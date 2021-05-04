Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 786C5373012
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 20:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbhEDS6v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 14:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28668 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231339AbhEDS6v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 May 2021 14:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620154675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6beGOHZCGGvQywYqt+HKGjpGFRdFrHDZn2QMgqGrku8=;
        b=ahuWYV779+Y3jVKVb3e+aBUgcgARsFK66KgynB1n+z13IX+IjRcfd4QqsIk47mOugZsswU
        ZEjrvZALd020oFa3SqJpZ/JGV6q+FaXlM8lCVG/cldWxd09jQsrQUZeVVaptsRYlIFRMfo
        rfrrqG+KdDySiV8Uaqjz+hxV7sGl47Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-ZcCRhW3EO4aLv-Rs8ga7wA-1; Tue, 04 May 2021 14:57:54 -0400
X-MC-Unique: ZcCRhW3EO4aLv-Rs8ga7wA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EC65107ACF9;
        Tue,  4 May 2021 18:57:52 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9AB85D6CF;
        Tue,  4 May 2021 18:57:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC v2 1/5] Input: goodix - platform/x86: touchscreen_dmi - Move upside down quirks to touchscreen_dmi.c
Date:   Tue,  4 May 2021 20:57:42 +0200
Message-Id: <20210504185746.175461-2-hdegoede@redhat.com>
In-Reply-To: <20210504185746.175461-1-hdegoede@redhat.com>
References: <20210504185746.175461-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move the DMI quirks for upside-down mounted Goodix touchscreens from
drivers/input/touchscreen/goodix.c to
drivers/platform/x86/touchscreen_dmi.c,
where all the other x86 touchscreen quirks live.

Note the touchscreen_dmi.c code attaches standard touchscreen
device-properties to an i2c-client device based on a combination of a
DMI match + a device-name match. I've verified that the: Teclast X98 Pro,
WinBook TW100 and WinBook TW700 uses an ACPI devicename of "GDIX1001:00"
based on acpidumps and/or dmesg output available on the web.

This patch was tested on a Teclast X89 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c     | 52 ------------------------
 drivers/platform/x86/touchscreen_dmi.c | 56 ++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 52 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index e743709b55f0..d92f6b2b6dcf 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -118,51 +118,6 @@ static const unsigned long goodix_irq_flags[] = {
 	IRQ_TYPE_LEVEL_HIGH,
 };
 
-/*
- * Those tablets have their coordinates origin at the bottom right
- * of the tablet, as if rotated 180 degrees
- */
-static const struct dmi_system_id rotated_screen[] = {
-#if defined(CONFIG_DMI) && defined(CONFIG_X86)
-	{
-		.ident = "Teclast X89",
-		.matches = {
-			/* tPAD is too generic, also match on bios date */
-			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
-			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
-			DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
-		},
-	},
-	{
-		.ident = "Teclast X98 Pro",
-		.matches = {
-			/*
-			 * Only match BIOS date, because the manufacturers
-			 * BIOS does not report the board name at all
-			 * (sometimes)...
-			 */
-			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
-			DMI_MATCH(DMI_BIOS_DATE, "10/28/2015"),
-		},
-	},
-	{
-		.ident = "WinBook TW100",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TW100")
-		}
-	},
-	{
-		.ident = "WinBook TW700",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TW700")
-		},
-	},
-#endif
-	{}
-};
-
 static const struct dmi_system_id nine_bytes_report[] = {
 #if defined(CONFIG_DMI) && defined(CONFIG_X86)
 	{
@@ -1086,13 +1041,6 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 				  ABS_MT_POSITION_Y, ts->prop.max_y);
 	}
 
-	if (dmi_check_system(rotated_screen)) {
-		ts->prop.invert_x = true;
-		ts->prop.invert_y = true;
-		dev_dbg(&ts->client->dev,
-			"Applying '180 degrees rotated screen' quirk\n");
-	}
-
 	if (dmi_check_system(nine_bytes_report)) {
 		ts->contact_size = 9;
 
diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 90fe4f8f3c2c..a53e176d94b9 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -273,6 +273,23 @@ static const struct ts_dmi_data estar_beauty_hd_data = {
 	.properties	= estar_beauty_hd_props,
 };
 
+/* Generic props + data for upside-down mounted GDIX1001 touchscreens */
+static const struct property_entry gdix1001_upside_down_props[] = {
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	{ }
+};
+
+static const struct ts_dmi_data gdix1001_00_upside_down_data = {
+	.acpi_name	= "GDIX1001:00",
+	.properties	= gdix1001_upside_down_props,
+};
+
+static const struct ts_dmi_data gdix1001_01_upside_down_data = {
+	.acpi_name	= "GDIX1001:01",
+	.properties	= gdix1001_upside_down_props,
+};
+
 static const struct property_entry gp_electronic_t701_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
@@ -1287,6 +1304,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "X3 Plus"),
 		},
 	},
+	{
+		/* Teclast X89 (Windows version / BIOS) */
+		.driver_data = (void *)&gdix1001_01_upside_down_data,
+		.matches = {
+			/* tPAD is too generic, also match on bios date */
+			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
+			DMI_MATCH(DMI_BOARD_NAME, "tPAD"),
+			DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
+		},
+	},
 	{
 		/* Teclast X98 Plus II */
 		.driver_data = (void *)&teclast_x98plus2_data,
@@ -1295,6 +1322,19 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "X98 Plus II"),
 		},
 	},
+	{
+		/* Teclast X98 Pro */
+		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.matches = {
+			/*
+			 * Only match BIOS date, because the manufacturers
+			 * BIOS does not report the board name at all
+			 * (sometimes)...
+			 */
+			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
+			DMI_MATCH(DMI_BIOS_DATE, "10/28/2015"),
+		},
+	},
 	{
 		/* Trekstor Primebook C11 */
 		.driver_data = (void *)&trekstor_primebook_c11_data,
@@ -1370,6 +1410,22 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
 		},
 	},
+	{
+		/* "WinBook TW100" */
+		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TW100")
+		}
+	},
+	{
+		/* WinBook TW700 */
+		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TW700")
+		},
+	},
 	{
 		/* Yours Y8W81, same case and touchscreen as Chuwi Vi8 */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.31.1

