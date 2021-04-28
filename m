Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5869E36D6BF
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 13:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhD1LrJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 07:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51064 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhD1LrJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 07:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619610384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=613dTng5KI2ARGE0Ebx7rE0HZxI4JfLbP+xUdQOCS5Y=;
        b=geRgeH9SP+MURpmoczdbc5reAmTaOexR1hziSC8o7JkA8WmbvBz+RL6MlLi9Zurq+m5AhQ
        2rd3wGcWhHpXCAQY/ry8fb+y4mJmjiASrE3BNOg710bHh827JFN+WYK52fVZYqp7ujW0Dz
        fgWU7EuP2RpAxYsjAz/8QT8eKkb2P34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-ohuTYiWPNF-uUu36I1nxgg-1; Wed, 28 Apr 2021 07:46:21 -0400
X-MC-Unique: ohuTYiWPNF-uUu36I1nxgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17B5F804030;
        Wed, 28 Apr 2021 11:46:19 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D6AEC2C6FB;
        Wed, 28 Apr 2021 11:46:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 7/7] platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of TM800A550L tablets
Date:   Wed, 28 Apr 2021 13:46:08 +0200
Message-Id: <20210428114608.101795-8-hdegoede@redhat.com>
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
References: <20210428114608.101795-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Bay Trail Glavey TM800A550L tablet, which ships with Android installed
from the factory, uses a GT912 touchscreen controller which needs to have
its firmware uploaded by the OS to work (this is a first for a x86 based
device with a Goodix touchscreen controller).

Add a touchscreen_dmi entry for this which specifies the filenames
to use for the firmware and config files needed for this.

Note this matches on a GDIX1001 ACPI HID, while the original DSDT uses
a HID of GODX0911. For the touchscreen to work on these devices a DSDT
override is necessary to fix a missing IRQ and broken GPIO settings in
the ACPI-resources for the touchscreen. This override also changes the
HID to the standard GDIX1001 id typically used for Goodix touchscreens.
The DSDT override is available here:
https://fedorapeople.org/~jwrdegoede/glavey-tm800a550l-dsdt-override/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 90fe4f8f3c2c..d95f04b61111 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -273,6 +273,18 @@ static const struct ts_dmi_data estar_beauty_hd_data = {
 	.properties	= estar_beauty_hd_props,
 };
 
+static const struct property_entry glavey_tm800a550l_props[] = {
+	PROPERTY_ENTRY_STRING("firmware-name", "gt912-glavey-tm800a550l.fw"),
+	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-glavey-tm800a550l.cfg"),
+	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
+	{ }
+};
+
+static const struct ts_dmi_data glavey_tm800a550l_data = {
+	.acpi_name	= "GDIX1001:00",
+	.properties	= glavey_tm800a550l_props,
+};
+
 static const struct property_entry gp_electronic_t701_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
@@ -1003,6 +1015,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
 		},
 	},
+	{	/* Glavey TM800A550L */
+		.driver_data = (void *)&glavey_tm800a550l_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
+		},
+	},
 	{
 		/* GP-electronic T701 */
 		.driver_data = (void *)&gp_electronic_t701_data,
-- 
2.31.1

