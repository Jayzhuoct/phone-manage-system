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
public class Vendor{
    //库存ID
    @ExcelProperty(value = "供应商ID",index = 0)
    @TableId(type = IdType.AUTO)
    private Long vId;
    //供应商名称
    @ExcelProperty(value = "供应商名称",index = 1)
    private String vName;
    //供应商电话
    @ExcelProperty(value = "供应商电话",index = 2)
    private String vTel;
}

