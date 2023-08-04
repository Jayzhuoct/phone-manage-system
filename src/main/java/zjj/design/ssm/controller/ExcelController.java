package zjj.design.ssm.controller;

import com.alibaba.excel.EasyExcelFactory;
import com.alibaba.excel.event.AnalysisEventListener;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import zjj.design.ssm.entity.*;
import zjj.design.ssm.service.*;
import zjj.design.ssm.utils.EasyExcelUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/excel")
public class ExcelController {

    @Resource
    private PhoneService phoneService;

    @Resource
    private SalesService salesService;

    @Resource
    private RepertoryService repertoryService;

    @Resource
    private BrandService brandService;

    @Resource
    private VendorService vendorService;

    @Resource
    private LoginfoService loginfoService;

    @Resource
    private OperLogService operLogService;

    @Resource
    private ExcelService excelService;

    @RequestMapping("/export/phone")
    public String readPhone(HttpServletResponse response){
        List<Phone> list = phoneService.list();
        EasyExcelUtils.exportExcel(response,list,Phone.class);
        return "redirect:/phone/list";
    }

    @RequestMapping("/export/sales")
    public String readSalary(HttpServletResponse response){
        List<Sales> list = salesService.list();
        EasyExcelUtils.exportExcel(response,list, Sales.class);
        return "redirect:/salary/list";
    }

    @RequestMapping("/export/repertory")
    public String readRepertory(HttpServletResponse response){
        List<Repertory> list = repertoryService.list();
        EasyExcelUtils.exportExcel(response,list, Repertory.class);
        return "redirect:/repertory/list";
    }

    @RequestMapping("/export/brand")
    public String readBrand(HttpServletResponse response){
        List<Brand> list = brandService.list();
        EasyExcelUtils.exportExcel(response,list, Brand.class);
        return "redirect:/brand/list";
    }

    @RequestMapping("/export/vendor")
    public String readVendor(HttpServletResponse response){
        List<Vendor> list = vendorService.list();
        EasyExcelUtils.exportExcel(response,list, Vendor.class);
        return "redirect:/vendor/list";
    }

    @RequestMapping("/export/loginfo")
    public String readLoginfo(HttpServletResponse response){
        List<Loginfo> list = loginfoService.list();
        EasyExcelUtils.exportExcel(response,list, Loginfo.class);
        return "redirect:/loginfo/list";
    }

    @RequestMapping("/export/operlog")
    public String readOperLog(HttpServletResponse response){
        List<OperLog> list = operLogService.list();
        EasyExcelUtils.exportExcel(response,list, OperLog.class);
        return "redirect:/operlog/list";
    }

    @RequestMapping("/append/phone")
    public String appendPhone(@RequestParam MultipartFile file) throws IOException {
        AnalysisEventListener<Phone> listener =
                EasyExcelUtils.getListener(list -> excelService.batchExport(list,Phone.class), 10000);
        EasyExcelFactory.read(new BufferedInputStream(file.getInputStream()), Phone.class,listener);
        return "redirect:/phone/list";
    }

    @RequestMapping("/append/sales")
    public String appendSalary(@RequestParam MultipartFile file) throws IOException {
        AnalysisEventListener<Sales> listener =
                EasyExcelUtils.getListener(list -> excelService.batchExport(list,Sales.class), 10000);
        EasyExcelFactory.read(new BufferedInputStream(file.getInputStream()), Sales.class,listener);
        return "redirect:/salary/list";
    }

    @RequestMapping("/append/repertory")
    public String appendRepertory(@RequestParam MultipartFile file) throws IOException {
        AnalysisEventListener<Repertory> listener =
                EasyExcelUtils.getListener(list -> excelService.batchExport(list,Repertory.class), 10000);
        EasyExcelFactory.read(new BufferedInputStream(file.getInputStream()), Repertory.class,listener);
        return "redirect:/repertory/list";
    }


}
