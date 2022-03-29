Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89FC24EAF35
	for <lists+linux-input@lfdr.de>; Tue, 29 Mar 2022 16:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbiC2O3P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Mar 2022 10:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235564AbiC2O3N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Mar 2022 10:29:13 -0400
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BFB6FA1E;
        Tue, 29 Mar 2022 07:27:25 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by srv6.fidu.org (Postfix) with ESMTP id AB123C800A4;
        Tue, 29 Mar 2022 16:27:23 +0200 (CEST)
Authentication-Results: srv6.fidu.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=tuxedocomputers.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        tuxedocomputers.com; h=content-transfer-encoding:mime-version
        :x-mailer:message-id:date:date:subject:subject:from:from; s=
        default; t=1648564042; x=1650378443; bh=KJh3mcGFHaG83v6g+X/u1bdg
        lWPoxa5mCKgpxTFvETU=; b=rVbgDbdcRMuGUvenCCv96PGRgs3DWGkHX6Gi+nA1
        OjSGQD67p4Nqm9fCwAUUhnF0s+2Q3JHwmx2mJRLjoa/9tj3nVVHVMsjPctSf8NcX
        vrR7y5pmaCWUnZ36NOER47UH9xDBbXxE7x8O7oYks1Px5Kiw0Bq64LS3mAfKEJW4
        njQ=
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
        by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id McDIeHkUnPcs; Tue, 29 Mar 2022 16:27:22 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box (host-212-18-30-247.customer.m-online.net [212.18.30.247])
        (Authenticated sender: wse@tuxedocomputers.com)
        by srv6.fidu.org (Postfix) with ESMTPA id 466F2C800A2;
        Tue, 29 Mar 2022 16:27:22 +0200 (CEST)
From:   Werner Sembach <wse@tuxedocomputers.com>
To:     dmitry.torokhov@gmail.com, tiwai@suse.de, mpdesouza@suse.com,
        arnd@arndb.de, hdegoede@redhat.com, samuel@cavoj.net,
        wse@tuxedocomputers.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] input/i8042: Merge quirk tables
Date:   Tue, 29 Mar 2022 16:27:16 +0200
Message-Id: <20220329142718.30921-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Merge i8042 quirk tables to reduce code duplication for devices that need
more than one quirk. Before every quirk had its own table with devices
needing that quirk. If a new quirk needed to be added a new table had to
be created. When a device needed multiple quirks, it appeared in multiple
tables. Now only one table called i8042_dmi_quirk_table exists. In it every
device has one entry and required quirks are coded in the .driver_data
field of the struct dmi_system_id used by this table. Multiple quirks for
one device can be applied by bitwise-or of the new SERIO_QUIRK_* defines.

Also align quirkable options with command line parameters and make vendor
wide quirks per device overwriteable on a per device basis. The first match
is honored while following matches are ignored. So when a vendor wide quirk
is defined in the table, a device can inserted before and therefore
ignoring the vendor wide define.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/input/serio/i8042-x86ia64io.h | 1100 +++++++++++++------------
 1 file changed, 595 insertions(+), 505 deletions(-)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 91c6f24b4837..1d2b34aac0c7 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -67,654 +67,735 @@ static inline void i8042_write_command(int val)
 
 #include <linux/dmi.h>
 
-static const struct dmi_system_id __initconst i8042_dmi_noloop_table[] = {
+#define SERIO_QUIRK_NOKBD		BIT(0)
+#define SERIO_QUIRK_NOAUX		BIT(1)
+#define SERIO_QUIRK_NOMUX		BIT(2)
+#define SERIO_QUIRK_FORCEMUX		BIT(3)
+#define SERIO_QUIRK_UNLOCK		BIT(4)
+#define SERIO_QUIRK_PROBE_DEFER		BIT(5)
+#define SERIO_QUIRK_RESET_ALWAYS	BIT(6)
+#define SERIO_QUIRK_RESET_NEVER		BIT(7)
+#define SERIO_QUIRK_DIECT		BIT(8)
+#define SERIO_QUIRK_DUMBKBD		BIT(9)
+#define SERIO_QUIRK_NOLOOP		BIT(10)
+#define SERIO_QUIRK_NOTIMEOUT		BIT(11)
+#define SERIO_QUIRK_KBDRESET		BIT(12)
+#define SERIO_QUIRK_DRITEK		BIT(13)
+#define SERIO_QUIRK_NOPNP		BIT(14)
+
+/* Quirk table for different mainboards. Options similar or identical to i8042
+ * module parameters.
+ * ORDERING IS IMPORTANT! The first match will be apllied and the rest ignored.
+ * This allows entries to overwrite vendor wide quirks on a per device basis.
+ * Where this is irrelevant, entries are sorted case sensitive by DMI_SYS_VENDOR
+ * and/or DMI_BOARD_VENDOR to make it easier to avoid dublicate entries.
+ */
+static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 	{
-		/*
-		 * Arima-Rioworks HDAMB -
-		 * AUX LOOP command does not raise AUX IRQ
-		 */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "RIOWORKS"),
-			DMI_MATCH(DMI_BOARD_NAME, "HDAMB"),
-			DMI_MATCH(DMI_BOARD_VERSION, "Rev E"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ALIENWARE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Sentia"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* ASUS G1S */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer Inc."),
-			DMI_MATCH(DMI_BOARD_NAME, "G1S"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X750LN"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* ASUS P65UP5 - AUX LOOP command does not raise AUX IRQ */
+		/* Asus X450LCP */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
-			DMI_MATCH(DMI_BOARD_NAME, "P/I-P65UP5"),
-			DMI_MATCH(DMI_BOARD_VERSION, "REV 2.X"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X450LCP"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_NEVER)
 	},
 	{
+		/* ASUS ZenBook UX425UA */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "X750LN"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_PROBE_DEFER | SERIO_QUIRK_RESET_NEVER)
 	},
 	{
+		/* ASUS ZenBook UM325UA */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Compaq"),
-			DMI_MATCH(DMI_PRODUCT_NAME , "ProLiant"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "8500"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UA_UM325UA"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_PROBE_DEFER | SERIO_QUIRK_RESET_NEVER)
 	},
+	/*
+	 * On some Asus laptops, just running self tests cause problems.
+	 */
 	{
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Compaq"),
-			DMI_MATCH(DMI_PRODUCT_NAME , "ProLiant"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "DL760"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_NEVER)
 	},
 	{
-		/* Dell Embedded Box PC 3000 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Embedded Box PC 3000"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible Notebook */
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_NEVER)
 	},
 	{
-		/* OQO Model 01 */
+		/* ASUS P65UP5 - AUX LOOP command does not raise AUX IRQ */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "OQO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ZEPTO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "00"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "P/I-P65UP5"),
+			DMI_MATCH(DMI_BOARD_VERSION, "REV 2.X"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* ULI EV4873 - AUX LOOP does not work properly */
+		/* ASUS G1S */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ULI"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "EV4873"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "5a"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK Computer Inc."),
+			DMI_MATCH(DMI_BOARD_NAME, "G1S"),
+			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Microsoft Virtual Machine */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Virtual Machine"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "VS2005R2"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 1360"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Medion MAM 2070 */
+		/* Acer Aspire 5710 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "MAM 2070"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "5a"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5710"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Medion Akoya E7225 */
+		/* Acer Aspire 7738 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Medion"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Akoya E7225"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 7738"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Blue FB5601 */
+		/* Acer Aspire 5536 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "blue"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "FB5601"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "M606"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5536"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "0100"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Gigabyte M912 */
+		/*
+		 * Acer Aspire 5738z
+		 * Touchpad stops working in mux mode when dis- + re-enabled
+		 * with the touchpad enable/disable toggle hotkey
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "M912"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "01"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5738"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Gigabyte M1022M netbook */
+		/* Acer Aspire One 150 */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co.,Ltd."),
-			DMI_MATCH(DMI_BOARD_NAME, "M1022E"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.02"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/* Gigabyte Spring Peak - defines wrong chassis type */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Spring Peak"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A114-31"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/* Gigabyte T1005 - defines wrong chassis type ("Other") */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "T1005"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A314-31"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/* Gigabyte T1005M/P - defines wrong chassis type ("Other") */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "T1005M/P"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-31"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion dv9700"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Rev 1"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-132"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "PEGATRON CORPORATION"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "C15B"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-332"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ByteSpeed LLC"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ByteSpeed Laptop C15B"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-432"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
-	{ }
-};
-
-/*
- * Some Fujitsu notebooks are having trouble with touchpads if
- * active multiplexing mode is activated. Luckily they don't have
- * external PS/2 ports so we can safely disable it.
- * ... apparently some Toshibas don't like MUX mode either and
- * die horrible death on reboot.
- */
-static const struct dmi_system_id __initconst i8042_dmi_nomux_table[] = {
 	{
-		/* Fujitsu Lifebook P7010/P7010D */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "P7010"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate Spin B118-RN"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
+	/*
+	 * Some Wistron based laptops need us to explicitly enable the 'Dritek
+	 * keyboard extension' to make their extra keys start generating scancodes.
+	 * Originally, this was just confined to older laptops, but a few Acer laptops
+	 * have turned up in 2007 that also need this again.
+	 */
 	{
-		/* Fujitsu Lifebook P7010 */
+		/* Acer Aspire 5100 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "0000000000"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5100"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu Lifebook P5020D */
+		/* Acer Aspire 5610 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook P Series"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5610"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu Lifebook S2000 */
+		/* Acer Aspire 5630 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook S Series"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5630"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu Lifebook S6230 */
+		/* Acer Aspire 5650 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook S6230"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5650"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu Lifebook T725 laptop */
+		/* Acer Aspire 5680 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T725"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5680"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu Lifebook U745 */
+		/* Acer Aspire 5720 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK U745"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5720"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu T70H */
+		/* Acer Aspire 9110 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "FMVLT70H"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 9110"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu-Siemens Lifebook T3010 */
+		/* Acer TravelMate 660 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T3010"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 660"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu-Siemens Lifebook E4010 */
+		/* Acer TravelMate 2490 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK E4010"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 2490"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu-Siemens Amilo Pro 2010 */
+		/* Acer TravelMate 4280 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "AMILO Pro V2010"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4280"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_DRITEK)
 	},
 	{
-		/* Fujitsu-Siemens Amilo Pro 2030 */
+		/* Amoi M636/A737 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "AMILO PRO V2030"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Amoi Electronics CO.,LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M636/A737 platform"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/*
-		 * No data is coming from the touchscreen unless KBC
-		 * is in legacy mode.
-		 */
-		/* Panasonic CF-29 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Matsushita"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CF-29"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ByteSpeed LLC"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ByteSpeed Laptop C15B"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/*
-		 * HP Pavilion DV4017EA -
-		 * errors on MUX ports are reported without raising AUXDATA
-		 * causing "spurious NAK" messages.
-		 */
+		/* Compal HEL80I */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Pavilion dv4000 (EA032EA#ABF)"),
+			DMI_MATCH(DMI_SYS_VENDOR, "COMPAL"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HEL80I"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/*
-		 * HP Pavilion ZT1000 -
-		 * like DV4017EA does not raise AUXERR for errors on MUX ports.
-		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion Notebook PC"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "HP Pavilion Notebook ZT1000"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Compaq"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "8500"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/*
-		 * HP Pavilion DV4270ca -
-		 * like DV4017EA does not raise AUXERR for errors on MUX ports.
-		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Pavilion dv4000 (EH476UA#ABL)"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Compaq"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "DL760"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
+		/* Advent 4211 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite P10"),
+			DMI_MATCH(DMI_SYS_VENDOR, "DIXONSXP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Advent 4211"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
+		/* Dell Embedded Box PC 3000 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "EQUIUM A110"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Embedded Box PC 3000"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
+		/* Dell XPS M1530 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "SATELLITE C850D"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "XPS M1530"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/* Dell Vostro 1510 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ALIENWARE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Sentia"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro1510"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Sharp Actius MM20 */
+		/* Dell Vostro V13 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "SHARP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "PC-MM20 Series"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V13"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Sony Vaio FS-115b */
+		/* Dell Vostro 1320 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-FS115B"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 1320"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/*
-		 * Sony Vaio FZ-240E -
-		 * reset and GET ID commands issued via KBD port are
-		 * sometimes being delivered to AUX3.
-		 */
+		/* Dell Vostro 1520 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-FZ240E"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 1520"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/*
-		 * Most (all?) VAIOs do not have external PS/2 ports nor
-		 * they implement active multiplexing properly, and
-		 * MUX discovery usually messes up keyboard/touchpad.
-		 */
+		/* Dell Vostro 1720 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-			DMI_MATCH(DMI_BOARD_NAME, "VAIO"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 1720"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/* Amoi M636/A737 */
+		/* Entroware Proteus */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Amoi Electronics CO.,LTD."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "M636/A737 platform"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS)
 	},
+	/*
+	 * Some Fujitsu notebooks are having trouble with touchpads if
+	 * active multiplexing mode is activated. Luckily they don't have
+	 * external PS/2 ports so we can safely disable it.
+	 * ... apparently some Toshibas don't like MUX mode either and
+	 * die horrible death on reboot.
+	 */
 	{
-		/* Lenovo 3000 n100 */
+		/* Fujitsu Lifebook P7010/P7010D */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "076804U"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P7010"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Lenovo XiaoXin Air 12 */
+		/* Fujitsu Lifebook P5020D */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "80UN"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook P Series"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/* Fujitsu Lifebook S2000 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 1360"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook S Series"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer Aspire 5710 */
+		/* Fujitsu Lifebook S6230 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5710"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook S6230"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer Aspire 7738 */
+		/* Fujitsu Lifebook T725 laptop */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 7738"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T725"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Gericom Bellagio */
+		/* Fujitsu Lifebook U745 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Gericom"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "N34AS6"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK U745"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* IBM 2656 */
+		/* Fujitsu T70H */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "IBM"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "2656"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FMVLT70H"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Dell XPS M1530 */
+		/* Fujitsu A544 laptop */
+		/* https://bugzilla.redhat.com/show_bug.cgi?id=1111138 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "XPS M1530"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK A544"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Compal HEL80I */
+		/* Fujitsu AH544 laptop */
+		/* https://bugzilla.kernel.org/show_bug.cgi?id=69731 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "COMPAL"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HEL80I"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK AH544"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Dell Vostro 1510 */
+		/* Fujitsu U574 laptop */
+		/* https://bugzilla.kernel.org/show_bug.cgi?id=69731 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro1510"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK U574"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Acer Aspire 5536 */
+		/* Fujitsu UH554 laptop */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5536"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "0100"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK UH544"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Dell Vostro V13 */
+		/* Fujitsu Lifebook P7010 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V13"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0000000000"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Newer HP Pavilion dv4 models */
+		/* Fujitsu-Siemens Lifebook T3010 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion dv4 Notebook PC"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T3010"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Asus X450LCP */
+		/* Fujitsu-Siemens Lifebook E4010 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "X450LCP"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK E4010"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Avatar AVIU-145A6 */
+		/* Fujitsu-Siemens Amilo Pro 2010 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "IC4I"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "AMILO Pro V2010"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* TUXEDO BU1406 */
+		/* Fujitsu-Siemens Amilo Pro 2030 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "N24_25BU"),
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "AMILO PRO V2030"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Lenovo LaVie Z */
+		/* Gigabyte M912 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo LaVie Z"),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M912"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "01"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/*
-		 * Acer Aspire 5738z
-		 * Touchpad stops working in mux mode when dis- + re-enabled
-		 * with the touchpad enable/disable toggle hotkey
-		 */
+		/* Gigabyte Spring Peak - defines wrong chassis type */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5738"),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Spring Peak"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Entroware Proteus */
+		/* Gigabyte T1005 - defines wrong chassis type ("Other") */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T1005"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
-	{ }
-};
-
-static const struct dmi_system_id i8042_dmi_forcemux_table[] __initconst = {
 	{
-		/*
-		 * Sony Vaio VGN-CS series require MUX or the touch sensor
-		 * buttons will disturb touchpad operation
-		 */
+		/* Gigabyte T1005M/P - defines wrong chassis type ("Other") */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-CS"),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T1005M/P"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
-	{ }
-};
-
-/*
- * On some Asus laptops, just running self tests cause problems.
- */
-static const struct dmi_system_id i8042_dmi_noselftest_table[] = {
+	/*
+	 * Some laptops need keyboard reset before probing for the trackpad to get
+	 * it detected, initialised & finally work.
+	 */
 	{
+		/* Gigabyte P35 v2 - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
-		},
-	}, {
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible Notebook */
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P35V2"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_KBDRESET)
 	},
-	{ }
-};
-static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
-	{
-		/* MSI Wind U-100 */
+		{
+		/* Aorus branded Gigabyte X3 Plus - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "U-100"),
-			DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., LTD"),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X3"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_KBDRESET)
 	},
 	{
-		/* LG Electronics X110 */
+		/* Gigabyte P34 - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "X110"),
-			DMI_MATCH(DMI_BOARD_VENDOR, "LG Electronics Inc."),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P34"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_KBDRESET)
 	},
 	{
-		/* Acer Aspire One 150 */
+		/* Gigabyte P57 - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "AOA150"),
+			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P57"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_KBDRESET)
 	},
 	{
+		/* Gericom Bellagio */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A114-31"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Gericom"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N34AS6"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/* Gigabyte M1022M netbook */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A314-31"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "Gigabyte Technology Co.,Ltd."),
+			DMI_MATCH(DMI_BOARD_NAME, "M1022E"),
+			DMI_MATCH(DMI_BOARD_VERSION, "1.02"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-31"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion dv9700"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Rev 1"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
+		/*
+		 * HP Pavilion DV4017EA -
+		 * errors on MUX ports are reported without raising AUXDATA
+		 * causing "spurious NAK" messages.
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-132"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Pavilion dv4000 (EA032EA#ABF)"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/*
+		 * HP Pavilion ZT1000 -
+		 * like DV4017EA does not raise AUXERR for errors on MUX ports.
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-332"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion Notebook PC"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "HP Pavilion Notebook ZT1000"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/*
+		 * HP Pavilion DV4270ca -
+		 * like DV4017EA does not raise AUXERR for errors on MUX ports.
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire ES1-432"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Pavilion dv4000 (EH476UA#ABL)"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/* Newer HP Pavilion dv4 models */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate Spin B118-RN"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion dv4 Notebook PC"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_NOTIMEOUT)
 	},
 	{
-		/* Advent 4211 */
+		/* IBM 2656 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "DIXONSXP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Advent 4211"),
+			DMI_MATCH(DMI_SYS_VENDOR, "IBM"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "2656"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Medion Akoya Mini E1210 */
+		/* Avatar AVIU-145A6 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "MEDION"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "E1210"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "IC4I"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Medion Akoya E1222 */
+		/* Intel MBO Desktop D845PESV */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "MEDION"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "E122X"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "D845PESV"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOPNP)
 	},
 	{
-		/* Mivvy M310 */
+		/*
+		 * Intel NUC D54250WYK - does not have i8042 controller but
+		 * declares PS/2 devices in DSDT.
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "VIOOO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "N10"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "D54250WYK"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOPNP)
 	},
 	{
-		/* Dell Vostro 1320 */
+		/* Lenovo 3000 n100 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 1320"),
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "076804U"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Dell Vostro 1520 */
+		/* Lenovo XiaoXin Air 12 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 1520"),
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "80UN"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Dell Vostro 1720 */
+		/* Lenovo LaVie Z */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 1720"),
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo LaVie Z"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
 		/* Lenovo Ideapad U455 */
@@ -722,6 +803,7 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "20046"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
 		/* Lenovo ThinkPad L460 */
@@ -729,13 +811,7 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad L460"),
 		},
-	},
-	{
-		/* Clevo P650RS, 650RP6, Sager NP8152-S, and others */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "P65xRP"),
-		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
 		/* Lenovo ThinkPad Twist S230u */
@@ -743,275 +819,269 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "33474HU"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/* Entroware Proteus */
+		/* LG Electronics X110 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "LG Electronics Inc."),
+			DMI_MATCH(DMI_BOARD_NAME, "X110"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
-	{ }
-};
-
-#ifdef CONFIG_PNP
-static const struct dmi_system_id __initconst i8042_dmi_nopnp_table[] = {
 	{
-		/* Intel MBO Desktop D845PESV */
+		/* Medion Akoya Mini E1210 */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "D845PESV"),
-			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_SYS_VENDOR, "MEDION"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "E1210"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/*
-		 * Intel NUC D54250WYK - does not have i8042 controller but
-		 * declares PS/2 devices in DSDT.
-		 */
+		/* Medion Akoya E1222 */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "D54250WYK"),
-			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_SYS_VENDOR, "MEDION"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "E122X"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
 		/* MSI Wind U-100 */
 		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "U-100"),
-			DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., LTD"),
-		},
-	},
-	{
-		/* Acer Aspire 5 A515 */
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "Grumpy_PK"),
-			DMI_MATCH(DMI_BOARD_VENDOR, "PK"),
-		},
-	},
-	{ }
-};
-
-static const struct dmi_system_id i8042_dmi_laptop_table[] __initconst = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
+			DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., LTD"),
+			DMI_MATCH(DMI_BOARD_NAME, "U-100"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOPNP)
 	},
 	{
+		/*
+		 * No data is coming from the touchscreen unless KBC
+		 * is in legacy mode.
+		 */
+		/* Panasonic CF-29 */
 		.matches = {
-			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
+			DMI_MATCH(DMI_SYS_VENDOR, "Matsushita"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CF-29"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
+		/* Medion Akoya E7225 */
 		.matches = {
-			DMI_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
+			DMI_MATCH(DMI_SYS_VENDOR, "Medion"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Akoya E7225"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "1.0"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
-	{ }
-};
-#endif
-
-static const struct dmi_system_id __initconst i8042_dmi_notimeout_table[] = {
 	{
-		/* Dell Vostro V13 */
+		/* Microsoft Virtual Machine */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V13"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Virtual Machine"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "VS2005R2"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Newer HP Pavilion dv4 models */
+		/* Medion MAM 2070 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion dv4 Notebook PC"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MAM 2070"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "5a"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Fujitsu A544 laptop */
-		/* https://bugzilla.redhat.com/show_bug.cgi?id=1111138 */
+		/* TUXEDO BU1406 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK A544"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N24_25BU"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Fujitsu AH544 laptop */
-		/* https://bugzilla.kernel.org/show_bug.cgi?id=69731 */
+		/* Clevo P650RS, 650RP6, Sager NP8152-S, and others */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK AH544"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Notebook"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "P65xRP"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
 	{
-		/* Fujitsu Lifebook T725 laptop */
+		/* OQO Model 01 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T725"),
+			DMI_MATCH(DMI_SYS_VENDOR, "OQO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ZEPTO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "00"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Fujitsu U574 laptop */
-		/* https://bugzilla.kernel.org/show_bug.cgi?id=69731 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK U574"),
+			DMI_MATCH(DMI_SYS_VENDOR, "PEGATRON CORPORATION"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "C15B"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Fujitsu UH554 laptop */
+		/* Acer Aspire 5 A515 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK UH544"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "PK"),
+			DMI_MATCH(DMI_BOARD_NAME, "Grumpy_PK"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOPNP)
 	},
-	{ }
-};
-
-/*
- * Some Wistron based laptops need us to explicitly enable the 'Dritek
- * keyboard extension' to make their extra keys start generating scancodes.
- * Originally, this was just confined to older laptops, but a few Acer laptops
- * have turned up in 2007 that also need this again.
- */
-static const struct dmi_system_id __initconst i8042_dmi_dritek_table[] = {
 	{
-		/* Acer Aspire 5100 */
+		/* ULI EV4873 - AUX LOOP does not work properly */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5100"),
+			DMI_MATCH(DMI_SYS_VENDOR, "ULI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EV4873"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "5a"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Acer Aspire 5610 */
+		/*
+		 * Arima-Rioworks HDAMB -
+		 * AUX LOOP command does not raise AUX IRQ
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5610"),
+			DMI_MATCH(DMI_BOARD_VENDOR, "RIOWORKS"),
+			DMI_MATCH(DMI_BOARD_NAME, "HDAMB"),
+			DMI_MATCH(DMI_BOARD_VERSION, "Rev E"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
 	{
-		/* Acer Aspire 5630 */
+		/* Sharp Actius MM20 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5630"),
+			DMI_MATCH(DMI_SYS_VENDOR, "SHARP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "PC-MM20 Series"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer Aspire 5650 */
+		/*
+		 * Sony Vaio FZ-240E -
+		 * reset and GET ID commands issued via KBD port are
+		 * sometimes being delivered to AUX3.
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5650"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-FZ240E"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer Aspire 5680 */
+		/*
+		 * Most (all?) VAIOs do not have external PS/2 ports nor
+		 * they implement active multiplexing properly, and
+		 * MUX discovery usually messes up keyboard/touchpad.
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5680"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "VAIO"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer Aspire 5720 */
+		/* Sony Vaio FS-115b */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5720"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-FS115B"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer Aspire 9110 */
+		/*
+		 * Sony Vaio VGN-CS series require MUX or the touch sensor
+		 * buttons will disturb touchpad operation
+		 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 9110"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-CS"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_FORCEMUX)
 	},
 	{
-		/* Acer TravelMate 660 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 660"),
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite P10"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer TravelMate 2490 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 2490"),
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EQUIUM A110"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
 	{
-		/* Acer TravelMate 4280 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4280"),
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SATELLITE C850D"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
-	{ }
-};
-
-/*
- * Some laptops need keyboard reset before probing for the trackpad to get
- * it detected, initialised & finally work.
- */
-static const struct dmi_system_id __initconst i8042_dmi_kbdreset_table[] = {
 	{
-		/* Gigabyte P35 v2 - Elantech touchpad */
+		/* Mivvy M310 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "P35V2"),
+			DMI_MATCH(DMI_SYS_VENDOR, "VIOOO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N10"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
-		{
-		/* Aorus branded Gigabyte X3 Plus - Elantech touchpad */
+	/*
+	 * Some laptops need keyboard reset before probing for the trackpad to get
+	 * it detected, initialised & finally work.
+	 */
+	{
+		/* Schenker XMG C504 - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "X3"),
+			DMI_MATCH(DMI_SYS_VENDOR, "XMG"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "C504"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_KBDRESET)
 	},
 	{
-		/* Gigabyte P34 - Elantech touchpad */
+		/* Blue FB5601 */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "P34"),
+			DMI_MATCH(DMI_SYS_VENDOR, "blue"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FB5601"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "M606"),
 		},
+		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
 	},
+	{ }
+};
+
+#ifdef CONFIG_PNP
+static const struct dmi_system_id i8042_dmi_laptop_table[] __initconst = {
 	{
-		/* Gigabyte P57 - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "GIGABYTE"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "P57"),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
 		},
 	},
 	{
-		/* Schenker XMG C504 - Elantech touchpad */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "XMG"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "C504"),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
 		},
 	},
-	{ }
-};
-
-static const struct dmi_system_id i8042_dmi_probe_defer_table[] __initconst = {
 	{
-		/* ASUS ZenBook UX425UA */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA"),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
 		},
 	},
 	{
-		/* ASUS ZenBook UM325UA */
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX325UA_UM325UA"),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
 		},
 	},
 	{ }
 };
+#endif
 
 #endif /* CONFIG_X86 */
 
@@ -1167,11 +1237,6 @@ static int __init i8042_pnp_init(void)
 	bool pnp_data_busted = false;
 	int err;
 
-#ifdef CONFIG_X86
-	if (dmi_check_system(i8042_dmi_nopnp_table))
-		i8042_nopnp = true;
-#endif
-
 	if (i8042_nopnp) {
 		pr_info("PNP detection disabled\n");
 		return 0;
@@ -1275,6 +1340,59 @@ static inline int i8042_pnp_init(void) { return 0; }
 static inline void i8042_pnp_exit(void) { }
 #endif /* CONFIG_PNP */
 
+
+#ifdef CONFIG_X86
+static void __init i8042_check_quirks(void)
+{
+	const struct dmi_system_id *device_quirk_info;
+	uintptr_t quirks;
+
+	device_quirk_info = dmi_first_match(i8042_dmi_quirk_table);
+	if (!device_quirk_info)
+		return;
+
+	quirks = (uintptr_t)device_quirk_info->driver_data;
+
+	if (quirks & SERIO_QUIRK_NOKBD)
+		i8042_nokbd = true;
+	if (quirks & SERIO_QUIRK_NOAUX)
+		i8042_noaux = true;
+	if (quirks & SERIO_QUIRK_NOMUX)
+		i8042_nomux = true;
+	if (quirks & SERIO_QUIRK_FORCEMUX)
+		i8042_nomux = false;
+	if (quirks & SERIO_QUIRK_UNLOCK)
+		i8042_unlock = true;
+	if (quirks & SERIO_QUIRK_PROBE_DEFER)
+		i8042_probe_defer = true;
+	/* Honor module parameter when value is not default */
+	if (i8042_reset == I8042_RESET_DEFAULT) {
+		if (quirks & SERIO_QUIRK_RESET_ALWAYS)
+			i8042_reset = I8042_RESET_ALWAYS;
+		if (quirks & SERIO_QUIRK_RESET_NEVER)
+			i8042_reset = I8042_RESET_NEVER;
+	}
+	if (quirks & SERIO_QUIRK_DIECT)
+		i8042_direct = true;
+	if (quirks & SERIO_QUIRK_DUMBKBD)
+		i8042_dumbkbd = true;
+	if (quirks & SERIO_QUIRK_NOLOOP)
+		i8042_noloop = true;
+	if (quirks & SERIO_QUIRK_NOTIMEOUT)
+		i8042_notimeout = true;
+	if (quirks & SERIO_QUIRK_KBDRESET)
+		i8042_kbdreset = true;
+	if (quirks & SERIO_QUIRK_DRITEK)
+		i8042_dritek = true;
+#ifdef CONFIG_PNP
+	if (quirks & SERIO_QUIRK_NOPNP)
+		i8042_nopnp = true;
+#endif
+}
+#else
+static inline void i8042_check_quirks(void) {}
+#endif
+
 static int __init i8042_platform_init(void)
 {
 	int retval;
@@ -1297,45 +1415,17 @@ static int __init i8042_platform_init(void)
 	i8042_kbd_irq = I8042_MAP_IRQ(1);
 	i8042_aux_irq = I8042_MAP_IRQ(12);
 
-	retval = i8042_pnp_init();
-	if (retval)
-		return retval;
-
 #if defined(__ia64__)
-        i8042_reset = I8042_RESET_ALWAYS;
+	i8042_reset = I8042_RESET_ALWAYS;
 #endif
 
-#ifdef CONFIG_X86
-	/* Honor module parameter when value is not default */
-	if (i8042_reset == I8042_RESET_DEFAULT) {
-		if (dmi_check_system(i8042_dmi_reset_table))
-			i8042_reset = I8042_RESET_ALWAYS;
-
-		if (dmi_check_system(i8042_dmi_noselftest_table))
-			i8042_reset = I8042_RESET_NEVER;
-	}
-
-	if (dmi_check_system(i8042_dmi_noloop_table))
-		i8042_noloop = true;
-
-	if (dmi_check_system(i8042_dmi_nomux_table))
-		i8042_nomux = true;
-
-	if (dmi_check_system(i8042_dmi_forcemux_table))
-		i8042_nomux = false;
-
-	if (dmi_check_system(i8042_dmi_notimeout_table))
-		i8042_notimeout = true;
-
-	if (dmi_check_system(i8042_dmi_dritek_table))
-		i8042_dritek = true;
-
-	if (dmi_check_system(i8042_dmi_kbdreset_table))
-		i8042_kbdreset = true;
+	i8042_check_quirks();
 
-	if (dmi_check_system(i8042_dmi_probe_defer_table))
-		i8042_probe_defer = true;
+	retval = i8042_pnp_init();
+	if (retval)
+		return retval;
 
+#ifdef CONFIG_X86
 	/*
 	 * A20 was already enabled during early kernel init. But some buggy
 	 * BIOSes (in MSI Laptops) require A20 to be enabled using 8042 to
-- 
2.25.1

