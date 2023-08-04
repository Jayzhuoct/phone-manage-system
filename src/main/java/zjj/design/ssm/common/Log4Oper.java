package zjj.design.ssm.common;


import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

public class Log4Oper {
    private static final Logger logger = Logger.getLogger(Log4Oper.class);


    public static void logInfo(String module, String method, String operType, String operDesc, String reqMethod, String operParam, String operIp, String operUri, String operUser) {
        MDC.put("oper_module", module);
        MDC.put("oper_method", method);
        MDC.put("oper_type", operType);
        MDC.put("oper_desc", operDesc);
        MDC.put("req_method", reqMethod);
        MDC.put("oper_param", operParam);
        MDC.put("oper_ip", operIp);
        MDC.put("oper_url", operUri);
        MDC.put("oper_user", operUser);
        logger.info("--操作日志记录--");
        MDC.clear();
    }
}
