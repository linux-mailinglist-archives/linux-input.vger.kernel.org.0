Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39A9114AFC
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 03:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfLFCka (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 21:40:30 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:33899 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfLFCka (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Thu, 5 Dec 2019 21:40:30 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33171948"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 06 Dec 2019 10:40:29 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71490:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:40:29 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(101174:1:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:40:28 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     <Linux-kernel@vger.kernel.org>, <Linux-input@vger.kernel.org>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        <Dmitry.torokhov@gmail.com>
Cc:     "'Josh.Chen'" <josh.chen@emc.com.tw>, <jingle.wu@emc.com.tw>,
        "'phoenix'" <phoenix@emc.com.tw>
Subject: [PATCH 5/6] Input: elantech - Transfer the device information from PS/2 to SMBus
Date:   Fri, 6 Dec 2019 10:40:28 +0800
Message-ID: <000d01d5abde$8532b540$8f981fc0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWr3kWOtAlRSxGOS36eKEmeQmaSPQ==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jMmFmYWI1Ny0xN2QxLTExZWEtYWExOS04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcYzJhZmFiNTktMTdkMS0xMWVhLWFhMTktODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSIyNjkxIiB0PSIxMzIyMDA3MzYyODAyNzQxMDgiIGg9IjU0eHZZQXNXMEIxSDBQQ0JmdHFQdGNGdytZdz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Many commands in SMBus interface cannot be triggered. In order to
get the correct device information, transfer the device information
from PS/2 to SMBus interface for PS/2+SMbus protocol.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 53d7ff719d76..0392b668cd39 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1889,12 +1889,28 @@ static int elantech_create_smbus(struct psmouse
*psmouse,
 				 struct elantech_device_info *info,
 				 bool leave_breadcrumbs)
 {
-	struct property_entry i2c_props[11] = {};
+	struct property_entry i2c_props[19] = {};
 	struct i2c_board_info smbus_board = {
 		I2C_BOARD_INFO("elan_i2c", 0x15),
 		.flags = I2C_CLIENT_HOST_NOTIFY,
 	};
 	unsigned int idx = 0;
+	u16 product_id, ic_type;
+	u8 sm_version, fw_version, iap_version;
+
+	if (info->pattern > 0) {
+		product_id = get_unaligned_be16(info->samples);
+		sm_version = info->bus;
+		ic_type = get_unaligned_be16(info->ic_body);
+		fw_version = info->ic_body[2];
+		iap_version = info->iap_version[2];
+	} else {
+		product_id = info->samples[1];
+		sm_version = info->samples[0];
+		ic_type = (info->fw_version & 0x0f0000) >> 16;
+		fw_version = info->fw_version & 0x0000ff;
+		iap_version = 0x00;
+	}
 
 	smbus_board.properties = i2c_props;
 
@@ -1906,6 +1922,22 @@ static int elantech_create_smbus(struct psmouse
*psmouse,
 						   info->x_min);
 	i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-min-y",
 						   info->y_min);
+	i2c_props[idx++] = PROPERTY_ENTRY_U16("elan,product_id",
+							product_id);
+	i2c_props[idx++] = PROPERTY_ENTRY_U8("elan,sm_version",
+							sm_version);
+	i2c_props[idx++] = PROPERTY_ENTRY_U16("elan,ic_type",
+							ic_type);
+	i2c_props[idx++] = PROPERTY_ENTRY_U8("elan,fw_version",
+							fw_version);
+	i2c_props[idx++] = PROPERTY_ENTRY_U16("elan,fw_checksum",
+			info->fw_checksum[0] << 8 | info->fw_checksum[1]);
+	i2c_props[idx++] = PROPERTY_ENTRY_U16("elan,iap_checksum",
+			info->iap_checksum[0] << 8 | info->iap_checksum[1]);
+	i2c_props[idx++] = PROPERTY_ENTRY_U8("elan,iap_version",
+							iap_version);
+	i2c_props[idx++] = PROPERTY_ENTRY_U8("elan,pattern",
+							info->pattern);
 	if (info->x_res)
 		i2c_props[idx++] = PROPERTY_ENTRY_U32("touchscreen-x-mm",
 						      (info->x_max + 1) /
info->x_res);
-- 
2.17.1

