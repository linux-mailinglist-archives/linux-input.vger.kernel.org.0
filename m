Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9E56C04EB
	for <lists+linux-input@lfdr.de>; Sun, 19 Mar 2023 21:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjCSUsP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 16:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjCSUsK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 16:48:10 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D65768B;
        Sun, 19 Mar 2023 13:48:07 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id r5so11130017qtp.4;
        Sun, 19 Mar 2023 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679258887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrTr039c+6RN5N35ewTG2eYP720SLlYLqSsBbC6Oub8=;
        b=DxonOl/8K+dvmpWuo+1YenKfHOlFPr30tw66Jg22opyy3IHXlPpOn7dRUNZOT41Tz8
         VRPg6q5HnxqAep5WpgHZTHU4/GeovoueOqbCd+GzpGrOVmNx/uWLYZopitxZPPDPl49M
         sUA1Ol8FDk1CkA5PnpUS4VF81lDITASOygHcbOqP0VfJoLl5ITlfGwokgXy8RbUZwFuU
         oSB5mI96cXCxeJeozDLEYIrapjy8exR+i2pfCWYNcI9s4S+OIulLm4KQzUFUfEy/EhzG
         Xzemc8s/PAtDZ23po7mpWP2uWlyFhigw2EDdEygK/OSwwSHiUpt7JLp2yArbpqX39khE
         kIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrTr039c+6RN5N35ewTG2eYP720SLlYLqSsBbC6Oub8=;
        b=ROcwb42Z+TCpw48hy0KeORDZPacDIsoOykHg47dlocgXdTxtrzpXMCEHSX4+LY8k/6
         PgHS4+13WAhenwr0rTzOCi/XW6M8QSOw+O+6HK5PAYQ/q4behYafJmc/o2+wtsi5tKK6
         xi8oRpNpojpEc492ILeDYi+ET2dymcv7JLBpFtyRTjQWWPYvFrqweQAOrbms6BB1O82a
         xjuMuxHhHM/Tm5wEM9wziUhqu56dXoaxWQCDWfBudcSFJTMOZ/KPnqVV5CmqTIihOzza
         j5B4kWkoR7PQpI6msBP/840q5iAC1ucBKa2C0i1pvlei2yWu7CjTWzAW31TKQ7YEGI9k
         ZK3w==
X-Gm-Message-State: AO0yUKVfV7Wo8aNT7X/PRYWkaunil1ROFog1OIjeKz7nWCjTnQOHTIkk
        B+4rU6elPYnjgCq9QvasP4g=
X-Google-Smtp-Source: AK7set+q7zCLSBGRHPR1/9WObyNMJyALQo+2AYOd+xNYhamOq9gmtCR4X1wKet5VZSoLbD4joTSPQQ==
X-Received: by 2002:a05:622a:1a0e:b0:3bf:c371:789e with SMTP id f14-20020a05622a1a0e00b003bfc371789emr24348536qtb.14.1679258886920;
        Sun, 19 Mar 2023 13:48:06 -0700 (PDT)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id m24-20020ac866d8000000b003b7e8c04d2esm5186021qtp.64.2023.03.19.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:48:06 -0700 (PDT)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v9 3/3] HID: cp2112: Fwnode Support
Date:   Sun, 19 Mar 2023 15:48:02 -0500
Message-Id: <20230319204802.1364-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230319204802.1364-1-kaehndan@gmail.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
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

Support describing the CP2112's I2C and GPIO interfaces in firmware.

I2C and GPIO child nodes can either be children with names "i2c" and
"gpio", or, for ACPI, device nodes with _ADR Zero and One,
respectively.

Additionally, support configuring the I2C bus speed from the
clock-frequency device property.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/hid-cp2112.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..9e327763fd90 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1234,6 +1234,10 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	u8 buf[3];
 	struct cp2112_smbus_config_report config;
 	struct gpio_irq_chip *girq;
+	struct i2c_timings timings;
+	struct fwnode_handle *child;
+	u32 addr;
+	const char *name;
 	int ret;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1247,6 +1251,17 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	mutex_init(&dev->lock);
 
+	device_for_each_child_node(&hdev->dev, child) {
+		name = fwnode_get_name(child);
+		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
+
+		if ((name && strcmp("i2c", name) == 0) || (!ret && addr == 0))
+			device_set_node(&dev->adap.dev, child);
+		else if ((name && strcmp("gpio", name)) == 0 ||
+					(!ret && addr == 1))
+			dev->gc.fwnode = child;
+	}
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
@@ -1292,6 +1307,9 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_power_normal;
 	}
 
+	i2c_parse_fw_timings(&dev->adap.dev, &timings, true);
+
+	config.clock_speed = cpu_to_be32(timings.bus_freq_hz);
 	config.retry_time = cpu_to_be16(1);
 
 	ret = cp2112_hid_output(hdev, (u8 *)&config, sizeof(config),
-- 
2.25.1

