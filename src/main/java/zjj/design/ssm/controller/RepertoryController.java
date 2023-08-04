package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import zjj.design.ssm.common.Log4Oper;
import zjj.design.ssm.entity.Repertory;
import zjj.design.ssm.service.RepertoryService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/repertory")
public class RepertoryController{
    @Resource
    private RepertoryService repertoryService;

    @RequestMapping("/toAdd")
    public String toAdd() {
        log("toAdd", "跳转", "跳转到库存信息添加页面",
                "GET", null, "/toAdd");
        return "/modules/repertory-add";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Repertory> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Repertory::getPId, id);
        Repertory repertory = repertoryService.getOne(lambdaQueryWrapper);
        model.addAttribute("repertory", repertory);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("toUpdate", "跳转", "跳转到库存信息修改页面",
                "GET", map, "/toUpdate");
        return "/modules/repertory-edit";
    }

    @RequestMapping("/list")
    public String index(@RequestParam(value = "page", defaultValue = "1")int page,
                            Model model) {
        PageHelper.startPage(page, 5);
        List<Repertory> repertorys = repertoryService.list();
        PageInfo<Repertory> pageInfo = new PageInfo<>(repertorys);
        model.addAttribute("repertorys", repertorys);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("list", "查询", "查询库存信息",
                "GET", map, "/list");
        return "/modules/repertory-list";
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public String search(@RequestParam("id") int id, Model model) {
        PageHelper.startPage(1, 5);
        LambdaQueryWrapper<Repertory> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Repertory::getPId, id);
        List<Repertory> repertorys = repertoryService.list(lambdaQueryWrapper);
        PageInfo<Repertory> pageInfo = new PageInfo<>(repertorys);
        model.addAttribute("repertorys", repertorys);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("search", "查询", "根据手机id查询库存信息",
                "POST", map, "/search");
        return "/modules/repertory-list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Repertory repertory, Model model) {
        boolean success = repertoryService.save(repertory);
        if (!success) {
            model.addAttribute("msg", "添加失败");
            return "/modules/repertory-add";
        }
        list(model);
        log("add", "添加", "添加库存信息",
                "POST", null, "/add");
        return "/modules/repertory-list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Repertory repertory, Model model) {
        LambdaQueryWrapper<Repertory> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Repertory::getPId, repertory.getPId());
        boolean success = repertoryService.update(repertory, lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "更新失败");
            return "/modules/repertory-edit";
        }
        list(model);
        log("update", "更新", "更新库存信息",
                "POST", null, "/update");
        return "/modules/repertory-list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Repertory> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Repertory::getPId, id);
        boolean success = repertoryService.remove(lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "删除失败");
            return "/modules/repertory-list";
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("delete", "删除", "删除库存信息",
                "GET", map, "/delete");
        return "/modules/repertory-list";
    }

    private void list(Model model) {
        PageHelper.startPage(1, 5);
        List<Repertory> repertorys = repertoryService.list();
        PageInfo<Repertory> pageInfo = new PageInfo<>(repertorys);
        model.addAttribute("repertorys", repertorys);
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
                "库存管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/repertory"+url,
                "admin");
    }
}

