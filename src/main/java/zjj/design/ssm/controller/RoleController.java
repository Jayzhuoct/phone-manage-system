package zjj.design.ssm.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import zjj.design.ssm.entity.Role;
import zjj.design.ssm.entity.RoleModule;
import zjj.design.ssm.entity.RolePermission;
import zjj.design.ssm.mapper.RoleModuleMapper;
import zjj.design.ssm.service.RoleService;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @Resource
    private RoleModuleMapper roleModuleMapper;

    @RequestMapping("/list")
    public String roleList(@RequestParam(value = "page",defaultValue = "1")int page,
                           Model model) {
        PageHelper.startPage(page, 10);
        List<Role> roles = roleService.list();

        List<RolePermission> rolePermissions = new ArrayList<>();
        for (Role role : roles) {
            LambdaQueryWrapper<RoleModule> lambdaQueryWrapper = new LambdaQueryWrapper<>();
            lambdaQueryWrapper.eq(RoleModule::getRoleId, role.getRoleId());
            List<RoleModule> roleModules = roleModuleMapper.selectList(lambdaQueryWrapper);
            List<Integer> roleModuleIds = new ArrayList<>();
            for (RoleModule roleModule : roleModules) {
                roleModuleIds.add(roleModule.getModuleId());
            }
            RolePermission rolePermission = new RolePermission();
            rolePermission.setRoleId(role.getRoleId());
            rolePermission.setRoleName(role.getRoleName());
            rolePermission.setModuleIds(roleModuleIds);
            rolePermissions.add(rolePermission);
        }
        PageInfo<Role> pageInfo = new PageInfo<>(roles);
        model.addAttribute("rolePermissions", rolePermissions);
        model.addAttribute("pageInfo", pageInfo);
        return "system/role/list";

    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "system/role/add";
    }

    @RequestMapping("/add")
    public String add(RolePermission rolePermission,Model model){
        Role role = new Role();
        role.setRoleName(rolePermission.getRoleName());
        roleService.save(role);
        LambdaQueryWrapper<Role> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Role::getRoleId,rolePermission.getRoleName());
        Role role1 = roleService.getOne(lambdaQueryWrapper);
        for (Integer moduleId : rolePermission.getModuleIds()) {
            RoleModule roleModule = new RoleModule();
            roleModule.setRoleId(role1.getRoleId());
            roleModule.setModuleId(moduleId);
            roleModuleMapper.insert(roleModule);
        }
        return "redirect:/role/list";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam("id")int id,Model model){
        LambdaQueryWrapper<Role> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Role::getRoleId,id);
        Role role = roleService.getOne(lambdaQueryWrapper);
        RolePermission rolePermission = new RolePermission();
        rolePermission.setRoleId(role.getRoleId());
        rolePermission.setRoleName(role.getRoleName());
        LambdaQueryWrapper<RoleModule> lambdaQueryWrapper1 = new LambdaQueryWrapper<>();
        lambdaQueryWrapper1.eq(RoleModule::getRoleId,role.getRoleId());
        List<RoleModule> roleModules = roleModuleMapper.selectList(lambdaQueryWrapper1);
        List<Integer> moduleIds = new ArrayList<>();
        for (RoleModule roleModule : roleModules) {
            moduleIds.add(roleModule.getModuleId());
        }
        rolePermission.setModuleIds(moduleIds);
        model.addAttribute("rolePermission",rolePermission);
        return "system/role/edit";
    }

    @RequestMapping("/update")
    public String update(RolePermission rolePermission){
        LambdaQueryWrapper<RoleModule> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(RoleModule::getRoleId,rolePermission.getRoleId());
        roleModuleMapper.delete(lambdaQueryWrapper);
        for (Integer moduleId : rolePermission.getModuleIds()) {
            RoleModule roleModule = new RoleModule();
            roleModule.setRoleId(rolePermission.getRoleId());
            roleModule.setModuleId(moduleId);
            roleModuleMapper.insert(roleModule);
        }
        return "redirect:/role/list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id")int id){
        LambdaQueryWrapper<RoleModule> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(RoleModule::getRoleId,id);
        roleModuleMapper.delete(lambdaQueryWrapper);
        LambdaQueryWrapper<Role> lambdaQueryWrapper1 = new LambdaQueryWrapper<>();
        lambdaQueryWrapper1.eq(Role::getRoleId,id);
        roleService.remove(lambdaQueryWrapper1);
        return "redirect:/role/list";
    }

}
