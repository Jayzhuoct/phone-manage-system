package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import zjj.design.ssm.common.Log4Oper;
import zjj.design.ssm.entity.Vendor;
import zjj.design.ssm.service.VendorService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/vendor")
public class VendorController {
    @Resource
    private VendorService vendorService;

    @RequestMapping("/toAdd")
    public String toAdd() {
        log("toAdd", "跳转", "跳转到供应商信息添加页面",
                "GET", null, "/toAdd");
        return "/modules/vendor-add";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Vendor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Vendor::getVId, id);
        Vendor vendor = vendorService.getOne(lambdaQueryWrapper);
        model.addAttribute("vendor", vendor);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("toUpdate", "跳转", "跳转到供应商信息修改页面",
                "GET", map, "/toUpdate");
        return "/modules/vendor-edit";
    }

    @RequestMapping("/list")
    public String index(@RequestParam(value = "page",defaultValue = "1") int page,
                        Model model) {
        PageHelper.startPage(page, 5);
        List<Vendor> vendors = vendorService.list();
        PageInfo<Vendor> pageInfo = new PageInfo<>(vendors);
        model.addAttribute("vendors", vendors);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("index", "查询", "查询供应商信息",
                "GET", map, "/list");
        return "/modules/vendor-list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("name") String name, Model model) {
        LambdaQueryWrapper<Vendor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(Vendor::getVName, name);
        List<Vendor> vendors = vendorService.list(lambdaQueryWrapper);
        model.addAttribute("vendors", vendors);
        HashMap<String, String> map = new HashMap<>();
        map.put("name", name);
        log("search", "查询", "模糊查询供应商信息",
                "GET", map, "/search");
        return "/modules/vendor-list";
    }

    @RequestMapping("/add")
    public String add(Vendor vendor, Model model) {
        boolean success = vendorService.save(vendor);
        if (!success) {
            model.addAttribute("msg", "添加失败，请检查输入是否合法！");
        } else {
            model.addAttribute("msg", "添加成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("vendor", String.valueOf(vendor));
        log("add", "添加", "添加供应商信息",
                "POST", map, "/add");
        return "/modules/vendor-list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Vendor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Vendor::getVId, id);
        boolean success = vendorService.remove(lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "删除失败，请稍后再试！");
        } else {
            model.addAttribute("msg", "删除成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("delete", "删除", "删除供应商信息",
                "GET", map, "/delete");
        return "/modules/vendor-list";
    }

    @RequestMapping("/update")
    public String update(Vendor vendor, Model model) {
        LambdaQueryWrapper<Vendor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Vendor::getVId, vendor.getVId());
        boolean success = vendorService.update(vendor, lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "更新失败，请检查输入是否合法！");
        } else {
            model.addAttribute("msg", "更新成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("vendor", String.valueOf(vendor));
        log("update", "更新", "更新供应商信息",
                "POST", map, "/update");
        return "/modules/vendor-list";
    }

    private void list(Model model) {
        PageHelper.startPage(1, 5);
        List<Vendor> vendors = vendorService.list();
        PageInfo<Vendor> pageInfo = new PageInfo<>(vendors);
        model.addAttribute("vendors", vendors);
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
                "供应商管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/vendor"+url,
                "admin");
    }


}

