Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E8A28EAF5
	for <lists+linux-input@lfdr.de>; Thu, 15 Oct 2020 04:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgJOCJ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 22:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgJOCJh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 22:09:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CA1C025249
        for <linux-input@vger.kernel.org>; Wed, 14 Oct 2020 16:42:54 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w21so782260pfc.7
        for <linux-input@vger.kernel.org>; Wed, 14 Oct 2020 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qFrXWlnqrEytBEII/28nJ9Q+zgUwBGHm9N4QniNz8M8=;
        b=U+rbf1CVFdodFLBAr7I5yOHqWBay4Pj50DtGKRgiFGDyYn6ruZqAXpohLnxSqGAo0m
         BWeUcEPZpnne8/7cqIw865l3M8/hK5xc0w0avlTX8pWWsRpfDEVW+BvdaiMxW9q4cmVV
         9lj4psALl9tthCDoncTyqDi6LmLgVqKguw1ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qFrXWlnqrEytBEII/28nJ9Q+zgUwBGHm9N4QniNz8M8=;
        b=Jez56HuhCaWlYawWjzs9PRwfk46S15kFs1hGV7dZHLfm7AAWRV5fuTKJbScRR8v4Md
         z6jwPkqpxlg2mUX/QrLcwgZSUtBQGwSOO1pUtUiLwYf2BVwPx4A38rxySEYT9YPMN/0b
         PviByFvsz9ZNGiC9zDqScEqb9jSGTIHOtBrqK79/OOBW1Nb7bPOuLTVeME/oeqwEpuY6
         o9opTtztegphIWSlF4nYLg7zVv0FGK9ds0CY1gmMHYLk9sa1UnO7tyek+eoyKmNBBCh8
         /r6wa4P9VUTAHGBO+1e+zUzVnwdnh4eLi7TaxwnleIvJOyKktEWhMiYsV4B1s9ilM6g9
         11cA==
X-Gm-Message-State: AOAM531chZJhNSJodb4FgNX/pgGhkAX0PXtrPZFLJpqZp8ZIAM6FZx26
        xG2EPYmDHg7ok4jm2Vpu4I0grQ==
X-Google-Smtp-Source: ABdhPJzBPnqPmwbpwNOhs/eygYiTbrIspFUYhf+REo4DT5L6bjdjgUEFFvkksBd5nSBGVZTLWWAgag==
X-Received: by 2002:a63:7843:: with SMTP id t64mr1071451pgc.117.1602718974342;
        Wed, 14 Oct 2020 16:42:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id d145sm808331pfd.136.2020.10.14.16.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:42:53 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org
Cc:     kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        hdegoede@redhat.com, andrea@borgia.bo.it, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: i2c-hid: Add the ability to control a reset GPIO
Date:   Wed, 14 Oct 2020 16:42:21 -0700
Message-Id: <20201014164203.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201014164203.1.I1c2d6236990449717b861539a2234354153b1656@changeid>
References: <20201014164203.1.I1c2d6236990449717b861539a2234354153b1656@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Apparently some devices connected via i2c-hid have timing requirements
around when a reset GPIO should be asserted to them.  The diagram I
have seen, which I believe is from a Goodix device, looked like this:

         +----------------------------------
         |
AVDD ----+
               +------------------------------
         | (a) |
RESET ---------+
                     +-------------
               | (b) |
I2C comm OK ---------+

Where (a) is 10 ms and (b) is 120 ms.

Let's add the ability to support this into the i2c-hid driver.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-core.c    | 18 ++++++++++++++++++
 include/linux/platform_data/i2c-hid.h |  5 +++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 786e3e9af1c9..807b344b697b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1005,6 +1005,9 @@ static void i2c_hid_fwnode_probe(struct i2c_client *client,
 	if (!device_property_read_u32(&client->dev, "post-power-on-delay-ms",
 				      &val))
 		pdata->post_power_delay_ms = val;
+	if (!device_property_read_u32(&client->dev, "post-gpio-reset-delay-ms",
+				      &val))
+		pdata->post_gpio_reset_delay_ms = val;
 }
 
 static int i2c_hid_probe(struct i2c_client *client,
@@ -1053,6 +1056,12 @@ static int i2c_hid_probe(struct i2c_client *client,
 	ihid->pdata.supplies[0].supply = "vdd";
 	ihid->pdata.supplies[1].supply = "vddl";
 
+	/* Start out with reset asserted */
+	ihid->pdata.reset_gpio =
+		devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ihid->pdata.reset_gpio))
+		return PTR_ERR(ihid->pdata.reset_gpio);
+
 	ret = devm_regulator_bulk_get(&client->dev,
 				      ARRAY_SIZE(ihid->pdata.supplies),
 				      ihid->pdata.supplies);
@@ -1067,6 +1076,10 @@ static int i2c_hid_probe(struct i2c_client *client,
 	if (ihid->pdata.post_power_delay_ms)
 		msleep(ihid->pdata.post_power_delay_ms);
 
+	gpiod_set_value_cansleep(ihid->pdata.reset_gpio, 0);
+	if (ihid->pdata.post_gpio_reset_delay_ms)
+		msleep(ihid->pdata.post_gpio_reset_delay_ms);
+
 	i2c_set_clientdata(client, ihid);
 
 	ihid->client = client;
@@ -1163,6 +1176,7 @@ static int i2c_hid_remove(struct i2c_client *client)
 	if (ihid->bufsize)
 		i2c_hid_free_buffers(ihid);
 
+	gpiod_set_value_cansleep(ihid->pdata.reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ihid->pdata.supplies),
 			       ihid->pdata.supplies);
 
@@ -1228,6 +1242,10 @@ static int i2c_hid_resume(struct device *dev)
 
 		if (ihid->pdata.post_power_delay_ms)
 			msleep(ihid->pdata.post_power_delay_ms);
+
+		gpiod_set_value_cansleep(ihid->pdata.reset_gpio, 0);
+		if (ihid->pdata.post_gpio_reset_delay_ms)
+			msleep(ihid->pdata.post_gpio_reset_delay_ms);
 	} else if (ihid->irq_wake_enabled) {
 		wake_status = disable_irq_wake(client->irq);
 		if (!wake_status)
diff --git a/include/linux/platform_data/i2c-hid.h b/include/linux/platform_data/i2c-hid.h
index c628bb5e1061..b2150223ffa6 100644
--- a/include/linux/platform_data/i2c-hid.h
+++ b/include/linux/platform_data/i2c-hid.h
@@ -12,6 +12,7 @@
 #ifndef __LINUX_I2C_HID_H
 #define __LINUX_I2C_HID_H
 
+#include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
 
@@ -20,6 +21,8 @@
  * @hid_descriptor_address: i2c register where the HID descriptor is stored.
  * @supplies: regulators for powering on the device.
  * @post_power_delay_ms: delay after powering on before device is usable.
+ * @post_gpio_reset_delay_ms: delay after reset via GPIO.
+ * @reset_gpio: optional gpio to de-assert after post_power_delay_ms.
  *
  * Note that it is the responsibility of the platform driver (or the acpi 5.0
  * driver, or the flattened device tree) to setup the irq related to the gpio in
@@ -36,6 +39,8 @@ struct i2c_hid_platform_data {
 	u16 hid_descriptor_address;
 	struct regulator_bulk_data supplies[2];
 	int post_power_delay_ms;
+	int post_gpio_reset_delay_ms;
+	struct gpio_desc *reset_gpio;
 };
 
 #endif /* __LINUX_I2C_HID_H */
-- 
2.28.0.1011.ga647a8990f-goog

