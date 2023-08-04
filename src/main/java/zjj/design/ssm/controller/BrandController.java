package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import zjj.design.ssm.common.Log4Oper;
import zjj.design.ssm.entity.Brand;
import zjj.design.ssm.service.BrandService;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/brand")
public class BrandController {
    @Resource
    private BrandService brandService;

    @RequestMapping("/toAdd")
    public String toAdd() {
        log("toAdd", "跳转", "跳转到品牌信息添加页面",
                "GET", null, "/toAdd");
        return "/modules/brand-add";
    }
    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Brand> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Brand::getBId, id);
        Brand brand = brandService.getOne(lambdaQueryWrapper);
        model.addAttribute("brand", brand);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("toUpdate", "跳转", "跳转到品牌信息修改页面",
                "GET", map, "/toUpdate");
        return "/modules/brand-edit";
    }

    @RequestMapping("/list")
    public String index(@RequestParam(value = "page", defaultValue = "1")int page,
                       Model model) {
        PageHelper.startPage(page, 5);
        List<Brand> brands = brandService.list();
        PageInfo<Brand> pageInfo = new PageInfo<>(brands);
        model.addAttribute("brands", brands);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("index", "查询", "查询品牌信息",
                "GET", map, "/list");
        return "/modules/brand-list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("name") String name, Model model) {
        LambdaQueryWrapper<Brand> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(Brand::getBName, name);
        PageHelper.startPage(1, 5);
        List<Brand> brands = brandService.list(lambdaQueryWrapper);
        PageInfo<Brand> pageInfo = new PageInfo<>(brands);
        model.addAttribute("brands", brands);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("name", name);
        log("search", "查询", "模糊查询品牌信息",
                "GET", map, "/search");
        return "/modules/brand-list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Brand brand, Model model) {
        boolean success = brandService.save(brand);
        if (!success) {
            model.addAttribute("msg", "添加失败，请检查输入是否合法！");
        } else {
            model.addAttribute("msg", "添加成功！");
        }
        list(model);
        log("add", "添加", "添加品牌信息",
                "POST", null, "/add");
        return "/modules/brand-list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Brand> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Brand::getBId, id);
        boolean success = brandService.remove(lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "删除失败，请稍后再试！");
        } else {
            model.addAttribute("msg", "删除成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("delete", "删除", "删除品牌信息",
                "GET", map, "/delete");
        return "/modules/brand-list";
    }

    @RequestMapping("/update")
    public String update(Brand brand, Model model) {
        LambdaQueryWrapper<Brand> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Brand::getBId, brand.getBId());
        boolean success = brandService.update(brand, lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "更新失败，请稍后再试！");
        } else {
            model.addAttribute("msg", "更新成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("brand", String.valueOf(brand));
        log("update", "更新", "更新品牌信息",
                "POST", map, "/update");
        return "/modules/brand-list";
    }

    private void list(Model model) {
        PageHelper.startPage(1, 5);
        List<Brand> brands = brandService.list();
        PageInfo<Brand> pageInfo = new PageInfo<>(brands);
        model.addAttribute("brands", brands);
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
                "品牌管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/brand"+url,
                "admin");
    }
}

