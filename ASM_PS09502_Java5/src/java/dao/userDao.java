/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Users;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;
import util.RegexTest;

/**
 *
 * @author admin
 */
public class userDao {

    public static Users getUserByUsername(String user) {
        List<Users> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Users where username= '" + user + "'";
            Query query = session.createQuery(hql);
            list = query.list();
            if (list.size() > 0) {
                return list.get(0);
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    public static List<Users> getAllUsers() {
        List<Users> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Users";
            Query query = session.createQuery(hql);
            list = query.list();
            if (list.size() > 0) {
                return list;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    public static boolean getUser(String id)
    {
        List<Users> list = null;
          Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Users where username= '" + id + "'";
            Query query = session.createQuery(hql);
            list = query.list();
            if (list.size() > 0) {
                return true;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        
        }
        return false;
    
    }
    public static boolean Insert(Users u) throws IllegalAccessException {
        // Check Before Insert
        Users u1 = getUserByUsername(u.getUsername());

        if (u.getUsername().length() < 4 || u.getPassword().length() < 4 || u.getFullname().length() < 4) {
            return false;

        
        } 
        else {
            if (!RegexTest.nameCheck(u.getFullname())) {
                return false;
            } 
            
            else {
                Session session = HibernateUtil.getSessionFactory().getCurrentSession();
                try {
                    session.getTransaction().begin();
                    session.save(u);
                    session.getTransaction().commit();
                    return true;

                } catch (Exception e) {
                    session.getTransaction().rollback();
                    e.printStackTrace();
                }
                
            }

        }

        return false;
    }

    public static boolean Update(Users u) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.update(u);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }

    public static boolean Delete(Users u) {
        if(kt(u.getUsername())==false)
        {
        
            return false;
        }
        else
        {
        
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.delete(u);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        
        }
        return false;
    }
    public static boolean kt(String id)
    {
     List<Users> list = null;
          Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Users where username= '" + id + "'";
            Query query = session.createQuery(hql);
            list = query.list();
            if (list != null) {
                return true;
            }
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        
        }
        return false;
    }
}
