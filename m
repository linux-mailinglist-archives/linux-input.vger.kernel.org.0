Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494C84117CE
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 17:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbhITPIW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 11:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49110 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241077AbhITPIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 11:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632150415;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=54Fo9hGYsBde6kBnTtsehhflzJcqA/qYo6flvgrgihk=;
        b=b8ekvxufdRZtWGYDN1aFr50M/sXYMlxGGWncHUHMV+L//+KA0701l8jA/GNVpxl20EaVQ9
        RqJels3I3y72smkcaNMSHE2xc5yEZiHXv1OsIXA6nCV0ANlrM3zCiXynVOHRy6jcZ2HLlK
        cKs1vLZ1OazlDFt1tLdUIf3H9Hj2E9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-Rp1IfikOOzWMqmvsw4_Q2w-1; Mon, 20 Sep 2021 11:06:53 -0400
X-MC-Unique: Rp1IfikOOzWMqmvsw4_Q2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D86F19253C0;
        Mon, 20 Sep 2021 15:06:53 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C45AF5F706;
        Mon, 20 Sep 2021 15:06:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 5/6] Input: goodix - Allow specifying the config filename through a "goodix,config-name" device-property
Date:   Mon, 20 Sep 2021 17:06:42 +0200
Message-Id: <20210920150643.155872-6-hdegoede@redhat.com>
In-Reply-To: <20210920150643.155872-1-hdegoede@redhat.com>
References: <20210920150643.155872-1-hdegoede@redhat.com>
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

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 10 ++++++----
 drivers/input/touchscreen/goodix.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 2205ebb9325e..1447a9858627 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1108,6 +1108,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
 	struct goodix_ts_data *ts;
+	const char *cfg_name;
 	int error;
 
 	dev_dbg(&client->dev, "I2C Address: 0x%02x\n", client->addr);
@@ -1181,10 +1182,11 @@ static int goodix_ts_probe(struct i2c_client *client,
 
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

