package com.bwton.generator;

import cn.org.rapid_framework.generator.Generator;
import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;
import cn.org.rapid_framework.generator.provider.db.table.TableFactory;
import cn.org.rapid_framework.generator.provider.db.table.model.Table;
import com.bwton.generator.util.GeneratorUtil;

import java.util.List;

/**
 * @author xushaobo@bwton.com
 * @date 2023/7/31 15:10
 */
public class GeneratorFactory {
    private static GeneratorFactory factory = null;

    private GeneratorFacade facade = null;

    public GeneratorFactory() {
        this.facade = new GeneratorFacade();
    }

    public static GeneratorFactory getInstance() {
        if (factory == null)
            factory = new GeneratorFactory();
        return factory;
    }

    public void create() throws Exception {
        Generator generator = new Generator();
        generator.setOutRootDir(GeneratorProperties.getProperty("outputDir"));
        generator.setTemplateRootDir(GeneratorProperties.getProperty("templateDir"));
        this.facade.setGenerator(generator);
        this.facade.deleteOutRootDir();
        String allSwitch = GeneratorProperties.getProperty("allSwitch");
        if ("true".equals(allSwitch)) {
            List<Table> tables = TableFactory.getInstance().getAllTables();
            for (Table table : tables) {
                GeneratorUtil.removeTablePrefix(table,
                        GeneratorProperties.getProperty("prefix").split(","));
                Generator.GeneratorModel m = GeneratorFacade.GeneratorModelUtils.newGeneratorModel("table", table);
                this.facade.generateBy(new Generator.GeneratorModel[] { m });
            }
        }
        if ("false".equals(allSwitch))
            if (!"".equals(GeneratorProperties.getProperty("tables")) && null !=
                    GeneratorProperties.getProperty("tables")) {
                String[] tableNames = GeneratorProperties.getProperty("tables").split(",");
                Table table = null;
                for (String tableName : tableNames) {
                    table = TableFactory.getInstance().getTable(tableName);
                    GeneratorUtil.removeTablePrefix(table,
                            GeneratorProperties.getProperty("prefix").split(","));
                    Generator.GeneratorModel m = GeneratorFacade.GeneratorModelUtils.newGeneratorModel("table", table);
                    this.facade.generateBy(new Generator.GeneratorModel[] { m });
                }
            } else {
                throw new RuntimeException("tables");
            }
    }
}
