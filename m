Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1029A68BEC0
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjBFNvA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:51:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbjBFNuj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:50:39 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC6B2449B;
        Mon,  6 Feb 2023 05:50:20 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id z5so12744927qtn.8;
        Mon, 06 Feb 2023 05:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxXKGR9ltFdKDl8mSCieW1oHKLB8nv28bH/fp3/rD9Q=;
        b=OsRfJAZE0DbZvScCF8h1BPnIKA1IyQMJMmObv5R0f6RXGGvGhGImrdhkZktoT9LvC7
         TQDPrHyx5FIn+zl/MFIXNtKMkbK4O23ODI40X8epY7U07ruGNHd8FuA6yDrn+y+khqDl
         MhuS2nI7TJDR9gBqgG6A9dQ1LY5Uv0UIqyqST0IPStwr1c0Ze56I7lPS5TrfOumHg+Hh
         BIuZdb21DAJyZaWlgp66EKptxZ4cDlRAXO33Knw/Of9VWjiYrGi5tGYticAfFH9/eKo6
         W/9dRjHoS2son6x/TIoTa7O2WVZeZr21GlWTtMC6O9hcLx2aGW01HZizeyxdbeWJ8z6H
         afKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxXKGR9ltFdKDl8mSCieW1oHKLB8nv28bH/fp3/rD9Q=;
        b=s0F0zCRQ+frtb0QP+geaXSHAgvUXB5ytsXiEOndLHbrRz4Q/IabQitTBOF1LVjFCXa
         4xpHeitb6rYfyQNesdUBu6FB5+sFgJGOxJiB2iE28FcoFmA4qhH/sjOk4mB7OaXoLsET
         roDlPdVusv8P/Raikl71UvhDVxGaFARDCb23RrSutsVrmXskK5fHE2sBO+cxYyQoNz8+
         pwctwRYVcCuGTTL42mmHOMe/hqDaa7rPMn1p85XKl/jbQgcfu76qAjachhrlqXTAGgFQ
         001Vdgq4TM4lKq+7xMaIdfqLQTaCjAIacVp0yPfwnJdQm0O3TAkzPICVbFAeNNbbk2B3
         salA==
X-Gm-Message-State: AO0yUKXPL0E4XMJvDzR37zQSO1NGjjvsinpJI2qGTlfCFbcz38E1y8Cl
        pIlysTsSWrAV6T+RdvX6AFSwzHJJEsaYPA==
X-Google-Smtp-Source: AK7set8GXdM3WkR/hGU0bOEx+TSAMGfo7qIoNTVTN8fKjj9Y3h7OIvghtQgLAFYK8QVW0cMTc6zVEg==
X-Received: by 2002:a05:622a:134c:b0:3b9:ba79:80d7 with SMTP id w12-20020a05622a134c00b003b9ba7980d7mr35570946qtk.12.1675691419420;
        Mon, 06 Feb 2023 05:50:19 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id ed4-20020a05620a490400b007195af894e7sm7349492qkb.76.2023.02.06.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:50:19 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v4 4/4] HID: cp2112: Devicetree Support
Date:   Mon,  6 Feb 2023 07:50:16 -0600
Message-Id: <20230206135016.6737-5-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206135016.6737-1-kaehndan@gmail.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
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

