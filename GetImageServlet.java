package com.mobile.db;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUtils;

/**
 * Servlet implementation class GetImageServlet
 */
@WebServlet("/GetImageServlet")
public class GetImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		byte b[]=null;
		if(request.getParameter("fname")==null ||request.getParameter("fname").equals("null") || request.getParameter("fname").equals("")) {
			Path p=Paths.get(request.getRealPath("/"),"nomember.png");
			System.out.println(p.toString());
			b=Files.readAllBytes(p);
		}else {
			Path p=Paths.get(request.getRealPath("/member_image"),request.getParameter("fname"));
			b=Files.readAllBytes(p);
			
		}
		response.setContentType("image/jpeg");
		response.setContentLength(b.length);
		ServletOutputStream os= response.getOutputStream();
		os.write(b, 0, b.length); //byte array,startindex,length
		os.flush();//send response to browser
		os.close(); //close stream
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
