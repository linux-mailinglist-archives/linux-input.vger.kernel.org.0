Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE1B370B09
	for <lists+linux-input@lfdr.de>; Sun,  2 May 2021 12:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhEBKKx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 06:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24200 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230373AbhEBKKw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 2 May 2021 06:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619950201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tlLUsklXPtVH3UyGV6LcQ+0htPTXCL0NhzahVgnZ+o4=;
        b=WGfeyBqyPUmkVp+CIUHrZJR0ctpuLrn2Ty7s6k+32V2kBfkhfF1CqSxC2GZNd0nW1SvpWo
        wnWcNm6OGTCMqYFDrGc0CkVmrxOrcV+kSr05u8Kk48MKP/dRKp1L2BX/yE8kxl2McXd94u
        pOcENLUPccJB3FQ04Kn/XhyHRWxFTS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-K-_vtX7TNv6pqazK51s6VQ-1; Sun, 02 May 2021 06:09:59 -0400
X-MC-Unique: K-_vtX7TNv6pqazK51s6VQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C01410066E6;
        Sun,  2 May 2021 10:09:58 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-34.ams2.redhat.com [10.36.112.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8BC8E19D7C;
        Sun,  2 May 2021 10:09:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC 3/4] Input: goodix - platform/x86: touchscreen_dmi - Move inverted-x quirk to touchscreen_dmi.c
Date:   Sun,  2 May 2021 12:09:48 +0200
Message-Id: <20210502100949.5371-4-hdegoede@redhat.com>
In-Reply-To: <20210502100949.5371-1-hdegoede@redhat.com>
References: <20210502100949.5371-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move the DMI quirk for the Goodix touchscreen with inverted X coordinates
found on the Cube I15-TC tablet from drivers/input/touchscreen/goodix.c to
drivers/platform/x86/touchscreen_dmi.c, where all the other x86
touchscreen quirks live.

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
index bb47cea8d297..60876d8962b6 100644
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
+	.acpi_hid	= "GDIX1001",
+	.properties	= cube_iwork10_ultimate_i15_tc_props,
+};
+
+
 static const struct property_entry cube_knote_i1101_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
 	PROPERTY_ENTRY_U32("touchscreen-min-y",  22),
@@ -992,6 +1003,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
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

