package jsug.app.account;

import jsug.domain.validation.Confirm;
import jsug.domain.validation.UnusedEmail;
import lombok.Data;
import org.hibernate.validator.constraints.Email;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDate;

/*(1)
@Confirmアノテーションを使って、passwordフィールドとconfirmPasswordフィールドの値が等しいことを制約にする。
このアノテーションはカスタムルール。バリデータの実装はjsug.domain.validation.ConfirmValidatorクラスを確認。
(2)
@Emailアノテーションを使って、Email形式であることを制約にする。
(3)
@UnusedEmailアノテーションを使って、Emailアドレスが使用されいないことを制約にする。
このアノテーションはカスタムルール。バリデータの実装はjsug.domain.validation.UnusedEmailValidatorクラスを確認。
(4)
@DateTimeFormatアノテーションを使って、入力値の日付文字列をLocalDate型に変換する際のフォーマットを指定します。
このアノテーションはバリデーション用ではありません。*/


@Data
@Confirm(field = "password") // (1)
public class AccountForm implements Serializable {
    @Email // (2)
    @Size(min = 1, max = 100)
    @NotNull
    @UnusedEmail // (3)
    private String email;
    @Size(min = 6, max = 16)
    @NotNull
    private String password;
    @NotNull
    private String confirmPassword;
    @Size(min = 1, max = 40)
    @NotNull
    private String name;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) // (4)
    @NotNull
    private LocalDate birthDay;
    @NotNull
    @Pattern(regexp = "[0-9]{7}")
    private String zip;
    @Size(min = 1, max = 100)
    @NotNull
    private String address;
}