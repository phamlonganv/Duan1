/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Depart;
import java.util.List;
import java.util.regex.Pattern;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author admin
 */
public class departDao {
    
    public static Depart getDepartById(String id)
    {
        List<Depart> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Depart where departid= '" + id + "'";
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
    
    public static List<Depart> getAllDepart()
    {
        List<Depart> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Depart";
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
    
    public static boolean Insert(Depart d) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.save(d);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean Update(Depart d) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            
            session.getTransaction().begin();
            session.update(d);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }
    
     public static boolean Delete(Depart d) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
         
         
        try {
           
            session.getTransaction().begin();
            session.delete(d);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }
}
