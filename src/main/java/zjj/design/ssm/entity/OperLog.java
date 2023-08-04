package zjj.design.ssm.entity;


import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class OperLog  {
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "日志ID",index = 0)
    private Integer id;
    /**
     * 操作模块
     */
    @ExcelProperty(value = "操作模块",index = 1)
    private String operModule;
    /**
     * 操作了哪个方法
     */
    @ExcelProperty(value = "操作方法",index = 2)
    private String operMethod;
    /**
     * 操作类型，例如查询删除等
     */
    @ExcelProperty(value = "操作类型",index = 3)
    private String operType;
    /**
     * 操作描述
     */
    @ExcelProperty(value = "操作描述",index = 4)
    private String operDesc;
    /**
     * 请求方法
     */
    @ExcelProperty(value = "请求方法",index = 5)
    private String reqMethod;
    /**
     * 请求参数
     */
    @ExcelProperty(value = "请求参数",index = 6)
    private String operParam;
    /**
     * 请求IP
     */
    @ExcelProperty(value = "请求IP",index = 7)
    private String operIp;
    /**
     * 请求地址
     */
    @ExcelProperty(value = "请求地址",index = 8)
    private String operUrl;
    /**
     * 操作人
     */
    @ExcelProperty(value = "操作人",index = 9)
    private String operUser;
    /**
     * 操作时间
     */
    @ExcelProperty(value = "操作时间",index = 10)
    private String createTime;

}

