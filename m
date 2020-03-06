Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E29E17B531
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 05:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFEEb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 23:04:31 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32929 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCFEEb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 23:04:31 -0500
Received: by mail-pg1-f195.google.com with SMTP id m5so461931pgg.0
        for <linux-input@vger.kernel.org>; Thu, 05 Mar 2020 20:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZFcpRxShA9JZ/VOv3ZzjdsoPbwSZeIGANxoR3Cv1Zog=;
        b=FNcoBSkrOxwl+YYVEI7NaJTBKt1dqUYoCKUg5YAeRw5cNaT2mQh6IfBdLwAmZjY0F7
         v9SJXEXckMFRG1qiCqJutuih1CF626yYcCVKXBTNpvqej5qabGXb+JU75PCeyP1BCtzl
         2a3MSUk0CFY/bBa0xPMPcOuRNfQtJAFLDMdnHaxvFdt6759q0RhVKZ513lz5cO9miqWX
         3RddWfkDK9lrVtKdrOwQVVScG5IBGK+7DRRj+IqEjrfkiHW8NVr34xD4zSgnh0nggABS
         t37sdDLwY2blAJVr9YTW/ri2igR7lGwBy1huQFIqDvsqb3Bsgn7/UC6/mXiAFEv2fgS9
         HBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZFcpRxShA9JZ/VOv3ZzjdsoPbwSZeIGANxoR3Cv1Zog=;
        b=FbwLbQlE77KUJ1wUj+k0Exda++eVCXazQ/7nX70nD+8lfnwe5TCdbSgLrvi0Ufu8aG
         gYMR78HpzQ3+7lz2XrrkVU/8m/7FltFtZa2474fBn48qa+rstAqIwYTUBHiTLsjWCmoD
         VxEbe6UTZD2kEpFzyrh7Qk9mmzYjcUhM6NoQTzyCuSI8RNh24rdqplO4wIEA1H38Asfl
         YtWhiH4JDXZuW0AnnSkLpsrXFSplSTaucjYO+dtTde5C3oRclp1Z4NpJV3tdprt38Zhn
         yqCKWRea7IWNrO9ktTD7vAe/cDRnEHDNMEpGkdVzQLvFUv2cebIgogU9kmpxNmLwKOx8
         9uqQ==
X-Gm-Message-State: ANhLgQ0DcAKGVwMtjlUYPVSyk89xfRWnSZo86j1MLd92DLw+Qpkr5R+9
        J5yO9NVZ9OpQ7vwzQMY3oY4=
X-Google-Smtp-Source: ADFU+vvWYSSI7JRPvpds2i9sB5bPJWFSvA+Cwc7eqE/pMtpgCsW3fctJbpw7CY0wuB6f0pqfdz4Sqg==
X-Received: by 2002:a63:5847:: with SMTP id i7mr1386028pgm.127.1583467469950;
        Thu, 05 Mar 2020 20:04:29 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id j126sm26101004pfb.129.2020.03.05.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:04:29 -0800 (PST)
Date:   Thu, 5 Mar 2020 20:04:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: Re: [PATCH v2 02/11] Input: goodix - Make loading the config from
 disk independent from the GPIO setup
Message-ID: <20200306040427.GC217608@dtor-ws>
References: <20200305220132.228722-1-hdegoede@redhat.com>
 <20200305220132.228722-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305220132.228722-2-hdegoede@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 05, 2020 at 11:01:23PM +0100, Hans de Goede wrote:
> At least on X86 ACPI platforms it is not necessary to load the touchscreen
> controller config from disk, if it needs to be loaded this has already been
> done by the BIOS / UEFI firmware.
> 
> Even on other (e.g. devicetree) platforms the config-loading as currently
> done has the issue that the loaded cfg file is based on the controller
> model, but the actual cfg is device specific, so the cfg files are not
> part of linux-firmware and this can only work with a device specific OS
> image which includes the cfg file.
> 
> And we do not need access to the GPIOs at all to load the config, if we
> do not have access we can still load the config.
> 
> So all in all tying the decision to try to load the config from disk to
> being able to access the GPIOs is not desirable. This commit adds a new
> load_cfg_from_disk boolean to control the firmware loading instead.
> 
> This commits sets the new bool to true when we set irq_pin_access_method
> to IRQ_PIN_ACCESS_GPIO, so there are no functional changes.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 9cfbcf3cbca8..28bb4385a54d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -56,6 +56,7 @@ struct goodix_ts_data {
>  	u16 id;
>  	u16 version;
>  	const char *cfg_name;
> +	bool load_cfg_from_disk;
>  	struct completion firmware_loading_complete;
>  	unsigned long irq_flags;
>  	enum goodix_irq_pin_access_method irq_pin_access_method;
> @@ -654,8 +655,10 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  
>  	ts->gpiod_rst = gpiod;
>  
> -	if (ts->gpiod_int && ts->gpiod_rst)
> +	if (ts->gpiod_int && ts->gpiod_rst) {
> +		ts->load_cfg_from_disk = true;
>  		ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
> +	}
>  
>  	return 0;
>  }
> @@ -952,7 +955,7 @@ static int goodix_ts_probe(struct i2c_client *client,
>  
>  	ts->chip = goodix_get_chip_data(ts->id);
>  
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> +	if (ts->load_cfg_from_disk) {
>  		/* update device config */
>  		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
>  					      "goodix_%d_cfg.bin", ts->id);
> @@ -983,7 +986,7 @@ static int goodix_ts_remove(struct i2c_client *client)
>  {
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO)
> +	if (ts->load_cfg_from_disk)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  
>  	return 0;
> @@ -1001,7 +1004,8 @@ static int __maybe_unused goodix_suspend(struct device *dev)
>  		return 0;
>  	}
>  
> -	wait_for_completion(&ts->firmware_loading_complete);
> +	if (ts->load_cfg_from_disk)
> +		wait_for_completion(&ts->firmware_loading_complete);

If you are detaching presence of GPIOs from firmware loading, then you
need to move this wait higher, so we do not complete early if GPIOs are
not there, but firmware is being loaded.

Thanks.

-- 
Dmitry
