Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D276A1211
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 22:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjBWVb5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 16:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBWVb4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 16:31:56 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A519456505;
        Thu, 23 Feb 2023 13:31:54 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id d7so12551700qtr.12;
        Thu, 23 Feb 2023 13:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4WrHToYhjDx1AbMUlSeZkbECM8IxjfDW2y4H9aWRFA=;
        b=XtR2q1zAOu5fQT8ZO0UFLqP70l4Utk2RNQMU4Lw7PzbrLvcfAOigqZ9ft/r+RXMeLy
         e6WsuLGk/t4oRLHMOI/J340NZGnx+zjolHPgOPu7vSzQpVNLeSzgeAWugOKRvPxRSQoQ
         UcvBSQGIZpHR5/R8s5jMQnPDmS6iG48fXVEz4/vehSxs7h6CUlP3xQwrxOZHF7tWBV4L
         miXcXrnTFA0/nNe4uKtGbOckGsFwhA73hJRbAg3wh1YsnSGYUP2vCBfFq6uMbgRZzkMy
         Dp9AaR57Yjnj5JQtURRdaN9SGWyFd0wEc8JmW3MzbLlHt2Jm1BLTIH8RG22Dp4Os3ncm
         cSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4WrHToYhjDx1AbMUlSeZkbECM8IxjfDW2y4H9aWRFA=;
        b=gVvBWUDusvmMf0q6bea859PuEtM4NSlD8Su7oYog7WDjnn65t8fLms+7kVoPSJBHRu
         p6/nH+nQQhhbxLg6r+wLrcIWnoeUcFvxQqn5XW+YGOw4AmE/RZm6JuCqfwM9v0Ul3aOe
         mS8S4xe9XIKvCGHeHu5IYVTOB4S+xUgoafx1JexeJc6bc8FxtQ8Gx+rJ3QOOFw25+Rpk
         Yg+ZZhAnoJX2p3ZGzRfKXaxVTR3QSbP99xgCz8UkyOZBKD0Rm2XJ9lUbpufyr35nCDn9
         KzY2K09JmdNNzRBkyzcUCSCpiYSsCe+1cWflXnExLHvVLXUnjjpe7/2Dkgngju4Ot38y
         pZcw==
X-Gm-Message-State: AO0yUKWtLVP0abAM7kB63CATmt9VsQ09sYkSdSDFDajC0DBnYgLOnwtG
        FmwA006IlPcVO/IbAHRoJJg=
X-Google-Smtp-Source: AK7set82VY6tdcA/sG+2AAgbSthszXP3VxHt6hvxah8XWTkAHmEDji6pYZ96revkGPBdzdsOET1g2Q==
X-Received: by 2002:ac8:5e09:0:b0:3bf:ae12:eff with SMTP id h9-20020ac85e09000000b003bfae120effmr9757859qtx.68.1677187913713;
        Thu, 23 Feb 2023 13:31:53 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id j187-20020a3787c4000000b00739e7e10b71sm3475394qkd.114.2023.02.23.13.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:31:53 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v7 3/3] HID: cp2112: Fwnode Support
Date:   Thu, 23 Feb 2023 15:31:47 -0600
Message-Id: <20230223213147.268-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223213147.268-1-kaehndan@gmail.com>
References: <20230223213147.268-1-kaehndan@gmail.com>
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

