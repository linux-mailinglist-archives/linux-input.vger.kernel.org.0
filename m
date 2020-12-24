Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875592E2775
	for <lists+linux-input@lfdr.de>; Thu, 24 Dec 2020 14:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgLXNxg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Dec 2020 08:53:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31686 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727240AbgLXNxf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Dec 2020 08:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608817926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=J+Sxrs3G2eYnhv0XzWqvkwoAd5izCxz/KQO75l+MZTg=;
        b=Thf55A+GZLJH6gHnRNT8YSyg1xTRsJHcWJ0j13UCzB61wal3nTx7aj9/DNXCFDS1SBopF+
        R10GpD4yf06Drh/ARs5aYvb2W+VtTsBQ2eO/JdoLGP7IAfIVuQwPx8lIyZ8iymhOTLA2+b
        K4GZKt3ulC+Ykq4KxZ9JTOPfujXuNC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-z0SMGDROM1KjLIE5SLNZMA-1; Thu, 24 Dec 2020 08:52:02 -0500
X-MC-Unique: z0SMGDROM1KjLIE5SLNZMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 422241005E46;
        Thu, 24 Dec 2020 13:52:01 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-165.ams2.redhat.com [10.36.112.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AF8FE5D9C6;
        Thu, 24 Dec 2020 13:51:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add swap-x-y quirk for Goodix touchscreen on Estar Beauty HD tablet
Date:   Thu, 24 Dec 2020 14:51:58 +0100
Message-Id: <20201224135158.10976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Estar Beauty HD (MID 7316R) tablet uses a Goodix touchscreen,
with the X and Y coordinates swapped compared to the LCD panel.

Add a touchscreen_dmi entry for this adding a "touchscreen-swapped-x-y"
device-property to the i2c-client instantiated for this device before
the driver binds.

This is the first entry of a Goodix touchscreen to touchscreen_dmi.c,
so far DMI quirks for Goodix touchscreen's have been added directly
to drivers/input/touchscreen/goodix.c. Currently there are 3
DMI tables in goodix.c:
1. rotated_screen[] for devices where the touchscreen is rotated
   180 degrees vs the LCD panel
2. inverted_x_screen[] for devices where the X axis is inverted
3. nine_bytes_report[] for devices which use a non standard touch
   report size

Arguably only 3. really needs to be inside the driver and the other
2 cases are better handled through the generic touchscreen DMI quirk
mechanism from touchscreen_dmi.c, which allows adding device-props to
any i2c-client. Esp. now that goodix.c is using the generic
touchscreen_properties code.

Alternative to the approach from this patch we could add a 4th
dmi_system_id table for devices with swapped-x-y axis to goodix.c,
but that seems undesirable.

Cc: Bastien Nocera <hadess@hadess.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 5783139d0a11..c4de932302d6 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -263,6 +263,16 @@ static const struct ts_dmi_data digma_citi_e200_data = {
 	.properties	= digma_citi_e200_props,
 };
 
+static const struct property_entry estar_beauty_hd_props[] = {
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	{ }
+};
+
+static const struct ts_dmi_data estar_beauty_hd_data = {
+	.acpi_name	= "GDIX1001:00",
+	.properties	= estar_beauty_hd_props,
+};
+
 static const struct property_entry gp_electronic_t701_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
@@ -942,6 +952,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 		},
 	},
+	{
+		/* Estar Beauty HD (MID 7316R) */
+		.driver_data = (void *)&estar_beauty_hd_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Estar"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
+		},
+	},
 	{
 		/* GP-electronic T701 */
 		.driver_data = (void *)&gp_electronic_t701_data,
-- 
2.28.0

