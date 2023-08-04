package zjj.design.ssm.service;


import com.baomidou.mybatisplus.extension.service.IService;
import zjj.design.ssm.entity.Module;

import java.util.List;

public interface ModuleService extends IService<Module> {
    /**
     * 查询所有
     * @return
     */
    List<Module> findAll();

    /**
     * 添加一条数据
     * @param module
     */
    void add(Module module);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Module getById(int id);

    /**
     * 修改
     * @param module
     */
    void updateModule(Module module);

    /**
     *
     * @param module
     */
    void delModule(Module module);

    /**
     *
     * @param ids
     * @return
     */
    List<Module> findByModuleIds(List<Integer> ids);

    /**
     *
     * @param roleId
     * @return
     */
    List<Module> findByRoleId(int roleId);

    List<Module> findMenusByUserId(int userId);

}

