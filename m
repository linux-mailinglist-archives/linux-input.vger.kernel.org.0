Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0CF3937F9
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 23:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234101AbhE0Vcj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 17:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbhE0Vci (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 17:32:38 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F3CC061574;
        Thu, 27 May 2021 14:31:05 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y202so1594534pfc.6;
        Thu, 27 May 2021 14:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=92w7fK+Mm8d7VOHGtQ52zeEYrDzHrnqQNTrY91S9zlE=;
        b=HazhiHbi8HLMATY1w/PBfotFYsroAHmVnINGVF5XK0WL44JaciHfcLhln/FOPc03Fn
         ZpOSHgifIwQdd/v0p544gpYRXNh0onIVBceRZowMDcKxO0FiAuN3vDP98y5uhPVNhMma
         j/U+dkWHExyFSwIX7YO8oXPUJ2PC6UJQFwccbWoePozzn6XaRQKoF/yNdO+fIPE7FG8q
         j4AdhSE8CjWZNSNBIsDxggi7v7o0KIAoUSE/QSgswciDE74c7bLHBXC4SMKeW5CmXA08
         OXHY2y45pHWAL1GvWjNCUzeNs4eCybxLnCFeL5Wcl5zFjyUhhQBYGr9l91KvS0KPLv1v
         AKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=92w7fK+Mm8d7VOHGtQ52zeEYrDzHrnqQNTrY91S9zlE=;
        b=BYgGnDDlUAOrNfzCcAVNeu/rJNyPa4K0zcS+hbIitpWocCZd5RfUd04q/3TDkqtigu
         lSCdD8IK5OM021EsDHWfYuPmxuS91zjjcgv0qFv7WH+5foowRQEBFA5NWO78tg00Rb+P
         mW/vQ68MdIHE4ZRhgHXMtPrbv8A8QbMjgE20PxetOj9Y7Hs98OLu5buKnBmc8d913eYi
         /co0fF1nURDwKLAmBLyZSRV/shvv5yz6sJDF+ekVCG2Vhx16xVyt3ZyGH1acePCHtdta
         EKNcAE0xsYkqs2DK4PJEyOpIbdExrH2O5VpNFUkTcqETD9cGsUrjfT2IK983Thh4YAYr
         A3kg==
X-Gm-Message-State: AOAM530aelLZWdPP1JxSMIz+YYs/XAZ48o1SEpZuKS2k5DpmNGBNOTSa
        ClBtq7BY+6YbsFfJqc8wy8Y=
X-Google-Smtp-Source: ABdhPJymdw+FUE9i9tijpf70fKJR8T/iANZPDhQPP/DlbzKpjh5/smoRHCmmMGeXq54kKCQNxUYhKw==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id g15-20020a056a0023cfb02902d5302edc77mr409995pfc.63.1622151064531;
        Thu, 27 May 2021 14:31:04 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2eca:168c:3933:43bc])
        by smtp.gmail.com with ESMTPSA id z6sm2667635pgp.89.2021.05.27.14.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 14:31:02 -0700 (PDT)
Date:   Thu, 27 May 2021 14:30:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: elants_i2c - Fix NULL dereference at probing
Message-ID: <YLAPk+Vvjnbp7FY/@google.com>
References: <20210527173153.16470-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527173153.16470-1-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Takashi,

On Thu, May 27, 2021 at 07:31:53PM +0200, Takashi Iwai wrote:
> The recent change in elants_i2c driver to support more chips
> introduced a regression leading to Oops at probing.  The driver reads
> id->driver_data, but the id may be NULL depending on the device type
> the driver gets bound.
> 
> Replace the driver data extraction with the device_get_match_data()
> helper, and define the driver data in OF table, too.
> 
> Fixes: 9517b95bdc46 ("Input: elants_i2c - add support for eKTF3624")
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1186454
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: Use device_get_match_data()
> 
>  drivers/input/touchscreen/elants_i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 17540bdb1eaf..29b5bb03cff9 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1396,7 +1396,7 @@ static int elants_i2c_probe(struct i2c_client *client,

Might want to switch to probe_new() to avoid same/similar issue down
the road, either in the same patch or in a separate one.


>  	init_completion(&ts->cmd_done);
>  
>  	ts->client = client;
> -	ts->chip_id = (enum elants_chip_id)id->driver_data;
> +	ts->chip_id = (enum elants_chip_id)device_get_match_data(&client->dev);

I think this might need to go through an intermediate cast to shut up
compiler warnings:

	ts->chip_id = (enum elants_chip_id)(uintptr_t)
			device_get_match_data(&client->dev);

>  	i2c_set_clientdata(client, ts);
>  
>  	ts->vcc33 = devm_regulator_get(&client->dev, "vcc33");
> @@ -1636,8 +1636,8 @@ MODULE_DEVICE_TABLE(acpi, elants_acpi_id);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id elants_of_match[] = {
> -	{ .compatible = "elan,ekth3500" },
> -	{ .compatible = "elan,ektf3624" },
> +	{ .compatible = "elan,ekth3500", .data = EKTH3500 },
> +	{ .compatible = "elan,ektf3624", .data = EKTF3624 },

As the bot mentioned this needs a cast.

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, elants_of_match);
> -- 
> 2.26.2
> 

Thanks.

-- 
Dmitry
