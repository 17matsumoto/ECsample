package jsug.infra.logging;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/*
(1)
@AspectアノテーションをつけてAspectを定義。
(2)
@AroundアノテーションをつけてAroundアドバイスを定義。HandlerExceptionResolver#resolveExceptionメソッドが対象になるように設定。
(3)
JointPoint情報から、実行されたメソッドの情報を取得できます。ここでは引数を取得。
(4)
HandlerExceptionResolver#resolveExceptionメソッドは複数回呼ばれる可能性があるため、マークをつけて複数回呼ばれないようにします。
*/
@Component
@Aspect // (1)
@Slf4j
public class HandlerExceptionResolverLoggingAspect {
    @Around("execution(* org.springframework.web.servlet.HandlerExceptionResolver.resolveException(..))") // (2)
    public Object logException(ProceedingJoinPoint joinPoint /* (3) */) throws Throwable {
        Object ret = joinPoint.proceed();
        HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0]; // (1)

        if (request.getAttribute("ERROR_LOGGED") == null) {
            Object handler = joinPoint.getArgs()[2];
            Exception exception = (Exception) joinPoint.getArgs()[3];
            log.info("Error occurred [url=" + request.getMethod() + " " + request.getRequestURI() + ", handler=" + handler + "]",
                    exception);
            // mark as logged
            request.setAttribute("ERROR_LOGGED", true); // (4)
        }
        return ret;
    }
}