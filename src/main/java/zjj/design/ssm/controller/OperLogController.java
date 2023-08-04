package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import zjj.design.ssm.common.Log4Oper;
import zjj.design.ssm.entity.OperLog;
import zjj.design.ssm.service.OperLogService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/operLog")
public class OperLogController {
    @Resource
    private OperLogService operLogService;

    @RequestMapping("/list")
    public String list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                       Model model) {
        PageHelper.startPage(page, 10);
        LambdaQueryWrapper<OperLog> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.ne(OperLog::getOperMethod, "").isNotNull(OperLog::getOperMethod);
        List<OperLog> operLogs = operLogService.list(lambdaQueryWrapper);
        PageInfo<OperLog> pageInfo = new PageInfo<>(operLogs);
        model.addAttribute("operLogs", operLogs);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("list", "查询", "查询操作日志",
                "GET", map, "/list");
        return "/log/operLog";
    }
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@RequestParam("name")String name,
                         Model model) {
        LambdaQueryWrapper<OperLog> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(OperLog::getOperType, name);
        List<OperLog> operLogs = operLogService.list(lambdaQueryWrapper);
        PageHelper.startPage(1, 20);
        PageInfo<OperLog> pageInfo = new PageInfo<>(operLogs);
        model.addAttribute("operLogs", operLogs);
        model.addAttribute("pageInfo", pageInfo);
        log("search", "查询", "根据操作方式查询操作日志",
                "GET", null, "/search");
        return "/log/operLog";
    }
    private void log(String operMethod,
                     String type,
                     String description,
                     String reqMethod,
                     HashMap<String, String> map,
                     String url
    ){
        Log4Oper.logInfo(
                "操作日志管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/operLog"+url,
                "admin");
    }


}

