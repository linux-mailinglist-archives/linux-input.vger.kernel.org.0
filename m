Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1465E17EF95
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 05:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgCJEW1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 00:22:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37410 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgCJEW1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 00:22:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id f16so2765463plj.4
        for <linux-input@vger.kernel.org>; Mon, 09 Mar 2020 21:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AQsuynTUfldOnQ3xZFbLN/c8q8NcV42hT5hhNb3f5zM=;
        b=fYkiPz2NI6xJ505wPdlaa1y/oviM1G6b8gqfXUvyEV5LN95btPdmkuMxU8WEN03tn1
         Vb7yLoQPLv0CpMfts4Ska+KSuOnbEU9qfB7BrSxvi4NRQPulqz4osKcS8covWTBab+x7
         nxP4hCNbijG6S5HFVPRfQfFjdKTbZKY84ER0O4fd4D0mz+mSj7H21qWKyl84dK490Gwq
         Yj45JtdMO5Y7QAZhkSY4U1PBGxcl5W/oop4BKHBbCO2AFjPkTyeOOoMTmKxAIPgE3+6W
         5I3TiUsZpnSBAOq0cyb5b8BUYq0Sn7oXzYzNRBNblSWwzVNkOh5i5R5QhJTS356i2Xzu
         paow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AQsuynTUfldOnQ3xZFbLN/c8q8NcV42hT5hhNb3f5zM=;
        b=rxZTvyxp3FMcM/VB10lryoQs92qf2JIjHlrTTDm+W2oQMI0m17afY051y34vrT6y+c
         lS57xWt7CWOGDkpStdulUK0kuQryw1Rg+hqnrHAxrhnPuqDXGU9Rc4kYZWdHAgfRMbtC
         7ar07TI/eKjjotzSRKCfq/aHtcetJSqIKhidvGL/4B96yhS6sRny4W6r8oJlVLm3wqfv
         ndpoaEr/PNR1RQbxnwtWdKo8fSvShvZ60qYvGH1MMjhK2463azVHztsF6P+awwlKJK0L
         u88PYcsxuha4tkR8IPo95BgaBkv1v7soA0s3y8512EpRHhuLbYuSi8YuL3xpcgmJJY25
         wIyg==
X-Gm-Message-State: ANhLgQ28Wsi9vNwNmE1W4tBX3Kr8jsmwieOqp8K/rn3FZwbb3a8ls5X9
        EyLemFRfskXXIvtE1PEGuWc=
X-Google-Smtp-Source: ADFU+vsuYGW7NQl8kmsGYVmhUalTdU+vXgr5dBZdxk9B7rNH5QSyzf82cvi9RvTDfKFEKaSt9BL8pg==
X-Received: by 2002:a17:90b:8d1:: with SMTP id ds17mr239571pjb.132.1583814146165;
        Mon, 09 Mar 2020 21:22:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id w19sm38877923pgm.27.2020.03.09.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 21:22:25 -0700 (PDT)
Date:   Mon, 9 Mar 2020 21:22:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     haibo.chen@nxp.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 1/2] input: egalax_ts: switch to i2c interface before
 wake up
Message-ID: <20200310042223.GA192640@dtor-ws>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Haibo,

On Tue, Feb 11, 2020 at 04:41:11PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> For HannStar (HSD100PXN1 Rev: 1-A00C11 F/W:0634) LVDS touch screen,
> it has a special request for the EETI touch controller. The host
> needs to trigger I2C event to device FW at booting first, and then
> the FW can switch to I2C interface. Otherwise, the FW can’t  work
> with I2C interface, and can't generate any interrupt when touch
> the screen.
> 
> This patch send an I2C command before the device wake up, make sure
> the device switch to I2C interface first.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/input/touchscreen/egalax_ts.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
> index 83ac8c128192..5e35ca5edc7b 100644
> --- a/drivers/input/touchscreen/egalax_ts.c
> +++ b/drivers/input/touchscreen/egalax_ts.c
> @@ -183,6 +183,20 @@ static int egalax_ts_probe(struct i2c_client *client,
>  	ts->client = client;
>  	ts->input_dev = input_dev;
>  
> +	/* HannStar (HSD100PXN1 Rev: 1-A00C11 F/W:0634) LVDS touch
> +	 * screen needs to trigger I2C event to device FW at booting
> +	 * first, and then the FW can switch to I2C interface.
> +	 * Otherwise, the FW can’t  work with I2C interface. So here
> +	 * just use the exist function egalax_firmware_version() to
> +	 * send a I2C command to the device, make sure the device FW
> +	 * switch to I2C interface.
> +	 */
> +	error = egalax_firmware_version(client);
> +	if (error) {
> +		dev_err(&client->dev, "Failed to switch to I2C interface\n");
> +		return error;
> +	}
> +
>  	/* controller may be in sleep, wake it up. */
>  	error = egalax_wake_up_device(client);
>  	if (error) {

I think this should be part of egalax_wake_up_device(), in case where we
do not have dedicated reset gpio. Also, instead of abusing firmware
read, would a dummy byte read be enough (i2c_probe_func_quick_read)?

Thanks.

-- 
Dmitry
