namespace: Integrations.hcmxtraining
flow:
  name: deploy_aos
  inputs:
    - target_host:
        default: 172.16.239.129
    - target_host_username: root
    - target_host_password:
        default: Cloud_1234
        sensitive: true
  workflow:
    - install_postgres:
        do:
          Integrations.demo.aos.software.install_postgres:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_java
    - install_java:
        do:
          Integrations.demo.aos.software.install_java:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_tomcat
    - install_tomcat:
        do:
          Integrations.demo.aos.software.install_tomcat:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: install_aos_application
    - install_aos_application:
        do:
          Integrations.demo.aos.application.install_aos_application:
            - username: '${target_host_username}'
            - password:
                value: '${target_host_password}'
                sensitive: true
            - tomcat_host: '${target_host}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      install_postgres:
        x: 372
        'y': 198
      install_java:
        x: 508
        'y': 191.484375
      install_tomcat:
        x: 661
        'y': 197
      install_aos_application:
        x: 807
        'y': 207.484375
        navigate:
          328a36c3-f1df-12ad-8d7c-080ed799152b:
            targetId: 71b8c4f0-85e5-ef09-aea4-da58367b74f2
            port: SUCCESS
    results:
      SUCCESS:
        71b8c4f0-85e5-ef09-aea4-da58367b74f2:
          x: 929
          'y': 206
