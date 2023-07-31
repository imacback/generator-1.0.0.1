<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
package ${basePackage}.${module}.api.dto.response;

import java.io.Serializable;
import java.util.Date;
import lombok.*;
import com.google.gson.annotations.SerializedName;

/**
 * ***********************************************************
 * Copyright  ${year} 八维通科技有限公司 Inc.All rights reserved.  *
 * ***********************************************************
 *
 * description:
 * @author ${author}
 * @date ${.now}
 */
@Data
public class ${className}ResponseDTO implements Serializable {

<#list table.columns as column>
    <#if column.javaType == "Boolean">

    /**
    * ${column.columnAlias}
    */
    @SerializedName("${column.sqlName}")
    private Integer ${column.columnNameLower};
    <#elseif column.javaType == "java.lang.String">

    /**
    * ${column.columnAlias}
    */
    @SerializedName("${column.sqlName}")
    private String ${column.columnNameLower};
    <#elseif column.javaType == "java.util.Date">

    /**
    * ${column.columnAlias}
    */
    @SerializedName("${column.sqlName}")
    private Date ${column.columnNameLower};
    <#elseif column.javaType == "java.lang.Long">

    /**
    * ${column.columnAlias}
    */
    @SerializedName("${column.sqlName}")
    private Long ${column.columnNameLower};
    <#elseif column.javaType == "java.lang.Integer">

    /**
    * ${column.columnAlias}
    */
    @SerializedName("${column.sqlName}")
    private Integer  ${column.columnNameLower};
    <#else>

    /**
    * ${column.columnAlias}
    */
    @SerializedName("${column.sqlName}")
    private ${column.javaType} ${column.columnNameLower};
    </#if>

</#list>

}
