package zjj.design.ssm.common;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import zjj.design.ssm.entity.Loginfo;
import zjj.design.ssm.entity.User;
import zjj.design.ssm.service.LoginfoService;
import zjj.design.ssm.utils.DateUtil;

import javax.annotation.Resource;

@Aspect
@Component
public class LoginLogAspect {

    @Resource
    private LoginfoService loginfoService;

    @Pointcut("execution(* zjj.design.ssm.controller.LoginController.login(..))")
    public void loginPointcut() {
    }

    @AfterReturning(value = "loginPointcut()", returning = "result")
    public void afterLogin(JoinPoint joinPoint, Object result) {
        if (result instanceof String && "/main".equals(result)) {
            // 获取当前登录用户的信息
            Subject subject = SecurityUtils.getSubject();
            User user = (User) subject.getPrincipal();
            Loginfo loginfo = new Loginfo(user.getId(), DateUtil.getNowTime());
            // 保存登录日志到数据库中
            loginfoService.save(loginfo);
        }
    }
}