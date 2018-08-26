package com.lvda.web.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import com.lvda.domain.PageBean;
import com.lvda.domain.Product;
import com.lvda.service.ProductService;
import com.lvda.utils.FastJsonUtil;
import com.lvda.utils.UploadUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

/**
 * 用户的控制器
 * @author Administrator
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product>{
	
	private static final long serialVersionUID = -3413092622818913571L;
	
	private Product product = new Product();
	
	public Product getModel() {
		return product;
	}
	
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
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
	
	
	public String findByPage1() {
		// 调用service业务层
		DetachedCriteria criteria = DetachedCriteria.forClass(product.getClass());
		// 查询
		PageBean<Product> page = productService.findByPage(pageCode, pageSize, criteria);
		// 压栈
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("page", page);
		return "page1";
	}
	
	// 要上传的文件
	private File upload;
	// 文件的名称
	private String uploadFileName;
	// 文件的MIME的类型
	
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String save() throws IOException {
		if(uploadFileName != null){
			// 打印
			String uuidname = UploadUtils.getUUIDName(uploadFileName);
			// 把文件上传到D:\\apache-tomcat-7.0.52\\webapps\\upload
//			String path = "F:\\LH\\Tool\\apache-tomcat-7.0.79\\webapps\\upload\\";
//			String path1 = "http://192.168.1.87:8080/upload/";
			String path = "D:\\学习资料\\java\\javaView\\Tomcat\\apache-tomcat-7.0.77\\webapps\\upload\\";
//			String path1 = "http://192.168.137.32:8080/upload/";
			String path1 = "http://192.168.43.40:8080/upload/";
			// 创建file对象http://192.168.1.87:8080/upload\
			File file = new File(path+uuidname);
			// 简单方式
			FileUtils.copyFile(upload, file);
			
			// 把上传的文件的路径，保存到客户表中
			product.setPro_img(path1+uuidname);
		}
		productService.save(product);
		return "save";
	}
	
	public String delete() {
		productService.delete(product.getPro_id());
		return "delete";
	}
	
	public String initUpdate() {
		Product product1 = productService.findById(product.getPro_id());
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().setAttribute("product", product1);
		return "initUpdate";
	}
	
	public String update() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().removeAttribute("product");
		// 判断，说明客户上传了新的图片
//		String path = "F:\\LH\\Tool\\apache-tomcat-7.0.79\\webapps\\upload\\";
//		String path1 = "http://192.168.1.87:8080/upload/";
		String path = "D:\\学习资料\\java\\javaView\\Tomcat\\apache-tomcat-7.0.77\\webapps\\upload\\";
//		String path1 = "http://192.168.137.32:8080/upload/";
		String path1 = "http://192.168.43.40:8080/upload/";
		if(uploadFileName != null){
			// 先删除旧的图片
			String img = product.getPro_img();
			String imgName = img.split("/")[img.split("/").length - 1];
			File f = new File(path + imgName);
			f.delete();
			// 上传新的图片
			// 先处理文件的名称的问题
			String uuidname = UploadUtils.getUUIDName(uploadFileName);
			File file = new File(path+uuidname);
			FileUtils.copyFile(upload, file);
			// 把客户新图片的路径更新到数据库中
			product.setPro_img(path1+uuidname);
		}
		productService.update(product);
		return "update";
	}
	
	public String findAll() {
		List<Product> list = productService.findAll(product);
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}
	
	public String findById() {
		Product product1 = productService.findById(product.getPro_id());
		ValueStack vs = ActionContext.getContext().getValueStack();
		// 栈顶是map<"page",page对象>
		vs.set("product", product1);
		return "find";
	}
}









