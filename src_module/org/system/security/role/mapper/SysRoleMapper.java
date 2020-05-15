package org.system.security.role.mapper;

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
import org.system.security.role.entity.SysRole;
import org.system.security.role.entity.SysRoleExample;

public interface SysRoleMapper {
    @DeleteProvider(type=SysRoleSqlProvider.class, method="deleteByExample")
    int deleteByExample(SysRoleExample example);

    @Delete({
        "delete from sys_role",
        "where ROLE_ID = #{roleId,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long roleId);

    @Insert({
        "insert into sys_role (ROLE_ID, ROLE_NAME, ",
        "ROLE_DESC)",
        "values (#{roleId,jdbcType=BIGINT}, #{roleName,jdbcType=VARCHAR}, ",
        "#{roleDesc,jdbcType=VARCHAR})"
    })
    int insert(SysRole record);

    @InsertProvider(type=SysRoleSqlProvider.class, method="insertSelective")
    int insertSelective(SysRole record);

    @SelectProvider(type=SysRoleSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="ROLE_ID", property="roleId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="ROLE_NAME", property="roleName", jdbcType=JdbcType.VARCHAR),
        @Result(column="ROLE_DESC", property="roleDesc", jdbcType=JdbcType.VARCHAR)
    })
    List<SysRole> selectByExample(SysRoleExample example);

    @Select({
        "select",
        "ROLE_ID, ROLE_NAME, ROLE_DESC",
        "from sys_role",
        "where ROLE_ID = #{roleId,jdbcType=BIGINT}"
    })
    @Results({
        @Result(column="ROLE_ID", property="roleId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="ROLE_NAME", property="roleName", jdbcType=JdbcType.VARCHAR),
        @Result(column="ROLE_DESC", property="roleDesc", jdbcType=JdbcType.VARCHAR)
    })
    SysRole selectByPrimaryKey(Long roleId);

    @UpdateProvider(type=SysRoleSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(SysRole record);

    @Update({
        "update sys_role",
        "set ROLE_NAME = #{roleName,jdbcType=VARCHAR},",
          "ROLE_DESC = #{roleDesc,jdbcType=VARCHAR}",
        "where ROLE_ID = #{roleId,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(SysRole record);
}