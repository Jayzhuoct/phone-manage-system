package zjj.design.ssm.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import zjj.design.ssm.entity.Module;
import java.util.List;

@Mapper
public interface ModuleMapper extends BaseMapper<Module> {
    List<Module> findModulesByIds(@Param("ids") List<Integer> ids);
    List<Module> findAll();
    void addModule(Module module);
    Module getById(int id);
    void updateModule(Module module);
    void delModule(Module module);
    List<Module> findByModuleIds(@Param("ids")List<Integer> ids);
    List<Module> findByRoleId(int roleId);
    List<Module> findMenusByUserId(int userId);
}

