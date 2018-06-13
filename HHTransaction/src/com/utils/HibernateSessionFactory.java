package com.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {
	
	private static SessionFactory sessionFactory = buildSessionFactory();
	
	private static SessionFactory buildSessionFactory() {
		Configuration cgf = new Configuration().configure();
		SessionFactory sessionFactory = cgf.buildSessionFactory();
		return sessionFactory;
	}
    public static Session getSession() {
	 Session session = sessionFactory.openSession();
	 return session;
 }
}
