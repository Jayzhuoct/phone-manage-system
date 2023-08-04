package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import zjj.design.ssm.entity.*;
import zjj.design.ssm.service.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class JsonController {
    @Resource
    private PhoneService phoneService;
    @Resource
    private VendorService vendorService;
    @Resource
    private BrandService brandService;
    @Resource
    private UserService userService;
    @Resource
    private ModuleService moduleService;
    @Resource
    private RoleService roleService;

    @RequestMapping("/getUserName")
    @ResponseBody
    public String getUserName(@RequestParam("id") int id) {
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getId, id);
        return userService.getOne(lambdaQueryWrapper).getUsername();
    }

    @RequestMapping("/getPhoneName")
    @ResponseBody
    public Phone getPhoneName(@RequestParam("pid") int id) {
        LambdaQueryWrapper<Phone> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Phone::getPId, id);
        return phoneService.getOne(lambdaQueryWrapper);
    }

    @RequestMapping("/getBrandName")
    @ResponseBody
    public Brand getBrandName(@RequestParam("bid") int id) {
        LambdaQueryWrapper<Brand> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Brand::getBId, id);
        return brandService.getOne(lambdaQueryWrapper);
    }
    @RequestMapping("/getVendorName")
    @ResponseBody
    public Vendor getVendorName(@RequestParam("vid") int id) {
        LambdaQueryWrapper<Vendor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Vendor::getVId, id);
        return vendorService.getOne(lambdaQueryWrapper);
    }

    @RequestMapping("/getRoleName")
    @ResponseBody
    public String getRoleName(@RequestParam("id") int id) {
        LambdaQueryWrapper<Role> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Role::getRoleId, id);
        return roleService.getOne(lambdaQueryWrapper).getRoleName();
    }

    @RequestMapping("/getPhoneList")
    @ResponseBody
    public List<Phone> getPhoneList() {
        return phoneService.list();
    }

    @RequestMapping("/getBrandList")
    @ResponseBody
    public List<Brand> getBrandList() {
        return brandService.list();
    }

    @RequestMapping("/getVendorList")
    @ResponseBody
    public List<Vendor> getVendorList() {
        return vendorService.list();
    }

    @RequestMapping("/getRoleList")
    @ResponseBody
    public List<Role> getRoleList() {
        return roleService.list();
    }

    @RequestMapping("/getEcharts")
    @ResponseBody
    public List<Phone> getEcharts() {
        return phoneService.list();
    }

    @RequestMapping("/getModules")
    @ResponseBody
    public List<Module> getModules() {
        return moduleService.list();
    }

    @RequestMapping("/getModule")
    @ResponseBody
    public Module getModule(@RequestParam("id") int id) {
        LambdaQueryWrapper<Module> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Module::getId, id);
        return moduleService.getOne(lambdaQueryWrapper);
    }
    @RequestMapping("/getModuleName")
    @ResponseBody
    public String getModuleName(@RequestParam("id") int id) {
        LambdaQueryWrapper<Module> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Module::getId, id);
        return moduleService.getOne(lambdaQueryWrapper).getName();
    }
}
