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
public class Repertory {
    //库存ID
    @ExcelProperty(value = "库存ID",index = 0)
    @TableId(type = IdType.AUTO)
    private Long rId;
    //手机ID
    @ExcelProperty(value = "手机ID",index = 1)
    private Integer pId;
    //库存数量
    @ExcelProperty(value = "库存数量",index = 2)
    private int rQuantity;
    //进货价格
    @ExcelProperty(value = "进货价格",index = 3)
    private Double rPrice;
    //供应商ID
    @ExcelProperty(value = "供应商ID",index = 4)
    private Integer vId;
}

