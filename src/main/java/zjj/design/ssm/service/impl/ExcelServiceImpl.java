package zjj.design.ssm.service.impl;

import java.lang.reflect.Field;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import zjj.design.ssm.service.ExcelService;


@Service
public class ExcelServiceImpl implements ExcelService {
    /*@Autowired
    private IService<Object> mybatisPlusService;*/

    @Transactional(rollbackFor = Exception.class)
    public <T> void batchExport(List<T> list, Class<T> clazz) {
       /* // 将列表中的数据插入到数据库中
        for (T obj : list) {
            // 获取对象的属性
            Field[] fields = clazz.getDeclaredFields();
            // 将属性值插入到数据库中
            try {
                // 创建实体对象
                Object entity = clazz.newInstance();
                // 设置实体对象的属性值
                for (Field field : fields) {
                    field.setAccessible(true);
                    field.set(entity, field.get(obj));
                }
                // 插入数据
                mybatisPlusService.save(entity);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }*/
    }
}
