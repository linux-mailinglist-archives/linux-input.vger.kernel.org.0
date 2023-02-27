Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CC36A43C1
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 15:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjB0OIM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 09:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbjB0OIL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 09:08:11 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05B9901C;
        Mon, 27 Feb 2023 06:08:04 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id b16so4003477iln.3;
        Mon, 27 Feb 2023 06:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4WrHToYhjDx1AbMUlSeZkbECM8IxjfDW2y4H9aWRFA=;
        b=Jsl67gvYuwAc2P2veWRPxNCh3ZX6rmMelPmmnO80Tk4NQ6oja1qErj0b+LvqlfJBnL
         4UTyPWAEyMPyFXRDP7vwpNDGmG17S3mK1PiB04gXVnsBxy0yRW+Pw3qkMTzwoYb0Pz+W
         k5KQa8whywr909Sdb9JACUfZqtaPyI6uIiKDEkr8W/nWyHO2kiMayo3AuxTyMq55afvY
         1p7ZdQ5qMSLJV466MixOLhnJm4tpe/wvf2LO7u2ALBmurFQHb444tjqLQsOVirTYw9Jt
         pbfW9djuI7sbXZyeLxl0y9h7BalN3+w45mEO+MQwD7nB4cmQ1fGdiy1oIhvCSQrgXl7T
         5xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4WrHToYhjDx1AbMUlSeZkbECM8IxjfDW2y4H9aWRFA=;
        b=lECL7GYLD7cypb3UtzJMhmWmcEY9Hxvc/vzteNn6INB9SFN2zksESaQxElQeNbD/bZ
         sVue34DCTKTNC7qnxQIhpcfdOnoUti4dCohsFPr8oISGPXxHDehgWoSkj8/wqpqeN1tj
         jTIi6iAaglO/SiKIKkVWebBl5I+bLne6apJOsBlccqZhRENqN6O4y4ikSgbzmLJ/rkZK
         ieyLyOeq2ley0JSbTH3IuUtqr5TAM5+i+P3a40S1iQK9Su95WyLqxa5JsvyHkXvDWccy
         Ct1ncxAkxEhelhyAK3M8qU0eoreBpUDHHCPF+CBq8IWFXmjxofJgxAetGGP3tx7oft6v
         kE/w==
X-Gm-Message-State: AO0yUKXF/qIyyto//75xRZzmeo1/wuvp+w6cDQOCGRb92dh+hAs4qx+g
        RilYpk+hHVkXTbvPLEdILTQ=
X-Google-Smtp-Source: AK7set+dHX5EyhrPcZLkbz0EuHUW4YplP/yWV8dZM/+K97pjcjpiU4Pl2RTNRd3SsoG0At9toJ4LYw==
X-Received: by 2002:a92:7611:0:b0:315:34b8:4c6d with SMTP id r17-20020a927611000000b0031534b84c6dmr16857929ilc.17.1677506884041;
        Mon, 27 Feb 2023 06:08:04 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id 14-20020a056e020cae00b00316dc3afe57sm1921503ilg.86.2023.02.27.06.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:08:03 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Date:   Mon, 27 Feb 2023 08:07:58 -0600
Message-Id: <20230227140758.1575-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227140758.1575-1-kaehndan@gmail.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
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

Bind I2C and GPIO interfaces to subnodes with names
"i2c" and "gpio" if they exist, respectively. This
allows the GPIO and I2C controllers to be described
in firmware as usual. Additionally, support configuring the
I2C bus speed from the clock-frequency device property.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/hid-cp2112.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..491e3c83af12 100644
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
 
+	device_set_node(&dev->adap.dev, device_get_named_child_node(&hdev->dev, "i2c"));
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
@@ -1336,6 +1341,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.ngpio			= 8;
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
+	dev->gc.fwnode			= device_get_named_child_node(&hdev->dev, "gpio");
 
 	dev->irq.name = "cp2112-gpio";
 	dev->irq.irq_startup = cp2112_gpio_irq_startup;
@@ -1376,7 +1382,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 err_gpiochip_remove:
 	gpiochip_remove(&dev->gc);
 err_free_i2c:
+	fwnode_handle_put(dev->gc.fwnode);
 	i2c_del_adapter(&dev->adap);
+err_free_i2c_of:
+	fwnode_handle_put(dev_fwnode(&dev->adap.dev));
 err_power_normal:
 	hid_hw_power(hdev, PM_HINT_NORMAL);
 err_hid_close:
@@ -1391,6 +1400,8 @@ static void cp2112_remove(struct hid_device *hdev)
 	struct cp2112_device *dev = hid_get_drvdata(hdev);
 	int i;
 
+	fwnode_handle_put(dev->gc.fwnode);
+	fwnode_handle_put(dev_fwnode(&dev->adap.dev));
 	sysfs_remove_group(&hdev->dev.kobj, &cp2112_attr_group);
 	i2c_del_adapter(&dev->adap);
 
-- 
2.25.1

