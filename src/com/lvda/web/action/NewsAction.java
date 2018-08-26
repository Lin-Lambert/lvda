package com.lvda.web.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.News;
import com.lvda.domain.PageBean;
import com.lvda.service.NewsService;
import com.lvda.utils.FastJsonUtil;
import com.lvda.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

public class NewsAction extends ActionSupport implements ModelDriven<News> {

	private static final long serialVersionUID = 1L;

	private News news = new News();

	public News getModel() {
		return news;
	}

	private NewsService newsService;

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	// 属性驱动的方式
	// 当前页，默认值就是1
	private Integer pageCode = 1;

	public void setPageCode(Integer pageCode) {
		if (pageCode == null) {
			pageCode = 1;
		}
		this.pageCode = pageCode;
	}

	// 每页显示的数据的条数
	private Integer pageSize = 3;

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 分页的查询方法
	 * 
	 * @return
	 */
	public String findByPage() {
		// 调用service业务层
		DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
		// 查询
		PageBean<News> page = newsService.findByPage(pageCode, pageSize, criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		return "page";
	}
	public String findByPage1() {
		// 调用service业务层
		DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
		// 查询
		PageBean<News> page = newsService.findByPage(pageCode, pageSize, criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		return "page1";
	}
	public String findByPage2() {
		// 调用service业务层
		DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
		// 查询
		PageBean<News> page = newsService.findByPage(pageCode, 1, criteria);
		List<News> news = page.getBeanList();
		String jsonString = FastJsonUtil.toJSONString(news);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}
	public String findByPage3() {
		System.out.println(news.getNt_id());
		// 调用service业务层
		DetachedCriteria criteria = DetachedCriteria.forClass(news.getClass());
		// 查询
		PageBean<News> page = newsService.findByPage(pageCode, 10, criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		return "page3";
	}

	
	// 要上传的文件
	private File upload1;
	// 文件的名称
	private String upload1FileName;
	// 文件的MIME的类型
	
	public void setUpload1(File upload1) {
		this.upload1 = upload1;
	}
	public void setUpload1FileName(String upload1FileName) {
		this.upload1FileName = upload1FileName;
	}
	private File upload2;
	// 文件的名称
	private String upload2FileName;
	// 文件的MIME的类型
	
	public void setUpload2(File upload2) {
		this.upload2 = upload2;
	}
	public void setUpload2FileName(String upload2FileName) {
		this.upload2FileName = upload2FileName;
	}
		
	public String save() throws IOException{
		// 做文件的上传，说明用户选择了上传的文件了
		if(upload1FileName != null){
			// 打印
			// 把文件的名称处理一下
			String uuidname = UploadUtils.getUUIDName(upload1FileName);
			// 把文件上传到D:\\apache-tomcat-7.0.52\\webapps\\upload
//			String path = "F:\\LH\\Tool\\apache-tomcat-7.0.79\\webapps\\upload\\";
//			String path1 = "http://192.168.1.87:8080/upload/";
			String path = "D:\\学习资料\\java\\javaView\\Tomcat\\apache-tomcat-7.0.77\\webapps\\upload\\";
//			String path1 = "http://192.168.137.32:8080/upload/";
			String path1 = "http://192.168.43.40:8080/upload/";
			// 创建file对象http://192.168.1.87:8080/upload\
			File file = new File(path+uuidname);
			// 简单方式
			FileUtils.copyFile(upload1, file);
			
			// 把上传的文件的路径，保存到客户表中
			news.setNt_img1(path1+uuidname);
		}
		if(upload2FileName != null){
			// 打印
			// 把文件的名称处理一下
			String uuidname = UploadUtils.getUUIDName(upload2FileName);
			// 把文件上传到D:\\apache-tomcat-7.0.52\\webapps\\upload
//			String path = "F:\\LH\\Tool\\apache-tomcat-7.0.79\\webapps\\upload\\";
//			String path1 = "http://192.168.1.87:8080/upload/";
			String path = "D:\\学习资料\\java\\javaView\\Tomcat\\apache-tomcat-7.0.77\\webapps\\upload\\";
//			String path1 = "http://192.168.137.32:8080/upload/";
			String path1 = "http://192.168.43.40:8080/upload/";
			// 创建file对象
			File file = new File(path+uuidname);
			// 简单方式
			FileUtils.copyFile(upload2, file);
			
			// 把上传的文件的路径，保存到客户表中
			news.setNt_img2(path1+uuidname);
		}
		
		// 保存客户成功了
		newsService.save(news);
		return "save";
	}
	
	public String delete(){
		// 删除客户，获取客户的信息获取到，上传文件的路径
		news = newsService.findById(news);
		// 获取上传文件的路径
		String img1 = news.getNt_img1();
		String img2 = news.getNt_img2();
//		String path = "F:\\LH\\Tool\\apache-tomcat-7.0.79\\webapps\\upload\\";
		String path = "D:\\学习资料\\java\\javaView\\Tomcat\\apache-tomcat-7.0.77\\webapps\\upload\\";
		String img1Name = img1.split("/")[img1.split("/").length - 1];
		String img2Name = img2.split("/")[img2.split("/").length - 1];
		// 删除客户
		newsService.delete(news);
		
		// 再删除文件
		File file1 = new File(path + img1Name);
		File file2 = new File(path + img2Name);
		if(file1.exists()){
			file1.delete();
		}
		if(file2.exists()){
			file2.delete();
		}
		
		return "delete";
	}
	
	public String initUpdate(){
		news = newsService.findById(news);
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("news", news);
		return "initUpdate";
	}
	
	public String update() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("news");
		// 判断，说明客户上传了新的图片
//		String path = "F:\\LH\\Tool\\apache-tomcat-7.0.79\\webapps\\upload\\";
//		String path1 = "http://192.168.1.87:8080/upload/";
		String path = "D:\\学习资料\\java\\javaView\\Tomcat\\apache-tomcat-7.0.77\\webapps\\upload\\";
//		String path1 = "http://192.168.137.32:8080/upload/";
		String path1 = "http://192.168.43.40:8080/upload/";
		if(upload1FileName != null){
			// 先删除旧的图片
			String img1 = news.getNt_img1();
			String img1Name = img1.split("/")[img1.split("/").length - 1];
			File f = new File(path + img1Name);
			f.delete();
			// 上传新的图片
			// 先处理文件的名称的问题
			String uuidname = UploadUtils.getUUIDName(upload1FileName);
			File file = new File(path+uuidname);
			FileUtils.copyFile(upload1, file);
			// 把客户新图片的路径更新到数据库中
			news.setNt_img1(path1+uuidname);
		}
		if(upload2FileName != null){
			// 先删除旧的图片
			String img2 = news.getNt_img2();
			String img2Name = img2.split("/")[img2.split("/").length - 1];
			File f = new File(path + img2Name);
			f.delete();
			// 上传新的图片
			// 先处理文件的名称的问题
			String uuidname = UploadUtils.getUUIDName(upload2FileName);
			File file = new File(path+uuidname);
			FileUtils.copyFile(upload2, file);
			// 把客户新图片的路径更新到数据库中
			news.setNt_img2(path1+uuidname);
		}
		// 更新客户的信息就OK了
		newsService.update(news);
		
		return "update";
	}
	
	public String findById(){
		news = newsService.findById(news);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("news", news);
		return "find";
	}
	
}
