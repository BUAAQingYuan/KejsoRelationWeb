package cn.buaaqingyuan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.buaaqingyuan.Entity.EntityRelation;
import cn.buaaqingyuan.Entity.KejsoRecord;
import cn.buaaqingyuan.Entity.MedicineInfo;

public interface KejsoRecordDao {
	public List<KejsoRecord> getAllRecord();
	public List<EntityRelation> getRelationByEntity(String entity);
	public List<KejsoRecord> getCorpusByEntity(String entity);
	public MedicineInfo getMedicineInfoByEntity(String entity);
	public List<KejsoRecord> getRelationByEntitys(String e1, String e2);
}
