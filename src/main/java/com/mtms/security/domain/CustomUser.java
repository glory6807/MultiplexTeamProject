package com.mtms.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mtms.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{

	private static final long serialVersionUID = 1L;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	
}
