package com.example.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.DAO.LoginDAO;
import com.example.service.LoginService;


@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDAO logindao;

	/*
	 * public void setLoginDAO(LoginDAO logindao) { this.logindao = logindao; }
	 */

	@Override
	@Transactional
	public boolean validateuser(String username, String password) {
		// TODO Auto-generated method stub
		boolean flag = this.logindao.validateuser(username, password);
		return flag;
	}
}
