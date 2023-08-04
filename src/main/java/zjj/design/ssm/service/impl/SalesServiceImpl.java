package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.mapper.SalesMapper;
import zjj.design.ssm.entity.Sales;
import zjj.design.ssm.service.SalesService;
import org.springframework.stereotype.Service;


@Service
public class SalesServiceImpl extends ServiceImpl<SalesMapper, Sales> implements SalesService {

}

