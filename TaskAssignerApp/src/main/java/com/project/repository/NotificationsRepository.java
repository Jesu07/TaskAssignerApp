package com.project.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.model.Notifications;

public interface NotificationsRepository extends JpaRepository<Notifications, Integer> {

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM notifications n WHERE n.user_ref=:user",nativeQuery=true)
	List<Notifications> findAllNotificationsByUserId(@Param("user")int user);

	@Transactional
	@Modifying
	@Query(value="UPDATE notifications n SET n.is_viewed=1, n.viewed_date_time=:date WHERE n.id=:id",nativeQuery=true)
	void updateIsViewed(@Param("id")int id,@Param("date") String date);

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM notifications n WHERE n.is_viewed=0 AND n.created_for='admin'",nativeQuery=true)
	List<Notifications> findAdminNotificationCount();

	@Transactional
	@Modifying
	@Query(value="SELECT * FROM notifications n WHERE n.is_viewed=0 AND n.created_for='user'",nativeQuery=true)
	List<Notifications> findUserNotificationCount();

}
