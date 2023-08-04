package zjj.design.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Role{
	/**
	 * 角色主键id
	 */
	private Integer roleId;
	
	/**
	 * 角色名称
	 */
	private String roleName;
	
}
