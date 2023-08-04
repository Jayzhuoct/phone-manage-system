package zjj.design.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.*;
import zjj.design.ssm.entity.Module;
import zjj.design.ssm.entity.User;
import zjj.design.ssm.entity.UserDto;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {
    UserDto findByName(@Param("username") String username);
}

