package zjj.design.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserRole {
    //用户ID
    private Integer userId;
    //角色ID
    private Integer roleId;
}

