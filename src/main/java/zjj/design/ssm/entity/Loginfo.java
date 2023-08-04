package zjj.design.ssm.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Loginfo{
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "日志ID",index = 0)
    private Integer logid;
    @ExcelProperty(value = "用户ID",index = 1)
    private int userid;
    @ExcelProperty(value = "登录时间",index = 2)
    private String logintime;

    public Loginfo(int userid, String logintime) {
        this.userid = userid;
        this.logintime = logintime;
    }
}

