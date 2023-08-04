package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.entity.*;
import zjj.design.ssm.mapper.*;
import zjj.design.ssm.service.UserService;
import org.springframework.stereotype.Service;
import zjj.design.ssm.utils.ListUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private ModuleMapper moduleMapper;
    @Resource
    private UserRoleMapper userRoleMapper;
    @Resource
    private RoleModuleMapper roleModuleMapper;

    @Override
    public UserDto findByName(String username) {
        UserDto userDto = new UserDto();
        userDto.setUsername(username);
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getUsername, username);
        int userId = userMapper.selectOne(wrapper).getId();
        List<Integer> roleIds = new ArrayList<>();
        LambdaQueryWrapper<UserRole> wrapper1 = new LambdaQueryWrapper<>();
        wrapper1.eq(UserRole::getUserId, userId);
        List<UserRole> userRoles = userRoleMapper.selectList(wrapper1);
        for (UserRole userRole : userRoles) {
            roleIds.add(userRole.getRoleId());
        }
        userDto.setRoles(roleIds);
        List<Integer> moduleIds = new ArrayList<>();
        for (Integer roleId : roleIds) {
            LambdaQueryWrapper<RoleModule> wrapper2 = new LambdaQueryWrapper<>();
            wrapper2.eq(RoleModule::getRoleId, roleId);
            List<RoleModule> roleModules = roleModuleMapper.selectList(wrapper2);
            for (RoleModule roleModule : roleModules) {
                moduleIds.add(roleModule.getModuleId());
            }
        }
        List<Integer> newModuleIds = ListUtils.removeDuplicates(moduleIds);
        userDto.setPerms(newModuleIds);
        List<Module> modules = new ArrayList<>();
        for (Integer moduleId : newModuleIds) {
            LambdaQueryWrapper<Module> wrapper3 = new LambdaQueryWrapper<>();
            wrapper3.eq(Module::getId, moduleId);
            modules.add(moduleMapper.selectOne(wrapper3));
        }
        userDto.setModules(modules);
        return userDto;
    }

    public  List<Module> loadData(List<Module> ps) {
        List<Module> Modules = new ArrayList<Module>();
        Map<Integer, Module> ModuleMap = new HashMap<Integer, Module>();
        for (Module p : ps) {
            ModuleMap.put(p.getId(), p);
        }
        for (Module p : ps) {

            if (p.getpId() == 0) {
                Modules.add(p);
            } else {
                Module parent = ModuleMap.get(p.getpId());
                if (parent.getMenuList() == null) {
                    parent.setMenuList(new ArrayList<>());
                }
                parent.getMenuList().add(p);
            }
        }
        return Modules;
    }
}

