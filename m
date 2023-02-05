Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0494D68B06D
	for <lists+linux-input@lfdr.de>; Sun,  5 Feb 2023 15:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBEOy6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Feb 2023 09:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjBEOy4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Feb 2023 09:54:56 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CEECC14;
        Sun,  5 Feb 2023 06:54:54 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id g18so8056800qtb.6;
        Sun, 05 Feb 2023 06:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxXKGR9ltFdKDl8mSCieW1oHKLB8nv28bH/fp3/rD9Q=;
        b=axPmLZFKu5zQ5MCi0CkYBG90wusDkLUaGFvG2lUgaFRwi9KBdZiL2DPg3Gs1siYg5h
         Lxqxw+c/E9ddSvNtmVJZrIMFQJNMncNL2F8/gBQTu8UYQbVo1Lcmn/Bg08MBrTdYgtOP
         aCTCi/Ks8ZpmQEFI5eMDBBptnlEzCPKt6qUES+OQmcsQfwEVF16MWf1cM1dQ7XS/u2Ur
         ssb90RFgB1OBoEFOkMV9KJ4NCwe2LowmvT/MpkPPb5oshOzxwo5DZuSiCmK8Xc4gRQYE
         LZ6TYvjR70gSFzZ4/12JE6489x1jXwuszD7BP452csvyYsY1s1AbRZNJi+rEyy+kG4g8
         KmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxXKGR9ltFdKDl8mSCieW1oHKLB8nv28bH/fp3/rD9Q=;
        b=nbflvevlnQYl6alT7X+o/jD4EQ1uB8fFWJA2Ob39v/+XCopttPPMkf4YHP7cBpSiYO
         gvjsdG1iiu/53gepzqXVVh9nan1nFX0l6r7G3n5nDm579C5thDLIERHd7c9byoXDBZmH
         aCbDxbcyF+uqI05tt8lyqzdFp2zAbF4StuWGT/Wd+7H+YMGFms06RbeiH0iPwf0GcrdJ
         /33Xc6hD+1kzqwVGXoEfGV7dzPChbH3F2HzOQLQhwszosP8zRR16FHFr6jX4WteSf8oU
         faMmS9tmNxLYST0EHMU/ttaj6CDiM9ZaTIMzhSA2sNaGR6p4Ct9RbOo6FuZ40alXEALd
         +I7A==
X-Gm-Message-State: AO0yUKV0XdLwHdntsGd1TgFDBbDPtXYxjyM8cvWYnCCrfUF6iQ0ish06
        OGzMFBP1YhisfARxv8+uFYw=
X-Google-Smtp-Source: AK7set9JVkSwwOLIla/B6LbZhxUvuW8a4pgkds1sw9acox/imHWOQ9r57xpOjGF57q0hPa2ukDVqbw==
X-Received: by 2002:ac8:7f01:0:b0:3b8:2e48:921a with SMTP id f1-20020ac87f01000000b003b82e48921amr33953215qtk.57.1675608893472;
        Sun, 05 Feb 2023 06:54:53 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b00719165e9e72sm5560048qkf.91.2023.02.05.06.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:54:53 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v3 4/4] HID: cp2112: Devicetree Support
Date:   Sun,  5 Feb 2023 08:54:50 -0600
Message-Id: <20230205145450.3396-5-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205145450.3396-1-kaehndan@gmail.com>
References: <20230205145450.3396-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Bind i2c and gpio interfaces to subnodes with names
"i2c" and "gpio" if they exist, respectively. This
allows the gpio and i2c controllers to be described
in DT as usual. Additionally, support configuring the
i2c bus speed from the clock-frequency property.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/hid-cp2112.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..aa634accdfb0 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1234,6 +1234,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
 	struct gpio_irq_chip *girq;
+	struct i2c_timings timings;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1292,6 +1293,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_power_normal;
 	}
 
+	dev->adap.dev.of_node   = of_get_child_by_name(hdev->dev.of_node, "i2c");
+	i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
+
+	config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
 	config.retry_time = cpu_to_be16(1);
 
 	ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),
@@ -1300,7 +1305,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hid_err(hdev, "error setting SMBus config\n");
 		if (ret >= 0)
 			ret = -EIO;
-		goto err_power_normal;
+		goto err_free_i2c_of;
 	}
 
 	hid_set_drvdata(hdev, (void *)dev);
@@ -1322,7 +1327,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	if (ret) {
 		hid_err(hdev, "error registering i2c adapter\n");
-		goto err_power_normal;
+		goto err_free_i2c_of;
 	}
 
 	hid_dbg(hdev, "adapter registered\n");
@@ -1336,6 +1341,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.ngpio			= 8;
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
+#if IS_ENABLED(CONFIG_OF_GPIO)
+	dev->gc.of_node			= of_get_child_by_name(hdev->dev.of_node, "gpio");
+#endif
 
 	dev->irq.name = "cp2112-gpio";
 	dev->irq.irq_startup = cp2112_gpio_irq_startup;
@@ -1376,7 +1384,12 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 err_gpiochip_remove:
 	gpiochip_remove(&dev->gc);
 err_free_i2c:
+#if IS_ENABLED(CONFIG_OF_GPIO)
+	of_node_put(dev->gc.of_node);
+#endif
 	i2c_del_adapter(&dev->adap);
+err_free_i2c_of:
+	of_node_put(dev->adap.dev.of_node);
 err_power_normal:
 	hid_hw_power(hdev, PM_HINT_NORMAL);
 err_hid_close:
@@ -1391,6 +1404,11 @@ static void cp2112_remove(struct hid_device *hdev)
 	struct cp2112_device *dev = hid_get_drvdata(hdev);
 	int i;
 
+	of_node_put(dev->adap.dev.of_node);
+#if IS_ENABLED(CONFIG_OF_GPIO)
+	of_node_put(dev->gc.of_node);
+#endif
+
 	sysfs_remove_group(&hdev->dev.kobj, &cp2112_attr_group);
 	i2c_del_adapter(&dev->adap);
 
-- 
2.25.1

