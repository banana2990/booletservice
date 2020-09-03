package kr.project.practice.dao;

import java.util.ArrayList;
import java.util.HashMap;


import kr.project.practice.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(HashMap<String, String> params);

	MemberDTO overlay(String id);

	int join(HashMap<String, String> param);

	ArrayList<MemberDTO> memberlist();
	
	int memdelete(String id);
}
