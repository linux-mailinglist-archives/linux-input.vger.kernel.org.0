Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C2117B530
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 05:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFEDH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 23:03:07 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40621 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCFEDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Mar 2020 23:03:07 -0500
Received: by mail-pg1-f196.google.com with SMTP id t24so446472pgj.7
        for <linux-input@vger.kernel.org>; Thu, 05 Mar 2020 20:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3eo5MrWYfEnoU3a2XrvZyfDPHKx3C9qzF3oQI3imD88=;
        b=OrJOIwxhCjslQcervwFBdP+pZIkb43neX3/ZVLvcKVSG1oIuYnqILAP8SYpwwT7Q30
         NTaxz9La2FdK4D6N7zSylGFVzrxw8NW+P5+/8DKqSSlTRBLK3/mpIiPqsENloj8k9Img
         Ii+4mdQZbb0ViQo8YtoDZFxD6ehYJ7AYv8xvtQvoKzmaHSFx9f791JS+kyZnfE8h5f8J
         3jxf2kLCrOJ2Mhj5PU/uVr754ITosksn4nZR96AXFzpVRgfv7vhriFy/T17nEQ4zVeKG
         s6472UQ27UIjmrC2XiZqCSGTCVnuwiz8Ayr0tYIDqZ7gAWOkgZWc1hcvJJmQLW2w3wAP
         LKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3eo5MrWYfEnoU3a2XrvZyfDPHKx3C9qzF3oQI3imD88=;
        b=oSg+SSK+n8LaGShiP76cjQKOSb0zEpDcPPYoF5c+zxe1gZstgpKEssKrlZ2+CP4FVr
         wNnQibGq9TPj5jk5FmcexesmDrh9DMBmT9F1MLmAOfj0IOOhRuTlTA1BcYiVE4t5YKD1
         hiLfpdzE1N1CJI7MM6IeJZ4QBr34yLOvDzAJjezCxACV1IoFYlZUyqB3PIkO7WIlaWY9
         cvvslitj+PX18yxhSXW/CxXVg/ofOK2HdbnqumKl0XY1nzYuTUFNGdaVdrBe7lv/WMy2
         ZjzoZ27KIrkHtm0OzvFVt59au3l1Ko/J/Xm7SzckCW7xoj4W2+fp95JaIkWqe7XqzAmi
         ur5g==
X-Gm-Message-State: ANhLgQ3AO6+B7nBP3scW9PmMJuwhtIu4FpQ9ekwmnkBaso7vAHXj3/+2
        LVBzhB0Yv3yzdlLEBbhIB1GwQKgW
X-Google-Smtp-Source: ADFU+vvXvoogJjwMsFCPXO4G16Gu8hSd+f2R1rT+8udMQr7tsGg+T+ReDPGwyEGF+XsbwWgAZYkjZw==
X-Received: by 2002:a63:cf14:: with SMTP id j20mr1374822pgg.67.1583467384309;
        Thu, 05 Mar 2020 20:03:04 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a6sm15097727pfl.82.2020.03.05.20.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 20:03:03 -0800 (PST)
Date:   Thu, 5 Mar 2020 20:03:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: Re: [PATCH v2 01/11] Input: goodix - Refactor IRQ pin GPIO accesses
Message-ID: <20200306040301.GB217608@dtor-ws>
References: <20200305220132.228722-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305220132.228722-1-hdegoede@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Thu, Mar 05, 2020 at 11:01:22PM +0100, Hans de Goede wrote:
> Suspending Goodix touchscreens requires changing the interrupt pin to
> output before sending them a power-down command. Followed by wiggling
> the interrupt pin to wake the device up, after which it is put back
> in input mode.
> 
> So far we have only effectively supported this on devices which use
> devicetree. On X86 ACPI platforms both looking up the pins; and using a
> pin as both IRQ and GPIO is a bit more complicated. E.g. on some devices
> we cannot directly access the IRQ pin as GPIO and we need to call ACPI
> methods to control it instead.
> 
> This commit adds a new irq_pin_access_method field to the goodix_chip_data
> struct and adds goodix_irq_direction_output and goodix_irq_direction_input
> helpers which together abstract the GPIO accesses to the IRQ pin.
> 
> This is a preparation patch for adding support for properly suspending the
> touchscreen on X86 ACPI platforms.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Make enum member names upper-case
> ---
>  drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 0403102e807e..9cfbcf3cbca8 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -31,6 +31,11 @@
>  
>  struct goodix_ts_data;
>  
> +enum goodix_irq_pin_access_method {
> +	IRQ_PIN_ACCESS_NONE,
> +	IRQ_PIN_ACCESS_GPIO,
> +};
> +
>  struct goodix_chip_data {
>  	u16 config_addr;
>  	int config_len;
> @@ -53,6 +58,7 @@ struct goodix_ts_data {
>  	const char *cfg_name;
>  	struct completion firmware_loading_complete;
>  	unsigned long irq_flags;
> +	enum goodix_irq_pin_access_method irq_pin_access_method;
>  	unsigned int contact_size;
>  };
>  
> @@ -502,17 +508,48 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,
>  	return 0;
>  }
>  
> +static int goodix_irq_direction_output(struct goodix_ts_data *ts,
> +				       int value)
> +{
> +	switch (ts->irq_pin_access_method) {
> +	case IRQ_PIN_ACCESS_NONE:
> +		dev_err(&ts->client->dev,
> +			"%s called without an irq_pin_access_method set\n",
> +			__func__);
> +		return -EINVAL;
> +	case IRQ_PIN_ACCESS_GPIO:
> +		return gpiod_direction_output(ts->gpiod_int, value);
> +	}
> +
> +	return -EINVAL; /* Never reached */

I do not like these "never reached" comments. We can either let compiler
issue a warning that we did not cover all switch cases, or stick
"default:" alongside "case IRQ_PIN_ACCESS_NONE:".

Thanks.

-- 
Dmitry
