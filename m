Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB34C2DF6
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 09:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfJAHIy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 03:08:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49326 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfJAHIy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Oct 2019 03:08:54 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iFCHD-0002PH-9I; Tue, 01 Oct 2019 07:08:51 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     dmitry.torokhov@gmail.com
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] Revert "Input: elantech - enable SMBus on new (2018+) systems"
Date:   Tue,  1 Oct 2019 15:08:45 +0800
Message-Id: <20191001070845.9720-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This reverts commit 883a2a80f79ca5c0c105605fafabd1f3df99b34c.

Apparently use dmi_get_bios_year() as manufacturing date isn't accurate
and this breaks older laptops with new BIOS update.

So let's revert this patch.

There are still new HP laptops still need to use SMBus to support all
features, but it'll be enabled via a whitelist.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/input/mouse/elantech.c | 55 ++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 04fe43440a3c..2d8434b7b623 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1827,31 +1827,6 @@ static int elantech_create_smbus(struct psmouse *psmouse,
 				  leave_breadcrumbs);
 }
 
-static bool elantech_use_host_notify(struct psmouse *psmouse,
-				     struct elantech_device_info *info)
-{
-	if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
-		return true;
-
-	switch (info->bus) {
-	case ETP_BUS_PS2_ONLY:
-		/* expected case */
-		break;
-	case ETP_BUS_SMB_HST_NTFY_ONLY:
-	case ETP_BUS_PS2_SMB_HST_NTFY:
-		/* SMbus implementation is stable since 2018 */
-		if (dmi_get_bios_year() >= 2018)
-			return true;
-		/* fall through */
-	default:
-		psmouse_dbg(psmouse,
-			    "Ignoring SMBus bus provider %d\n", info->bus);
-		break;
-	}
-
-	return false;
-}
-
 /**
  * elantech_setup_smbus - called once the PS/2 devices are enumerated
  * and decides to instantiate a SMBus InterTouch device.
@@ -1871,7 +1846,7 @@ static int elantech_setup_smbus(struct psmouse *psmouse,
 		 * i2c_blacklist_pnp_ids.
 		 * Old ICs are up to the user to decide.
 		 */
-		if (!elantech_use_host_notify(psmouse, info) ||
+		if (!ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version) ||
 		    psmouse_matches_pnp_id(psmouse, i2c_blacklist_pnp_ids))
 			return -ENXIO;
 	}
@@ -1891,6 +1866,34 @@ static int elantech_setup_smbus(struct psmouse *psmouse,
 	return 0;
 }
 
+static bool elantech_use_host_notify(struct psmouse *psmouse,
+				     struct elantech_device_info *info)
+{
+	if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
+		return true;
+
+	switch (info->bus) {
+	case ETP_BUS_PS2_ONLY:
+		/* expected case */
+		break;
+	case ETP_BUS_SMB_ALERT_ONLY:
+		/* fall-through  */
+	case ETP_BUS_PS2_SMB_ALERT:
+		psmouse_dbg(psmouse, "Ignoring SMBus provider through alert protocol.\n");
+		break;
+	case ETP_BUS_SMB_HST_NTFY_ONLY:
+		/* fall-through  */
+	case ETP_BUS_PS2_SMB_HST_NTFY:
+		return true;
+	default:
+		psmouse_dbg(psmouse,
+			    "Ignoring SMBus bus provider %d.\n",
+			    info->bus);
+	}
+
+	return false;
+}
+
 int elantech_init_smbus(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-- 
2.17.1

