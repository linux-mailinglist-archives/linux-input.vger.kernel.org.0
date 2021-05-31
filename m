Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B0D395E68
	for <lists+linux-input@lfdr.de>; Mon, 31 May 2021 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhEaN6Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 May 2021 09:58:16 -0400
Received: from air.basealt.ru ([194.107.17.39]:59444 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232589AbhEaN4R (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 May 2021 09:56:17 -0400
Received: by air.basealt.ru (Postfix, from userid 490)
        id 7A38A589517; Mon, 31 May 2021 13:54:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.1
Received: from EGORI-MACHINE.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id 47F53589883
        for <linux-input@vger.kernel.org>; Mon, 31 May 2021 13:54:26 +0000 (UTC)
From:   Egor Ignatov <egori@altlinux.org>
To:     linux-input@vger.kernel.org
Subject: [PATCH] Input: i8042 - add HP 15s-fq2xxx to dumbkbd list
Date:   Mon, 31 May 2021 16:54:07 +0300
Message-Id: <20210531135407.30816-1-egori@altlinux.org>
X-Mailer: git-send-email 2.29.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The virtual i8042 keyboard controller on the HP Laptop 15s-fq2xxx
is not properly delivering GETID interrupts resulting in a large
initialization delay. With dumbkbd, the driver does not ask for the
keyboard ID, and uses the default configuration, which works fine
with this keyboard.

Link: https://lore.kernel.org/lkml/20210528154339.GA9116@suse.com/
Signed-off-by: Egor Ignatov <egori@altlinux.org>
---
 drivers/input/serio/i8042-x86ia64io.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index a5a003553646..a29588014abc 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -981,6 +981,17 @@ static const struct dmi_system_id __initconst i8042_dmi_kbdreset_table[] = {
 	{ }
 };
 
+static const struct dmi_system_id __initconst i8042_dmi_dumbkbd_table[] = {
+	{
+		/* HP 15s-fq2xxx - keyboard */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15s-fq2xxx"),
+		},
+	},
+	{ }
+};
+
 #endif /* CONFIG_X86 */
 
 #ifdef CONFIG_PNP
@@ -1301,6 +1312,9 @@ static int __init i8042_platform_init(void)
 	if (dmi_check_system(i8042_dmi_kbdreset_table))
 		i8042_kbdreset = true;
 
+	if (dmi_check_system(i8042_dmi_dumbkbd_table))
+		i8042_dumbkbd = true;
+
 	/*
 	 * A20 was already enabled during early kernel init. But some buggy
 	 * BIOSes (in MSI Laptops) require A20 to be enabled using 8042 to
-- 
2.29.3

