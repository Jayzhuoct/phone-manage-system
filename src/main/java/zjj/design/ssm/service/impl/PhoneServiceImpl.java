package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.mapper.PhoneMapper;
import zjj.design.ssm.entity.Phone;
import zjj.design.ssm.service.PhoneService;
import org.springframework.stereotype.Service;


@Service
public class PhoneServiceImpl extends ServiceImpl<PhoneMapper, Phone> implements PhoneService {

}

