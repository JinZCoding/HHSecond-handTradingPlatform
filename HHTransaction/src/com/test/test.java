package com.test;

import org.hibernate.Session;

import com.utils.HibernateSessionFactory;

public class test {

	public static void main(String[] args) {
		Session session = HibernateSessionFactory.getSession();
	}
}
