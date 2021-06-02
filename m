Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F1539808A
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 07:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhFBFE5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 01:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhFBFEx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 01:04:53 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C43C061574;
        Tue,  1 Jun 2021 22:03:10 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 133so1278728pgf.2;
        Tue, 01 Jun 2021 22:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iMkGncNVGj8i4pkqCX9zTHqXo5+xF9uH+eQEto8ILwk=;
        b=UVA9PG5QwPT1pqew4ahxYa0S7T4GiuPe2GV0YDOQudtttU8/ZyEQOIu0G3HR95VTP/
         ARkkNdaE2gGqxvvkvgaYpZUpQC034NiJxGCu3iZ27OzZt4g8t4BXSkjmZ1jvTROD3mP8
         rzzyortQlkoG5ta+XKM3qt49eqYlUDcuxvzAanPmcFj3PdjfW8BNbtfe0X65QWe+NTPe
         uZYz5PL21J98nvFLySznux62T+euxnTYjQqYcEaOKLElAfvh4IyFCoXyRWxZ/PhnkDEj
         mq4YLvcCe38TBD9gbLsXByp7lnJIQgrZLsSXSOoJhSCpoqTKOVVR4UukN2TGe/X6wHOx
         iAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iMkGncNVGj8i4pkqCX9zTHqXo5+xF9uH+eQEto8ILwk=;
        b=qgQvgA98jhQWvgRBE2wBQJQraAmfldqx3MH2pbzUzgRO1z6hhtea3hz3QI2vTIIhBP
         7WpVq8K7g4FSvAvsXjPlyKcRaNlzT1YMlMDnjaLYFNFtI1BeFT8wHixBUP8P/w79TPOe
         I4hzquq6/vQKgvXjCcf45B9kzRtM/oJqJSwun7JXPzpoRE7M3MoXjaDNTc4NCB44SrMM
         5WhCjFObe+ksmms1e2lPYcryIHO0KIAX1bS8H6lTw6EGaUw0ys8nlX7nvqZKq5rdgov6
         IfrDnul0Sw7jy2gcY8KjHCOWZD3N2bOAZwt3g8kLItVNJYE/jD4UFg3pnxvT7IIXWXXK
         MFnw==
X-Gm-Message-State: AOAM5303xH+UXkx4GEelOFzv12gQpL8ogKveawInDGs49oADDwkFQjga
        punUrRCejixS4Il7ms1q0V15UZLNOlc=
X-Google-Smtp-Source: ABdhPJzzvRHo7/TXEIQieOZuFTHVv0AHhUEzSakDrx4RmjM/DaGuc2Pz7r5I3fs+OX01BvXiwU0okQ==
X-Received: by 2002:a65:5c01:: with SMTP id u1mr32055820pgr.6.1622610189718;
        Tue, 01 Jun 2021 22:03:09 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a596:b3cb:1a6:1ee4])
        by smtp.gmail.com with ESMTPSA id n17sm4094265pfv.125.2021.06.01.22.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 22:03:08 -0700 (PDT)
Date:   Tue, 1 Jun 2021 22:03:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
Cc:     simba.hsu@rad-ic.com, furquan@google.com, seanpaul@chromium.org,
        rrangle@chromium.org, evgreen@chromium.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        KP.li@rad-ic.com, jeffrey.lin@rad-ic.com
Subject: Re: [PATCH] driver:input:touchscreen: improve the mechanism of
 auto-update
Message-ID: <YLcRCl23ksfYTmN6@google.com>
References: <20210510083536.41925-1-simba.hsu@rad-ic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510083536.41925-1-simba.hsu@rad-ic.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, May 10, 2021 at 04:35:36PM +0800, simba.hsu wrote:
> From: "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
> 
> Once auto-update has been interrupted, touch IC will be stuck in
> recovery mode forever and it will lead to touch malfunction.
> This patch makes auto-update available when touch IC is in
> recovery mode to avoid touch malfunction.
> 
> Signed-off-by: simba.hsu <simba.hsu@rad-ic.com>
> ---
>  drivers/input/touchscreen/raydium_i2c_ts.c | 53 ++++++++++++++++++----
>  1 file changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index 4d2d22a86977..50f6fbbe4775 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -36,7 +36,8 @@
>  #define RM_CMD_BOOT_CHK		0x33		/* send data check */
>  #define RM_CMD_BOOT_READ	0x44		/* send wait bl data ready*/
>  
> -#define RM_BOOT_RDY		0xFF		/* bl data ready */
> +#define RM_BOOT_RDY		0xFF			/* bl data ready */
> +#define RM_BOOT_CMD_READHWID	0x0E	/* read hwid */
>  
>  /* I2C main commands */
>  #define RM_CMD_QUERY_BANK	0x2B
> @@ -155,6 +156,7 @@ static int raydium_i2c_xfer(struct i2c_client *client, u32 addr,
>  	 * sent first. Else, skip the header i.e. xfer[0].
>  	 */
>  	int xfer_start_idx = (addr > 0xff) ? 0 : 1;
> +
>  	xfer_count -= xfer_start_idx;
>  
>  	ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
> @@ -289,6 +291,44 @@ static int raydium_i2c_sw_reset(struct i2c_client *client)
>  
>  	return 0;
>  }
> +static int raydium_i2c_query_ts_BL_info(struct raydium_data *ts)
> +{
> +	struct i2c_client *client = ts->client;
> +	static const u8 get_hwid[7] = {RM_BOOT_CMD_READHWID,
> +					 0x10, 0xc0, 0x01, 0x00, 0x04, 0x00};
> +	int error;
> +	u8 rbuf[5] = {0, 0, 0, 0, 0};
> +	u32 tmpdata = 0;
> +
> +	error = raydium_i2c_send(client,
> +				 RM_CMD_BOOT_WRT, get_hwid, sizeof(get_hwid));
> +	if (error) {
> +		dev_err(&client->dev, "WRT HWID command failed: %d\n", error);
> +		return error;
> +	}
> +
> +	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, rbuf, 1);
> +	if (error) {
> +		dev_err(&client->dev, "Ack HWID command failed: %d\n", error);
> +		return error;
> +	}
> +
> +	error = raydium_i2c_read(client,
> +				 RM_CMD_BOOT_CHK, rbuf, sizeof(rbuf));
> +	if (!error) {
> +		tmpdata = (rbuf[1]<<24|rbuf[2]<<16|rbuf[3]<<8|rbuf[4]);

This looks like a big-endian data. Is this correct? If so, could you
please see if the version of the patch below still works for you?

Thanks!

-- 
Dmitry

Input: raydium_i2c_ts - read device version in bootloader mode

From: simba.hsu <simba.hsu@rad-ic.com>

Add support reading device ID when controller is in bootloader mode, which
may happen if firmware update has been interrupted.

Signed-off-by: simba.hsu <simba.hsu@rad-ic.com>
Link: https://lore.kernel.org/r/20210510083536.41925-1-simba.hsu@rad-ic.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c |   52 ++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 4d2d22a86977..c7bf0c5360c9 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -36,7 +36,8 @@
 #define RM_CMD_BOOT_CHK		0x33		/* send data check */
 #define RM_CMD_BOOT_READ	0x44		/* send wait bl data ready*/
 
-#define RM_BOOT_RDY		0xFF		/* bl data ready */
+#define RM_BOOT_RDY		0xFF			/* bl data ready */
+#define RM_BOOT_CMD_READHWID	0x0E	/* read hwid */
 
 /* I2C main commands */
 #define RM_CMD_QUERY_BANK	0x2B
@@ -290,6 +291,44 @@ static int raydium_i2c_sw_reset(struct i2c_client *client)
 	return 0;
 }
 
+static int raydium_i2c_query_ts_bootloader_info(struct raydium_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	static const u8 get_hwid[] = { RM_BOOT_CMD_READHWID,
+				       0x10, 0xc0, 0x01, 0x00, 0x04, 0x00 };
+	u8 rbuf[5] = { 0 };
+	u32 hw_ver;
+	int error;
+
+	error = raydium_i2c_send(client, RM_CMD_BOOT_WRT,
+				 get_hwid, sizeof(get_hwid));
+	if (error) {
+		dev_err(&client->dev, "WRT HWID command failed: %d\n", error);
+		return error;
+	}
+
+	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, rbuf, 1);
+	if (error) {
+		dev_err(&client->dev, "Ack HWID command failed: %d\n", error);
+		return error;
+	}
+
+	error = raydium_i2c_read(client, RM_CMD_BOOT_CHK, rbuf, sizeof(rbuf));
+	if (error) {
+		dev_err(&client->dev, "Read HWID command failed: %d (%4ph)\n",
+			error, rbuf + 1);
+		hw_ver = 0xffffffffUL;
+	} else {
+		hw_ver = get_unaligned_be32(rbuf + 1);
+	}
+
+	ts->info.hw_ver = cpu_to_le32(hw_ver);
+	ts->info.main_ver = 0xff;
+	ts->info.sub_ver = 0xff;
+
+	return error;
+}
+
 static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 {
 	struct i2c_client *client = ts->client;
@@ -388,13 +427,10 @@ static int raydium_i2c_initialize(struct raydium_data *ts)
 	if (error)
 		ts->boot_mode = RAYDIUM_TS_BLDR;
 
-	if (ts->boot_mode == RAYDIUM_TS_BLDR) {
-		ts->info.hw_ver = cpu_to_le32(0xffffffffUL);
-		ts->info.main_ver = 0xff;
-		ts->info.sub_ver = 0xff;
-	} else {
+	if (ts->boot_mode == RAYDIUM_TS_BLDR)
+		raydium_i2c_query_ts_bootloader_info(ts);
+	else
 		raydium_i2c_query_ts_info(ts);
-	}
 
 	return error;
 }
@@ -1218,7 +1254,7 @@ static SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
 			 raydium_i2c_suspend, raydium_i2c_resume);
 
 static const struct i2c_device_id raydium_i2c_id[] = {
-	{ "raydium_i2c" , 0 },
+	{ "raydium_i2c", 0 },
 	{ "rm32380", 0 },
 	{ /* sentinel */ }
 };
