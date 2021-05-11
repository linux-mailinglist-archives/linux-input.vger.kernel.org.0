Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA0B379C63
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 04:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhEKCDH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 22:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhEKCDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 22:03:07 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED94C061574;
        Mon, 10 May 2021 19:02:02 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id h127so14923384pfe.9;
        Mon, 10 May 2021 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dRcz4fiE4UZIEjQ44lwl5Ekk7gTvZIEnVsKtSc+dcgg=;
        b=uhCPxJc+uCjyrwuNRcLWteetAAXbWAWOsnlfkq0tsartX5UnZ25DsojLEmi3JCq/cX
         11Pj0WmE2mLPxU3Av+cshuf8IfjSRmoQZpVgRrQuRn1daIu3GKh5CETfmCf0gyE7RNSI
         Dnfcyvm44OrxfFEUIUsOxJG+fnUW7UqHmGkIwMyigGBtJJankwM4hogyo6CWFSK58oQi
         +/Wbi+h9dXWGMd6vq6DlvnZ5ke0QF63aTf2uRoKijoRZaEcMJpkSDSNV1UutQGaMP+QC
         0iOiqAfT2Wj9pCxL5NA0tuSapheqk8TiyU0fvXLYt6i5X698yWdf8g9JZ/4AFDI9YsBX
         THLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dRcz4fiE4UZIEjQ44lwl5Ekk7gTvZIEnVsKtSc+dcgg=;
        b=RwZsFjd3ZcO1Hmc7vq69CHDSx5KibxD7ViJLOkXRS3cG4YbDhTh8cehs/oJIrIgig+
         xm00jYIEDUNoDwWKFYY73UP7mVp/KYxrgmPvol0BL23W5B6Q1/TjP35yIsV/WnQXk7hw
         WIymxBcQGSt7mEbIz1GnSPQDUMh2fnEfHcNiDUaL8PiTRA+nVRXAQVMv5AwY+jl6dOOX
         aZVaoY7MVrNfq1zB895cQ5wqESpCmBqSB02pby0eADsKOUY+3WHQHgfKJxl7/BVKAMau
         uUpSAIDHFWSpBDuArQImBt7uDK+lykE69HiEs3N7cQkClByQ+VpXlAaiapWDtTv+txkD
         dzTg==
X-Gm-Message-State: AOAM533rUdI5eryop/FFq26z6/lyWrJV2llEGWGlSoCHoEH/AoOlhX0G
        vgx7tWXt2ZVwczeEfdoAOw4=
X-Google-Smtp-Source: ABdhPJyLMK0mm4wOSmZhxBy+FHgGp2mimnIA308q/KAQBqLKcwUzqpdyI0KnPPhWA8fTz4svh8cI5g==
X-Received: by 2002:a63:6ec1:: with SMTP id j184mr28003983pgc.364.1620698521839;
        Mon, 10 May 2021 19:02:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:206:cca1:1e8c:52e0])
        by smtp.gmail.com with ESMTPSA id b1sm13394801pgf.84.2021.05.10.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:02:00 -0700 (PDT)
Date:   Mon, 10 May 2021 19:01:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
Message-ID: <YJnllh7GfuVlL3ze@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510220012.2003285-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephen,

On Mon, May 10, 2021 at 03:00:12PM -0700, Stephen Boyd wrote:
> Touching an elan trackpad while shutting down the system sometimes leads
> to the following warning from i2c core. This is because the irq is still
> active and working, but the i2c bus for the device has been shutdown
> already. If the bus has been taken down then we shouldn't expect
> transfers to work. Disable the irq on shutdown so that this driver
> doesn't try to get the report in the irq handler after the i2c bus is
> shutdown.
> 
>  i2c i2c-7: Transfer while suspended
>  WARNING: CPU: 0 PID: 196 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xb8/0x38c
>  Modules linked in: rfcomm algif_hash algif_skcipher af_alg uinput xt_cgroup
>  CPU: 0 PID: 196 Comm: irq/166-ekth300 Not tainted 5.4.115 #96
>  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
>  pstate: 60c00009 (nZCv daif +PAN +UAO)
>  pc : __i2c_transfer+0xb8/0x38c
>  lr : __i2c_transfer+0xb8/0x38c
>  sp : ffffffc011793c20
>  x29: ffffffc011793c20 x28: 0000000000000000
>  x27: ffffff85efd60348 x26: ffffff85efdb8040
>  x25: ffffffec39d579cc x24: ffffffec39d57bac
>  x23: ffffffec3aab17b9 x22: ffffff85f02d6400
>  x21: 0000000000000001 x20: ffffff85f02aa190
>  x19: ffffff85f02aa100 x18: 00000000ffff0a10
>  x17: 0000000000000044 x16: 00000000000000ec
>  x15: ffffffec3a0b9174 x14: 0000000000000006
>  x13: 00000000003fe680 x12: 0000000000000000
>  x11: 0000000000000000 x10: 00000000ffffffff
>  x9 : 806da3cb9f8c1d00 x8 : 806da3cb9f8c1d00
>  x7 : 0000000000000000 x6 : ffffffec3afd3bef
>  x5 : 0000000000000000 x4 : 0000000000000000
>  x3 : 0000000000000000 x2 : fffffffffffffcc7
>  x1 : 0000000000000000 x0 : 0000000000000023
>  Call trace:
>   __i2c_transfer+0xb8/0x38c
>   i2c_transfer+0xa0/0xf4
>   i2c_transfer_buffer_flags+0x64/0x98
>   elan_i2c_get_report+0x2c/0x88
>   elan_isr+0x68/0x3e4
>   irq_thread_fn+0x2c/0x70
>   irq_thread+0xf8/0x148
>   kthread+0x140/0x17c
>   ret_from_fork+0x10/0x18

This does not seem to me that it is Elan-specific issue. I wonder if
this should be pushed into I2C core to shut off client->irq in shutdown
for everyone.

> 
> Cc: Jingle Wu <jingle.wu@emc.com.tw>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index bef73822315d..6f64992e70d1 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1338,6 +1338,22 @@ static int elan_probe(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static void elan_shutdown(struct i2c_client *client)
> +{
> +	struct elan_tp_data *data = i2c_get_clientdata(client);
> +
> +	/*
> +	 * Make sure we don't access i2c bus after it is shutdown.
> +	 *
> +	 * We are taking the mutex to make sure sysfs operations are
> +	 * complete before we attempt to silence the device by disabling
> +	 * the irq.
> +	 */

I do not think important on shutdown as I expect we'll stop/kill
userspace first, and then fully reinitialize device on subsequent boot.

Thanks.

-- 
Dmitry
