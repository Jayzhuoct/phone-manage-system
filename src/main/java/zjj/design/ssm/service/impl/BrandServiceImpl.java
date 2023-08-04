package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.mapper.BrandMapper;
import zjj.design.ssm.entity.Brand;
import zjj.design.ssm.service.BrandService;
import org.springframework.stereotype.Service;



@Service
public class BrandServiceImpl extends ServiceImpl<BrandMapper, Brand> implements BrandService {

}

