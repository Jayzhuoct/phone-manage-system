package zjj.design.ssm.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import zjj.design.ssm.common.Log4Oper;
import zjj.design.ssm.entity.Loginfo;
import zjj.design.ssm.entity.User;
import zjj.design.ssm.service.LoginfoService;
import zjj.design.ssm.service.UserService;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/loginfo")
public class LoginfoController {

    @Resource
    private LoginfoService loginfoService;

    @Resource
    private UserService userService;


    @RequestMapping("/list")
    public String loginfoList(@RequestParam(value = "page",defaultValue = "1") Integer page,
        Model model){
        PageHelper.startPage(page, 5);
        LambdaQueryWrapper<Loginfo> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.isNotNull(Loginfo::getUserid);
        List<Loginfo> loginfos = loginfoService.list(lambdaQueryWrapper);
        model.addAttribute("loginfos", loginfos);
        PageInfo<Loginfo> pageInfo = new PageInfo<>(loginfos);
        model.addAttribute("pageInfo", pageInfo);
        HashMap<String, String> map = new HashMap<>();
        map.put("page", String.valueOf(page));
        log("list", "查询", "查询登陆日志信息",
                "GET", map, "/list");
        return "/log/loginfo";
    }

    @RequestMapping("/search")
    public String  loginfoSearch(@RequestParam("name")String name,Model model){
        //根据用户名ID
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(User::getUsername, name);
        List<User> users = userService.list(lambdaQueryWrapper);
        List<Integer> ids = new ArrayList<>();
        //根据用户ID查询登陆日志
        for (User user : users) {
            ids.add(user.getId());
        }
        LambdaQueryWrapper<Loginfo> lambdaQueryWrapper1 = new LambdaQueryWrapper<>();
        lambdaQueryWrapper1.in(Loginfo::getUserid, ids);
        List<Loginfo> loginfos = loginfoService.list(lambdaQueryWrapper1);
        PageHelper.startPage(1, 5);
        PageInfo<Loginfo> pageInfo = new PageInfo<>(loginfos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("loginfos", loginfos);
        log("search", "查询", "根据用户名查询登陆日志信息",
                "GET", null, "/search");
        return "/log/loginfo";
    }

    private void log(String operMethod,
                     String type,
                     String description,
                     String reqMethod,
                     HashMap<String, String> map,
                     String url
    ){
        Log4Oper.logInfo(
                "登陆日志管理",
                operMethod,
                type,
                description,
                reqMethod,
                String.valueOf(map),
                "127.0.0.1",
                "/loginfo"+url,
                "admin");
    }


}

