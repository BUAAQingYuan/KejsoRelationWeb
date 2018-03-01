package cn.buaaqingyuan.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Util {
	
	public static List<String> getEntity(String relation_string)
	{
		List<String> results = new ArrayList<String>();
		if(relation_string == null || relation_string == "")
		{
			return results;
		}
		String[] entitys = relation_string.split("\\|\\|");
		for(int i=0;i<entitys.length;i++)
		{
			results.add(entitys[i]);
		}
		return results;
	}
	
	public static Map getNodeInfo(List<String> relation_strings)
	{
		Map nodes = new HashMap();
		List<String> results = new ArrayList<String>();
		int count = 0;
		for(String relation_string : relation_strings)
		{
			results.clear();
			results = getEntity(relation_string);
			for(String result:results)
			{
				nodes.put(result,String.valueOf(count));
			}
			count += 1;
		}
		
		return nodes;
	}
	
	public static void main(String[] args)
	{
		String content = "中央国家安全委员会主席||国家副书记||中国新任国家主席||中共中央主席||中共中央委员会总书记||新任国家主席||国家主席||中华人民共和国国家主席||中国国家主席||中央委员会总书记||中共浙江省委书记||习近平||国家军委主席||浙江省委书记||中国共产党新任总书记||我国国家主席||中国主席||省人大常委会主任||中国国家总书记||中共中央军委主席||中共中央总书记||中央军委副主席||中国共产党总书记||纪检监察机关严格执行中共中央总书记||中华人民共和国副主席||中华人民共和国中央军事委员会主席||中央书记处书记||新任中共中央总书记||上海市市委书记||直播国家主席||中共中英总书记||中央军委主席||我国中共中央总书记||中华人民共和国主席|";
		List<String> results = new ArrayList<String>();
		results = Util.getEntity(content);
		for(String one:results)
		{
			System.out.println(one);
		}
	}
}
