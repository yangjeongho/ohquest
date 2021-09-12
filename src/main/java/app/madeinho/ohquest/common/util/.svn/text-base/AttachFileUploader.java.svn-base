package app.madeinho.ohquest.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public class AttachFileUploader {
	private static final Logger logger = LoggerFactory.getLogger(AttachFileUploader.class);
	private static final String DEFAULT_FILEINPUT_NAME = "attach";
	
	@Value("${attach.temp.path}") private String uploadTemporayPath ;
	@Value("${user.image.uploadpath}") private String userImageUploadPath ;
	
	private static AttachFileUploader attachFileUploader ;  
	public static AttachFileUploader  getInstance(){
		if(attachFileUploader == null){
			attachFileUploader = new AttachFileUploader();
		}
		return attachFileUploader ;
	}
	@PostConstruct
	public void init() {
		File destinationPath = new File(uploadTemporayPath);

		if(!destinationPath.exists()){
			destinationPath.mkdirs();

			if (logger.isDebugEnabled()) {
				logger.debug("init : directroy " + destinationPath + " maked.");
			}
		}else{
			// 초기 임시 저장소 clear한다. 
			File destination = new File(uploadTemporayPath);
			if(destination.isDirectory()){
				for(File file : destination.listFiles()){
					file.delete();
				}
			}
		}
	}

	public File upload(HttpServletRequest request) throws IOException, Exception {
		return upload(request, uploadTemporayPath);
	}

	public File upload(HttpServletRequest request, String path) throws IOException, Exception {
		File retFile = null ;
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile(DEFAULT_FILEINPUT_NAME);

			File destinationPath = new File(path);

			if (logger.isDebugEnabled()) {
				logger.debug(" upload : fileList = " + multipartFile );
			}
			if (multipartFile != null && !multipartFile.isEmpty()) {
				retFile = getAttachFileList(destinationPath, multipartFile);
				
				
				// 파일이 복사될 위치 지정.
				/*File destination = new File(uploadTemporayPath+ "/war/" + multipartFile.getOriginalFilename());
				FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(destination));*/
				
			}
		} catch (Exception e) {
			throw e;
		}
		return retFile ;
	}
	
	public void download(HttpServletResponse response, String filepath, String orgFileName) {
		FileInputStream fis = null;
		try {
			response.setHeader("Content-Disposition",
					"attachment;fileName=\"" + StringUtils.replace(orgFileName, "+", "%20")
							+ "\";");
			File file = new File(filepath);
			response.setContentType("application/octet-stream");
			response.setContentLength((int) file.length());
			response.setHeader("Content-Transfer-Encoding", "binary");
			OutputStream out;
			out = response.getOutputStream();
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();

				}
			}
		}
	}
	
	private File getAttachFileList(File destinationPath, MultipartFile multipartFile) 
	throws IOException, FileNotFoundException, Exception {
		
		File destination = null ;
		try {
			if (logger.isDebugEnabled()) {
				logger.debug("fileName=" + multipartFile.getOriginalFilename() 
						+ ", fileSize=" + multipartFile.getSize());
			}

			if (!multipartFile.isEmpty()) {
				// 파일이 복사될 위치 지정.
				destination = File.createTempFile("file", multipartFile.getName(),
						destinationPath);
				FileCopyUtils.copy(multipartFile.getInputStream(),new FileOutputStream(destination));

			}
		} catch (Exception e) {
			throw e;
		}
		return destination ;
	}
	
	public File uploadUserImage(HttpServletRequest request, String custNo) throws IOException, Exception {
		File retFile = null ;
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile multipartFile = multipartRequest.getFile(DEFAULT_FILEINPUT_NAME);

			copyUserImage(multipartFile, custNo, 180, 200);
		} catch (Exception e) {
			throw e;
		}
		return retFile ;
	}
	public void copyUserImage(MultipartFile multipartFile, String custNo, int width, int height ) throws IOException, Exception {
		File tmpFile = new File(userImageUploadPath+"/" + custNo);
		if(!tmpFile.exists()){
			tmpFile.mkdirs();
		}
		File destination = new File(userImageUploadPath+"/" + custNo+ "/" + custNo+"_ORG");
		try {
			FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(destination));
			ImageRender render = new ImageRender();		
			render.resize(destination.getPath(), tmpFile.getPath() + "/" +custNo, width, height);	
		} catch (Exception ex) {
			if(logger.isErrorEnabled()){
				logger.error("[error]", ex);
			}
		} finally {
			/*if(destination != null)
				destination.delete();*/
		}		
	}
	
	public List<MultipartFile> uploadFiles(HttpServletRequest request) throws IOException, Exception {
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			List<MultipartFile> multipartFiles = multipartRequest.getFiles(DEFAULT_FILEINPUT_NAME);
			return multipartFiles ;
		} catch (Exception e) {
			throw e;
		}		
	}
	
	public void downloadUserImage(HttpServletResponse response, String downLoadPath, String fileName) {
		try {
			File userFile = new File(userImageUploadPath + downLoadPath);
			if(userFile.exists()){
				download(response, userImageUploadPath + downLoadPath, fileName);
			}else{
				download(response, userImageUploadPath+"/no_user.jpg", fileName);
			}
		} catch (Exception e) {
		}		
	}
}
