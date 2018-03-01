package cn.buaaqingyuan.dao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;
import org.springframework.stereotype.Repository;

import cn.buaaqingyuan.Entity.EntityRelation;
import cn.buaaqingyuan.Entity.KejsoRecord;
import cn.buaaqingyuan.Entity.MedicineInfo;

@Repository("kejsoRecordDao")
public class KejsoRecordDaoImpl implements KejsoRecordDao{
	
	@Resource  
    private JdbcTemplate jdbcTemplate;   
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {  
        this.jdbcTemplate = jdbcTemplate;  
    }  

	@SuppressWarnings("unchecked")
	public List<KejsoRecord> getAllRecord() {
		
		List<KejsoRecord> records = new ArrayList<KejsoRecord>();  
		
		String sql = "select * from relations limit 10";  
		records = jdbcTemplate.query(sql, new ResultSetExtractor() {		  
            public Object extractData(ResultSet rs) throws SQLException, DataAccessException { 
            	List<KejsoRecord> res = new ArrayList<KejsoRecord>();  
                while (rs.next()) {  
                    KejsoRecord u = new KejsoRecord();  
                    u.setId(rs.getInt("id"));  
                    u.setSentence(rs.getString("sentence"));  
                    res.add(u);  
                }  
  
                return res;  
            }  
  
        });  
		return records;
	}

	@SuppressWarnings("unchecked")
	public List<EntityRelation> getRelationByEntity(String entity) {
		
		List<EntityRelation> records = new ArrayList<EntityRelation>();  
		
		String sql = "select * from entity_map where entity=?"; 
		records = jdbcTemplate.query(sql, new Object[]{entity},new ResultSetExtractor() {		  
            public Object extractData(ResultSet rs) throws SQLException, DataAccessException { 
            	List<EntityRelation> res = new ArrayList<EntityRelation>();  
                while (rs.next()) {  
                	EntityRelation u = new EntityRelation();  
                    u.setId(rs.getInt("id"));  
                    u.setEntity(rs.getString("entity"));
                    u.setCause_entitys(rs.getString("Cause_entitys"));
                    u.setDescribe_entitys(rs.getString("Describe_entitys"));
                    u.setFrom_entitys(rs.getString("From_entitys"));
                    u.setIdentity_entitys(rs.getString("Identity_entitys"));
                    u.setMedicine_entitys(rs.getString("Medicine_entitys"));
                    u.setPart_entitys(rs.getString("Part_entitys"));
                    u.setPosition_entitys(rs.getString("Position_entitys"));
                    u.setEdges(rs.getInt("edges"));
                    u.setMedicine_count(rs.getInt("medicine_count"));
                    res.add(u);  
                }  
  
                return res;  
            }  
  
        });  
		return records;
	}

	@SuppressWarnings("unchecked")
	public List<KejsoRecord> getCorpusByEntity(String entity) {
		
		List<KejsoRecord> records = new ArrayList<KejsoRecord>(); 
		
		String sql = "select * from relations where e1=? or e2=?"; 
		records = jdbcTemplate.query(sql, new Object[]{entity,entity},new ResultSetExtractor() {		  
            public Object extractData(ResultSet rs) throws SQLException, DataAccessException { 
            	List<KejsoRecord> res = new ArrayList<KejsoRecord>();  
                while (rs.next()) {  
                	KejsoRecord u = new KejsoRecord();  
                    u.setId(rs.getInt("id"));  
                    u.setSentence(rs.getString("sentence"));
                    u.setRelation(rs.getString("relation"));
                    u.setE1(rs.getString("e1"));
                    u.setE2(rs.getString("e2"));
                    res.add(u);  
                }  
  
                return res;  
            }  
  
        });  
		System.out.println("records size= "+records.size());
		return records;
		
	}

	public MedicineInfo getMedicineInfoByEntity(String entity) {
		List<MedicineInfo> records = new ArrayList<MedicineInfo>(); 
		String sql = "select * from medicineinfo where entity=?"; 
		records = jdbcTemplate.query(sql, new Object[]{entity},new ResultSetExtractor() {		  
            public Object extractData(ResultSet rs) throws SQLException, DataAccessException { 
            	List<MedicineInfo> res = new ArrayList<MedicineInfo>();  
                while (rs.next()) {  
                	MedicineInfo u = new MedicineInfo();  
                    u.setId(rs.getInt("id"));  
                    u.setEntity(rs.getString("entity"));
                    u.setRelations(rs.getString("relations"));
                    u.setCount(rs.getInt("count"));
                    res.add(u);  
                }  
  
                return res;  
            }  
  
        });  
		System.out.println("records size= "+records.size());
		if(records.size()>0)
			return records.get(0);
		else
			return null;
	}

	public List<KejsoRecord> getRelationByEntitys(String e1, String e2) {
		List<KejsoRecord> records = new ArrayList<KejsoRecord>(); 
		String sql = "select * from relations where e1=? and e2=?"; 
		records = jdbcTemplate.query(sql, new Object[]{e1,e2},new ResultSetExtractor() {		  
            public Object extractData(ResultSet rs) throws SQLException, DataAccessException { 
            	List<KejsoRecord> res = new ArrayList<KejsoRecord>();  
                while (rs.next()) {  
                	KejsoRecord u = new KejsoRecord();  
                    u.setId(rs.getInt("id"));  
                    u.setSentence(rs.getString("sentence"));
                    u.setRelation(rs.getString("relation"));
                    u.setE1(rs.getString("e1"));
                    u.setE2(rs.getString("e2"));
                    res.add(u);  
                }  
  
                return res;  
            }  
  
        });  
		System.out.println("records size= "+records.size());
		return records;
	}
	
}
