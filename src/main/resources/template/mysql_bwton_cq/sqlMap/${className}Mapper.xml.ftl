<#include "/macro.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = table.classNameFirstLower>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >

<#macro mapperEl value>${r"#{"}${value}}</#macro>
<#macro namespace>${className}.</#macro>

<mapper namespace="${basePackage}.${module}.persist.dao.${className}Mapper">

	<resultMap id="BaseResultMap" type="${basePackage}.${module}.persist.domain.entity.${className}DO">
	<#list table.columns as column>
	<#if column.pk>
		<id property="${column.columnNameLower}" column="${column.sqlName}" jdbcType="${column.jdbcType}" />
	<#else>
		<result property="${column.columnNameLower}" column="${column.sqlName}" jdbcType="${column.jdbcType}" />
	</#if>
	</#list>
	</resultMap>

    <!-- 用于select查询公用抽取的列 -->
    <sql id="Base_Column_List">
        <![CDATA[
	<#list table.columns as column>
		${column.sqlName}<#if column_has_next>,</#if>
	</#list>
        ]]>
    </sql>


    <!--根据主键ID查询记录-->
    <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType=<#list table.pkColumns as column>"${column.javaType}"</#list> >
        SELECT <include refid="Base_Column_List" />
        <![CDATA[
        FROM ${table.sqlName}
        WHERE
	<#list table.compositeIdColumns as column>
		${column.sqlName} = <@mapperEl 'id'/> <#if column_has_next> AND </#if>
	</#list>
        ]]>
    </select>

    <!--更新-->
    <update id="updateByPrimaryKeySelective" parameterType="${basePackage}.${module}.persist.domain.entity.${className}DO" >
        UPDATE ${table.sqlName}
        <set>
		<#list table.columns as column>
		<#if !column.pk>
            <if test="${column.columnNameLower} != null" >
                <![CDATA[ ${column.sqlName} = <@mapperEl column.columnNameLower/> <#if column_has_next>,</#if> ]]>
			</if>
		</#if>
		</#list>
		</set>
        <![CDATA[
        WHERE
		<#list table.compositeIdColumns as column>
		${column.sqlName} = <@mapperEl '${column.columnNameLower} ,jdbcType=${column.jdbcType}'/> <#if column_has_next> AND </#if>
		</#list>
		<#--<#list table.columns as column><#if column.pk>${column.sqlName}</#if></#list> = <@mapperEl ${column.columnNameLower}/>-->
        ]]>
    </update>


    <delete id="deleteByPrimaryKey" parameterType=<#list table.pkColumns as column>"${column.javaType}"</#list> >
        <![CDATA[
        DELETE FROM ${table.sqlName} WHERE
		<#list table.compositeIdColumns as column>
		${column.sqlName} = <@mapperEl 'id'/> <#if column_has_next> AND </#if>
		</#list>
        ]]>
    </delete>

    <!--新增 -->
    <insert id="insert" useGeneratedKeys="true" keyProperty="${table.idColumn.columnNameFirstLower}" parameterType="${basePackage}.${module}.persist.domain.entity.${className}DO">
        INSERT INTO ${table.sqlName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
		<#list table.columns as column>
			<#if !column.pk>
            <if test="${column.columnNameLower} != null" >
			    ${column.sqlName}<#if column_has_next>,</#if>
            </if>
			</#if>
		</#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
		<#list table.columns as column>
			<#if !column.pk>
            <if test="${column.columnNameLower} != null" >
                <@mapperEl '${column.columnNameLower} ,jdbcType=${column.jdbcType}'/><#if column_has_next>,</#if>
            </if>
			</#if>
		</#list>
        </trim>

    </insert>

    <!--查询数据列表-->
    <select id="queryForList" resultMap="BaseResultMap" parameterType="${basePackage}.${module}.persist.domain.query.${className}Query">
        SELECT <include refid="Base_Column_List" />
        FROM ${table.sqlName}
        <where>
            <!-- 下面的条件根据自己的VO定义来，需要调整 -->
        <#list table.columns as column>
            <#if !column.pk>
            <if test="${column.columnNameLower} != null" >
                <![CDATA[ AND ${column.sqlName} = <@mapperEl '${column.columnNameLower} ,jdbcType=${column.jdbcType}'/> ]]>
            </if>
            </#if>
        </#list>
        </where>
    </select>

    <!--分页查询数据列表-->
    <select id="queryForPage" resultMap="BaseResultMap" parameterType="${basePackage}.${module}.persist.domain.query.${className}PageQuery">
        SELECT <include refid="Base_Column_List" />
        FROM ${table.sqlName}
        <where>
        <!-- 下面的条件根据自己的VO定义来，需要调整 -->
        <#list table.columns as column>
        <#if !column.pk>
            <if test="${column.columnNameLower} != null" >
                <![CDATA[ AND ${column.sqlName} = <@mapperEl '${column.columnNameLower} ,jdbcType=${column.jdbcType}'/> ]]>
            </if>
        </#if>
        </#list>
        </where>
    </select>


</mapper>

