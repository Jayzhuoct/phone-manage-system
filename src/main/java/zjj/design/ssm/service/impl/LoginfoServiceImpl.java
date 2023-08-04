package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.entity.Loginfo;
import zjj.design.ssm.mapper.LoginfoMapper;
import zjj.design.ssm.service.LoginfoService;
import org.springframework.stereotype.Service;


@Service
public class LoginfoServiceImpl extends ServiceImpl<LoginfoMapper, Loginfo> implements LoginfoService {

}

