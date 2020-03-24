Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FB419197A
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 19:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgCXSwT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 14:52:19 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:33833 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCXSwT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 14:52:19 -0400
Received: by mail-pj1-f67.google.com with SMTP id q16so1468569pje.1
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 11:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4lWZoj6SSHssm2pKdJFS/Yrbt2Gr7xWey6NJD3OIYUQ=;
        b=lwzLkpTqtm17W/xqJOGQ1vIhD/aTz/zWTDa5SNT6JZXtrtup/YSOjsakpmBDeLTLdR
         wvhMqKx9JOkwokqO6nda3G4LrgCpqC1USD3yxgvOciHvfXL4eaVB54a+ilUqCvT0sGOA
         PP0Y4XAzrxLFRhue+cRazwYdwSxfI9MXp2h4XwjRShPOTWS0XUNvbtVQe5FlT+4EfLTn
         6D0ay5YxwAu1vH4Ricp14/AtUtGNyT+EmCRCy7BZ7HYq/su6+0+DsOV6Gw8G1ty3EbQT
         uejTnfWL0Ed4LG6TLhfiixtPYDKmPdOJDvb8H07UB9So7o3m2Z0erC9FLR/D6al8UWrr
         4YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4lWZoj6SSHssm2pKdJFS/Yrbt2Gr7xWey6NJD3OIYUQ=;
        b=Eev997lm+qkEmkYkQG/zHqszH3gycMYgKxhaLQF7+wZBnZRNORS+AFs82uJaafwlyG
         e8bqqSUjnic3Fph3qKQhj7wD11Sthnu82X/8jbLP5LtxmCpBjtUwbjBoRhV/P2YBBQPw
         ge7h/IH3JJNqj7ecJtQcHbMPhWORNj0SH8yFSkuwUBQit43ElHlPxutBaBKagC1wLvJG
         KcN8Ji55orZL52Z043qpjEVP+mqm05i07qLieMvT4hzgbXQPdqdJ87qn5/7Gh2fqm2aY
         X5l2+2W4GRc/bdKzME/4bdpCaZGUqFOrZZbuHjC+SzF1wTEWFJiptcWDuyCopVhHb8Aq
         u76w==
X-Gm-Message-State: ANhLgQ0bi/qjhenuDZ4MX+yTZLM8M3oJQkqpawESfY7jSYaXXfSmbYDA
        z84gq7eORlLrA7b8XeqIX+o=
X-Google-Smtp-Source: ADFU+vv57CluUSDorCzcvJ4qdFmGwv2g82xGuUgKkl8kwxUjziEsuWuJRlXqadH2OBV6xVprbT5YJA==
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr27702631plo.170.1585075936322;
        Tue, 24 Mar 2020 11:52:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id mn18sm2959772pjb.13.2020.03.24.11.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:52:15 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:52:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <dmastykin@astralinux.ru>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - Try to reset the controller if the
 i2c-test fails
Message-ID: <20200324185214.GC75430@dtor-ws>
References: <20200311191013.10826-1-hdegoede@redhat.com>
 <20200311191013.10826-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311191013.10826-2-hdegoede@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 11, 2020 at 08:10:13PM +0100, Hans de Goede wrote:
> On some ACPI/x86 devices (where we use one of the ACPI IRQ pin access
> methods) the firmware is buggy, it does not properly reset the controller
> at boot, and we cannot communicate with it.
> 
> Normally on ACPI/x86 devices we do not want to reset the controller at
> probe time since in some cases this causes the controller to loose its
> configuration and this is loaded into it by the system's firmware.
> So on these systems we leave the reset_controller_at_probe flag unset,
> even though we have a access to both the IRQ and reset pins and thus
> could reset it.
> 
> In the case of the buggy firmware we have to reset the controller to
> actually be able to talk to it.
> 
> This commit adds a special case for this, if the goodix_i2c_test() fails,
> and we have not reset the controller yet; and we do have a way to reset
> the controller then retry the i2c-test after resetting the controller.
> 
> This fixes the driver failing at probe on ACPI/x86 systems with this
> firmware bug.
> 
> Reported-and-tested-by: Dmitry Mastykin <dmastykin@astralinux.ru>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/goodix.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 2f135ac9484e..816d6ade89a9 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1165,6 +1165,7 @@ static int goodix_ts_probe(struct i2c_client *client,
>  	if (error)
>  		return error;
>  
> +reset:
>  	if (ts->reset_controller_at_probe) {
>  		/* reset the controller */
>  		error = goodix_reset(ts);
> @@ -1176,6 +1177,12 @@ static int goodix_ts_probe(struct i2c_client *client,
>  
>  	error = goodix_i2c_test(client);
>  	if (error) {
> +		if (!ts->reset_controller_at_probe &&
> +		    ts->irq_pin_access_method != IRQ_PIN_ACCESS_NONE) {
> +			/* Retry after a controller reset */
> +			ts->reset_controller_at_probe = true;
> +			goto reset;
> +		}
>  		dev_err(&client->dev, "I2C communication failure: %d\n", error);
>  		return error;
>  	}
> -- 
> 2.25.1
> 

-- 
Dmitry
