package zjj.design.ssm.realm;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import zjj.design.ssm.entity.*;
import zjj.design.ssm.service.RoleService;
import zjj.design.ssm.service.UserService;
import zjj.design.ssm.utils.MD5Salt;
import java.util.List;

public class MyRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        User user = (User) principals.getPrimaryPrincipal();
        String username = user.getUsername();
        // 根据用户名获取用户的角色和权限列表
        UserDto userDto = userService.findByName(username);
        List<Integer> roles = userDto.getRoles();
        List<Module> permissions = userDto.getModules();
        // 将角色和权限列表添加到AuthorizationInfo中
        for (Integer role : roles) {
            LambdaQueryWrapper<Role> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(Role::getRoleId, role);
            Role role1 = roleService.getOne(wrapper);
            authorizationInfo.addRole(role1.getRoleName());
        }
        for (Module permission : permissions) {
            authorizationInfo.addStringPermission(permission.getPerms());
        }
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 将AuthenticationToken转换为UsernamePasswordToken
        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        // 获取用户名和密码
        String username = usernamePasswordToken.getUsername();
        String password = new String(usernamePasswordToken.getPassword());
        // 根据用户名获取用户信息
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, username);
        User user = userService.getOne(wrapper);
        if (user == null) {
            throw new UnknownAccountException("用户名不存在");
        }
        // 对密码进行加密，然后与数据库中的密码比对
        String salt = user.getSalt();
        String encryptedPassword = MD5Salt.encryptPassword(password, salt);
        if (!encryptedPassword.equals(user.getPassword())) {
            throw new IncorrectCredentialsException("密码错误");
        }
        // 构造AuthenticationInfo对象并返回
        return new SimpleAuthenticationInfo(user, password, ByteSource.Util.bytes(salt), getName());
    }
}
