Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE6625032
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfEUN1w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40552 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726995AbfEUN1v (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 68FD681DEE;
        Tue, 21 May 2019 13:27:51 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2EF35610A3;
        Tue, 21 May 2019 13:27:48 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 06/10] Input: elantech/SMBus - export all capabilities from the PS/2 node
Date:   Tue, 21 May 2019 15:27:08 +0200
Message-Id: <20190521132712.2818-7-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 21 May 2019 13:27:51 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The recent touchpads might not have all the information regarding the
characteristics through the I2C port.
On some Lenovo t480s, this results in the touchpad not being detected
as a clickpad, and on the Lenovo P52, this results in a failure while
fetching the resolution through I2C.

We need to imitate the Windows behavior: fetch the data under PS/2, and
limit the querries under I2C.

This patch prepares this by exporting the info from PS/2.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

changes in v2:
- updated according to the 2 previous patches
---
 drivers/input/mouse/elantech.c | 47 ++++++++++++++++++++++++++++++----
 drivers/input/mouse/elantech.h |  2 ++
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 057a3cf01eec..ca10fd97d9d5 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1736,6 +1736,15 @@ static int elantech_query_info(struct psmouse *psmouse,
 			return -EINVAL;
 
 		info->width = info->x_max / (traces - 1);
+
+		/* column number of traces */
+		info->x_traces = traces;
+
+		/* row number of traces */
+		traces = info->capabilities[2];
+		if ((traces >= 2) && (traces <= info->y_max))
+			info->y_traces = traces;
+
 		break;
 	}
 
@@ -1781,17 +1790,45 @@ static int elantech_create_smbus(struct psmouse *psmouse,
 				 struct elantech_device_info *info,
 				 bool leave_breadcrumbs)
 {
-	const struct property_entry i2c_properties[] = {
-		PROPERTY_ENTRY_BOOL("elan,trackpoint"),
-		{ },
-	};
+	struct property_entry i2c_props[11] = {};
 	struct i2c_board_info smbus_board = {
 		I2C_BOARD_INFO("elan_i2c", 0x15),
 		.flags = I2C_CLIENT_HOST_NOTIFY,
 	};
+	unsigned int idx = 0;
+
+	smbus_board.properties = i2c_props;
+
+	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-size-x",
+						   info->x_max + 1);
+	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-size-y",
+						   info->y_max + 1);
+	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-min-x",
+						   info->x_min);
+	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-min-y",
+						   info->y_min);
+	if (info->x_res)
+		i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-x-mm",
+						      (info->x_max + 1) / info->x_res);
+	if (info->y_res)
+		i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-y-mm",
+						      (info->y_max + 1) / info->y_res);
 
 	if (info->has_trackpoint)
-		smbus_board.properties = i2c_properties;
+		i2c_props[idx++] = PROPERTY_ENTRY_BOOL("elan,trackpoint");
+
+	if (info->has_middle_button)
+		i2c_props[idx++] = PROPERTY_ENTRY_BOOL("elan,middle-button");
+
+	if (info->x_traces)
+		i2c_props[idx++] = PROPERTY_ENTRY_U32("elan,x_traces",
+						      info->x_traces);
+	if (info->y_traces)
+		i2c_props[idx++] = PROPERTY_ENTRY_U32("elan,y_traces",
+						      info->y_traces);
+
+	if (elantech_is_buttonpad(info))
+		i2c_props[idx++] = PROPERTY_ENTRY_BOOL("elan,clickpad");
 
 	return psmouse_smbus_init(psmouse, &smbus_board, NULL, 0, false,
 				  leave_breadcrumbs);
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index 16174b54ffc3..a7eaa62af6a0 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -150,6 +150,8 @@ struct elantech_device_info {
 	unsigned int y_max;
 	unsigned int x_res;
 	unsigned int y_res;
+	unsigned int x_traces;
+	unsigned int y_traces;
 	unsigned int width;
 	unsigned int bus;
 	bool paritycheck;
-- 
2.21.0

