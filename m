Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D428228A1E
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 21:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732150AbfEWTJ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 15:09:26 -0400
Received: from knopi.disroot.org ([178.21.23.139]:34132 "EHLO
        knopi.disroot.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732155AbfEWTJZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 15:09:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by disroot.org (Postfix) with ESMTP id C442E31D55;
        Thu, 23 May 2019 21:09:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
        by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vmu_h8mAoYUm; Thu, 23 May 2019 21:09:22 +0200 (CEST)
From:   Daniel Smith <danct12@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
        t=1558638562; bh=4X7RiEUOO10b4AmFFhEJd+iNhQIpQPnLIH8kZbBd5OQ=;
        h=From:To:Cc:Subject:Date;
        b=U2btwKbcAOtKJ1vrs8k9LTweuOG1B9lm1loE60rPNHcHTAvnuM7TLnIwXDSToZi7k
         Qq9iG6Zd0mNcArqRS6coOZNaI5r24bsq6P8oUm/TzccOYwauypxogPmA+g/1ReqdzP
         AZAlnLuCE9aHgWzgtbAuMru5H5tCeowJ9/BD4UczCIh7SVBZzEXXIcnhunstZo8hAi
         RrcHax7aFvoUzQ+DTs4ot2MNM+DMZm3wUsuf1S1fPa/SozPc8+tN4fVYUXT3s4tK53
         htU88HRPDpu9oYc56mb1812+y3cNwUsBv26F0gRV1WGauZZztkON2fcSM/0d1ysN39
         Q97hg3GOo3JbQ==
Cc:     Daniel Smith <danct12@disroot.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the CHUWI Hi10 Plus tablet.
Date:   Fri, 24 May 2019 02:09:13 +0700
Message-Id: <20190523190913.5801-1-danct12@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Added touch screen info for CHUWI Hi10 Plus tablet.

Signed-off-by: Daniel Smith <danct12@disroot.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index bd0856d2e825..1dbb53c3f1e7 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -91,6 +91,22 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
 	.properties	= chuwi_hi10_air_props,
 };
 
+static const struct property_entry chuwi_hi10_plus_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 0),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1914),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1283),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10plus.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_hi10_plus_data = {
+	.acpi_name      = "MSSL0017:00",
+	.properties     = chuwi_hi10_plus_props,
+};
+
 static const struct property_entry chuwi_vi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
@@ -605,6 +621,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
 		},
 	},
+	{
+		/* Chuwi Hi10 Plus (CWI527) */
+		.driver_data = (void *)&chuwi_hi10_plus_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 plus tablet"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+		},
+	},
 	{
 		/* Chuwi Vi8 (CWI506) */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.21.0

