package nurse.emp.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	public void fileUploadToServer(MultipartFile file);
}
