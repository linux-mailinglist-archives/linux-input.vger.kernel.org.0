Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB21A31DE65
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbhBQRgH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28942 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234478AbhBQRd7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5VLHujtLzR88HOeM8BSi0d3rQM8u5L0kcBDkFTPR1N4=;
        b=d9nK5netlW6J4NUrMClhpV+QMCRXuR/RFRPdEKTgJxQvneq/xiXHC53AxJtNpWBOTZ0UYN
        EetOuDr3C1HMOiz5ZcB8oicmxGff567aoPiblUwwRylP0KFK/oW2g45UXtDYRb7DX1MqBD
        1pJ447cDZx0j2xrkkPQB/6yS0CbQEqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-PZM0Dt9WOeSjZO8zuYAnBQ-1; Wed, 17 Feb 2021 12:32:29 -0500
X-MC-Unique: PZM0Dt9WOeSjZO8zuYAnBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5DAA1020C22;
        Wed, 17 Feb 2021 17:32:27 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4305960C61;
        Wed, 17 Feb 2021 17:32:25 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 09/11] HID: playstation: add initial DualSense lightbar support.
Date:   Wed, 17 Feb 2021 18:31:56 +0100
Message-Id: <20210217173158.3122868-10-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Provide initial support for the DualSense lightbar and configure it
with a default PlayStation blue color.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
Reviewed-by: Barnabás Pőcze <pobrn@protonmail.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 65 +++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f279064e74a5..b141b1be6453 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -103,6 +103,10 @@ struct ps_calibration_data {
 /* Flags for DualSense output report. */
 #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
 #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
+#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
+#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
+#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
+#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
 
 /* DualSense hardware limits */
 #define DS_ACC_RES_PER_G	8192
@@ -132,6 +136,12 @@ struct dualsense {
 	uint8_t motor_left;
 	uint8_t motor_right;
 
+	/* RGB lightbar */
+	bool update_lightbar;
+	uint8_t lightbar_red;
+	uint8_t lightbar_green;
+	uint8_t lightbar_blue;
+
 	struct work_struct output_worker;
 	void *output_report_dmabuf;
 	uint8_t output_seq; /* Sequence number for output report. */
@@ -796,6 +806,15 @@ static void dualsense_output_worker(struct work_struct *work)
 		ds->update_rumble = false;
 	}
 
+	if (ds->update_lightbar) {
+		common->valid_flag1 |= DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE;
+		common->lightbar_red = ds->lightbar_red;
+		common->lightbar_green = ds->lightbar_green;
+		common->lightbar_blue = ds->lightbar_blue;
+
+		ds->update_lightbar = false;
+	}
+
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
 	dualsense_send_output_report(ds, &report);
@@ -980,6 +999,41 @@ static int dualsense_play_effect(struct input_dev *dev, void *data, struct ff_ef
 	return 0;
 }
 
+static int dualsense_reset_leds(struct dualsense *ds)
+{
+	struct dualsense_output_report report;
+	uint8_t *buf;
+
+	buf = kzalloc(sizeof(struct dualsense_output_report_bt), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	dualsense_init_output_report(ds, &report, buf);
+	/*
+	 * On Bluetooth the DualSense outputs an animation on the lightbar
+	 * during startup and maintains a color afterwards. We need to explicitly
+	 * reconfigure the lightbar before we can do any programming later on.
+	 * In USB the lightbar is not on by default, but redoing the setup there
+	 * doesn't hurt.
+	 */
+	report.common->valid_flag2 = DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE;
+	report.common->lightbar_setup = DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT; /* Fade light out. */
+	dualsense_send_output_report(ds, &report);
+
+	kfree(buf);
+	return 0;
+}
+
+static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, uint8_t green, uint8_t blue)
+{
+	ds->update_lightbar = true;
+	ds->lightbar_red = red;
+	ds->lightbar_green = green;
+	ds->lightbar_blue = blue;
+
+	schedule_work(&ds->output_worker);
+}
+
 static struct ps_device *dualsense_create(struct hid_device *hdev)
 {
 	struct dualsense *ds;
@@ -1057,6 +1111,17 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	if (ret)
 		goto err;
 
+	/*
+	 * The hardware may have control over the LEDs (e.g. in Bluetooth on startup).
+	 * Reset the LEDs (lightbar, mute, player leds), so we can control them
+	 * from software.
+	 */
+	ret = dualsense_reset_leds(ds);
+	if (ret)
+		goto err;
+
+	dualsense_set_lightbar(ds, 0, 0, 128); /* blue */
+
 	/*
 	 * Reporting hardware and firmware is important as there are frequent updates, which
 	 * can change behavior.
-- 
2.29.2

