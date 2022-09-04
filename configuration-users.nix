{ config, pkgs, lib, ... }:
{
  security.sudo.wheelNeedsPassword = false;

  users.users.rj = {
    isNormalUser = true;
    home = "/home/rj";
    description = "RJ Graffham";
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAjqruCmhDeW4YrVqjzcHi94BcmDbmFdEUHgr4aHiuPdcS2uavmWPeu9xqhsBy+8njUnpJydPReE+XK7nE558ZxBgvIBhRr5s0FEVfdsarnJ5VUBx0e3TRzpXTgwqm2MinPb/Q0NUHGSYuXp2OMtNpMvxamMzifskh+F92b6LVo+2j10RiaigbH5oXbXzeHcZxGavyYggZ8mM2KatzIReVTb6mmzZ+Ct8xQLxkxJZvBfKNVjv0urmDSrpHm/x2J41z6/DQ95TCWs2m/EBmiRgrHs0uETjcEwqHkl1henrmyBGVwr9pJ/FunQuBqCRx/XPQ+v9iMtGyed7GV5LeqJjk5Q== DIAMOND"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCwI9mhy9tkKnHbqpqKOKgN5ioFiwUcrH+R3zVSp468xytAEctbiHMPTfNmsZwK/cCd5zy8DDYWsshfn8JuxRswPIlmt+mICviXm1KL1UNJvPBGusLR/pMu805q7n46P3kBhr2i6wqF2Mr5lGZ8sgiLQdGOeDKoMs0Co7U9XBhjVmqvIMFs32sgQsuX0pjd8O82hBK4fndVwQ7PcdKVI5M3/puCPUzOyykzeKlsPYjJYAhO4T9Mce++ZTsOuZxFwrYRTpHRm3ldrawVTTWJyZgOFufoA/7Et0WODhqjKeRLxqo5le768W4ZhCwGnSdbInLRXG+qA7Urcql1hPyQZTv4CuJDqGlrlEB8zwUNL2XOUthF1DLzFtp/JzYe2AK1viFBOZ6CShTJxnXpWAalxdS61nlqQywfHfFSnFcnYZwKVU8YS3O61DnNdR/UttvvO5fyduUUWn8DasJyxoYt+aC70xP6zw6pJema8bM9EQO/kY4YNNeBmGnx4uWoeq6sXEE= u0_a358@localhost"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD9hmOf4UAXId8QopYaNnzakzwbO5wSW3/gRjYvxzfm49lVAzMM/WE6Z/OJwJcVrYeSsiBOXhWqhzSAhcR4QGtiw/HHZnfjqc/bgqSq3e6l9l3qluwjZKWhTy3c07gqsnE9nETRbX0gfr4AV4xZxB+pA/klhc0iV7oJHxBUUGi9a+luBUsjA4f4BQqu9z06m4RX6fBcJ8y8a8/HoBYYvVznAJMLCEdtsUKCEOMd9Vq9A8QojCPYN1JfI0yVEo7ptrFIT0cNK3/iI4pnt1vtne45cI7Y7qDtJk2/wijge/VpvN4QlnztrV/en2jk+HpGIn0tWiMUZVXDrvdWMXgTfJ3IBQ2axmp7VmfF6IxtHa9CxmPqZdvRIsxYThvW2x5OuPJUtYQjao395oPeVJ2+KFSdr1MqiBNNQpvHWs51JeQ2QblN2nKWa30XzX74Y4xzwbgXXK6XiEhTGYz6PW5YqSb/KmYm1ORzg9RsHN89GNUrn+iRU3L9r6SOdoolgxxOEU= u0_a292@localhost"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbKTZqadaRuZih1HELyaVQXSxI0p6jj90f+Iqjhhf6M ed25519-key-20220729"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBoZB9gm4v2V+ucQdcB5bET43xvWRuSbqSAyxeBmbzoh ipadmini"
    ];
  };
}
