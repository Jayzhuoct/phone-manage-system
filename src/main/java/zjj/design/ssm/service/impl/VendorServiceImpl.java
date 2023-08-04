package zjj.design.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import zjj.design.ssm.mapper.VendorMapper;
import zjj.design.ssm.entity.Vendor;
import zjj.design.ssm.service.VendorService;
import org.springframework.stereotype.Service;


@Service
public class VendorServiceImpl extends ServiceImpl<VendorMapper, Vendor> implements VendorService {

}

