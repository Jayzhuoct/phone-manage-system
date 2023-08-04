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
public class Phone {
    //手机ID
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "手机ID",index = 0)
    private Long pId;
    //手机名称
    @ExcelProperty(value = "手机名称",index = 1)
    private String pName;
    //品牌ID
    @ExcelProperty(value = "品牌ID",index = 2)
    private Integer bId;
    //手机颜色
    @ExcelProperty(value = "手机颜色",index = 3)
    private String pColor;
    //手机内存
    @ExcelProperty(value = "手机内存",index = 4)
    private String pMemory;
    //手机售价
    @ExcelProperty(value = "手机售价",index = 5)
    private Double pPrice;

}

