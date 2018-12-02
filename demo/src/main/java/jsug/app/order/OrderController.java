package jsug.app.order;

import jsug.domain.model.Cart;
import jsug.domain.model.Order;
import jsug.domain.service.order.EmptyCartOrderException;
import jsug.domain.service.order.InvalidCartOrderException;
import jsug.domain.service.order.OrderService;
import jsug.domain.service.userdetails.ShopUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/*(1)
@AuthenticationPrincipalアノテーションでログイン中の認証ユーザー情報を取得。
accountプロパティに、ユーザーの住所などが含まれており、Modelに渡して画面で表示

(2)
注文確認画面で確認したカートの状態と実際に注文した際の状態に違いがないように署名データを埋め込み。
*/
@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    Cart cart;

    @RequestMapping(method = RequestMethod.GET, params = "confirm")
    String confirm(@AuthenticationPrincipal ShopUserDetails userDetails /* (1) */, Model model) {
        model.addAttribute("orderLines", cart.getOrderLines());
        if (cart.isEmpty()) {
            model.addAttribute("error", "買い物カゴが空です");
            return "cart/viewCart";
        }
        model.addAttribute("account", userDetails.getAccount());
        model.addAttribute("signature", orderService.calcSignature(cart)); // (2)
        return "order/confirm";
    }

    @RequestMapping(method = RequestMethod.POST)
    String order(@AuthenticationPrincipal ShopUserDetails userDetails,
                 @RequestParam String signature, RedirectAttributes attributes) {
        Order order = orderService.purchase(userDetails.getAccount(), cart, signature);
        attributes.addFlashAttribute(order);
        return "redirect:/order?finish";
    }

    @RequestMapping(method = RequestMethod.GET, params = "finish")
    String finish() {
        return "order/finish";
    }
    
    @ExceptionHandler({EmptyCartOrderException.class, InvalidCartOrderException.class})
    @ResponseStatus(HttpStatus.CONFLICT)//競合　（別タブで開いてカートの状態を変えて元のタブの方で注文するとハンドリングされる
    ModelAndView handleOrderException(RuntimeException e) {
        return new ModelAndView("order/error")
                .addObject("error", e.getMessage());
    }
}