package zjj.design.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserDto {
    private String username;//用户名
    private List<Integer> roles;//角色集合
    private List<Integer> perms;//权限id集合
    private List<Module> modules;//权限集合
}
