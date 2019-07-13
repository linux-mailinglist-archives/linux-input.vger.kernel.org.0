Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42BC767951
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfGMIqx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:46:53 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43774 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbfGMIqx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:46:53 -0400
Received: by mail-pf1-f196.google.com with SMTP id i189so5328308pfg.10;
        Sat, 13 Jul 2019 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=TidFut9OwzlW0ckjd0UWlmPGsBc3cKq+HKK2tjI05FU=;
        b=t/ZD3FhsnoPnm2E+3B/ARqrJg0QJ+ZECapNTZ3zU6U9HQ5APb+bT6vYUyNrIyndBNu
         z0ds0/WboGAnuxrzYOwEXUuVJzlA1013DnTY4CgsuHZP7yjswiY1fQJboK1SP0Arw8cX
         Z03axsvNnaNEejEM/QNbjeM7ANE33RaM4c832DFE6tRALSexkiCp0wtKg7g+YOMWAA7f
         O+hpC6tHalRp/SdPGzvfQEOU+7dG98HKKSbS0h1t2x42cTCIRsbYNkocw4UUIUNauXMz
         Y3Sj0HPKsrQKViZyNRfDENg9nEa3V11mFKqnIgm7BlaHQOYk03f2A33Xw9KKVLtrcBS1
         JkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=TidFut9OwzlW0ckjd0UWlmPGsBc3cKq+HKK2tjI05FU=;
        b=K2azVKaOZ8v7WCuxffpAa5BUCg8YCzhNZgIHxx26qSsmeKGf55wzEqsJvQkI74Au0j
         fRrRdBoQU09b98rHYpYu02RtreZMFJGKEdJERdVaVGKb/ui2CHoXF3BatvTzaDtoboae
         wKcOMx4G2/79R/PgyoatiwmyjSxPgOLHGBST920UIrzxSD0+4BOlc5f6ch4STHk4uxQF
         ErXKlf+YoZM1FN0tX1CoP/R23t5h4pR61SqLgkJO9Yrf2VT+SAPU6VtgE2mRH7Kbo8ZN
         eZf3izdKgDn2avuqOOEB7F9copQtWCkNhssfwRfDeyI5Hgni6D8RxZbZRxz+dlejI8T2
         sMkw==
X-Gm-Message-State: APjAAAXKi+OnSaqRr96Cp+JNNcCozIxgYVNu867sQv8/7nCjtmE9tvjQ
        U2NEdyBXZgdI8fmJ8Wl39SUOSVJnwEk=
X-Google-Smtp-Source: APXvYqybBXEMVzLYTL2ekVN1YTgAolvKRFUmUqko0Us4zHccKRgSKftzFoQOezW1W/9C9ZUxmgdH3g==
X-Received: by 2002:a17:90a:17a6:: with SMTP id q35mr17183784pja.118.1563007612348;
        Sat, 13 Jul 2019 01:46:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 25sm10757516pfp.76.2019.07.13.01.46.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 13 Jul 2019 01:46:51 -0700 (PDT)
Date:   Sat, 13 Jul 2019 01:46:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        KT Liao <kt.liao@emc.com.tw>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elan_i2c - switch to using devm_device_add_groups()
Message-ID: <20190713084649.GA103402@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of installing custom devm cleanup action to remove attribute
groups on failure, let's use the dedicated devm API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index d9b103a81a79..b549d032da93 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1138,13 +1138,6 @@ static void elan_disable_regulator(void *_data)
 	regulator_disable(data->vcc);
 }
 
-static void elan_remove_sysfs_groups(void *_data)
-{
-	struct elan_tp_data *data = _data;
-
-	sysfs_remove_groups(&data->client->dev.kobj, elan_sysfs_groups);
-}
-
 static int elan_probe(struct i2c_client *client,
 		      const struct i2c_device_id *dev_id)
 {
@@ -1269,20 +1262,12 @@ static int elan_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = sysfs_create_groups(&dev->kobj, elan_sysfs_groups);
+	error = devm_device_add_groups(dev, elan_sysfs_groups);
 	if (error) {
 		dev_err(dev, "failed to create sysfs attributes: %d\n", error);
 		return error;
 	}
 
-	error = devm_add_action(dev, elan_remove_sysfs_groups, data);
-	if (error) {
-		elan_remove_sysfs_groups(data);
-		dev_err(dev, "Failed to add sysfs cleanup action: %d\n",
-			error);
-		return error;
-	}
-
 	error = input_register_device(data->input);
 	if (error) {
 		dev_err(dev, "failed to register input device: %d\n", error);
-- 
2.22.0.510.g264f2c817a-goog


-- 
Dmitry
