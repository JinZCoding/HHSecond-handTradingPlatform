package com.service;

import com.entity.Classify;

public interface ClassifyService {
	void insertClassify(Classify classify);
	Classify getClassify(String classofyName);

}
