Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4136FA7B
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 09:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfGVHlE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 03:41:04 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35385 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfGVHlE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 03:41:04 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hpSwO-0007zh-HD; Mon, 22 Jul 2019 07:41:01 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     dmitry.torokhov@gmail.com
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Your Name <you@example.com>
Subject: [PATCH v3] Input: elantech: Enable SMBus on new (2018+) systems
Date:   Mon, 22 Jul 2019 15:40:55 +0800
Message-Id: <20190722074055.22427-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190121070258.1844-1-kai.heng.feng@canonical.com>
References: <20190121070258.1844-1-kai.heng.feng@canonical.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are some new HP laptops with Elantech touchpad don't support
multitouch.

Currently we use ETP_NEW_IC_SMBUS_HOST_NOTIFY() to check if SMBus is
supported, but in addition to firmware version, the bus type also
informs us if the IC can support SMBus, so also check that.

In case of breaking old ICs, only enables SMBus on systems manufactured
after 2018, alongsides aforementioned checks.

Lastly, consolidats all check into elantech_use_host_notify() and use it
to determine whether to use PS/2 or SMBus.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Your Name <you@example.com>
---
v3:
- Put dmi_get_bios_year() under switch.

v2:
- Wording.
- Further restrain on older systems (< 2018).

 drivers/input/mouse/elantech.c | 64 +++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..46e70535a069 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1827,6 +1827,40 @@ static int elantech_create_smbus(struct psmouse *psmouse,
 				  leave_breadcrumbs);
 }
 
+static bool elantech_use_host_notify(struct psmouse *psmouse,
+				     struct elantech_device_info *info)
+{
+	bool host_notify = false;
+
+	if (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version))
+		host_notify = true;
+	else {
+		switch (info->bus) {
+		case ETP_BUS_PS2_ONLY:
+			/* expected case */
+			break;
+		case ETP_BUS_SMB_ALERT_ONLY:
+			/* fall-through  */
+		case ETP_BUS_PS2_SMB_ALERT:
+			psmouse_dbg(psmouse, "Ignoring SMBus provider through alert protocol.\n");
+			break;
+		case ETP_BUS_SMB_HST_NTFY_ONLY:
+			/* fall-through  */
+		case ETP_BUS_PS2_SMB_HST_NTFY:
+			/* SMbus implementation is stable since 2018 */
+			if (dmi_get_bios_year() >= 2018)
+				host_notify = true;
+			break;
+		default:
+			psmouse_dbg(psmouse,
+				    "Ignoring SMBus bus provider %d.\n",
+				    info->bus);
+		}
+	}
+
+	return host_notify;
+}
+
 /**
  * elantech_setup_smbus - called once the PS/2 devices are enumerated
  * and decides to instantiate a SMBus InterTouch device.
@@ -1846,7 +1880,7 @@ static int elantech_setup_smbus(struct psmouse *psmouse,
 		 * i2c_blacklist_pnp_ids.
 		 * Old ICs are up to the user to decide.
 		 */
-		if (!ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version) ||
+		if (!elantech_use_host_notify(psmouse, info) ||
 		    psmouse_matches_pnp_id(psmouse, i2c_blacklist_pnp_ids))
 			return -ENXIO;
 	}
@@ -1866,34 +1900,6 @@ static int elantech_setup_smbus(struct psmouse *psmouse,
 	return 0;
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
-	case ETP_BUS_SMB_ALERT_ONLY:
-		/* fall-through  */
-	case ETP_BUS_PS2_SMB_ALERT:
-		psmouse_dbg(psmouse, "Ignoring SMBus provider through alert protocol.\n");
-		break;
-	case ETP_BUS_SMB_HST_NTFY_ONLY:
-		/* fall-through  */
-	case ETP_BUS_PS2_SMB_HST_NTFY:
-		return true;
-	default:
-		psmouse_dbg(psmouse,
-			    "Ignoring SMBus bus provider %d.\n",
-			    info->bus);
-	}
-
-	return false;
-}
-
 int elantech_init_smbus(struct psmouse *psmouse)
 {
 	struct elantech_device_info info;
-- 
2.17.1

