package zjj.design.ssm.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Brand {
    //品牌ID
    @ExcelProperty(value = "品牌ID",index = 0)
    @TableId(type = IdType.AUTO)
    private Long bId;
    //品牌名称
    @ExcelProperty(value = "品牌名称",index = 1)
    private String bName;

}

