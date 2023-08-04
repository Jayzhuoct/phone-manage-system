package zjj.design.ssm.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import zjj.design.ssm.entity.Module;
import zjj.design.ssm.entity.Result;
import zjj.design.ssm.entity.User;
import zjj.design.ssm.entity.UserDto;
import zjj.design.ssm.service.UserService;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import zjj.design.ssm.utils.MD5Salt;

@Controller
public class LoginController {
    @Resource
    private UserService userService;

    @RequestMapping("/")
    public String toLogin(){
        return "login";
    }

    @GetMapping("/login")
    @ResponseBody
    public Result login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        @RequestParam("code") String code,
                        HttpServletRequest request, Model model, HttpSession session) throws AuthenticationException {
        // 验证码校验
        String sessionCode = (String) request.getSession().getAttribute("code");
        System.out.println(sessionCode);
        System.out.println(code);
        System.out.println(username);
        System.out.println(password);

        if (!code.equalsIgnoreCase(sessionCode)) {
            return new Result(false, "验证码错误");
        }
        // 密码权限校验
        Subject subject = SecurityUtils.getSubject();
        subject.login(new UsernamePasswordToken(username, password));
        User user=(User)subject.getPrincipal();
        if (user != null) {
            UserDto userDto = userService.findByName(username);
            List<Module> modules = userDto.getModules();
            List<Module> newModules = userService.loadData(modules);
            session.setAttribute("menuList", newModules);
            model.addAttribute("name", username);
            return new Result(true, "登录成功");
        } else {
            return new Result(false, "登录失败");
        }
    }

    @RequestMapping("/main")
    public String index(){
        return "main";
    }

    @RequestMapping(value = "/regist",method = RequestMethod.POST)
    public String register(@RequestParam("username") String username,
                           @RequestParam("password") String password){
        String salt = MD5Salt.generateSalt();
        String encryptedPassword = MD5Salt.encryptPassword(password, salt);
        // 把加密后的密码和salt放入user对象中
        User user = new User();
        user.setUsername(username);
        user.setPassword(encryptedPassword);
        user.setSalt(salt);
        // 将对象存储到数据库中
        userService.save(user);
        return "/login";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        // 1. 清除 Session 中的认证信息
        request.getSession().invalidate();
        // 2. 清除 Subject 中的认证信息
        SecurityUtils.getSubject().logout();
        // 3. 重定向到登录页面
        return "redirect:/";

    }
    @RequestMapping("/image")
    public void code(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedImage bi=new BufferedImage(78, 30,BufferedImage.TYPE_INT_RGB);
        Graphics g=bi.getGraphics();
        Color c=new Color(192,192,192);
        g.setColor(c);
        g.fillRect(0, 0, 78,30);
        g.setFont(new Font("Times New Roman", Font.PLAIN,22));
        char[] ch="ABCDEFGHJKMNPQRSTUVWXYZ23456789".toCharArray();
        Random r=new Random();
        int len=ch.length;
        int index;
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<4;i++)
        {
            index=r.nextInt(len);
            g.setColor(new Color(r.nextInt(88),r.nextInt(188),r.nextInt(255)));
            g.drawString(ch[index]+"",(i*15)+10, 22);
            sb.append(ch[index]);
        }
        request.getSession().setAttribute("code",sb.toString());
        ImageIO.write(bi, "JPG", response.getOutputStream());
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }
}
