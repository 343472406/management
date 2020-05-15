package org.system.security.permission.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;
import org.system.security.permission.entity.SysPermission;
import org.system.security.permission.entity.SysPermissionExample;

public interface SysPermissionMapper {
    @DeleteProvider(type=SysPermissionSqlProvider.class, method="deleteByExample")
    int deleteByExample(SysPermissionExample example);

    @Delete({
        "delete from sys_permission",
        "where PERMISSION_ID = #{permissionId,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long permissionId);

    @Insert({
        "insert into sys_permission (PERMISSION_ID, PERMISSION_NAME, ",
        "PERMISSION_TYPE, EXPRESSION, ",
        "URL, PARENT_ID)",
        "values (#{permissionId,jdbcType=BIGINT}, #{permissionName,jdbcType=VARCHAR}, ",
        "#{permissionType,jdbcType=VARCHAR}, #{expression,jdbcType=VARCHAR}, ",
        "#{url,jdbcType=VARCHAR}, #{parentId,jdbcType=BIGINT})"
    })
    int insert(SysPermission record);

    @InsertProvider(type=SysPermissionSqlProvider.class, method="insertSelective")
    int insertSelective(SysPermission record);

    @SelectProvider(type=SysPermissionSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="PERMISSION_ID", property="permissionId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="PERMISSION_NAME", property="permissionName", jdbcType=JdbcType.VARCHAR),
        @Result(column="PERMISSION_TYPE", property="permissionType", jdbcType=JdbcType.VARCHAR),
        @Result(column="EXPRESSION", property="expression", jdbcType=JdbcType.VARCHAR),
        @Result(column="URL", property="url", jdbcType=JdbcType.VARCHAR),
        @Result(column="PARENT_ID", property="parentId", jdbcType=JdbcType.BIGINT)
    })
    List<SysPermission> selectByExample(SysPermissionExample example);

    @Select({
        "select",
        "PERMISSION_ID, PERMISSION_NAME, PERMISSION_TYPE, EXPRESSION, URL, PARENT_ID",
        "from sys_permission",
        "where PERMISSION_ID = #{permissionId,jdbcType=BIGINT}"
    })
    @Results({
        @Result(column="PERMISSION_ID", property="permissionId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="PERMISSION_NAME", property="permissionName", jdbcType=JdbcType.VARCHAR),
        @Result(column="PERMISSION_TYPE", property="permissionType", jdbcType=JdbcType.VARCHAR),
        @Result(column="EXPRESSION", property="expression", jdbcType=JdbcType.VARCHAR),
        @Result(column="URL", property="url", jdbcType=JdbcType.VARCHAR),
        @Result(column="PARENT_ID", property="parentId", jdbcType=JdbcType.BIGINT)
    })
    SysPermission selectByPrimaryKey(Long permissionId);

    @UpdateProvider(type=SysPermissionSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(SysPermission record);

    @Update({
        "update sys_permission",
        "set PERMISSION_NAME = #{permissionName,jdbcType=VARCHAR},",
          "PERMISSION_TYPE = #{permissionType,jdbcType=VARCHAR},",
          "EXPRESSION = #{expression,jdbcType=VARCHAR},",
          "URL = #{url,jdbcType=VARCHAR},",
          "PARENT_ID = #{parentId,jdbcType=BIGINT}",
        "where PERMISSION_ID = #{permissionId,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(SysPermission record);
}