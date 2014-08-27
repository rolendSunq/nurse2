package nurse.emp.controller;

import java.io.InputStream;
import java.io.OutputStream;

import nurse.emp.vo.UploadedFile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller("fileUploadContoller")
public class FileUploadController {
	
	
	@RequestMapping("/fileUpload")
	public ModelAndView fileUploaded(@ModelAttribute("uploadedFile") UploadedFile uploadedFile){
		
		MultipartFile file = uploadedFile.getFile();
		
		String fileName = file.getOriginalFilename();
		
		
		
		
		return new ModelAndView("showFile","message", fileName);
	}
	
}
