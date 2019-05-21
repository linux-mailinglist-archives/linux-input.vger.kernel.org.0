Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816CE25044
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbfEUN1o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35280 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726995AbfEUN1n (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 969AB30044CC;
        Tue, 21 May 2019 13:27:38 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5CE60F8D;
        Tue, 21 May 2019 13:27:35 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 03/10] Input: elantech - detect middle button based on firmware version
Date:   Tue, 21 May 2019 15:27:05 +0200
Message-Id: <20190521132712.2818-4-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 21 May 2019 13:27:43 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Looks like the new generation of Lenovo machine also need to
be added to the PnPID whitelist. This is definitively not going
to scale, as there is nothing that tells us currently if a
touchpad supports a true physical middle button.

Consider that all new touchpads that are not clickpads
(so matching ETP_NEW_IC_SMBUS_HOST_NOTIFY) are handling 3 physical
buttons.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

new in v2
---
 drivers/input/mouse/elantech.c | 16 ++++++----------
 drivers/input/mouse/elantech.h |  1 +
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 34b96b96fc96..057a3cf01eec 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1107,14 +1107,6 @@ static const struct dmi_system_id elantech_dmi_has_middle_button[] = {
 	{ }
 };
 
-static const char * const middle_button_pnp_ids[] = {
-	"LEN2131", /* ThinkPad P52 w/ NFC */
-	"LEN2132", /* ThinkPad P52 */
-	"LEN2133", /* ThinkPad P72 w/ NFC */
-	"LEN2134", /* ThinkPad P72 */
-	NULL
-};
-
 /*
  * Set the appropriate event bits for the input subsystem
  */
@@ -1133,8 +1125,7 @@ static int elantech_set_input_params(struct psmouse *psmouse)
 	__clear_bit(EV_REL, dev->evbit);
 
 	__set_bit(BTN_LEFT, dev->keybit);
-	if (dmi_check_system(elantech_dmi_has_middle_button) ||
-			psmouse_matches_pnp_id(psmouse, middle_button_pnp_ids))
+	if (info->has_middle_button)
 		__set_bit(BTN_MIDDLE, dev->keybit);
 	__set_bit(BTN_RIGHT, dev->keybit);
 
@@ -1748,6 +1739,11 @@ static int elantech_query_info(struct psmouse *psmouse,
 		break;
 	}
 
+	/* check for the middle button: DMI matching or new v4 firmwares */
+	info->has_middle_button = dmi_check_system(elantech_dmi_has_middle_button) ||
+				  (ETP_NEW_IC_SMBUS_HOST_NOTIFY(info->fw_version) &&
+				   !elantech_is_buttonpad(info));
+
 	return 0;
 }
 
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index 194503ed59c5..16174b54ffc3 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -158,6 +158,7 @@ struct elantech_device_info {
 	bool crc_enabled;
 	bool set_hw_resolution;
 	bool has_trackpoint;
+	bool has_middle_button;
 	int (*send_cmd)(struct psmouse *psmouse, unsigned char c,
 			unsigned char *param);
 };
-- 
2.21.0

