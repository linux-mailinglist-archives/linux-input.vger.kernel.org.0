Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53AA36D6BD
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 13:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhD1LrE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 07:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39948 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhD1LrE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 07:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619610379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GhEXu8u/klONC1a5eOU3FMZNLPrY8MPQcEUqW6O8Y2M=;
        b=FEX7Spcfqepz80fAexuyDtHWmIrgVPO3jfe9rgoRX/GHL0xoKcbEWuVoAoOHJU8yzIzJWq
        /FGO1CeU1NAUTuz59hEnmFQmXjhXYAxWYmzK6Bl9zMJGRLUA8jnBlRl5dOd6yQKNrSlQvi
        a3AZ96DcmuapCKd91kVlYTSVir8lxEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-vX4f2-sYMhSG-UQQQarAyQ-1; Wed, 28 Apr 2021 07:46:17 -0400
X-MC-Unique: vX4f2-sYMhSG-UQQQarAyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B487189829B;
        Wed, 28 Apr 2021 11:46:16 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3D2FD5F729;
        Wed, 28 Apr 2021 11:46:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 5/7] Input: goodix - Allow specifying the config filename through a "goodix,config-name" device-property
Date:   Wed, 28 Apr 2021 13:46:06 +0200
Message-Id: <20210428114608.101795-6-hdegoede@redhat.com>
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
References: <20210428114608.101795-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The config which needs to be send to the controller on some device-models
is model-specific. Allow specifying a model-specific filename through
a device-property, rather then always using a fixed filename.

Note the "goodix,config-name" device-property used by this is
*not* documented in the
Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
device-tree bindings for now.

Not documenting these is intentional. This is done because this code has
only been tested on x86/ACPI so far, where devicetree is not used.
Instead these properties are set through a software-fwnode attached to the
device by the drivers/platform/x86/touchscreen_dmi.c code. This means that
the use of this property for now is purely a kernel-internal thing and
the name/working of the property may still be changed for now.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 10 ++++++----
 drivers/input/touchscreen/goodix.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index ce3050e45a48..14d16a2a111d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1160,6 +1160,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
 	struct goodix_ts_data *ts;
+	const char *cfg_name;
 	int error;
 
 	dev_dbg(&client->dev, "I2C Address: 0x%02x\n", client->addr);
@@ -1233,10 +1234,11 @@ static int goodix_ts_probe(struct i2c_client *client,
 
 	if (ts->load_cfg_from_disk) {
 		/* update device config */
-		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
-					      "goodix_%s_cfg.bin", ts->id);
-		if (!ts->cfg_name)
-			return -ENOMEM;
+		error = device_property_read_string(&client->dev, "goodix,config-name", &cfg_name);
+		if (!error)
+			snprintf(ts->cfg_name, sizeof(ts->cfg_name), "goodix/%s", cfg_name);
+		else
+			snprintf(ts->cfg_name, sizeof(ts->cfg_name), "goodix_%s_cfg.bin", ts->id);
 
 		error = request_firmware_nowait(THIS_MODULE, true, ts->cfg_name,
 						&client->dev, GFP_KERNEL, ts,
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index 0b88554ba2ae..b1d1bc004091 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -52,8 +52,8 @@ struct goodix_ts_data {
 	int gpio_count;
 	int gpio_int_idx;
 	char id[GOODIX_ID_MAX_LEN + 1];
+	char cfg_name[64];
 	u16 version;
-	const char *cfg_name;
 	bool reset_controller_at_probe;
 	bool load_cfg_from_disk;
 	struct completion firmware_loading_complete;
-- 
2.31.1

