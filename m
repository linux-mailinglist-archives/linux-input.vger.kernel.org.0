Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 172B6F95E9
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 17:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfKLQo7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 11:44:59 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35786 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfKLQo6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 11:44:58 -0500
Received: by mail-qt1-f194.google.com with SMTP id n4so15823007qte.2;
        Tue, 12 Nov 2019 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X3O+CX+8oR3Mx1ZogYLNvvXIK4m82y5KO5CqU8RBF4U=;
        b=DoEUhr3/ghcjvDYW41+0FOmODU1uYROVseuPbsZnJB9Ox6kbzH4YaV8T49mHWyV9pO
         4vEdmH8Zi4fyCh5ZcXuwWgogXtDttYgP5DOnm2ZF2WusbcgLbZqyu6V0I9K/PET9eKOF
         1VDmQFQGRzS7VgrRTXH0z3UBkmGbMGHDPBoxwMxtVTCU/zpkvrBrqC4K15netk8J1lfm
         fpEE4CwAGEM5AR/q4F24PetsYIpW4wuK8qP7FDm4FWUE9Jb5VpGHz5teE+kCBWN+52+9
         VlhAhw+k90ZCF0yJCjukJAq4pMgpqYr4AGAuUsUDcgPWH93iQf2IGI8u/6/RoTTriOfq
         2cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X3O+CX+8oR3Mx1ZogYLNvvXIK4m82y5KO5CqU8RBF4U=;
        b=WixpsPM0m6ChLIiT6dqtfVRPbEai72x2S9qY8vEBWZZnnO6kV/Pssx825t6r9uywYw
         /FxW2uD6rJmFdeYnhAOoeZa5Qmnu3dWIwu/1Qbs9vxhTstSZvuEXZ4/lkfRr+IUVvlvb
         +SQ68TiO7gB5imE115ANIAH9ZRn9Z6hDJLzHa+uR3SnucjScnL4yb4b6Syx+sGF1nNVU
         YooqXcnG/jYjthlX98AYlSwpfUMNLMBncr1ukF0N9YeDEUxYHT1e27/gHP1vuLZWcoSI
         S1uv5ASH0YnbhdmR7ICKxJlP3KWV2oBzk7aXBj1RWNz3M3cEFJ5mUcB4SMdAvA+zfWyq
         wRkA==
X-Gm-Message-State: APjAAAU7N7eNXM01wjNfTERRNbLBJngUMYb/xNZ2jKZYXkDf1jJCPwwi
        DtyaX9gFndU8n/5JKpBoQ/Y=
X-Google-Smtp-Source: APXvYqyU9nbUbsYKawQAJe709f5xUIZGQ5mOkiq59a1upa4JBd2aNnqZrfKF5gEbyRO1IyTKXEoMCg==
X-Received: by 2002:ac8:2441:: with SMTP id d1mr22992778qtd.386.1573577096790;
        Tue, 12 Nov 2019 08:44:56 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id z5sm10543552qtm.9.2019.11.12.08.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 08:44:56 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 3/3] Input: ili210x - optionally hide calibrate sysfs attribute
Date:   Tue, 12 Nov 2019 11:44:29 -0500
Message-Id: <20191112164429.11225-3-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112164429.11225-1-TheSven73@gmail.com>
References: <20191112164429.11225-1-TheSven73@gmail.com>
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
 drivers/input/touchscreen/ili210x.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 4321f0d676cc..810770ad02e2 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -32,6 +32,7 @@ struct ili2xxx_chip {
 	bool (*continue_polling)(const u8 *data, bool touch);
 	unsigned int max_touches;
 	unsigned int resolution;
+	bool no_calibrate_reg;
 };
 
 struct ili210x {
@@ -162,6 +163,7 @@ static const struct ili2xxx_chip ili211x_chip = {
 	.continue_polling	= ili211x_decline_polling,
 	.max_touches		= 10,
 	.resolution		= 2048,
+	.no_calibrate_reg	= true,
 };
 
 static int ili251x_read_reg(struct i2c_client *client,
@@ -310,8 +312,19 @@ static struct attribute *ili210x_attributes[] = {
 	NULL,
 };
 
+static umode_t ili210x_calibrate_visible(struct kobject *kobj,
+					  struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+
+	return !priv->chip->no_calibrate_reg;
+}
+
 static const struct attribute_group ili210x_attr_group = {
 	.attrs = ili210x_attributes,
+	.is_visible = ili210x_calibrate_visible,
 };
 
 static void ili210x_power_down(void *data)
-- 
2.17.1

