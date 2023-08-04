package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import zjj.design.ssm.entity.Role;
import zjj.design.ssm.mapper.RoleMapper;
import zjj.design.ssm.service.RoleService;

@Service
public  class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
}
