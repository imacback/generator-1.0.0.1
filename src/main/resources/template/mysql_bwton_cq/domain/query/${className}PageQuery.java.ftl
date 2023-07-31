<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.persist.domain.query;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import com.bwton.lang.PageQuery;

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
public class ${className}PageQuery extends PageQuery implements Serializable {

<#list table.columns as column>
    <#if column.javaType == "Boolean">

    /**
    * ${column.columnAlias}
    */
    private Integer ${column.columnNameLower};
    <#elseif column.javaType == "java.lang.String">

    /**
    * ${column.columnAlias}
    */
    private String ${column.columnNameLower};
    <#elseif column.javaType == "java.util.Date">

    /**
    * ${column.columnAlias}
    */
    private Date ${column.columnNameLower};
    <#elseif column.javaType == "java.lang.Long">

    /**
    * ${column.columnAlias}
    */
    private Long ${column.columnNameLower};
    <#elseif column.javaType == "java.lang.Integer">

    /**
    * ${column.columnAlias}
    */
    private Integer  ${column.columnNameLower};
    <#else>

    /**
    * ${column.columnAlias}
    */
    private ${column.javaType} ${column.columnNameLower};
    </#if>

</#list>


}
