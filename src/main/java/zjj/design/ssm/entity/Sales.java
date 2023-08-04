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
public class Sales {
    //销售ID
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "销售ID",index = 0)
    private Long sId;
    //手机ID
    @ExcelProperty(value = "手机ID",index = 1)
    private Integer pId;
    //销售日期
    @ExcelProperty(value = "销售日期",index = 2)
    private String sDate;
    //销售价格
    @ExcelProperty(value = "销售价格",index = 3)
    private double sPrice;
    //销售数量
    @ExcelProperty(value = "销售数量",index = 4)
    private Integer sQuantity;
    //顾客姓名
    @ExcelProperty(value = "顾客姓名",index = 5)
    private String customerName;
    //顾客电话
    @ExcelProperty(value = "顾客电话",index = 6)
    private String customerTel;

}

