Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B0929F643
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 21:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgJ2UgO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 16:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgJ2UgO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 16:36:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FB3C0613D4;
        Thu, 29 Oct 2020 13:36:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w65so3355168pfd.3;
        Thu, 29 Oct 2020 13:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I61zSSXnddISlj5dBjtLwYvC1P3deaYqmSH5ozqsYog=;
        b=LtKG+5PTjdwFBcnbd7HuU/FkzbjKi+WfScvarwjV+M6z1yg2rNwnHDfYY4jgwGaaf/
         qz+FrIAPxmmYxE4hgzknAvHWV6yNV9+iUaPvVGpyouDWq9enXAI98INKV1olorZIMtdY
         j0B80rkRT75br2IYrjN325LinEhG3YAUUGgAQqHqCc1LU9d+d/Of4grSPkXxJqoaO21S
         otzBDMUOXQSmWoam5PtNCbeP54CDvR0AWLxOvyWLxqwuZkoJsyfyPpFqlDFUSddxjwjq
         4bUhy1nC6O8/G8d+JS8EBwBWZvKK4jkUc37XiX+P0C3fYvNF1BJtMYYg7E9d8OsdVJPN
         U1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I61zSSXnddISlj5dBjtLwYvC1P3deaYqmSH5ozqsYog=;
        b=YsuPHNTXMEEx3b6ifkrMmb4yJ5lcrobw5V41g9B2ElEfmtb9gcmEl5nJ0KECMB/TXo
         rJG7FYCJ4XYKfMsEDX8YZqejx/kiKrTfx0mQ1fErN5rclvoG4ByvjgZlMwglGiqk4G1Z
         6jT9oYaZvEYTRDHJy3lNhY5zK6HO+QNXLvKsgKVzOV5wLYzneHza6WMYoHdp4Le9kmQW
         yKZvrmlBlzcPuiup0UreSfZPy4jMEM0OSLzjcn5K9wylU+FB3063DpX0kmDv5tRyq+u6
         WrKiLEvWz06Ov9HDf85vdI5ozYyXIDKSx6q9vH1g0RY36XvzODqkqDVi1eSbbYf3tt4d
         kpOQ==
X-Gm-Message-State: AOAM532G2ITSoDPXy2gcuVYZvG2R1PhrFU5sNb+Rwo1cXkVtb8ng3aDg
        ySgJjpvaVSx3WjoZo46hZTQ=
X-Google-Smtp-Source: ABdhPJylnY79MpK/rej9wEYYx1yPr2EAFJYxJWw8BVYTx7s67m6CSqSoxqZToU1y3zY6wyGN6y1BZg==
X-Received: by 2002:a17:90a:f683:: with SMTP id cl3mr1675662pjb.84.1604003771560;
        Thu, 29 Oct 2020 13:36:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id u4sm694739pjy.19.2020.10.29.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:36:10 -0700 (PDT)
Date:   Thu, 29 Oct 2020 13:36:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrej Valek <andrej.valek@siemens.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     nick@shmanahar.org, hadess@hadess.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
Message-ID: <20201029203608.GE2547185@dtor-ws>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201029170313.25529-2-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029170313.25529-2-andrej.valek@siemens.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrej,

On Thu, Oct 29, 2020 at 06:03:11PM +0100, Andrej Valek wrote:
> Firmware file loadind for GT911 controller takes too much time (~60s).
> There is no check that configuration is the same which is already present.
> This happens always during boot, which makes touchscreen unusable.
> 
> Add there an option to prevent firmware file loading, but keep it enabled
> by default.

I thought that Goodix was losing firmware loading at poweroff. Is this
not the case with this model?

Adding Hans as he was working with this driver/code.

> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  drivers/input/touchscreen/goodix.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 02c75ea385e08..44336ecd2acdf 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -941,7 +941,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  	default:
>  		if (ts->gpiod_int && ts->gpiod_rst) {
>  			ts->reset_controller_at_probe = true;
> -			ts->load_cfg_from_disk = true;
> +			/* Prevent cfg loading for each start */
> +			ts->load_cfg_from_disk = !device_property_read_bool(dev,
> +						 "touchscreen-do-not-load-fw");
>  			ts->irq_pin_access_method = IRQ_PIN_ACCESS_GPIO;
>  		}
>  	}
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
