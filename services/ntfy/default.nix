{

  services.ntfy-sh = {

    enable = true;

    settings = {
      # use central push backend to avoid unreliable iOS background processing
      upstream-base-url = "https://ntfy.sh";
      # set base-url to tailnet domain - by not opening the ntfy port
      # in the OS firewall this effectively makes notifications private
      # to devices on the tailnet without needing to configure auth
      base-url = "http://rpi4.raven-ghost.ts.net:8546";
      listen-http = ":8546";
    };

  };

}

