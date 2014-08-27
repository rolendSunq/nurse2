package nurse.emp.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

import nurse.emp.service.FileUploadService;

public class FileUploadServiceImpl implements FileUploadService {

	@Override
	public void fileUploadToServer(MultipartFile file) {
		InputStream inputStream = null;
		OutputStream outputStream = null;
		String saveFolder = "/uploadFiles";
		
		
		try
		{
			inputStream = file.getInputStream();
			File newFile = new File("C:/Temp/File/files/" + file.getName());
			if (!newFile.exists())
				newFile.createNewFile();
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] bytes = new byte[1024];
			
			while((read = inputStream.read(bytes)) != -1){
				outputStream.write(bytes, 0, read);
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

}
