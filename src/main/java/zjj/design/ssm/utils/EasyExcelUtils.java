package zjj.design.ssm.utils;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.alibaba.excel.support.ExcelTypeEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.function.Consumer;
import static com.alibaba.excel.EasyExcelFactory.write;

public class EasyExcelUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(EasyExcelUtils.class);

    public static <T> AnalysisEventListener<T> getListener(Consumer<List<T>> consumer, int threshold){
        return new AnalysisEventListener<T>() {
            /**
             * 存储数据集合
             */
            private List<T> list = new LinkedList<T>();
            /**
             * 这个每一条数据解析都会调用一次
             * @param t
             * @param analysisContext
             */
            @Override
            public void invoke(T t, AnalysisContext analysisContext) {
                list.add(t);
                if (list.size() == threshold){
                    consumer.accept(list);
                    list.clear();
                }

            }

            /**
             * 所有数据解析完成 自动调用此方法
             * @param analysisContext
             */
            @Override
            public void doAfterAllAnalysed(AnalysisContext analysisContext) {
                if (list.size()>0){
                    consumer.accept(list);
                }
            }
        };
    }

    /**
     * 根据指定字段导出数据
     * @param response
     * @param colums
     * @param dataList
     * @param aClass
     */
    public static void exportExcel(HttpServletResponse response,String[] colums, List<?> dataList,Class<?> aClass){
        try {
            //添加要导出的字段
            Set<String> includeList = new HashSet<>();
            Collections.addAll(includeList,colums);
            //设置返回类型及编码类型
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            response.setCharacterEncoding("UTF-8");
            //写出
            write(new BufferedOutputStream(response.getOutputStream()),aClass)
                    .autoCloseStream(true)
                    .excelType(ExcelTypeEnum.XLSX)
                    .includeColumnFiledNames(includeList)
                    .sheet().doWrite(dataList);
        }catch (IOException e){
            LOGGER.error(e.getMessage());
        }
    }

    /**
     * 不指定导出字段
     * 不需要导出的字段需要使用注解标记@ExcelIgnore
     * 按照实体类中注解标记顺序导出
     *
     * @param response
     * @param dataList
     * @param aClass
     */
    public static void exportExcel(HttpServletResponse response, List<?> dataList, Class<?> aClass){
        try {
            //设置返回类型及编码类型
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            response.setCharacterEncoding("UTF-8");
            //写出
            write(new BufferedOutputStream(response.getOutputStream()),aClass)
                    .autoCloseStream(true)
                    .excelType(ExcelTypeEnum.XLSX)
                    .sheet().doWrite(dataList);
        }catch (IOException e){
            LOGGER.error(e.getMessage());
        }
    }
}
