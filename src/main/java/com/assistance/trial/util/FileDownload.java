package com.assistance.trial.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDownload extends AbstractView {

	@SuppressWarnings("unchecked")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		setContentType("application/download; charset=UTF-8");

		//파일 정보 Load
		Map<String, Object> fileMap = (Map<String, Object>) model.get("fileMap");
		String filePath = (String) fileMap.get("filePath");
		String fileName = (String) fileMap.get("fileSaveName");
		String fileOriginalName = (String) fileMap.get("fileOriginalName");
		File file = new File(filePath, fileName);

		response.setContentType(getContentType());
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");

		if(userAgent.indexOf("MSIE") != -1) {
			fileOriginalName = URLEncoder.encode(fileOriginalName,"UTF-8");
		}else {
			fileOriginalName = new String(fileOriginalName.getBytes("UTF-8"), "ISO-8859-1");
		}

		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileOriginalName + "\"");

		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis != null) {
				try {
					fis.close();
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
			out.flush();
		}

	}
}