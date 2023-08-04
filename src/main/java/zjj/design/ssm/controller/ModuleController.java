package zjj.design.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import zjj.design.ssm.entity.Module;
import zjj.design.ssm.service.ModuleService;
import javax.annotation.Resource;

@Controller
@RequestMapping("/module")
public class ModuleController {
    @Resource
    private ModuleService moduleService;

    @RequestMapping("/add")
    public String addModule(Module module) {
        moduleService.save(module);
        return "redirect:toList";
    }

    @RequestMapping("/update")
    public String update(Module module) {
        LambdaQueryWrapper<Module> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Module::getId, module.getId());
        moduleService.update(module, queryWrapper);
        return "redirect:toList";
    }

    @RequestMapping("/del")
    public String del(@RequestParam("id")int id) {
        LambdaQueryWrapper<Module> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Module::getId, id);
        moduleService.remove(queryWrapper);
        return "redirect:toList";
    }

    @RequestMapping("/toList")
    public String toModuleManagePage() {
        return "/system/module";
    }
}