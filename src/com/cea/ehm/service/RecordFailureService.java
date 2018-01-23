package com.cea.ehm.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cea.ehm.bean.RecordFailure;
import com.cea.ehm.dao.RecordFailureMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Service
public class RecordFailureService {
	@Autowired
	RecordFailureMapper recordFailureMapper;
	public PageList<RecordFailure> recordinfo(Map<String, String>paramMap,PageBounds pageBounds){
		return recordFailureMapper.recordinfos(paramMap, pageBounds);
	}
	public void hptbadd(RecordFailure recordFailure) {
		recordFailureMapper.recordadd(recordFailure);
	}
	public void hptbupdate(RecordFailure recordFailure) {
		recordFailureMapper.recordupdate(recordFailure);
	}
	public void hptbdelete(RecordFailure recordFailure) {
		recordFailureMapper.recorddelete(recordFailure);
	}
	
}
