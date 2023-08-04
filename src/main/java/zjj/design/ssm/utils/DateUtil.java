package zjj.design.ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    private static final String FORMAT_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static String getNowTime() {
        SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_PATTERN);
        return sdf.format(new Date());
    }
}