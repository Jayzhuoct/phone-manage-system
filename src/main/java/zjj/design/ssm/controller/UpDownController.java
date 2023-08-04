package zjj.design.ssm.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class UpDownController {
    private String path = "src/main/resources/up/";

    @RequestMapping("/down")
    public String toDownload(){
        return "file/down";
    }

    @RequestMapping("/update")
    public String uploadPage() {
        return "file/upload";
    }

    @PostMapping("/upload")
    @ResponseBody
    public String create(@RequestPart MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        String filePath = path + fileName;
        File dest = new File(filePath);
        Files.copy(file.getInputStream(), dest.toPath());
        return "文件上传成功！路径为: " + dest.getAbsolutePath();
    }

}
