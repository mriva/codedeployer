1. `composer require mriva/codedeployer`
1. `bin/deploy --setup`
1. create directories named as deployment groups
1. add scripts inside deployment groups directories
1. add `config.php`
1. configure Codedeploy via AWS console
1. deploy


TODO
- refactor config.php with some other form of configuration
- write Codedeploy new activation (app + groups) through CLI skipping web console
- make tar_exclude optional
- sanity checks