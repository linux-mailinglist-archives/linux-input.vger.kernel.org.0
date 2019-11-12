Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C36EF95E7
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 17:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfKLQo5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 11:44:57 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38993 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfKLQo4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 11:44:56 -0500
Received: by mail-qt1-f195.google.com with SMTP id t8so20462954qtc.6;
        Tue, 12 Nov 2019 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=19EjmRUyqj0e5HAJbsNkVIG9nAhQU55k6g6gflHpzw0=;
        b=ayJbdqQOs3oVSpfOCN5tFUGspMNiIWcX679UKi3/p979+aG63Fis24QySEs+Ht9IZ8
         iLJTviltEJReXD7jNFN+zvflKYpVkWQFkM+RAJ7RIUrwYSY7gX9R5HzWDUlQbi8cJ/f1
         KjCjcOyvCCQSVt+SW3/ca9DZrJasxxKO+rgoghRkEIaeVumLk/GkOLF61Mg0AgUjkRx7
         X/6/BlbxBI7+cIqJgzrUyJzCbIK58/9h6po2KXfipiuB/ppEquIR1ug7T3kJxLhTpwvj
         DbKi74VDSOmnLu50pqc4qqpPJjmNdCP+7togX4O8ty/1WZoGhD3W8HXTPT0j8Ni5KmeI
         gFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=19EjmRUyqj0e5HAJbsNkVIG9nAhQU55k6g6gflHpzw0=;
        b=aemoUfYUkXB6rj5c4Fek7iWK4CkMJ43mc/FMSaZollGiBCTrPWW/v6pq1w7lQ+vJVU
         j+SFVMX9uip/+W5FuMx2uhJGa9FR5/7BF+xid7o0LV2iBGekH/Tjd4Pv+IB9LCW4L5JJ
         pOksEbqvdtu9SBPP3ngdXXspew1fwAbRXl1nI1y5xnLZLIm/03/NujFfAriwY2UXIRHP
         zF7BSVohmDiwld9XJ9/6J45vNJ5eCVYxi4Gt05bYggJn31MKdQWmwnCcjBvT0qY6S3SG
         fR/BMCGVOLoxyrkgdG5EJaZsKcvZhGQ171t5npgrH26B2767FOzODgyoyzM/JmPALhuk
         VAtA==
X-Gm-Message-State: APjAAAVuacBI+tGEThlTRSt463klzmp6VKPcTO75R1TggPXTXotvXwXv
        1NOJcDD0+oSkFBuWLmXwefM=
X-Google-Smtp-Source: APXvYqwv0d8l3Q4WlXIW7Bn4+TLLGQAH7wwu7xHx8LvHynwVBXhQ2PL1/8Nn4NrwOSzEDSCKcDsy/g==
X-Received: by 2002:ac8:92a:: with SMTP id t39mr32634622qth.170.1573577095759;
        Tue, 12 Nov 2019 08:44:55 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id z5sm10543552qtm.9.2019.11.12.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 08:44:55 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 2/3] Input: ili210x - add resolution to chip operations structure
Date:   Tue, 12 Nov 2019 11:44:28 -0500
Message-Id: <20191112164429.11225-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112164429.11225-1-TheSven73@gmail.com>
References: <20191112164429.11225-1-TheSven73@gmail.com>
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
 drivers/input/touchscreen/ili210x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index a6feae5ce887..4321f0d676cc 100644
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
 
@@ -386,8 +389,12 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	input->id.bustype = BUS_I2C;
 
 	/* Multi touch */
-	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
-	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);
+	if (chip->resolution)
+		max_xy = chip->resolution - 1;
+	else
+		max_xy = 0xffff;
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
 	touchscreen_parse_properties(input, true, &priv->prop);
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
-- 
2.17.1

