Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4555A394F5D
	for <lists+linux-input@lfdr.de>; Sun, 30 May 2021 06:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbhE3Eho (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 May 2021 00:37:44 -0400
Received: from mail-am7eur06olkn2044.outbound.protection.outlook.com ([40.92.16.44]:9825
        "EHLO EUR06-AM7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229447AbhE3Eho (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 May 2021 00:37:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6JG5zEqUG15qrG6zjo/Dn5eFVbI4nylIM0fHX/9J0wR1Qf4AiuAbfuKKyQCPAlVDQXAhwd9e+NUzv0QyyvfhK4K6JK5NXKOyqJ9uLsQ9Fgl0eq+bTG0zxTYIUqgUF3y3MWX8sIZserOEOc/xpEGNaajmXyTTPI5ZaMYe64/0/VEB7G5nVEe2UTcFvIKhtZSU9W4dZw6gGmutzyjcery0eIkkmtPkylSV3A6mFnPoAnEesjb06ta4Ke50ZogcD4uwkkavlaABe3eidTWYuny6PTYmgzgFZO2mef+fd823cTdQFpVPpa1I8Cp0H0sTwdpmx15nDYFSOdVrOxXVVaLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpwPB6qKCmSaKZTA6RsBULw87qHqKdnIzgcdEdR2dKk=;
 b=NwXqJeEb+BV3APsl+2gg3Qa+AADyzpI0VGcFHaanZ1llFjGfbZnwSTy80ReQwI/G/G8SpSFpOGVc5+BsVzp7cxmLUBP5Ky5IfmYLDzMwDaehAYBLDBAzUR6IWtdmjR/ug8UxA9AhivimikVLw5ybbj6Y4rdEQkXGXDOQOcItuGDK3MQQuBi5ZHNx/gbzzRHoBPLZBDPsmBS/VBIiZ8LnekAloBV1vTbamK5kj4nGmheLNmAa9YkZ6JLeMGeGSjY34ywFGTf1LQHScy+6bILPwSvHBODFmCTsWDJ++uTq611cECqxs/oyM3hi4RGsTqyfKNLREjOzuCcWYAD6lUeZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB8EUR06FT004.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::4c) by
 DB8EUR06HT032.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::403)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.30; Sun, 30 May
 2021 04:35:57 +0000
Received: from AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 (2a01:111:e400:fc35::53) by DB8EUR06FT004.mail.protection.outlook.com
 (2a01:111:e400:fc35::250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.30 via Frontend
 Transport; Sun, 30 May 2021 04:35:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:78010920D9192E45547D6E75A181F6910967481890C3AEB275DC4498337BC4CE;UpperCasedChecksum:0B6196D4CACBB2486E56B1EF6573E98669B21085E6AB13A96147325DEEE92B8D;SizeAsReceived:7993;Count:45
Received: from AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ad12:6a2c:b949:f65d]) by AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ad12:6a2c:b949:f65d%5]) with mapi id 15.20.4173.027; Sun, 30 May 2021
 04:35:52 +0000
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Bernd Edlinger <bernd.edlinger@hotmail.de>
Subject: [PATCH v3] Input: elantech - fix x_max/y_max values
Message-ID: <AM8PR10MB47082E49F8A2DC4B9B522023E4209@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
Date:   Sun, 30 May 2021 06:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN:  [OhNj4mn2jkFk7IW+2MH5SizoZ/+n2LGw]
X-ClientProxiedBy: AM0PR02CA0188.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::25) To AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:364::23)
X-Microsoft-Original-Message-ID: <e81c3776-aaac-c8ae-7ade-7a328383fec6@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.101] (84.57.61.94) by AM0PR02CA0188.eurprd02.prod.outlook.com (2603:10a6:20b:28e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22 via Frontend Transport; Sun, 30 May 2021 04:35:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1eba5aef-cb9b-494e-80dc-08d9232467a9
X-MS-TrafficTypeDiagnostic: DB8EUR06HT032:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HtcEpNrWplKt5gwhC5i+N3+fxsr67/z0cS5bg1QCVgv8ZwKjpmd0nh7Lk3+0J28MWYFiRtyBK/Wql6FuQDXCkDmoe6vtIXe3fXG/F7eNVXdXHiX3K1DpJNudUvv2LGFlyQynOHTl4wN166WdPJAY9uCf7yb3hcbjHMaDlU5xNu2ZUHzVR0VN2jTeUc6LI+eCpHQ7EQ0La3IUXCxObEMtPhmlo037MrFgTJlK6UQLnOf/PT3UzATsNFbprQtHX9ueyw3cEq8j8yp6wXlsdKsBLGOlZg3ubNBN8U+wZM0UVOrVvXUPZh0qkp4UIqcrLQtOTgHK5/aqJDbc8aI6R4NxZOocFCoqDs5wyvSOtb2LGf9kQKuf7MS1dWo02zbHJTMFBG+dAJrcfl2bM6nBt1AQ9g==
X-MS-Exchange-AntiSpam-MessageData: tB0WNOozswMOKk/V4k3crT3V7P8DVoIBYSuOzbQMDQlU4SimuADVVK1qfZVGKKu7CeCFtwj+Ry1yWCMW3nji+y8bovw9KmL3qs2Qb0CN+6+K6Ul0erSU1nFFxt0XOMyOc2fiEF1L2xhwvHE4jXrzGg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba5aef-cb9b-494e-80dc-08d9232467a9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2021 04:35:51.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DB8EUR06FT004.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT032
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since commit 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
moved the querying of the x_max/y_max values from
elantech_set_input_params to elantech_query_info,
the returned x_max/y_max values are different than before,
at least for some firmware versions.

The reason is likely that this is now done before
elantech_set_absolute_mode does run.  So it may happen that
the returned values are exactly half of what they used to be,
which makes input_report_abs in PS/2 mode report ABS_X values which
exceed the x_max value, which is very annoying since the mouse stops
to move then, and ABS_Y value become negative, which is benign.

This was observed with a MSI GX70 laptop:

elantech: assuming hardware version 3 (with firmware version 0x250f01)
elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
elantech: Elan sample query result 05, 0e, 00
input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...

This patch moves the code sending the ETP_FW_ID_QUERY command to
the function elantech_set_range and calls this function in
elantech_query_info for hw_version == 4, but for hw_version < 4 it is
called in elantech_setup_ps2 after the function elantech_set_absolute_mode.

It is right to switch the touchpad into absolute mode first to get valid
results from the ID query call in hardware version 2 and 3.

There is no way how this change can affect the state of the firmware
when elantech_setup_smbus is called later, since that can only happen for
hardware version 4, see elantech_init_smbusand elantech_use_host_notify
which uses ETP_NEW_IC_SMBUS_HOST_NOTIFY and info->bus.

The macro ETP_NEW_IC_SMBUS_HOST_NOTIFY can only return true
for (fw_version & 0x0f0000) == 0x0f0000 which implies v4 hardware.
The value info->bus can only be unequal to ETP_BUS_PS2_ONLY,
if elantech_get_resolution_v4 was called from elantech_query_info,
which is again guarded by info->hw_version == 4.

Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")

Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
---
v3: Do the ID_QUEERY after set absoulute mode for hw_version < 4.
    Note: It turned out to be more difficult to call elantech_set_absolute_mode
    from elantech_query_info.

 drivers/input/mouse/elantech.c | 172 ++++++++++++++++++++++-------------------
 1 file changed, 94 insertions(+), 78 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 97381e2..5f4a1a4 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1078,6 +1078,94 @@ static int elantech_set_absolute_mode(struct psmouse *psmouse)
 	return rc;
 }
 
+static int elantech_set_range(struct psmouse *psmouse,
+			      struct elantech_device_info *info)
+{
+	unsigned char param[3];
+	unsigned char traces;
+
+	/* query range information */
+	switch (info->hw_version) {
+	case 1:
+		info->x_min = ETP_XMIN_V1;
+		info->y_min = ETP_YMIN_V1;
+		info->x_max = ETP_XMAX_V1;
+		info->y_max = ETP_YMAX_V1;
+		break;
+
+	case 2:
+		if (info->fw_version == 0x020800 ||
+		    info->fw_version == 0x020b00 ||
+		    info->fw_version == 0x020030) {
+			info->x_min = ETP_XMIN_V2;
+			info->y_min = ETP_YMIN_V2;
+			info->x_max = ETP_XMAX_V2;
+			info->y_max = ETP_YMAX_V2;
+		} else {
+			int i;
+			int fixed_dpi;
+
+			i = (info->fw_version > 0x020800 &&
+			     info->fw_version < 0x020900) ? 1 : 2;
+
+			if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+				return -EINVAL;
+
+			fixed_dpi = param[1] & 0x10;
+
+			if (((info->fw_version >> 16) == 0x14) && fixed_dpi) {
+				if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
+					return -EINVAL;
+
+				info->x_max = (info->capabilities[1] - i) * param[1] / 2;
+				info->y_max = (info->capabilities[2] - i) * param[2] / 2;
+			} else if (info->fw_version == 0x040216) {
+				info->x_max = 819;
+				info->y_max = 405;
+			} else if (info->fw_version == 0x040219 || info->fw_version == 0x040215) {
+				info->x_max = 900;
+				info->y_max = 500;
+			} else {
+				info->x_max = (info->capabilities[1] - i) * 64;
+				info->y_max = (info->capabilities[2] - i) * 64;
+			}
+		}
+		break;
+
+	case 3:
+		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+			return -EINVAL;
+
+		info->x_max = (0x0f & param[0]) << 8 | param[1];
+		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		break;
+
+	case 4:
+		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+			return -EINVAL;
+
+		info->x_max = (0x0f & param[0]) << 8 | param[1];
+		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		traces = info->capabilities[1];
+		if ((traces < 2) || (traces > info->x_max))
+			return -EINVAL;
+
+		info->width = info->x_max / (traces - 1);
+
+		/* column number of traces */
+		info->x_traces = traces;
+
+		/* row number of traces */
+		traces = info->capabilities[2];
+		if ((traces >= 2) && (traces <= info->y_max))
+			info->y_traces = traces;
+
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * (value from firmware) * 10 + 790 = dpi
  * we also have to convert dpi to dots/mm (*10/254 to avoid floating point)
@@ -1659,7 +1747,6 @@ static int elantech_query_info(struct psmouse *psmouse,
 			       struct elantech_device_info *info)
 {
 	unsigned char param[3];
-	unsigned char traces;
 	unsigned char ic_body[3];
 
 	memset(info, 0, sizeof(*info));
@@ -1759,85 +1846,9 @@ static int elantech_query_info(struct psmouse *psmouse,
 			psmouse_warn(psmouse,
 				     "failed to query resolution data.\n");
 		}
-	}
-
-	/* query range information */
-	switch (info->hw_version) {
-	case 1:
-		info->x_min = ETP_XMIN_V1;
-		info->y_min = ETP_YMIN_V1;
-		info->x_max = ETP_XMAX_V1;
-		info->y_max = ETP_YMAX_V1;
-		break;
-
-	case 2:
-		if (info->fw_version == 0x020800 ||
-		    info->fw_version == 0x020b00 ||
-		    info->fw_version == 0x020030) {
-			info->x_min = ETP_XMIN_V2;
-			info->y_min = ETP_YMIN_V2;
-			info->x_max = ETP_XMAX_V2;
-			info->y_max = ETP_YMAX_V2;
-		} else {
-			int i;
-			int fixed_dpi;
-
-			i = (info->fw_version > 0x020800 &&
-			     info->fw_version < 0x020900) ? 1 : 2;
-
-			if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
-				return -EINVAL;
 
-			fixed_dpi = param[1] & 0x10;
-
-			if (((info->fw_version >> 16) == 0x14) && fixed_dpi) {
-				if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
-					return -EINVAL;
-
-				info->x_max = (info->capabilities[1] - i) * param[1] / 2;
-				info->y_max = (info->capabilities[2] - i) * param[2] / 2;
-			} else if (info->fw_version == 0x040216) {
-				info->x_max = 819;
-				info->y_max = 405;
-			} else if (info->fw_version == 0x040219 || info->fw_version == 0x040215) {
-				info->x_max = 900;
-				info->y_max = 500;
-			} else {
-				info->x_max = (info->capabilities[1] - i) * 64;
-				info->y_max = (info->capabilities[2] - i) * 64;
-			}
-		}
-		break;
-
-	case 3:
-		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
-			return -EINVAL;
-
-		info->x_max = (0x0f & param[0]) << 8 | param[1];
-		info->y_max = (0xf0 & param[0]) << 4 | param[2];
-		break;
-
-	case 4:
-		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+		if (elantech_set_range(psmouse, info))
 			return -EINVAL;
-
-		info->x_max = (0x0f & param[0]) << 8 | param[1];
-		info->y_max = (0xf0 & param[0]) << 4 | param[2];
-		traces = info->capabilities[1];
-		if ((traces < 2) || (traces > info->x_max))
-			return -EINVAL;
-
-		info->width = info->x_max / (traces - 1);
-
-		/* column number of traces */
-		info->x_traces = traces;
-
-		/* row number of traces */
-		traces = info->capabilities[2];
-		if ((traces >= 2) && (traces <= info->y_max))
-			info->y_traces = traces;
-
-		break;
 	}
 
 	/* check for the middle button: DMI matching or new v4 firmwares */
@@ -2037,6 +2048,11 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
 		goto init_fail;
 	}
 
+	if (info->hw_version < 4) {
+		if (elantech_set_range(psmouse, &etd->info))
+			goto init_fail;
+	}
+
 	if (info->fw_version == 0x381f17) {
 		etd->original_set_rate = psmouse->set_rate;
 		psmouse->set_rate = elantech_set_rate_restore_reg_07;
-- 
1.9.1
