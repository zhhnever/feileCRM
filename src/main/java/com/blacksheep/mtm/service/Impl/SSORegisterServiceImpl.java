package com.blacksheep.mtm.service.Impl;

import java.util.Date;
import java.util.List;


import com.blacksheep.mtm.common.exception.XmallException;
import com.blacksheep.mtm.dao.TbMemberMapper;
import com.blacksheep.mtm.dao.TbMemberQuestionMapper;
import com.blacksheep.mtm.dto.front.MemberLoginRegist;
import com.blacksheep.mtm.pojo.manager.TbMember;
import com.blacksheep.mtm.pojo.manager.TbMemberExample;
import com.blacksheep.mtm.pojo.manager.TbMemberQuestion;
import com.blacksheep.mtm.service.SSORegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;


@Service
public class SSORegisterServiceImpl implements SSORegisterService {
	
	@Autowired
	private TbMemberMapper tbMemberMapper;
	@Autowired
	private TbMemberQuestionMapper tbMemberQuestionMapper;
	@Override
	public boolean checkData(String param, int type) {

		TbMemberExample example = new TbMemberExample();
		TbMemberExample.Criteria criteria = example.createCriteria();
		criteria.andStateEqualTo(1);
		//1：用户名 2：手机号 3：邮箱
		if (type == 1) {
			criteria.andUsernameEqualTo(param);
		} else if (type == 2) {
			criteria.andPhoneEqualTo(param);
		} else if (type == 3) {
			criteria.andEmailEqualTo(param);
		} else {
			return false;
		}

		List<TbMember> list = tbMemberMapper.selectByExample(example);
		if (list != null && list.size()>0) {
			return false;
		}
		return true;
	}

	@Override
	@Transactional
	public int register(MemberLoginRegist memberLoginRegist) {

		TbMember tbMember=new TbMember();
		String userName = memberLoginRegist.getUserName();
		String phone = memberLoginRegist.getPhone();
		String sex = memberLoginRegist.getSex();
		tbMember.setUsername(userName);

		if(userName.isEmpty()||phone.isEmpty()){
			return -1; //用户名手机号不能为空
		}
		boolean phoneResult = checkData(phone, 2);
		if (!phoneResult) {
			return 0; //该手机已被注册
		}

		//MD5加密
		tbMember.setState(1);
		tbMember.setChannel(memberLoginRegist.getChannel());
		tbMember.setEducation(memberLoginRegist.getEducation());
		tbMember.setSex(sex);
		tbMember.setPhone(phone);
		tbMember.setCreated(new Date());
		tbMember.setUpdated(new Date());

		long result = tbMemberMapper.insertSelective(tbMember);

		if(result<=0){
			throw new XmallException("注册用户失败");
		}else
		{
			TbMemberQuestion tbMemberQuestion = memberLoginRegist.getTags();
			tbMemberQuestion.setmId((int)tbMember.getId());
			int qResult = tbMemberQuestionMapper.insertSelective(tbMemberQuestion);
			if (qResult <=0){
				throw new XmallException("注册用户失败");
			}
		}
		return 1;
	}

	@Override
	public int wxRegister(String userName,String userPwd) {

		TbMember tbMember=new TbMember();
		tbMember.setUsername(userName);

		if(userName.isEmpty()){
			return -1; //用户名密码不能为空
		}
		boolean result = checkData(userName, 1);
		if (!result) {
			return 0; //该手机已被注册
		}
		if (userPwd ==null){
			userPwd ="123456";
		}
		//MD5加密
		String md5Pass = DigestUtils.md5DigestAsHex(userPwd.getBytes());
		tbMember.setPassword(md5Pass);
		tbMember.setState(1);
		tbMember.setCreated(new Date());
		tbMember.setUpdated(new Date());

		if(tbMemberMapper.insert(tbMember)!=1){
			throw new XmallException("注册用户失败");
		}
		return 1;
	}


}
