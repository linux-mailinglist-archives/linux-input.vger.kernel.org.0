Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D77D6DC06B
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 16:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjDIOnl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 10:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIOnk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 10:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA253AA1
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681051373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E0HnaQz+neSY4UCoZ0HQeAfqhi9RPd92/yf48Aw/FlI=;
        b=hvLj0TnmNfQwwQACSbxksEJtfTzqIeCSU+CHTyBcB4cNNAEJE/9cOaYo+gjKyeipkmUBau
        Fjgl9NjFnP4D0ZLUKGnCwBSH32nKif6l0nm3LoR6c0CTQgM8NTELr8qQcBjwZKgwVrn9b9
        N2CO8HN4SyY6/PNq/qeA5IZQpc4+gQw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-8zd_tPWAMV-i7cX8OH7Gjg-1; Sun, 09 Apr 2023 10:42:49 -0400
X-MC-Unique: 8zd_tPWAMV-i7cX8OH7Gjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B7DB811E7C;
        Sun,  9 Apr 2023 14:42:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7CCEB2027040;
        Sun,  9 Apr 2023 14:42:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 4/6] HID: i2c-hid-of: Add chip_data struct
Date:   Sun,  9 Apr 2023 16:42:41 +0200
Message-Id: <20230409144243.25360-5-hdegoede@redhat.com>
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

Add a chip_data struct which can be used to set different supply-names
and default power-on-delay, reset-deassert-delay and hid_descriptor_address
values.

This is a preparation patch for consolidating the 2 specialized
i2c-hid-of-elan.c and i2c-hid-of-goodix.c drivers into the generic
i2c-hid-of driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 67 +++++++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index d0289afa57dc..4fafef1e36b9 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -32,24 +32,44 @@
 
 #include "i2c-hid.h"
 
+#define MAX_BULK_SUPPLIES	2
+
+struct i2c_hid_of_chip_data {
+	const char * const *supply_names;
+	int num_supplies;
+	int post_power_delay_ms;
+	int post_reset_delay_ms;
+	u16 hid_descriptor_address;
+};
+
 struct i2c_hid_of {
 	struct i2chid_ops ops;
 
 	struct i2c_client *client;
 	struct gpio_desc *reset_gpio;
-	struct regulator_bulk_data supplies[2];
+	struct regulator_bulk_data supplies[MAX_BULK_SUPPLIES];
+	int num_supplies;
 	int post_power_delay_ms;
 	int post_reset_delay_ms;
 };
 
+static const char * const i2c_hid_of_default_supply_names[] = {
+	"vdd",
+	"vddl",
+};
+
+static const struct i2c_hid_of_chip_data i2c_hid_of_default_chip_data = {
+	.supply_names = i2c_hid_of_default_supply_names,
+	.num_supplies = ARRAY_SIZE(i2c_hid_of_default_supply_names),
+};
+
 static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 {
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable(ihid_of->num_supplies, ihid_of->supplies);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
@@ -70,18 +90,28 @@ static void i2c_hid_of_power_down(struct i2chid_ops *ops)
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(ihid_of->supplies),
-			       ihid_of->supplies);
+	regulator_bulk_disable(ihid_of->num_supplies, ihid_of->supplies);
 }
 
 static int i2c_hid_of_probe(struct i2c_client *client)
 {
+	const struct i2c_hid_of_chip_data *chip_data;
 	struct device *dev = &client->dev;
 	struct i2c_hid_of *ihid_of;
 	u16 hid_descriptor_address;
 	u32 quirks = 0;
 	int ret;
 	u32 val;
+	int i;
+
+	chip_data = device_get_match_data(dev);
+	if (!chip_data)
+		chip_data = &i2c_hid_of_default_chip_data;
+
+	if (chip_data->num_supplies > MAX_BULK_SUPPLIES) {
+		dev_err(dev, "Error chip_data->num_supplies > MAX_BULK_SUPPLIES (internal kernel error)\n");
+		return -EINVAL;
+	}
 
 	ihid_of = devm_kzalloc(dev, sizeof(*ihid_of), GFP_KERNEL);
 	if (!ihid_of)
@@ -90,16 +120,22 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 	ihid_of->ops.power_up = i2c_hid_of_power_up;
 	ihid_of->ops.power_down = i2c_hid_of_power_down;
 
+	/* chip_data as defaults, allow device-properties to override things */
+	ihid_of->post_power_delay_ms = chip_data->post_power_delay_ms;
+	ihid_of->post_reset_delay_ms = chip_data->post_reset_delay_ms;
+	hid_descriptor_address = chip_data->hid_descriptor_address;
+
 	ret = device_property_read_u32(dev, "hid-descr-addr", &val);
-	if (ret) {
+	if (ret == 0) {
+		if (val >> 16) {
+			dev_err(dev, "Bad HID register address: 0x%08x\n", val);
+			return -EINVAL;
+		}
+		hid_descriptor_address = val;
+	} else if (!hid_descriptor_address) {
 		dev_err(dev, "HID register address not provided\n");
 		return -ENODEV;
 	}
-	if (val >> 16) {
-		dev_err(dev, "Bad HID register address: 0x%08x\n", val);
-		return -EINVAL;
-	}
-	hid_descriptor_address = val;
 
 	if (!device_property_read_u32(dev, "post-power-on-delay-ms", &val))
 		ihid_of->post_power_delay_ms = val;
@@ -112,10 +148,11 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 	if (IS_ERR(ihid_of->reset_gpio))
 		return PTR_ERR(ihid_of->reset_gpio);
 
-	ihid_of->supplies[0].supply = "vdd";
-	ihid_of->supplies[1].supply = "vddl";
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ihid_of->supplies),
-				      ihid_of->supplies);
+	ihid_of->num_supplies = chip_data->num_supplies;
+	for (i = 0; i < ihid_of->num_supplies; i++)
+		ihid_of->supplies[i].supply = chip_data->supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ihid_of->num_supplies, ihid_of->supplies);
 	if (ret)
 		return ret;
 
-- 
2.39.1

