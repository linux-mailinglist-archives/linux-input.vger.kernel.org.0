Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE1DAF9B6C
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 22:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfKLVB4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 16:01:56 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37299 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbfKLVB4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 16:01:56 -0500
Received: by mail-qt1-f195.google.com with SMTP id g50so28934qtb.4;
        Tue, 12 Nov 2019 13:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qyX4Z7dk195T8SFGUPO4T2jowou4yUxsFAfRoSseSpM=;
        b=ofAr6ZvPPVnsqQBVUUfwdtvm3h/mGX9d+rC/I+dLjlRy2p+t3weW4DbGu6iSCmJH/I
         3k8J+ya07BH0c2+xPa1RqV1yalf3VQk7/rp3SLTxdqaEz7kwpIxO8xROFRqVO1dgFktc
         +pjNhL9KixAPbDGN17w2AAg598YQsBMJmKUoYMxtCGmcYYAY4xIChYarprmLxtO4udIX
         cCrNkk3oN7PC1U5Qim/eEdKI8VojwTldDCjpFLcQ5VICXHFHttqv6+34oSVpb2aPm5tJ
         8wCCeMBnKffuOjzsrVivkl6ZnR3cyTdoJt496RgdA9pOXjaCyNwO3UkwUs5nabPwk+Lr
         PqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qyX4Z7dk195T8SFGUPO4T2jowou4yUxsFAfRoSseSpM=;
        b=GadTDLoViZYqLZZkut2KWNUD/9S8GNcEE8uWoZjzd/R8rgwUBgJbWe+U8J7t+Lql2D
         dNOl2XQkEKhjCh2TU7niJ3DOfLVJk1iQIHnxQmo6cUIFTlGe1AN+3l5RlSy5ZOIU+MM6
         nFeo0ZbDW3vp/8fU6H2BVa5ZEvPHCDFMYOugrNw06/vWhDp4IP5D5V2TPDpHuKpD54jF
         7cA9PLSSd5W8DitF3lMrzSxdMiMBK+a/tWNpW5UpkDEX7OFPskkzL7XblS5twY+LDL0/
         Ll5wb7V38S2UW5o4yGhvjm7tROfQ5Gt1Qn30d88Vh9MW+DiQRwR2f50Upcz+dm+YfRMj
         qJ6Q==
X-Gm-Message-State: APjAAAU+Zy0kFIFdJJ0ymnTPblhQ+rT4UVsuYbmNaE3r5tXnBOsY2KhW
        7YbK6YwhttHEXUOrZmONZw8=
X-Google-Smtp-Source: APXvYqykZ/+J6YxcQZSfxkhdNfem524fdjlMh32brVJcCy1cVMACtbR9vrzBSxJlKVBWGR2pvs12eQ==
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr33306752qtk.31.1573592514196;
        Tue, 12 Nov 2019 13:01:54 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 40sm1395635qtc.95.2019.11.12.13.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 13:01:53 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] Input: ili210x - optionally show calibrate sysfs attribute
Date:   Tue, 12 Nov 2019 16:01:48 -0500
Message-Id: <20191112210148.3535-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112210148.3535-1-TheSven73@gmail.com>
References: <20191112210148.3535-1-TheSven73@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Only show the 'calibrate' sysfs attribute on chip flavours
which support calibration by writing to a calibration register.

Do this by adding a flag to the chip operations structure.

Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
Cc: Marek Vasut <marex@denx.de>
Cc: Adam Ford <aford173@gmail.com>
Cc: <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org
Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 3b8e24815a1f..b0454cdacf38 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -32,6 +32,7 @@ struct ili2xxx_chip {
 	bool (*continue_polling)(const u8 *data, bool touch);
 	unsigned int max_touches;
 	unsigned int resolution;
+	bool has_calibrate_reg;
 };
 
 struct ili210x {
@@ -102,6 +103,7 @@ static const struct ili2xxx_chip ili210x_chip = {
 	.parse_touch_data	= ili210x_touchdata_to_coords,
 	.continue_polling	= ili210x_check_continue_polling,
 	.max_touches		= 2,
+	.has_calibrate_reg	= true,
 };
 
 static int ili211x_read_touch_data(struct i2c_client *client, u8 *data)
@@ -227,6 +229,7 @@ static const struct ili2xxx_chip ili251x_chip = {
 	.parse_touch_data	= ili251x_touchdata_to_coords,
 	.continue_polling	= ili251x_check_continue_polling,
 	.max_touches		= 10,
+	.has_calibrate_reg	= true,
 };
 
 static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
@@ -310,8 +313,19 @@ static struct attribute *ili210x_attributes[] = {
 	NULL,
 };
 
+static umode_t ili210x_calibrate_visible(struct kobject *kobj,
+					  struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+
+	return priv->chip->has_calibrate_reg;
+}
+
 static const struct attribute_group ili210x_attr_group = {
 	.attrs = ili210x_attributes,
+	.is_visible = ili210x_calibrate_visible,
 };
 
 static void ili210x_power_down(void *data)
-- 
2.17.1

