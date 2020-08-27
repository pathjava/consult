package user;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;

//@WebServlet("/user/multipart")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 2, maxRequestSize = 1024 * 1024 * 5 * 5)
public class UserMultiPartUpload extends HttpServlet {

    private static final String FILE_DIRECTORY = "avatars";
    private String fileName;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + FILE_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists())
            return; //TODO - сообщение об отсутствии директории

        for (Part part : req.getParts()) {
            if (part.getName().equals("imageFile")) {
                fileName = getDateTime() + getFileName(part);
                part.write(uploadPath + File.separator + fileName);
            }
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename"))
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
        }
        return "";
    }

    private static String getDateTime() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        return dtf.format(java.time.LocalDateTime.now()) + "_";
    }
}
