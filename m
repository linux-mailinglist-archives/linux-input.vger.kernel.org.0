Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8979F69B28E
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 19:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjBQStO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 13:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBQStO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 13:49:14 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F565FC50;
        Fri, 17 Feb 2023 10:49:11 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id t13so2263700oiw.1;
        Fri, 17 Feb 2023 10:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3yNRn8MWww6wdZq63JvrvwjyqjnOgv65RZw/9AtJW8=;
        b=WeIZuz5swzFWt4PORzyQejSbIJdFOlwYAngYOhJeg2nCwSSn3PyCu7HlH2BL5rjMel
         qyajIQ75pSJL3iGudsIQcqWJC1yPuQ4RMTVdMjf3smTuIOdZQ7iCdAu0tWCwdd4eS3+g
         Fz5ildGg3VTyBGkx12IW6/2GsrPh///Acfx1d48y3kHG2GoVJvgasl6/AGa8getZgesp
         gva2G4KKxwKRRb/5sESMFZiWkF1jw/+O7GDeAwNIFwRuDWHCiaPwjoSEULnplcwwxpjd
         fyLi+DiboFyZ3vDGC5SJK4UcykIuyHyX2sS619zHMIVO8YJsCFDhSfLX9kegeDrbWm1+
         DvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3yNRn8MWww6wdZq63JvrvwjyqjnOgv65RZw/9AtJW8=;
        b=l/E4t0Ex666NuUqaeTu0Oyc7K1LIoTermC1E2uXpIXLmn6ihEnvXBjr2x8vt0O1AKY
         NTN2f6wFjk6EkkiMUpznjHYB9prdkmIAtdrd/Sk1YvQRObGlwwvSAhTtNUJz4m4CfL5n
         0gMnsm6Vt1sxVgibfGE3BAjC3IJFtQfw3sPEy0bnMVh/g4wxeguCTmft/ltfVtv0ODBX
         TqExrjZ+Kvj4P33CoZweGyCmT7WLGLdsWTF1UvxZXIqW8rhr4a4hCJ+oaRK80knYS5EE
         ZlCmz8Zca7QpxfOYn4vOGpHPsTWf0eTMP64lfpUGFPV9Km3TLyX/fTalEDBtpcJOM3iq
         yhqw==
X-Gm-Message-State: AO0yUKVX3oODV9JXfilXWnXwGshG6iYCqp+1pF9FNT/jSDf5lmq/DTYi
        kTXMhScntINk0HWyPIsScJI=
X-Google-Smtp-Source: AK7set+FDkP+n2jORChu0F4S+5U5L8MGXN9ERX14b1GmWD+Sm+twNGSgg9lPEZ7G/F0WyREkFMH8qA==
X-Received: by 2002:a05:6808:5ce:b0:37b:4e19:3fd2 with SMTP id d14-20020a05680805ce00b0037b4e193fd2mr1186396oij.55.1676659750340;
        Fri, 17 Feb 2023 10:49:10 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id s22-20020acaa916000000b0037fa61eb1dasm1198521oie.47.2023.02.17.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:49:09 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v6 3/3] HID: cp2112: Fwnode Support
Date:   Fri, 17 Feb 2023 12:49:04 -0600
Message-Id: <20230217184904.1290-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217184904.1290-1-kaehndan@gmail.com>
References: <20230217184904.1290-1-kaehndan@gmail.com>
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
in firmware as usual. Additionally, support configuring the
i2c bus speed from the clock-frequency device property.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/hid-cp2112.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..0013bf863f0f 100644
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
+	fwnode_handle_put(dev->adap.dev.fwnode);
 err_power_normal:
 	hid_hw_power(hdev, PM_HINT_NORMAL);
 err_hid_close:
@@ -1391,6 +1400,8 @@ static void cp2112_remove(struct hid_device *hdev)
 	struct cp2112_device *dev = hid_get_drvdata(hdev);
 	int i;
 
+	fwnode_handle_put(dev->gc.fwnode);
+	fwnode_handle_put(dev->adap.dev.fwnode);
 	sysfs_remove_group(&hdev->dev.kobj, &cp2112_attr_group);
 	i2c_del_adapter(&dev->adap);
 
-- 
2.25.1

