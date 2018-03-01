package cn.buaaqingyuan.util;

import java.net.URLEncoder;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class Client {
	
	public static JSONObject getSegInfo(String sentence) {
		String remote="http://10.2.4.83:8090/AnsjRESTful/segment/one/";
        HttpClient client=new HttpClient();
        
        String request = remote+URLEncoder.encode(sentence);
        HttpMethod method =new GetMethod(request);
        method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,"utf-8");
        
        String responseMsg = "{}";
        
        try{
        	int statusCode = client.executeMethod(method);   
        	System.out.println("---------"+statusCode+"------------");
        	if(statusCode==200)
        	{
        		byte[] responseBody=method.getResponseBody(); 
        		responseMsg=new String(responseBody);
        		System.out.println(responseMsg);
        	}
        }catch(Exception e)
        {
        	System.out.println("connection error.");
        }finally{
        	method.releaseConnection();
        }
        
        JSONObject obj=JSON.parseObject(responseMsg);
        return obj;
	}
	
	public static JSONObject getModelResult(String sentence,String pos) {
		String remote="http://10.2.5.125:5001/relation";
        HttpClient client=new HttpClient();
        //client.getParams().setContentCharset("GBK"); 
        PostMethod method =new PostMethod(remote);
        method.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,"utf-8");
        method.addParameter("sentence", sentence);
        method.addParameter("pos", pos);
        String responseMsg = "{}";
        
        try{
        	int statusCode = client.executeMethod(method);   
        	System.out.println("---------"+statusCode+"------------");
        	if(statusCode==200)
        	{
        		responseMsg = method.getResponseBodyAsString().trim();
        		System.out.println(responseMsg);
        	}
        }catch(Exception e)
        {
        	System.out.println("connection error.");
        }finally{
        	method.releaseConnection();
        }
        JSONObject obj=JSON.parseObject(responseMsg);
        return obj;
	}
	
	public static void main(String[] args)
	{
		/*
		String sentence = "结论   大 柴胡 汤 联合 消炎 利胆 片 治疗 慢性 胆囊炎 疗效 确切 ,";
		String pos = "n null a n n v vn nz q v b n n a null";
		sendGet(sentence,pos);
		*/
		
		String sentence = "结论 大柴胡汤联合消炎利胆片治疗慢性胆囊炎疗效确切,";
		getSegInfo(sentence);
	}
		
}
