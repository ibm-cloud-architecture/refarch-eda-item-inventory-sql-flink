package org.acme.getting.started;

import org.apache.flink.table.api.*;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;

public class InventoryJob {
  public static void main(String[] args) throws Exception {
    EnvironmentSettings settings = EnvironmentSettings.newInstance().build();
    StreamExecutionEnvironment sEnv = StreamExecutionEnvironment.getExecutionEnvironment(settings.toConfiguration());
    StreamTableEnvironment stableEnv = StreamTableEnvironment.create(sEnv);

    System.out.println("houwdy!");
  }
}