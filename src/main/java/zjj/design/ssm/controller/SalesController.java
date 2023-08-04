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
import zjj.design.ssm.entity.Sales;
import zjj.design.ssm.service.SalesService;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/sales")
public class SalesController {
    @Resource
    private SalesService salesService;

    @RequestMapping("/toAdd")
    public String toAdd() {
        log("toAdd", "跳转", "跳转到销售信息添加页面",
                "GET", null, "/toAdd");
        return "/modules/sales-add";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Sales> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Sales::getPId, id);
        Sales sales = salesService.getOne(lambdaQueryWrapper);
        model.addAttribute("sales", sales);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("toUpdate", "跳转", "跳转到销售信息修改页面",
                "GET", map, "/toUpdate");
        return "/modules/sales-edit";
    }

    @RequestMapping("/list")
    public String index(@RequestParam(name = "page",defaultValue = "1") int page,
                        Model model) {
        PageHelper.startPage(page, 5);
        List<Sales> salesList = salesService.list();
        PageInfo<Sales> pageInfo = new PageInfo<>(salesList);
        model.addAttribute("salesList", salesList);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("index", "查询", "查询销售信息",
                "GET", map, "/list");
        return "/modules/sales-list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("name") String name, Model model) {
        LambdaQueryWrapper<Sales> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(Sales::getCustomerName, name);
        List<Sales> salesList = salesService.list(lambdaQueryWrapper);
        model.addAttribute("salesList", salesList);
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("name", name);
        log("search", "查询", "根据客户姓名模糊查询销售信息",
                "GET", map, "/search");
        return "/modules/sales-list";
    }

    @RequestMapping("/add")
    public String add(Sales sales, Model model) {
        boolean success = salesService.save(sales);
        if (!success) {
            model.addAttribute("msg", "添加失败，请检查输入是否合法！");
        } else {
            model.addAttribute("msg", "添加成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("sales", String.valueOf(sales));
        log("add", "添加", "添加销售信息",
                "POST", map, "/add");
        return "/modules/sales-list";
    }

    @RequestMapping("/update")
    public String update(Sales sales, Model model) {
        LambdaQueryWrapper<Sales> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Sales::getPId, sales.getPId());
        boolean success = salesService.update(sales, lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "修改失败，请检查输入是否合法！");
        } else {
            model.addAttribute("msg", "修改成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("sales", String.valueOf(sales));
        log("update", "修改", "修改销售信息",
                "POST", map, "/update");
        return "/modules/sales-list";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id, Model model) {
        LambdaQueryWrapper<Sales> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Sales::getPId, id);
        boolean success = salesService.remove(lambdaQueryWrapper);
        if (!success) {
            model.addAttribute("msg", "删除失败，请检查输入是否合法！");
        } else {
            model.addAttribute("msg", "删除成功！");
        }
        list(model);
        HashMap<String, String> map = new HashMap<>();
        map.put("id", String.valueOf(id));
        log("delete", "删除", "删除销售信息",
                "GET", map, "/delete");
        return "/modules/sales-list";
    }

    private void list(Model model) {
        PageHelper.startPage(1, 5);
        List<Sales> salesList = salesService.list();
        PageInfo<Sales> pageInfo = new PageInfo<>(salesList);
        model.addAttribute("salesList", salesList);
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
                "订单管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/sales"+url,
                "admin");
    }

}

