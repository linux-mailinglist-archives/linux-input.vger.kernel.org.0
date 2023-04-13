Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7A86E0A5A
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 11:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDMJhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 05:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjDMJhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 05:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D8E4C3C
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 02:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681378594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2470Jn1xT8SqVojwsdSC8po6r74iycG8WPpiDgzZJ2o=;
        b=cDut8nar4fBHEnjdmDQnG4Ca+6pjE4W+TrpPMjcE9exTl3hW6hqzM4E27wNVXT05/qNwkw
        lO21BjHTcp5iq2+vU1taW+QFEhXv4/8O6BcLNDIuaaUngcD3OJFt01ji/wSFGjEpfPJ2SE
        /YMejq26z33PEm5nfK2L+FYWA2e1G6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-36X916g1PfOKGAkFyQ34tw-1; Thu, 13 Apr 2023 05:36:30 -0400
X-MC-Unique: 36X916g1PfOKGAkFyQ34tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43AC18996E2;
        Thu, 13 Apr 2023 09:36:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 80FCFC15E7F;
        Thu, 13 Apr 2023 09:36:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 3/3] HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
Date:   Thu, 13 Apr 2023 11:36:25 +0200
Message-Id: <20230413093625.71146-4-hdegoede@redhat.com>
In-Reply-To: <20230413093625.71146-1-hdegoede@redhat.com>
References: <20230413093625.71146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add reset GPIO support to the generic i2c-hid-of driver

This is necessary to make the Wacom digitizer on the Lenovo Yoga Book 1
(yb1-x90f/l) work and this will also allow consolidating the 2 specialized
i2c-hid-of-elan.c and i2c-hid-of-goodix.c drivers into the generic
i2c-hid-of driver.

For now the new "post-reset-deassert-delay-ms" property is only used on
x86/ACPI (non devicetree) devs. IOW it is not used in actual devicetree
files and the same goes for the reset GPIO. The devicetree-bindings
maintainers have requested properties like these to not be added to
the devicetree-bindings, so the new property + GPIO are deliberately
not added to the existing devicetree-bindings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Chanhes in v2:
- Add a comment to the "post-reset-deassert-delay-ms" property reading,
  that it is a kernel internal (non public) property used between x86
  platform code and the i2c-hid driver.
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 385f7460e03c..855f53092f4e 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -21,6 +21,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/hid.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
@@ -35,8 +36,10 @@ struct i2c_hid_of {
 	struct i2chid_ops ops;
 
 	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[2];
 	int post_power_delay_ms;
+	int post_reset_delay_ms;
 };
 
 static int i2c_hid_of_power_up(struct i2chid_ops *ops)
@@ -55,6 +58,10 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	if (ihid_of->post_power_delay_ms)
 		msleep(ihid_of->post_power_delay_ms);
 
+	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
+	if (ihid_of->post_reset_delay_ms)
+		msleep(ihid_of->post_reset_delay_ms);
+
 	return 0;
 }
 
@@ -62,6 +69,7 @@ static void i2c_hid_of_power_down(struct i2chid_ops *ops)
 {
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 
+	gpiod_set_value_cansleep(ihid_of->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(ihid_of->supplies),
 			       ihid_of->supplies);
 }
@@ -96,6 +104,19 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 	if (!device_property_read_u32(dev, "post-power-on-delay-ms", &val))
 		ihid_of->post_power_delay_ms = val;
 
+	/*
+	 * Note this is a kernel internal device-property set by x86 platform code,
+	 * this MUST not be used in devicetree files without first adding it to
+	 * the DT bindings.
+	 */
+	if (!device_property_read_u32(dev, "post-reset-deassert-delay-ms", &val))
+		ihid_of->post_reset_delay_ms = val;
+
+	/* Start out with reset asserted */
+	ihid_of->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ihid_of->reset_gpio))
+		return PTR_ERR(ihid_of->reset_gpio);
+
 	ihid_of->supplies[0].supply = "vdd";
 	ihid_of->supplies[1].supply = "vddl";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ihid_of->supplies),
-- 
2.39.1

