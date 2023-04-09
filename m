Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B99166DC06A
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 16:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjDIOnk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 10:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjDIOnk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 10:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0141630F6
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 07:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681051370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W25vjDxRWh3r7g/c9uA6SC3LXuaMuOvAMoNp73wzVP0=;
        b=Ggai89XQWaG60DYJ43FOxkAlvpybonRL4Jilg/ggYr/qq2roYB0jqZ7ledxgPV9y9VFA8r
        vHdEjjo0DgYCa/qv39oznsXA7RRERqg289tuDD6uGNWxMIrONbgvHwSpp579FLULvQ2SHY
        z7Ptbx7Ub0rFJH4XtVdAo2xm1mbdikg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-ojCNDTZQNM69OXMk95TO6g-1; Sun, 09 Apr 2023 10:42:48 -0400
X-MC-Unique: ojCNDTZQNM69OXMk95TO6g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A2DC185A78F;
        Sun,  9 Apr 2023 14:42:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7C751202701E;
        Sun,  9 Apr 2023 14:42:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/6] HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
Date:   Sun,  9 Apr 2023 16:42:40 +0200
Message-Id: <20230409144243.25360-4-hdegoede@redhat.com>
In-Reply-To: <20230409144243.25360-1-hdegoede@redhat.com>
References: <20230409144243.25360-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
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
 drivers/hid/i2c-hid/i2c-hid-of.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 385f7460e03c..d0289afa57dc 100644
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
@@ -96,6 +104,14 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 	if (!device_property_read_u32(dev, "post-power-on-delay-ms", &val))
 		ihid_of->post_power_delay_ms = val;
 
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

