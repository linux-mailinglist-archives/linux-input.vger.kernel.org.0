Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8ED63612D2
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 21:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbhDOTRt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 15:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234505AbhDOTRt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 15:17:49 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E413EC061574;
        Thu, 15 Apr 2021 12:17:23 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a85so16277482pfa.0;
        Thu, 15 Apr 2021 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zavrSAOhrdK7PChu5W1wVd4Vytxr7ADRcbZyctfF7w8=;
        b=tEcjFvEzmK/fNjE27G/orNlk6qsronI36dkZ0S8pElFOV4OC/hjjY7Y/MrP5siShPH
         ywildFAS83K1XNSrCSLlXWcrWT+pN/RWneLF05GfUHD15Pu2pNWInYYFrrOpviU6B0W0
         o9GUJ1R65QLNZOP6XIh4KUhuo3iz2k8ol6ICC+45ZMlpgwmiBAfxmZl/IwHEuWiCj4d1
         dfcUo5ya0mlU0Ki2GjpKVjK69qHrT11A+tjOO0rLuc/ULK8DMXNNXj0vDZGtJuvXZu5H
         WMq/oASoT0YpwjrVHhIjmkjxUFRf4qthffvODxcNs2wCP/QEAjDvHd+o4jJ00AMWpYbe
         3WgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zavrSAOhrdK7PChu5W1wVd4Vytxr7ADRcbZyctfF7w8=;
        b=X01OqK62Efr8icrhCW0/Tpd4XZxoYhBexyE4/I7ujn/9sZFfmwQRloIsZUYJmei/u+
         lAb2fRNLbkfC0GIGAkuLe+lygMsOaK4V2Q1skpTYeFAlbkuVngRlKBJly6tHKTEtbpgl
         Mbv0c/892kHl9L1wd/dt5jyDuJ6t1doXseu9Z5RXi8W4AsyNgmXn5zw7F3Cj/ViZTbzT
         gV1ouNRKajdoRfTiEB6BKbu9CbbCALmc34vIUXoMYAsMCJ3nX4RT6VWCRVYkWB3oo7ee
         /w7xj817T7LwQIx82qSJfwD+Mj51aBABeS5NNxqqGjO4AFQyJ5aOHo8FTA2qbevORleT
         m6ZQ==
X-Gm-Message-State: AOAM532pnuFQtIForXj50Yk6QcxuVZEs/AGV5m1v+vS+37NKAH4/JnKG
        b76nwTzezY15eQvYlM9AXuY=
X-Google-Smtp-Source: ABdhPJxruoQ/s7Jv+K/lrjugu4aFxNSIR1LQJ5RazivrMaxRsGeFWOCbtfRORW2k3W3PM5pwy8e03A==
X-Received: by 2002:a62:2943:0:b029:24b:f35d:2565 with SMTP id p64-20020a6229430000b029024bf35d2565mr4604433pfp.52.1618514243339;
        Thu, 15 Apr 2021 12:17:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d7e:4d10:d9a7:9fa4])
        by smtp.gmail.com with ESMTPSA id x12sm3094381pjk.53.2021.04.15.12.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 12:17:22 -0700 (PDT)
Date:   Thu, 15 Apr 2021 12:17:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
Cc:     furquan@google.com, seanpaul@chromium.org, rrangel@chromium.org,
        simba.hsu@rad-ic.com, jeffrey.lin@rad-ic.com, KP.li@rad-ic.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver: input: touchscreen: modify Raydium i2c
 touchscreen driver
Message-ID: <YHiRP+UvUlXfr0J6@google.com>
References: <20210415085829.1419147-1-simba.hsu@raydium.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415085829.1419147-1-simba.hsu@raydium.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI,

On Thu, Apr 15, 2021 at 04:58:29PM +0800, simba.hsu wrote:
> This path makes auto-update available when IC's status is
> Recovery mode.

Could you please explain in more detail what the issue is. Also please
improve the patch subject, as "modify Raydium i2c touchscreen driver"
does not really convey the substance of the patch.

Also, the patch does not apply to my tree, was it based on some other
tree?

> 
> Signed-off-by: simba.hsu@raydium.corp-partner.google.com

Please use your Raydium email for signoff.

> Change-Id: I5ae54896a201b949eba7514500a7e75574f5726b

No need to send change-id tags, they are not used in mainline kernel.

> ---
>  drivers/input/touchscreen/raydium_i2c_ts.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index 444479ef699e..a97403c55f75 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -298,6 +298,7 @@ static int raydium_i2c_query_ts_BL_info(struct raydium_data *ts)
>  					 0x10, 0xc0, 0x01, 0x00, 0x04, 0x00};
>  	int error;
>  	u8 rbuf[5] = {0, 0, 0, 0, 0};
> +	u32 tmpdata = 0;
>  
>  	error = raydium_i2c_send(client,
>  				 RM_CMD_BOOT_WRT, get_hwid, sizeof(get_hwid));
> @@ -315,7 +316,8 @@ static int raydium_i2c_query_ts_BL_info(struct raydium_data *ts)
>  	error = raydium_i2c_read(client,
>  				 RM_CMD_BOOT_CHK, rbuf, sizeof(rbuf));
>  	if (!error) {
> -		ts->info.hw_ver = cpu_to_le32(rbuf[1]<<24|rbuf[2]<<16|rbuf[3]<<8|rbuf[4]);
> +		tmpdata = (rbuf[1]<<24|rbuf[2]<<16|rbuf[3]<<8|rbuf[4]);
> +		ts->info.hw_ver = cpu_to_le32(tmpdata);

On the face of it I can't see why the code would behave differently,
nut then there is no raydium_i2c_query_ts_BL_info() in the copy of the
driver I have here.

>  		dev_err(&client->dev, "HWID %08X\n", ts->info.hw_ver);
>  	} else {
>  		ts->info.hw_ver = cpu_to_le32(0xffffffffUL);
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
