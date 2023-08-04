package zjj.design.ssm.service;

import java.util.List;

public interface ExcelService {
     <T> void batchExport(List<T> list, Class<T> clazz);
}
