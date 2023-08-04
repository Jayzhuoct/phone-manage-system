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
public class RolePermission {
    private int roleId;
    private String roleName;
    private List<Integer> moduleIds;
}
