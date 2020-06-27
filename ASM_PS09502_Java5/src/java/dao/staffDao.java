/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Staff;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author admin
 */
public class staffDao {
    
    public static List<Object[]> getStaffReport(String order) {
        List<Object[]> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String sh = (order.equals("Thuong")) ? "desc" : "asc";
            String sql = "SELECT Top 10 Staff.staffid, SUM(case when type=1 then 1 else 0 end)"
                    + " As 'Thuong', SUM(case when type=0 then 1 else 0 end) As 'Phat' "
                    + "FROM Record Join Staff On Record.staffid = Staff.staffid "
                    + "GROUP BY Staff.staffid order by '" + order + "' " + sh;
            //Query query = session.createQuery(hql);
            list = session.createSQLQuery(sql).list();
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
    
    public static Staff getStaffById(String id)
    {
        List<Staff> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Staff where staffid= '" + id + "'";
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
    
    public static List<Staff> getAllStaff()
    {
        List<Staff> list = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();
            String hql = "from Staff";
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
    
    public static boolean Insert(Staff s) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.save(s);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean Update(Staff s) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.update(s);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean Delete(Staff s) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.delete(s);
            session.getTransaction().commit();
            return true;

        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        }
        return false;
    }
}
