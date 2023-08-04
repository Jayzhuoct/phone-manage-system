package zjj.design.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;
import zjj.design.ssm.entity.Module;
import zjj.design.ssm.entity.User;
import zjj.design.ssm.entity.UserDto;

import java.util.List;

public interface UserService extends IService<User> {
    UserDto findByName(@Param("username") String username);
    List<Module> loadData(List<Module> ps);
}

