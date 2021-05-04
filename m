Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46ADD373014
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 20:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhEDS6x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 14:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22532 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231339AbhEDS6x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 May 2021 14:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620154677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7gxLqVOrmYAn0pUtJtnDV+l1BrMEcg0Ptqcjga9RjCU=;
        b=R9GCo5JQ8o7ttMHFLImrHLcweq4N2B2RpBVbiLPlniv93EhKiRFNUQ99LYesTal+54nKMs
        ibrLeQCDldp0fxufW6PCS8JeRY3FEDR+IjM082FfjSqWpmnazrKcoAKEDMpyDpfAGBxMzo
        T9yOa1YvGkw6zAGYZFP9Yw7BczTO17c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Ju3qRNdkNZa7WxQeIWkHng-1; Tue, 04 May 2021 14:57:56 -0400
X-MC-Unique: Ju3qRNdkNZa7WxQeIWkHng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDD2801B19;
        Tue,  4 May 2021 18:57:54 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E347C5D6CF;
        Tue,  4 May 2021 18:57:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC v2 2/5] Input: goodix - platform/x86: touchscreen_dmi - Move inverted-x quirk to touchscreen_dmi.c
Date:   Tue,  4 May 2021 20:57:43 +0200
Message-Id: <20210504185746.175461-3-hdegoede@redhat.com>
In-Reply-To: <20210504185746.175461-1-hdegoede@redhat.com>
References: <20210504185746.175461-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move the DMI quirk for the Goodix touchscreen with inverted X coordinates
found on the Cube I15-TC tablet from drivers/input/touchscreen/goodix.c to
drivers/platform/x86/touchscreen_dmi.c, where all the other x86
touchscreen quirks live.

Cc: Arkadiy <arkan49@yandex.ru>
Cc: Sergei A. Trusov <sergei.a.trusov@ya.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c     | 22 ----------------------
 drivers/platform/x86/touchscreen_dmi.c | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index d92f6b2b6dcf..2203ad4d8e30 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -131,22 +131,6 @@ static const struct dmi_system_id nine_bytes_report[] = {
 	{}
 };
 
-/*
- * Those tablets have their x coordinate inverted
- */
-static const struct dmi_system_id inverted_x_screen[] = {
-#if defined(CONFIG_DMI) && defined(CONFIG_X86)
-	{
-		.ident = "Cube I15-TC",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Cube"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
-		},
-	},
-#endif
-	{}
-};
-
 /**
  * goodix_i2c_read - read data from a register of the i2c slave device.
  *
@@ -1048,12 +1032,6 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 			"Non-standard 9-bytes report format quirk\n");
 	}
 
-	if (dmi_check_system(inverted_x_screen)) {
-		ts->prop.invert_x = true;
-		dev_dbg(&ts->client->dev,
-			"Applying 'inverted x screen' quirk\n");
-	}
-
 	error = input_mt_init_slots(ts->input_dev, ts->max_touch_num,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index a53e176d94b9..e0ea8a1b4c6c 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -218,6 +218,17 @@ static const struct ts_dmi_data cube_iwork8_air_data = {
 	.properties	= cube_iwork8_air_props,
 };
 
+static const struct property_entry cube_iwork10_ultimate_i15_tc_props[] = {
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	{ }
+};
+
+static const struct ts_dmi_data cube_iwork10_ultimate_i15_tc_data = {
+	.acpi_name	= "GDIX1001:00",
+	.properties	= cube_iwork10_ultimate_i15_tc_props,
+};
+
+
 static const struct property_entry cube_knote_i1101_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
 	PROPERTY_ENTRY_U32("touchscreen-min-y",  22),
@@ -985,6 +996,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 		},
 	},
+	{
+		/* CUBE iWork10 Ultimate (I15-TC) */
+		.driver_data = (void *)&cube_iwork10_ultimate_i15_tc_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Cube"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "I15-TC")
+		},
+	},
 	{
 		/* Cube KNote i1101 */
 		.driver_data = (void *)&cube_knote_i1101_data,
-- 
2.31.1

