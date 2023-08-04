package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import zjj.design.ssm.common.Log4Oper;
import zjj.design.ssm.entity.Phone;
import zjj.design.ssm.service.PhoneService;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/phone")
public class PhoneController {
    @Resource
    private PhoneService phoneService;

    @RequestMapping("/toAdd")
    public String toAdd() {
        log("toAdd", "跳转", "跳转到手机信息添加页面",
                "GET", null, "/toAdd");
        return "/modules/phone-add";
    }
    @RequestMapping("/toEcharts")
    public String toEcharts() {
        log("toEcharts", "跳转", "跳转到手机价格统计页面",
                "GET", null, "/toEcharts");
        return "/modules/echarts";
    }
    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Phone> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Phone::getPId, id);
        Phone phone = phoneService.getOne(lambdaQueryWrapper);
        model.addAttribute("phone", phone);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("toUpdate", "跳转", "跳转到手机信息修改页面",
                "GET", map, "/toUpdate");
        return "/modules/phone-edit";
    }
    @RequestMapping("/list")
    public String index(@RequestParam(value = "page", defaultValue = "1")int page,
                        Model model) {
        PageHelper.startPage(page, 5);
        List<Phone> phones = phoneService.list();
        PageInfo<Phone> pageInfo = new PageInfo<>(phones);
        model.addAttribute("phones", phones);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("list", "查询", "查询手机信息",
                "GET", map, "/list");
        return "/modules/phone-list";
    }
    @RequestMapping("/search")
    public String search(@RequestParam("name") String name, Model model) {
        PageHelper.startPage(1, 5);
        LambdaQueryWrapper<Phone> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(Phone::getPName, name);
        List<Phone> phones = phoneService.list(lambdaQueryWrapper);
        PageInfo<Phone> pageInfo = new PageInfo<>(phones);
        model.addAttribute("phones", phones);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("name", name);
        log("search", "查询", "根据手机名称模糊查询手机信息",
                "GET", map, "/search");
        return "/modules/phone-list";
    }
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Phone phone, Model model) {
        boolean success = phoneService.save(phone);
        if (!success) {
            model.addAttribute("msg", "添加失败");
            return "/modules/phone-add";
        }
        list(model);
        log("add", "添加", "添加手机信息",
                "POST", null, "/add");
        return "/modules/phone-list";
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Phone phone, Model model) {
        LambdaQueryWrapper<Phone> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Phone::getPId, phone.getPId());
        boolean success = phoneService.update(phone, lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "更新失败");
            return "/modules/phone-edit";
        }
        list(model);
        log("update", "更新", "更新手机信息",
                "POST", null, "/update");
        return "/modules/phone-list";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Phone> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Phone::getPId, id);
        boolean success = phoneService.remove(lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "删除失败");
            list(model);
            return "/modules/phone-list";
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("delete", "删除", "删除手机信息",
                "GET", map, "/delete");
        return "/modules/phone-list";
    }
    private void list(Model model) {
        PageHelper.startPage(1, 5);
        List<Phone> phones = phoneService.list();
        PageInfo<Phone> pageInfo = new PageInfo<>(phones);
        model.addAttribute("phones", phones);
        model.addAttribute("pageInfo", pageInfo);
    }
    private void log(String operMethod,
                     String type,
                     String description,
                     String reqMethod,
                     HashMap<String, String> map,
                     String url
                     ){
        Log4Oper.logInfo(
                "手机管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/phone"+url,
                "admin");
    }
}

