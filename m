Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6C268A843
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 05:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjBDEnW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 23:43:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbjBDEnV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 23:43:21 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C55C252B5;
        Fri,  3 Feb 2023 20:43:19 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id g18so5505487qtb.6;
        Fri, 03 Feb 2023 20:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxXKGR9ltFdKDl8mSCieW1oHKLB8nv28bH/fp3/rD9Q=;
        b=LH+/iZF7HBV/S7Xu2nv3FpyfWu5Huh1+YzFFfqLGOtEPgihdZjiGyGITckoBS8rkRy
         eFuuYKcL6vCQZbyAki1wkhnl4L4teABf4KeXuH7jPGYAHEiUHauV6BBYTWCLlH/S4TEF
         PArcNV5ldTmaZOE7yUKZxxgXgrX5HdEFX+3z/7LPHATmo+XFZPPx5OfBW/lnBgWR6k8Y
         8FMMxBgmhcyjjg+5o+Tcp+xBxbOAxfvWzusujSwJehEq9ri1kTJsFJoTCPDIV8+SGeUo
         6NZp5sha0knnojT9ZKzSGy4bms/ahCgFWjqQxOHXWWVjKiF+JOygdgKy8bWKJjzeBlOs
         0wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxXKGR9ltFdKDl8mSCieW1oHKLB8nv28bH/fp3/rD9Q=;
        b=P9UXrtX+ThUZ9dXU6vzd1tkOEXwkgLJbDLjqe4W35dBQrSEJT+PaqEg6GOB5wUUxUA
         KQNC1/mwkxgUNbT39IwL1FYPcq8JNmxwj2HKTXjWCcNoG/gabeAk7qti6tYmifI0FLKK
         67dFW2KznrrMegDEdnli2HLbRPmjIOAP7tl5VKdHRtkswk2gyKxnMyArWIdHePy63qCA
         EWuRqXBjnf7lAheyIhSUBo2dA6Rd6D/cpx+1/JJjwFdPBgtNLjW6J2NtRBjAqHV+4sEW
         S8gd2k2JJDtX8/YMN/3rzNSa7NhEOqm/Kuw6m8UyYN4Kl7HNSKzbRV+ssoFsbCOdMVJ+
         0ZmA==
X-Gm-Message-State: AO0yUKUyiNSMVFnX/r8IaM6crdWMaj+wsU0E0lnyhK/gSmy6MLx8oOoR
        hixJRpRQ0xKAE+9IOSRFcTY=
X-Google-Smtp-Source: AK7set/lLKkrAGKutVgi4jr5I9+Cu2czUItSKLcD05Owdkr6qDJ8GFzep44BVvRnOmYye2Boa2jrGA==
X-Received: by 2002:a05:622a:312:b0:3b7:ec1b:1fa7 with SMTP id q18-20020a05622a031200b003b7ec1b1fa7mr22922879qtw.43.1675485798335;
        Fri, 03 Feb 2023 20:43:18 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id l23-20020ac84597000000b003b85ed59fa2sm2882135qtn.50.2023.02.03.20.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 20:43:18 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v2 4/4] HID: cp2112: Devicetree Support
Date:   Fri,  3 Feb 2023 22:43:13 -0600
Message-Id: <20230204044313.364-5-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230204044313.364-1-kaehndan@gmail.com>
References: <20230204044313.364-1-kaehndan@gmail.com>
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

