package zjj.design.ssm.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import zjj.design.ssm.entity.User;
import zjj.design.ssm.entity.UserDto;
import zjj.design.ssm.entity.UserRole;
import zjj.design.ssm.mapper.UserRoleMapper;
import zjj.design.ssm.service.UserService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController{

    @Resource
    private UserService userService;

    @Resource
    private UserRoleMapper userRoleMapper;

    @RequestMapping("/list")
    public String userList(@RequestParam(value = "page",defaultValue = "1")int page,
    Model model){
        List<User> users = userService.list();
        List<UserDto> userDtos = new ArrayList<>();
        for (User user : users) {
            UserDto userDto = userService.findByName(user.getUsername());
            userDtos.add(userDto);
        }
        PageHelper.startPage(page, 5);
        PageInfo<UserDto> pageInfo = new PageInfo<>(userDtos);
        model.addAttribute("userDtos", userDtos);
        model.addAttribute("pageInfo", pageInfo);
        System.out.println(userDtos);
        return "system/user/list";
    }

    @RequestMapping("/search")
    public String userSearch(@RequestParam("name")String name,Model model){
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(User::getUsername, name);
        List<User> users = userService.list(lambdaQueryWrapper);
        List<UserDto> userDtos = new ArrayList<>();
        for (User user : users) {
            userDtos.add(userService.findByName(user.getUsername()));
        }
        PageHelper.startPage(1, 5);
        PageInfo<UserDto> pageInfo = new PageInfo<>(userDtos);
        model.addAttribute("userDtos", userDtos);
        model.addAttribute("pageInfo", pageInfo);
        return "system/user/list";
    }

    @RequestMapping("/delete")
    public String userDelete(@RequestParam("name")String username){
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getUsername, username);
        User user = userService.getOne(lambdaQueryWrapper);
        int userId = user.getId();
        LambdaQueryWrapper<UserRole> lambdaQueryWrapper1 = new LambdaQueryWrapper<>();
        lambdaQueryWrapper1.eq(UserRole::getUserId, userId);
        userRoleMapper.delete(lambdaQueryWrapper1);
        return "redirect:/user/list";

    }

    @RequestMapping("/toUpdate")
    public String userToUpdate(@RequestParam("name")String username,Model model){
        UserDto userDto = userService.findByName(username);
        model.addAttribute("userDto", userDto);
        return "system/user/edit";
    }

    @RequestMapping("/update")
    public String userUpdate(UserDto userDto){
        String username = userDto.getUsername();
        List<Integer> roleIds = userDto.getRoles();
        LambdaQueryWrapper<User> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(User::getUsername, username);
        User user = userService.getOne(lambdaQueryWrapper);
        lambdaQueryWrapper.clear();
        int userId = user.getId();
        LambdaQueryWrapper<UserRole> lambdaQueryWrapper1 = new LambdaQueryWrapper<>();
        lambdaQueryWrapper1.eq(UserRole::getUserId, userId);
        userRoleMapper.delete(lambdaQueryWrapper1);
        for (Integer roleId : roleIds) {
            LambdaQueryWrapper<UserRole> lambdaQueryWrapper2 = new LambdaQueryWrapper<>();
            lambdaQueryWrapper2.eq(UserRole::getUserId, userId);
            lambdaQueryWrapper2.eq(UserRole::getRoleId, roleId);
            if (userRoleMapper.selectCount(lambdaQueryWrapper2) == 0){
                UserRole userRole = new UserRole();
                userRole.setUserId(userId);
                userRole.setRoleId(roleId);
                userRoleMapper.insert(userRole);
            }
            lambdaQueryWrapper2.clear();
        }
        return "redirect:/user/list";
    }

}

