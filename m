Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A582F9B6A
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 22:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfKLVBy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 16:01:54 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43491 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLVBy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 16:01:54 -0500
Received: by mail-qt1-f196.google.com with SMTP id l24so21330946qtp.10;
        Tue, 12 Nov 2019 13:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2i1h3RTZew5EzwteIWhHEPu/LeGd/dQkP36HLoeGoB4=;
        b=aLdc0HgwaayDctt+CpmfnklPni2iEqu6ZeAd5WQdIvq1d3cZ1bc9+Gd/HO2L9P2kD9
         mpPWSpIlRz98whhm0fFQX0SGeOFeAeMigyUpzD8VaTgDUXXpzWerQrtjgO0xFpK0e+iH
         SL1M1rjwvkW1uG+qLcFS01ZUETATS3+A8zx6d3bAUi5tFiDHwfdPn5Q3kp0p5a2keBbR
         1h2et2tIN1qTUl+EqdU7JRT3h295kz2j4wLAThYG2hRNiwAtl9PVX0Chjg1cJAqjfmbb
         y/1fYep/6ej6ZhxN8EwuZKvwXJEdXDqmc4GzKI4Psb0oElb4+UkzEqcE86CB6OTKDHQ1
         5PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2i1h3RTZew5EzwteIWhHEPu/LeGd/dQkP36HLoeGoB4=;
        b=rD/b4bVsQ4niThHTERb2EYymtMLphpADG3/u2CpW54yXES4uBD6bFwAiRP20XBfPnD
         S4V5QmiusaU9phgEEbEnz5cep99LkKC4JQqoSj2sgxD9FEPEDbxhpVhwjHU+ah3a4Sec
         q/gsYx5HIS4A1aG0Gz/pyyL6sc3kzJKV+w41DC+XaG68ju9oGfNxhcHKpivkb4vGg7zg
         2lripZV/F1RRT2rHKHTTpPvg3xcr+qzgYsIgAPd/XPGPSsD77V7sRSrbqzz1T7dhAPtu
         NvCbRxhixycJ6qvmS6n165nIXEzqGhGO3VmVcQjbk1UQtTZpBxgbBPnVADqWhGv/UVr5
         puCw==
X-Gm-Message-State: APjAAAUO3Av5fFoQBTxVRIN4jdJ5vd+CV5zAnQhPnWu3+G/jrPhJ2x0n
        a3GxpOZRXxOtF5710MXesSW+toED
X-Google-Smtp-Source: APXvYqyW0+qv089yMwQdCsfbDP7TOzGd/jKcCJeOgj/SJiFbZIZMYol/dCtgE6fPF6TsBDUVGLxQmA==
X-Received: by 2002:aed:3702:: with SMTP id i2mr31995202qtb.312.1573592512879;
        Tue, 12 Nov 2019 13:01:52 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 40sm1395635qtc.95.2019.11.12.13.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 13:01:52 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] Input: ili210x - add resolution to chip operations structure
Date:   Tue, 12 Nov 2019 16:01:47 -0500
Message-Id: <20191112210148.3535-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Optionally allow the touch screen resolution to be set by adding
it to the chip operations structure. If it is omitted (left zero),
the resolution defaults to 64K. Which is the previously hard-coded
value.

Set the ili2117 resolution to 2048, as indicated in its datasheet.

Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
Cc: Marek Vasut <marex@denx.de>
Cc: Adam Ford <aford173@gmail.com>
Cc: <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org
Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index a6feae5ce887..3b8e24815a1f 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -31,6 +31,7 @@ struct ili2xxx_chip {
 				 unsigned int *x, unsigned int *y);
 	bool (*continue_polling)(const u8 *data, bool touch);
 	unsigned int max_touches;
+	unsigned int resolution;
 };
 
 struct ili210x {
@@ -160,6 +161,7 @@ static const struct ili2xxx_chip ili211x_chip = {
 	.parse_touch_data	= ili211x_touchdata_to_coords,
 	.continue_polling	= ili211x_decline_polling,
 	.max_touches		= 10,
+	.resolution		= 2048,
 };
 
 static int ili251x_read_reg(struct i2c_client *client,
@@ -336,6 +338,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	struct gpio_desc *reset_gpio;
 	struct input_dev *input;
 	int error;
+	unsigned int max_xy;
 
 	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
 
@@ -386,8 +389,9 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	input->id.bustype = BUS_I2C;
 
 	/* Multi touch */
-	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);
+	max_xy = (chip->resolution ?: SZ_64K) - 1;
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
 	touchscreen_parse_properties(input, true, &priv->prop);
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
-- 
2.17.1

