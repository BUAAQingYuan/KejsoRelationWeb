package cn.buaaqingyuan.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.buaaqingyuan.Entity.EntityRelation;
import cn.buaaqingyuan.Entity.KejsoRecord;
import cn.buaaqingyuan.Entity.Link;
import cn.buaaqingyuan.Entity.MedicineInfo;
import cn.buaaqingyuan.Entity.Node;
import cn.buaaqingyuan.dao.KejsoRecordDaoImpl;
import cn.buaaqingyuan.service.SpringContextHolder;
import cn.buaaqingyuan.util.Client;
import cn.buaaqingyuan.util.EntityFinder;
import cn.buaaqingyuan.util.Util;

@Controller  
@RequestMapping("/kejso")  
public class KejsoRecordController {
	
	@Resource  
    private KejsoRecordDaoImpl jdbcDataDAO;  
    public void setJdbcDataDAO(KejsoRecordDaoImpl jdbcDataDAO) {  
        this.jdbcDataDAO = jdbcDataDAO;  
    }  
	
	@RequestMapping(value = "/getRecordInfo", method = RequestMethod.GET)  
    public String getStudentInfo(HttpServletRequest request,ModelMap model) {  
		
		List<KejsoRecord> records = jdbcDataDAO.getAllRecord();
		/*
		for(int i=0;i<records.size();i++)
		{
			System.out.println(records.get(i).getId()+" "+records.get(i).getSentence());
		}
		*/
        model.addAttribute("students", jdbcDataDAO.getAllRecord());  
        return "showRecordInfo";  
    }  
	
	
	@RequestMapping(value = "/Topic/corpus", method = RequestMethod.GET)  
    public String getTopicCorpus(HttpServletRequest request,ModelMap model) {  
		System.out.println("corpus.jsp");
        return "Topic/corpus";  
    }  
	
	@RequestMapping(value = "/Topic/network", method = RequestMethod.GET)  
    public String getTopicNetwork(HttpServletRequest request,ModelMap model) {  
		System.out.println("network.jsp");
        return "Topic/network";  
    }  
	
	@RequestMapping(value = "/Topic/medicine", method = RequestMethod.GET)  
    public String getTopicMedicine(HttpServletRequest request,ModelMap model) {  
		System.out.println("medicine.jsp");
        return "Topic/medicine";  
    }
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)  
	@ResponseBody
    public JSONObject search(HttpServletRequest request,ModelMap model) {  
		System.out.println("seach sentence");
		//search info
		String  sentence=request.getParameter("sentence");
		System.out.println(sentence);
		//entity find
		List<String> results = EntityFinder.GetEntitysFromText(sentence);
		System.out.println("entity size = " + results.size());
		String label_sent = sentence;
		List<String> colors = new ArrayList<String>(Arrays.asList("red","#00ff00","rgb(0,0,255)")); 
		int count = 0;
		for(String result : results)
		{
			System.out.println(result);
			String color = colors.get(count % 3);
			label_sent = label_sent.replaceFirst(result, "<font style='font-size:120%;color:"+color+"'><strong>"+result+"</strong></font>");
			count += 1;
		}
		System.out.println(label_sent);
		//predict
		List<String> relations = new ArrayList<String>();
		if(results.size() == 2)
		{
			JSONObject seg = Client.getSegInfo(sentence);
			String sent = seg.getString("sentence");
			String pos = seg.getString("pos");
			String type = "";
			if(!sent.equals("")&&sent!=null&&!pos.equals("")&&pos!=null)
			{
				JSONObject modelresult = Client.getModelResult(sent, pos);
				type = modelresult.getString("predict");
			}
			JSONObject jsonObject = new JSONObject();
			if(!type.equals("Other"))
			{
				String temp = "<font style='font-size:120%'><strong>"+results.get(0)+"</strong></font>"+"-----"+"<font style='font-size:120%'><strong>"+results.get(1)+"</strong></font>";
				temp += "----->" + "<font style='font-size:120%;color:#00ff00'><strong>"+type+"</strong></font>";
				relations.add(temp);
			}
			jsonObject.put("classification", JSONArray.toJSON(relations));
			jsonObject.put("sentence", label_sent);
			return jsonObject;
		}else if(results.size() > 2)
		{
			for(int i=0;i<results.size();i++)
			{
				for(int j=i+1;j<results.size();j++)
				{
					String e1 = results.get(i);
					String e2 = results.get(j);
					List<KejsoRecord> records = jdbcDataDAO.getRelationByEntitys(e1, e2);
					if(records!=null&&records.size()>0)
					{
						if(!records.get(0).getRelation().equals("Other"))
						{
							String temp = "<font style='font-size:120%'><strong>"+e1+"</strong></font>"+"-----"+"<font style='font-size:120%'><strong>"+e2+"</strong></font>";
							temp  += "----->" + "<font style='font-size:120%;color:#00ff00'><strong>"+records.get(0).getRelation()+"</strong></font>";
							relations.add(temp);
						}
					}
				}
			}
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("classification", JSONArray.toJSON(relations));
			jsonObject.put("sentence", label_sent);
			return jsonObject;
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("classification", JSONArray.toJSON(relations));
		jsonObject.put("sentence", label_sent);
		return jsonObject;
    }  
	
	
	@RequestMapping(value = "/corpus", method = RequestMethod.POST)  
	@ResponseBody
    public JSONObject getCorpusByEntity(HttpServletRequest request,ModelMap model) {
		System.out.println("seach corpus");
		//search info
		String  entity=request.getParameter("entity");
		System.out.println(entity);
		
		List<KejsoRecord> records = jdbcDataDAO.getCorpusByEntity(entity);
		
		List<String> cause = new ArrayList<String>();
		List<String> describe = new ArrayList<String>();
		List<String> from = new ArrayList<String>();
		List<String> identity = new ArrayList<String>();
		List<String> medicine = new ArrayList<String>();
		List<String> part = new ArrayList<String>();
		List<String> position = new ArrayList<String>();
		//add tag
		for(KejsoRecord record : records)
		{
			String target = "";
			if(record.getE1().equals(entity))
			{
				target = record.getE2();
			}else if(record.getE2().equals(entity))
			{
				target = record.getE1();
			}
			if(target == "")
			{
				System.out.println(record.getE1()+" "+record.getE2());
				continue;
			}
			
			System.out.println(record.getSentence());
			String result = record.getSentence().replaceFirst(target, "<font style='font-size:120%;color:black'><strong>"+target+"</strong></font>").replaceFirst(entity, "<font style='font-size:120%;color:red'><strong>"+entity+"</strong></font>");
			if(record.getRelation().equals("Cause"))
			{
				cause.add(result);
			}else if(record.getRelation().equals("Describe"))
			{
				describe.add(result);
			}else if(record.getRelation().equals("From"))
			{
				from.add(result);
			}else if(record.getRelation().equals("Identity"))
			{
				identity.add(result);
			}else if(record.getRelation().equals("Medicine"))
			{
				medicine.add(result);
			}else if(record.getRelation().equals("Part"))
			{
				part.add(result);
			}else if(record.getRelation().equals("Position"))
			{
				position.add(result);
			}
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cause", JSONArray.toJSON(cause));
		jsonObject.put("describe", JSONArray.toJSON(describe));
		jsonObject.put("from", JSONArray.toJSON(from));
		jsonObject.put("identity", JSONArray.toJSON(identity));
		jsonObject.put("medicine", JSONArray.toJSON(medicine));
		jsonObject.put("part", JSONArray.toJSON(part));
		jsonObject.put("position", JSONArray.toJSON(position));
        return jsonObject;  
	}
	
	
	
	
	
	@RequestMapping(value = "/network", method = RequestMethod.POST)  
	@ResponseBody
    public JSONObject getEntityNetwork(HttpServletRequest request,ModelMap model) {  
		System.out.println("seach entity network");
		//search info
		String  entity=request.getParameter("entity");
		System.out.println(entity);
		
		List<EntityRelation> relations = jdbcDataDAO.getRelationByEntity(entity);
		System.out.println(relations.size());
		List<Node> nodes = new ArrayList<Node>(); // 节点列表
		List<Link> links = new ArrayList<Link>(); // 连线列表
		
		EntityRelation target = relations.get(0);
		List<String> relation_strings = new ArrayList<String>();
		relation_strings.add(target.getCause_entitys());
		relation_strings.add(target.getDescribe_entitys());
		relation_strings.add(target.getFrom_entitys());
		relation_strings.add(target.getIdentity_entitys());
		relation_strings.add(target.getMedicine_entitys());
		relation_strings.add(target.getPart_entitys());
		relation_strings.add(target.getPosition_entitys());
		Map<String,String> temp = Util.getNodeInfo(relation_strings);
		for (Map.Entry<String, String> entry : temp.entrySet()) { 
			 System.out.println("value = " + entry.getValue() + ", key = " + entry.getKey()); 
			 nodes.add(new Node(entry.getValue(),entry.getKey(), 2));
		}
		//add links
		int count = 0;
		for (Node n : nodes) {
			links.add(new Link(count, nodes.size(), 0.01));
			count += 1;
		}
		//add self
		nodes.add(new Node("7", entity, 5));
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("nodes", JSONArray.toJSON(nodes));
		jsonObject.put("links", JSONArray.toJSON(links));
        return jsonObject;  
    }  
	
	@RequestMapping(value = "/medicine", method = RequestMethod.POST)  
	@ResponseBody
    public JSONObject getMedicineNetwork(HttpServletRequest request,ModelMap model) {  
		System.out.println("seach medicine network");
		//search info
		String  entity=request.getParameter("entity");
		System.out.println(entity);
		
		MedicineInfo medicine = jdbcDataDAO.getMedicineInfoByEntity(entity);
		//解析
		List<String> entitys = new ArrayList<String>();
		List<String> relations = Arrays.asList(medicine.getRelations().split("\\|\\|"));
		/*max = 50
		if(relations.size() > 50)
		{
			Collections.shuffle(relations);
			relations = relations.subList(0, 50);
		}
		*/
		for(String one : relations)
		{
			String[] items = one.split("#");
			if(items.length == 2)
			{
				if(!items[0].equals(entity)&&!entitys.contains(items[0]))
				{
					entitys.add(items[0]);
				}
				if(!items[1].equals(entity)&&!entitys.contains(items[1]))
				{
					entitys.add(items[1]);
				}
			}
		}
		List<Node> nodes = new ArrayList<Node>(); // 节点列表
		List<Link> links = new ArrayList<Link>(); // 连线列表
		//add nodes
		Map<String,Integer> mapping = new HashMap<String,Integer>();
		int count = 0;
		for(String node:entitys)
		{
			nodes.add(new Node("1", node, 2));
			mapping.put(node, count);
			count += 1;
		}
		//add self
		nodes.add(new Node("0", entity, 5));
		mapping.put(entity, count);
		//add links
		for (String one : relations) {
			String[] items = one.split("#");
			if(items.length == 2)
			{
				int pos_1 = mapping.get(items[0]);
				int pos_2 = mapping.get(items[1]);
				links.add(new Link(pos_1, pos_2, 0.01));
			}
		}
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("nodes", JSONArray.toJSON(nodes));
		jsonObject.put("links", JSONArray.toJSON(links));
        return jsonObject;  
	}

}
