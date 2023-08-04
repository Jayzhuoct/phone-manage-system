package zjj.design.ssm.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zjj.design.ssm.entity.Module;
import zjj.design.ssm.mapper.ModuleMapper;
import zjj.design.ssm.service.ModuleService;

import java.util.List;

@Service
public class ModuleServiceImpl extends ServiceImpl<ModuleMapper, Module> implements ModuleService {

    @Autowired
    private ModuleMapper moduleMapper;
    @Override
    public List<Module> findAll() {
        return moduleMapper.findAll();
    }

    @Override
    public void add(Module module) {
        moduleMapper.addModule(module);
    }

    @Override
    public Module getById(int id) {
        return moduleMapper.getById(id);
    }

    @Override
    public void updateModule(Module module) {
        moduleMapper.updateModule(module);
    }

    @Override
    public void delModule(Module module) {
        moduleMapper.delModule(module);
    }

    @Override
    public List<Module> findByModuleIds(List<Integer> ids) {
        return moduleMapper.findByModuleIds(ids);
    }

    @Override
    public List<Module> findByRoleId(int roleId) {
        return moduleMapper.findByRoleId(roleId);
    }

    public List<Module> findMenusByUserId(int userId){
        return moduleMapper.findMenusByUserId(userId);
    }


}

