namespace: Integrations.hcmxtraining
flow:
  name: Justtest
  workflow:
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      do_nothing:
        x: 391
        'y': 101.484375
        navigate:
          14ade247-c34f-a6bc-f7ee-d8f9939e8f58:
            targetId: 3a05ad07-dbf2-032d-c788-35ec264ee265
            port: SUCCESS
    results:
      SUCCESS:
        3a05ad07-dbf2-032d-c788-35ec264ee265:
          x: 250
          'y': 98
