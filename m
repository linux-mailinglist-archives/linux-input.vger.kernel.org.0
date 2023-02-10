Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2E7692A43
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 23:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbjBJWgl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 17:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbjBJWgj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 17:36:39 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F2DC0;
        Fri, 10 Feb 2023 14:36:38 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id g8so7556115qtq.13;
        Fri, 10 Feb 2023 14:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aW1PkSRv3jt+WaJT9WXVxW1GhTX6PsVqCh9XDNIwKI=;
        b=JJxL/5RqpaGgrVE1Bs5XUZL5kk0IBT6jTvxtEV8CxFEYizSeEZLUVqPBHcLzfL7Lsy
         KcQ+2xu5YLaXMJKDbZIdHY49b5r3+Ct8yLQNW+H5LTgiWhhdrt1YvlpszJ3i+m34noqT
         N4EmT2SB2gHv2zmMUGm86IKWcXqB4mmFbZy9Qy5GtPNDR8C0AP5huCmDKNyDCfYAJh84
         zkS/9u16GJ335H3CamlhrKytvxgzn5pUJG8Q7hSXrjGX0QegJmcdwkvRhYOWNUgzWMdz
         H5/eOM2BDye5wLOUfATpH0oWVWeWFcmNz/G42Tx+TTO2swhbbR4SXujfPqTRa9eDSX8H
         IKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aW1PkSRv3jt+WaJT9WXVxW1GhTX6PsVqCh9XDNIwKI=;
        b=UoSIDa6sOUzeaJ+IguSZoaH7aM3HcWA/lPOeeCIv9D/P2sEgHVfWP2ADxAaomPIZiX
         FyQ4WztlIxTzvgxT6rwbErB0l1wAmvk43CHAJ7TcDrxot7xIPAhRmqyJSzPC16aSA4jh
         wJsXyEF47Nby/jC3xp6izdhD6fBYsTFI4Vbtkj6RniaOBTumXvNhIUZl+GgyCoLpd57p
         rR0zNOkNN6EiiyaOHXGj2vLvyQUEf2SnNhecZUMUX5Oac1PB885zLh7EcGcb6MIFcWJl
         urc1ObpP2Bq7o5gnthLem8BGA/J+J8Z7i4X2oueLQdVLOuiwFjRvKQtJzaS2nmClaymN
         PVnQ==
X-Gm-Message-State: AO0yUKXErvmBiP92dI8I8WPyYmnzKXkdCFrKHvydEb97cIVAl4IgaMsm
        sbRbjrEFokd1RWiso1qFFysdA4htD/Cb7Q==
X-Google-Smtp-Source: AK7set9JFiCORaiIUucMOJD+DkloHy2ly80R2CpAJ5daubjDkcu36Xl6Ec4sIkWOQLZBhYvp7diRIg==
X-Received: by 2002:ac8:4e46:0:b0:3ae:189c:7455 with SMTP id e6-20020ac84e46000000b003ae189c7455mr28710928qtw.47.1676068597614;
        Fri, 10 Feb 2023 14:36:37 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id o5-20020ac80245000000b003b64f1b1f40sm4166063qtg.40.2023.02.10.14.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 14:36:37 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v5 3/3] HID: cp2112: Fwnode Support
Date:   Fri, 10 Feb 2023 16:36:38 -0600
Message-Id: <20230210223638.12796-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210223638.12796-1-kaehndan@gmail.com>
References: <20230210223638.12796-1-kaehndan@gmail.com>
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
 drivers/hid/hid-cp2112.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 27cadadda7c9..23c4518ec016 100644
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
@@ -1336,6 +1341,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	dev->gc.ngpio			= 8;
 	dev->gc.can_sleep		= 1;
 	dev->gc.parent			= &hdev->dev;
+	dev->gc.fwnode			= device_get_named_child_node(&hdev->dev, "gpio");
 
 	dev->irq.name = "cp2112-gpio";
 	dev->irq.irq_startup = cp2112_gpio_irq_startup;
-- 
2.25.1

