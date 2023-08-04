package zjj.design.ssm.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.entity.OperLog;
import zjj.design.ssm.mapper.OperLogMapper;
import zjj.design.ssm.service.OperLogService;
import org.springframework.stereotype.Service;


@Service
public class OperLogServiceImpl extends ServiceImpl<OperLogMapper, OperLog> implements OperLogService {

}

