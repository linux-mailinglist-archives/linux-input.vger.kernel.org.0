Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A57158AFA
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 09:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbgBKIBj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 03:01:39 -0500
Received: from mailout.easymail.ca ([64.68.200.34]:52520 "EHLO
        mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727613AbgBKIBj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 03:01:39 -0500
X-Greylist: delayed 525 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 03:01:39 EST
Received: from localhost (localhost [127.0.0.1])
        by mailout.easymail.ca (Postfix) with ESMTP id 15C3CA0C98;
        Tue, 11 Feb 2020 07:52:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo05-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
        by localhost (emo05-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id G-VggqAq2CZ6; Tue, 11 Feb 2020 07:52:53 +0000 (UTC)
Received: from fortknox.lan (cpe-173-172-97-228.kc.res.rr.com [173.172.97.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailout.easymail.ca (Postfix) with ESMTPSA id 2D95FA0B33;
        Tue, 11 Feb 2020 07:52:51 +0000 (UTC)
From:   James Buren <braewoods+lkml@braewoods.net>
To:     linux-input@vger.kernel.org
Cc:     James Buren <braewoods+lkml@braewoods.net>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Nuvision NES11 tablet
Date:   Tue, 11 Feb 2020 01:52:41 -0600
Message-Id: <20200211075241.35653-1-braewoods+lkml@braewoods.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen info for the Nuvision NES11 tablet.

Signed-off-by: James Buren <braewoods+lkml@braewoods.net>
---
 drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 93177e6e5ecd..33f91eb3c61f 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -357,6 +357,22 @@ static const struct ts_dmi_data myria_my8307_data = {
 	.properties	= myria_my8307_props,
 };
 
+static const struct property_entry nuvision_nes11_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 39),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 31),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1949),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1508),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-nuvision-nes11.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct ts_dmi_data nuvision_nes11_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= nuvision_nes11_props,
+};
+
 static const struct property_entry onda_obook_20_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
@@ -856,6 +872,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "MY8307"),
 		},
 	},
+	{
+		/* Nuvision NES11 */
+		.driver_data = (void *)&nuvision_nes11_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Nuvision"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "NES11"),
+		},
+	},
 	{
 		/* Onda oBook 20 Plus */
 		.driver_data = (void *)&onda_obook_20_plus_data,
-- 
2.17.1

