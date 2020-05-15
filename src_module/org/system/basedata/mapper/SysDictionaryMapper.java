package org.system.basedata.mapper;

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
import org.system.basedata.entity.SysDictionary;
import org.system.basedata.entity.SysDictionaryExample;

public interface SysDictionaryMapper {
    @DeleteProvider(type=SysDictionarySqlProvider.class, method="deleteByExample")
    int deleteByExample(SysDictionaryExample example);

    @Delete({
        "delete from sys_dictionary",
        "where DICTIONARY_ID = #{dictionaryId,jdbcType=BIGINT}"
    })
    int deleteByPrimaryKey(Long dictionaryId);

    @Insert({
        "insert into sys_dictionary (DICTIONARY_ID, DICTIONARY_NAME, ",
        "DICTIONARY_DESC, PARENT_ID)",
        "values (#{dictionaryId,jdbcType=BIGINT}, #{dictionaryName,jdbcType=VARCHAR}, ",
        "#{dictionaryDesc,jdbcType=VARCHAR}, #{parentId,jdbcType=BIGINT})"
    })
    int insert(SysDictionary record);

    @InsertProvider(type=SysDictionarySqlProvider.class, method="insertSelective")
    int insertSelective(SysDictionary record);

    @SelectProvider(type=SysDictionarySqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="DICTIONARY_ID", property="dictionaryId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="DICTIONARY_NAME", property="dictionaryName", jdbcType=JdbcType.VARCHAR),
        @Result(column="DICTIONARY_DESC", property="dictionaryDesc", jdbcType=JdbcType.VARCHAR),
        @Result(column="PARENT_ID", property="parentId", jdbcType=JdbcType.BIGINT)
    })
    List<SysDictionary> selectByExample(SysDictionaryExample example);

    @Select({
        "select",
        "DICTIONARY_ID, DICTIONARY_NAME, DICTIONARY_DESC, PARENT_ID",
        "from sys_dictionary",
        "where DICTIONARY_ID = #{dictionaryId,jdbcType=BIGINT}"
    })
    @Results({
        @Result(column="DICTIONARY_ID", property="dictionaryId", jdbcType=JdbcType.BIGINT, id=true),
        @Result(column="DICTIONARY_NAME", property="dictionaryName", jdbcType=JdbcType.VARCHAR),
        @Result(column="DICTIONARY_DESC", property="dictionaryDesc", jdbcType=JdbcType.VARCHAR),
        @Result(column="PARENT_ID", property="parentId", jdbcType=JdbcType.BIGINT)
    })
    SysDictionary selectByPrimaryKey(Long dictionaryId);

    @UpdateProvider(type=SysDictionarySqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(SysDictionary record);

    @Update({
        "update sys_dictionary",
        "set DICTIONARY_NAME = #{dictionaryName,jdbcType=VARCHAR},",
          "DICTIONARY_DESC = #{dictionaryDesc,jdbcType=VARCHAR},",
          "PARENT_ID = #{parentId,jdbcType=BIGINT}",
        "where DICTIONARY_ID = #{dictionaryId,jdbcType=BIGINT}"
    })
    int updateByPrimaryKey(SysDictionary record);
}