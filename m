Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA4AEE773
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 19:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729434AbfKDShI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 13:37:08 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39567 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDShI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 13:37:08 -0500
Received: by mail-qt1-f194.google.com with SMTP id t8so25437598qtc.6;
        Mon, 04 Nov 2019 10:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DI1hcEhCcLbkSeRAhVyjZB1oiq8hAYHfbGrfkOIF6Gg=;
        b=Rmgm5nkNSp3KX9H0KX6g4O/Du0UcndbRBQ+zZSZfNnzuuF15HlhaVqX/0hEUDcZ1tX
         rljE4YsG64bHUMtQseMWnI+SUWNg+7J8qEgmINXAztE04hJ9cXuRJ/vSJR0ck/in0Vql
         IQSzpqaC34AujM5mjm81NGWe0jbIBXUsoAdVCeMNnIhWlbF8IBEHhElCDtprOt5VaZ3m
         M6pwoRseFH05RL6aIcsikVuu6bpUu86ZXi/JscP+mKPWRcenhTL4Ti55/TaCvhjpfEYH
         AyqgcB5/3NMKk9DawWmlPa5ECWV5SaiAS0eKdRUmc4CCg+8vL62Sg41vQnfl2jkK99Pz
         Es/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DI1hcEhCcLbkSeRAhVyjZB1oiq8hAYHfbGrfkOIF6Gg=;
        b=Lylj7mkDVMMMYq7IwC+8YZvzoX6LTUxWwbrdCUdlTh6rr+uqIyw9lzAA62YbrFNfTx
         o2Vu/q0H++EYFOm7ZWgj5bx3VZBhDWZSPsTJX/+/O/iXjjSGLcLi3HKLJlDkUYxhJSM3
         4BDRSZb7OoQ3qEVsIYDM9N1NqSiEZSM9uLPq1u/AgIH+jNYQ3/nixKJ+4pHytKAD+Oid
         yqofMcwHSvfUmazNOQa8mCiM7uh8+ze7QlzKv0LTBBrXlTEBo+H97EI0H7xxsmOOKCnR
         485oo/gdmhAIjlEUNcmVQRtpKnYU6LtjXaUUVFm5t5Ntt1BofnvylqSRZJKIm3aqpfOw
         WQCw==
X-Gm-Message-State: APjAAAUPTNp4R1chsgWMhb0caMusEPJfULOZ9MYxgoQ5Sr3iYbb6Uy9M
        HJOCAkJzcCEaaNbqWWB8onBAgABG
X-Google-Smtp-Source: APXvYqycdaeFv/udxKgt5/zd+OqWhsQ8SpROXxWa++l40AdJRnXLs7TWEqhrRO5eRMeVMBg9XqgMRg==
X-Received: by 2002:ac8:2894:: with SMTP id i20mr13432421qti.270.1572892626568;
        Mon, 04 Nov 2019 10:37:06 -0800 (PST)
Received: from svens-asus.arcx.com ([184.94.50.30])
        by smtp.gmail.com with ESMTPSA id z193sm9589821qkb.12.2019.11.04.10.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 10:37:06 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Date:   Mon,  4 Nov 2019 13:37:02 -0500
Message-Id: <20191104183702.8894-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104070116.GM57214@dtor-ws>
References: <20191104070116.GM57214@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ok, so here are my test results on an ili211x :

Using Marek's patch:
https://patchwork.kernel.org/patch/10836651/#22811657
It works fine.

Using Dmitry's patch:
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=ili2xxx-touchscreen
Does not work at all - the driver even enters an infinite loop.

I tracked this down to two separate issues:
1. the ili211x does not have a touchdata register; but the driver tries to 
	read from one.
2. the ili211x should never poll - otherwise it will read all zeros, which
	passes the crc check (!), then results in ten finger touches all
	at (x=0, y=0).

The patch at the end of this e-mail addresses these two issues. When it is
applied, the ili211x works fine.

Of course, this does not address the issue Marek saw with Dmitry's patch
	on the ili251x.

Sven

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 7a9c46b8a079..f51a3a19075f 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -36,7 +36,7 @@ struct ili2xxx_chip {
 	int (*get_touch_data)(struct i2c_client *client, u8 *data);
 	bool (*parse_touch_data)(const u8 *data, unsigned int finger,
 				 unsigned int *x, unsigned int *y);
-	bool (*continue_polling)(const u8 *data);
+	bool (*continue_polling)(const u8 *data, bool has_touch);
 	unsigned int max_touches;
 };
 
@@ -96,7 +96,7 @@ static bool ili210x_touchdata_to_coords(const u8 *touchdata,
 	return true;
 }
 
-static bool ili210x_check_continue_polling(const u8 *data)
+static bool ili210x_check_continue_polling(const u8 *data, bool has_touch)
 {
 	return data[0] & 0xf3;
 }
@@ -111,14 +111,19 @@ static const struct ili2xxx_chip ili210x_chip = {
 
 static int ili211x_read_touch_data(struct i2c_client *client, u8 *data)
 {
+	struct i2c_msg msg = {
+		.addr	= client->addr,
+		.flags	= I2C_M_RD,
+		.len	= ILI211X_DATA_SIZE,
+		.buf	= data,
+	};
 	s16 sum = 0;
 	int i;
-	int error;
 
-	error = ili210x_read_reg(client, REG_TOUCHDATA,
-				 data, ILI211X_DATA_SIZE);
-	if (error)
-		return error;
+	if (i2c_transfer(client->adapter, &msg, 1) != 1) {
+		dev_err(&client->dev, "i2c transfer failed\n");
+		return -EIO;
+	}
 
 	/* This chip uses custom checksum at the end of data */
 	for (i = 0; i <= ILI211X_DATA_SIZE - 2; i++)
@@ -152,7 +157,7 @@ static bool ili211x_touchdata_to_coords(const u8 *touchdata,
 	return true;
 }
 
-static bool ili2xxx_decline_polling(const u8 *data)
+static bool ili2xxx_decline_polling(const u8 *data, bool has_touch)
 {
 	return false;
 }
@@ -216,11 +221,16 @@ static bool ili251x_touchdata_to_coords(const u8 *touchdata,
 	return true;
 }
 
+static bool ili251x_check_continue_polling(const u8 *data, bool has_touch)
+{
+	return has_touch;
+}
+
 static const struct ili2xxx_chip ili251x_chip = {
 	.read_reg		= ili251x_read_reg,
 	.get_touch_data		= ili251x_read_touch_data,
 	.parse_touch_data	= ili251x_touchdata_to_coords,
-	.continue_polling	= ili2xxx_decline_polling,
+	.continue_polling	= ili251x_check_continue_polling,
 	.max_touches		= 10,
 };
 
@@ -268,7 +278,7 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 		}
 
 		touch = ili210x_report_events(priv, touchdata);
-		keep_polling = touch || chip->continue_polling(touchdata);
+		keep_polling = chip->continue_polling(touchdata, touch);
 		if (keep_polling)
 			msleep(ILI2XXX_POLL_PERIOD);
 	} while (!priv->stop && keep_polling);
-- 
2.17.1
