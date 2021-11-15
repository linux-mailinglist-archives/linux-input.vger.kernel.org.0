Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A990945043F
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 13:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbhKOMSf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Nov 2021 07:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbhKOMSN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Nov 2021 07:18:13 -0500
X-Greylist: delayed 382 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 15 Nov 2021 04:15:16 PST
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369DCC061570
        for <linux-input@vger.kernel.org>; Mon, 15 Nov 2021 04:15:15 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by srv6.fidu.org (Postfix) with ESMTP id 10DFDC800AB;
        Mon, 15 Nov 2021 13:08:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
        by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id 1lthgp6yzjvt; Mon, 15 Nov 2021 13:08:50 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box (host-212-18-30-247.customer.m-online.net [212.18.30.247])
        (Authenticated sender: wse@tuxedocomputers.com)
        by srv6.fidu.org (Postfix) with ESMTPA id 4C916C800A2;
        Mon, 15 Nov 2021 13:08:50 +0100 (CET)
From:   Werner Sembach <wse@tuxedocomputers.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] input/i8042: Add TUXEDO devices to i8042 quirk tables
Date:   Mon, 15 Nov 2021 13:08:50 +0100
Message-Id: <20211115120850.69768-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A lot of modern Clevo barebones have touchpad and/or keyboard issues after
suspend fixable with reset + nomux + nopnp + noloop. Luckily, none of them
have an external PS/2 port so this can safely be set for all of them.

I'm not entirely sure if every device listed really needs all four quirks,
but after testing and production use. No negative effects could be
observed when setting all four.

The list is quite massive as neither the TUXEDO nor the Clevo dmi strings
have been very consistent historically. I tried to keep the list as short
as possible without risking on missing an affected device.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>
---
 drivers/input/serio/i8042-x86ia64io.h | 1406 ++++++++++++++++++++++++-
 1 file changed, 1387 insertions(+), 19 deletions(-)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index a5a003553646..e42f8b64260c 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -226,6 +226,348 @@ static const struct dmi_system_id __initconst i8042_dmi_noloop_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "ByteSpeed Laptop C15B"),
 		},
 	},
+	/*
+	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
+	 * after suspend fixable with reset + nomux + nopnp + noloop. Luckily,
+	 * none of them have an external PS/2 port so this can savely be set for
+	 * all of them.
+	 */
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
 	{ }
 };
 
@@ -562,25 +904,367 @@ static const struct dmi_system_id __initconst i8042_dmi_nomux_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
 		},
 	},
-	{ }
-};
-
-static const struct dmi_system_id i8042_dmi_forcemux_table[] __initconst = {
+	/*
+	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
+	 * after suspend fixable with reset + nomux + nopnp + noloop. Luckily,
+	 * none of them have an external PS/2 port so this can savely be set for
+	 * all of them.
+	 */
 	{
-		/*
-		 * Sony Vaio VGN-CS series require MUX or the touch sensor
-		 * buttons will disturb touchpad operation
-		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-CS"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
 		},
 	},
-	{ }
-};
-
-/*
- * On some Asus laptops, just running self tests cause problems.
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{ }
+};
+
+static const struct dmi_system_id i8042_dmi_forcemux_table[] __initconst = {
+	{
+		/*
+		 * Sony Vaio VGN-CS series require MUX or the touch sensor
+		 * buttons will disturb touchpad operation
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-CS"),
+		},
+	},
+	{ }
+};
+
+/*
+ * On some Asus laptops, just running self tests cause problems.
  */
 static const struct dmi_system_id i8042_dmi_noselftest_table[] = {
 	{
@@ -745,10 +1429,352 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
 		},
 	},
-	{ }
-};
-
-#ifdef CONFIG_PNP
+	/*
+	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
+	 * after suspend fixable with reset + nomux + nopnp + noloop. Luckily,
+	 * none of them have an external PS/2 port so this can savely be set for
+	 * all of them.
+	 */
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{ }
+};
+
+#ifdef CONFIG_PNP
 static const struct dmi_system_id __initconst i8042_dmi_nopnp_table[] = {
 	{
 		/* Intel MBO Desktop D845PESV */
@@ -781,6 +1807,348 @@ static const struct dmi_system_id __initconst i8042_dmi_nopnp_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "PK"),
 		},
 	},
+	/*
+	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
+	 * after suspend fixable with reset + nomux + nopnp + noloop. Luckily,
+	 * none of them have an external PS/2 port so this can savely be set for
+	 * all of them.
+	 */
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
+		},
+	},
 	{ }
 };
 
-- 
2.25.1

