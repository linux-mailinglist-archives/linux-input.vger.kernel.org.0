Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D953BDB883
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503004AbfJQUna (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:43:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41602 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503017AbfJQUmv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so2368385pfh.8;
        Thu, 17 Oct 2019 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nakS4ni/rzOzl8FCN3SL5jKJ0hRnlt/GoJAm0yqa078=;
        b=PnZ4hYwEbStV5VEGMzJSEN6FdtifpkFlGbm5q0movRTugtW+PpjBrsmsuTncl1+rkn
         HdbrHLceCbMiS8URsK6KETlr4YVmaRGhqky0DWLL3ZgyxyVwM1oKnkT/TypiILQgWmnB
         CxbzFJySVcKjPf7f6qUyw6w0w0QKpDZUQjU0twGJUH4vKrg5Ns167e1U/fSJWJ4lZbSZ
         //I4SCEofeFxvtVRmvTHOCcVuuAwTySDuAsrxjEQDLVyk+i0b9HZvFZ2j2p6Pr5ynQrq
         6Wjkfp9w6jDXHqVId0rNZ+JcBIJuRDehdgkck42U5br2BwmSPbplczIzjcbKm+ZR8z/O
         ZfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nakS4ni/rzOzl8FCN3SL5jKJ0hRnlt/GoJAm0yqa078=;
        b=AS+WgyuqOMzI+AUjo1PgMumvUiZl+0uiBC4AL6m5aSbl4nyhpFF5Y2lxqkd3f7vgzm
         zNTxlgcP7q3lpJgyAmqE3Nuv7kwQptnSRcCoBvGA9Sy8BhmFMLrPJzaWYYzSHqWXcaAe
         ivFIzq46XVgZxVOmoRvWucqY4Z0mq3d64/BWoTux74fb9pxtilrUgRrHKgvLWPzvpRsd
         Id4ZzwHlM2VZHE8d1l0ITct6Ey1OkjER93YcxCZ+24EC3xOiQ73beXV0rri4JGpIz3Di
         kgmDU4mWD0R+VzdJEowy0Ef54Brfop0snwH+GIjKDacl3XT8GeZQhugig2SHqLUH7T1r
         840A==
X-Gm-Message-State: APjAAAWamIPhWjYzA3rDhbu4725WLvcnTxrsCNcAW4Du/s493s58v36T
        7iBw/qNBsLVdhJ1jDxGo5pGL44qC
X-Google-Smtp-Source: APXvYqxkfJlhpt9lZeGxJkPWeJELDZT4tnBWyAeABdOUDsiw4ptS+IX1wWTVg3XEHm/FsGi9WjwEeA==
X-Received: by 2002:a62:fc12:: with SMTP id e18mr2326918pfh.257.1571344969228;
        Thu, 17 Oct 2019 13:42:49 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:48 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 21/22] Input: kxtj9 - switch to using managed resources
Date:   Thu, 17 Oct 2019 13:42:15 -0700
Message-Id: <20191017204217.106453-22-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Using devm API allows to clean up error handling and drop the remove()
method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/kxtj9.c | 86 +++++++++++++-------------------------
 1 file changed, 28 insertions(+), 58 deletions(-)

diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index db01c4a33914..a86544d575f8 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -292,7 +292,6 @@ static void kxtj9_init_input_device(struct kxtj9_data *tj9,
 
 	input_dev->name = "kxtj9_accel";
 	input_dev->id.bustype = BUS_I2C;
-	input_dev->dev.parent = &tj9->client->dev;
 }
 
 static int kxtj9_setup_input_device(struct kxtj9_data *tj9)
@@ -300,7 +299,7 @@ static int kxtj9_setup_input_device(struct kxtj9_data *tj9)
 	struct input_dev *input_dev;
 	int err;
 
-	input_dev = input_allocate_device();
+	input_dev = devm_input_allocate_device(&tj9->client->dev);
 	if (!input_dev) {
 		dev_err(&tj9->client->dev, "input device allocate failed\n");
 		return -ENOMEM;
@@ -319,7 +318,6 @@ static int kxtj9_setup_input_device(struct kxtj9_data *tj9)
 		dev_err(&tj9->client->dev,
 			"unable to register input polled device %s: %d\n",
 			tj9->input_dev->name, err);
-		input_free_device(tj9->input_dev);
 		return err;
 	}
 
@@ -424,8 +422,8 @@ static int kxtj9_setup_polled_device(struct kxtj9_data *tj9)
 {
 	int err;
 	struct input_polled_dev *poll_dev;
-	poll_dev = input_allocate_polled_device();
 
+	poll_dev = devm_input_allocate_polled_device(&tj9->client->dev);
 	if (!poll_dev) {
 		dev_err(&tj9->client->dev,
 			"Failed to allocate polled device\n");
@@ -446,19 +444,12 @@ static int kxtj9_setup_polled_device(struct kxtj9_data *tj9)
 	if (err) {
 		dev_err(&tj9->client->dev,
 			"Unable to register polled device, err=%d\n", err);
-		input_free_polled_device(poll_dev);
 		return err;
 	}
 
 	return 0;
 }
 
-static void kxtj9_teardown_polled_device(struct kxtj9_data *tj9)
-{
-	input_unregister_polled_device(tj9->poll_dev);
-	input_free_polled_device(tj9->poll_dev);
-}
-
 #else
 
 static inline int kxtj9_setup_polled_device(struct kxtj9_data *tj9)
@@ -466,11 +457,15 @@ static inline int kxtj9_setup_polled_device(struct kxtj9_data *tj9)
 	return -ENOSYS;
 }
 
-static inline void kxtj9_teardown_polled_device(struct kxtj9_data *tj9)
+#endif
+
+static void kxtj9_platform_exit(void *data)
 {
-}
+	struct kxtj9_data *tj9 = data;
 
-#endif
+	if (tj9->pdata.exit)
+		tj9->pdata.exit();
+}
 
 static int kxtj9_verify(struct kxtj9_data *tj9)
 {
@@ -494,7 +489,7 @@ static int kxtj9_verify(struct kxtj9_data *tj9)
 }
 
 static int kxtj9_probe(struct i2c_client *client,
-				 const struct i2c_device_id *id)
+		       const struct i2c_device_id *id)
 {
 	const struct kxtj9_platform_data *pdata =
 			dev_get_platdata(&client->dev);
@@ -512,7 +507,7 @@ static int kxtj9_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	tj9 = kzalloc(sizeof(*tj9), GFP_KERNEL);
+	tj9 = devm_kzalloc(&client->dev, sizeof(*tj9), GFP_KERNEL);
 	if (!tj9) {
 		dev_err(&client->dev,
 			"failed to allocate memory for module data\n");
@@ -525,13 +520,17 @@ static int kxtj9_probe(struct i2c_client *client,
 	if (pdata->init) {
 		err = pdata->init();
 		if (err < 0)
-			goto err_free_mem;
+			return err;
 	}
 
+	err = devm_add_action_or_reset(&client->dev, kxtj9_platform_exit, tj9);
+	if (err)
+		return err;
+
 	err = kxtj9_verify(tj9);
 	if (err < 0) {
 		dev_err(&client->dev, "device not recognized\n");
-		goto err_pdata_exit;
+		return err;
 	}
 
 	i2c_set_clientdata(client, tj9);
@@ -546,59 +545,31 @@ static int kxtj9_probe(struct i2c_client *client,
 
 		err = kxtj9_setup_input_device(tj9);
 		if (err)
-			goto err_pdata_exit;
+			return err;
 
-		err = request_threaded_irq(client->irq, NULL, kxtj9_isr,
-					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					   "kxtj9-irq", tj9);
+		err = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL, kxtj9_isr,
+						IRQF_TRIGGER_RISING |
+							IRQF_ONESHOT,
+						"kxtj9-irq", tj9);
 		if (err) {
 			dev_err(&client->dev, "request irq failed: %d\n", err);
-			goto err_destroy_input;
+			return err;
 		}
 
-		err = sysfs_create_group(&client->dev.kobj, &kxtj9_attribute_group);
+		err = devm_device_add_group(&client->dev,
+					    &kxtj9_attribute_group);
 		if (err) {
 			dev_err(&client->dev, "sysfs create failed: %d\n", err);
-			goto err_free_irq;
+			return err;
 		}
 
 	} else {
 		err = kxtj9_setup_polled_device(tj9);
 		if (err)
-			goto err_pdata_exit;
-	}
-
-	return 0;
-
-err_free_irq:
-	free_irq(client->irq, tj9);
-err_destroy_input:
-	input_unregister_device(tj9->input_dev);
-err_pdata_exit:
-	if (tj9->pdata.exit)
-		tj9->pdata.exit();
-err_free_mem:
-	kfree(tj9);
-	return err;
-}
-
-static int kxtj9_remove(struct i2c_client *client)
-{
-	struct kxtj9_data *tj9 = i2c_get_clientdata(client);
-
-	if (client->irq) {
-		sysfs_remove_group(&client->dev.kobj, &kxtj9_attribute_group);
-		free_irq(client->irq, tj9);
-		input_unregister_device(tj9->input_dev);
-	} else {
-		kxtj9_teardown_polled_device(tj9);
+			return err;
 	}
 
-	if (tj9->pdata.exit)
-		tj9->pdata.exit();
-
-	kfree(tj9);
-
 	return 0;
 }
 
@@ -647,7 +618,6 @@ static struct i2c_driver kxtj9_driver = {
 		.pm	= &kxtj9_pm_ops,
 	},
 	.probe		= kxtj9_probe,
-	.remove		= kxtj9_remove,
 	.id_table	= kxtj9_id,
 };
 
-- 
2.23.0.866.gb869b98d4c-goog

