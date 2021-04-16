Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE3D36209D
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235252AbhDPNOD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35606 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240600AbhDPNOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yQ4Hhxf1k99HBMnRXN2PzEc7pNk8TxZV85xgcJZ/lvg=;
        b=I1eRMOubFf2J+MuG5AKzZmdjyIbcHXcCUxE5HD3wnxt/QAIPUvOhgdqkRiUjom4pNYjptA
        RUZ19hq5rfB8oaoaa8fjjQQiiCFG8mGIsaSZTb/oSPx7sFux+le2z46MKH1JQD9jJEyGVo
        tkEIK9ga9YjMHsg9S8T9ydy9pK2s4DY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-oPY4KSuoO7Wwol1TvFhysA-1; Fri, 16 Apr 2021 09:13:36 -0400
X-MC-Unique: oPY4KSuoO7Wwol1TvFhysA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B79C21B2C983;
        Fri, 16 Apr 2021 13:13:34 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A5F305C257;
        Fri, 16 Apr 2021 13:13:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 4/6] HID: lg-g15: Make the LED-name used by lg_g15_register_led() a parameter
Date:   Fri, 16 Apr 2021 15:13:21 +0200
Message-Id: <20210416131323.233184-5-hdegoede@redhat.com>
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
References: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the LED-name used by lg_g15_register_led() a parameter.

This is a preparation patch for adding support for the LCD menu
keys + LCD brightness control on the Logitech Z-10 speakers (with LCD)
which use the same protocol as the G15 keyboards.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index eff8c51a8dce..b76988c19f84 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -652,19 +652,10 @@ static void lg_g15_input_close(struct input_dev *dev)
 	hid_hw_close(hdev);
 }
 
-static int lg_g15_register_led(struct lg_g15_data *g15, int i)
+static int lg_g15_register_led(struct lg_g15_data *g15, int i, const char *name)
 {
-	static const char * const led_names[] = {
-		"g15::kbd_backlight",
-		"g15::lcd_backlight",
-		"g15::macro_preset1",
-		"g15::macro_preset2",
-		"g15::macro_preset3",
-		"g15::macro_record",
-	};
-
 	g15->leds[i].led = i;
-	g15->leds[i].cdev.name = led_names[i];
+	g15->leds[i].cdev.name = name;
 
 	switch (g15->model) {
 	case LG_G15:
@@ -733,6 +724,14 @@ static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *inp
 
 static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
+	static const char * const led_names[] = {
+		"g15::kbd_backlight",
+		"g15::lcd_backlight",
+		"g15::macro_preset1",
+		"g15::macro_preset2",
+		"g15::macro_preset3",
+		"g15::macro_record",
+	};
 	u8 gkeys_settings_output_report = 0;
 	u8 gkeys_settings_feature_report = 0;
 	struct hid_report_enum *rep_enum;
@@ -874,7 +873,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	/* Register LED devices */
 	for (i = 0; i < LG_G15_LED_MAX; i++) {
-		ret = lg_g15_register_led(g15, i);
+		ret = lg_g15_register_led(g15, i, led_names[i]);
 		if (ret)
 			goto error_hw_stop;
 	}
-- 
2.31.1

