package com.dao;

import java.io.Serializable;
import java.util.List;

/**
 * 基础数据库操作类
 * @author Pan
 *
 */
public interface BaseDao<T> {
	/**
	 * 保存一个对象
	 * @param o
	 * @return
	 */
  public Serializable save(T o);
  /**
   * 删除一个对象
   * @param o
   */
  public void delete(T o);
  /**
   * 更新一个对象
   * @param o
   */
  public void update(T o);
  /**
   * 保存或更新一个对象
   * @param o
   */
  public void saveOrUpdate(T o);
  
  /**
   * 查询
   * @param hql
   * @return
   */
  public List<T> find(String hql);
  
  public List<T> find(String hql,Object[] param);
  
  public List<T> find(String hql,List<Object> param);
  
  /**
   * 带分页的查找
   * @param hql
   * @param param
   * @param page
   * @param row
   * @return
   */
  public List<T> find(String hql,Object[] param ,Integer page,Integer row);
  
  public List<T> find(String hql, List<Object> param, Integer page, Integer rows);
  
  /**
   * 获得一个对象
   * @param c
   * @param id
   * @return
   */
  public T get(Class<T> c,Serializable id);
  
  public T get(String hql,Object[] param);
  
  public T get(String hql,List<Object>param);
  
  /**
   * select count(*) from 类
   * @param hql
   * @return
   */
  public Long count(String hql);
  
  public Long count(String hql,Object[] param);
  
  public Long count(String hql,List<Object> param);
  
  /**
   * 执行HQL语句
   * @param hql
   * @return
   */
  public Integer executeHql(String hql);
  
  public Integer executeHql(String hql,Object[] param);
  
  public Integer executeHql(String hql,List<Object> param);
  
}
