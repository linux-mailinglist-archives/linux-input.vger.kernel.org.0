Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 284B417168B
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 12:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbgB0L7U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 27 Feb 2020 06:59:20 -0500
Received: from mail-vi1eur05olkn2024.outbound.protection.outlook.com ([40.92.90.24]:24224
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728885AbgB0L7U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 06:59:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDBi6V7439s6nowKtd1l/cL59qjky1CY6bzkjjGqxxwgdbrNLebS0ADia0bSl0SK0t+WXV3/8S0gvusXpT9V3BCwl9iSjR95xg/pXHfaearXUIzYtHquBRQTONK6uW8AmNx9Bzs/JC0ANaCeXOaEzVBOo6DxXaGBJFmP1RJ7fihuvaLfkq2r6L2wsLTxRTZVey2Wm6SVl85UxNtFiqcKK9ljZgapKQS/s/HNvMRc6lPBv9ecxzteIo8C9TCYHVwjkQS2AVT/+4YgT3mkl8mkvZdSxPyUhNFK2ubn8u307vsGwS3uW72/MvtTmoruDkOiYgsbHxQanSEjvjonoqk6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mU+DHsqyz+ahTmiUW83qzjEEc87JEwrIQ0NUXY3f54=;
 b=GI0jwgtBGnQVE89nzIFVOjdzK1JPP/lVqnHBjPjHKgavB6E37cTiouNuM+8/NUidw9x9E8sw5mjdU2MkXA/999AZosgCZTCeVkClQQTFadJs3b6F2cBu8pEeS6r53/QJfAD+2U/m0gbQkht3GqcwZi7lB7FD1DXhREjPueHbe8jsMhxv7YvKy3MVKUbMpzy5NcXjnnTXo9apwK1CkmLxxMOpA53bnsu7/mfCLtKaMVPOLOn8G9E7RLb/1RgyX9Z0nIcs17FWEWytUNLOQxuWM2Wnjk2Vw93NSowzLC9acKcF1Itj6WmaM0KFvu2gbRyRh2wjitN3eS6R4hsoLXhtiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6EUR05FT007.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::38) by
 AM6EUR05HT097.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::120)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Thu, 27 Feb
 2020 11:59:16 +0000
Received: from PR2PR03MB5179.eurprd03.prod.outlook.com (10.233.240.55) by
 AM6EUR05FT007.mail.protection.outlook.com (10.233.240.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 11:59:16 +0000
Received: from PR2PR03MB5179.eurprd03.prod.outlook.com
 ([fe80::5914:cd4e:9863:88c2]) by PR2PR03MB5179.eurprd03.prod.outlook.com
 ([fe80::5914:cd4e:9863:88c2%5]) with mapi id 15.20.2772.012; Thu, 27 Feb 2020
 11:59:16 +0000
Received: from [192.168.1.101] (92.77.140.102) by FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend Transport; Thu, 27 Feb 2020 11:59:15 +0000
From:   Bernd Edlinger <bernd.edlinger@hotmail.de>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Aaron Ma <aaron.ma@canonical.com>
Subject: [PATCH] Input: elantech - fix x_max/y_max values
Thread-Topic: [PATCH] Input: elantech - fix x_max/y_max values
Thread-Index: AQHV7WVVYTVl2cgg3k+48LjBx/56vQ==
Date:   Thu, 27 Feb 2020 11:59:16 +0000
Message-ID: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
Accept-Language: en-US, en-GB, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To PR2PR03MB5179.eurprd03.prod.outlook.com
 (2603:10a6:101:25::12)
x-incomingtopheadermarker: OriginalChecksum:A835BFBD5A89C80C4A3532F162A3C94726B0864F931F3748CD71DCED6EB0F6B7;UpperCasedChecksum:1ADFC1D5127C058C4ADD419C2149F02314F5B99A1C44542A36FB3419C40914E7;SizeAsReceived:7697;Count:47
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [9HcJat3D8YsDGOMh7MWukCqKGgwGRPUL]
x-microsoft-original-message-id: <8d6d8d05-fa9d-b1c8-a6e9-9af4ce7605a9@hotmail.de>
x-ms-publictraffictype: Email
x-incomingheadercount: 47
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 74011f02-cc98-4ab2-7b0d-08d7bb7c77df
x-ms-traffictypediagnostic: AM6EUR05HT097:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w5VTVXK7gQGnElD1GXk3XmsOsGdHiFewaqwTMLixzBVQqwScOhixPkDxI9R46tRZGbc/Uu0x1YrSaKNUHiwLtHZSN7Y+8RiY9MyDYku45v1pvBPQwAZ14GsPzJ+4UCPZqT2FQYqH7SaI05b4s8jh99el2wxxeqn9d1XmxSrLH7VEX2XkNTNLvI2j+RibEudf
x-ms-exchange-antispam-messagedata: x+iMtO6I/lwbA6yaU2DfbFqyRiNJBz6+cE4SUhgrZhvE5WEu1Ein2+yA953fxiRdPCfSfopo+/KILH45RaWJVk2H5NdEGS2mTkCrPnHgav1gMJxUju2XyqNcoy7fTRtIVe48lINwxnhXQ2jv+GLN7w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <CB78FBB99F4E7341884BD469B64B0D45@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 74011f02-cc98-4ab2-7b0d-08d7bb7c77df
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 11:59:16.1286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT097
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since 37548659bb2 moved the querying of the x_max/y_max
values from elantech_set_input_params to elantech_query_info,
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

Correct this by doubling the returned x_max and y_max
value for this specific firmware version.

Fixes: 37548659bb2 ("Input: elantech - query the min/max
information beforehand too")

Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
---
 drivers/input/mouse/elantech.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b..3399db8 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1720,6 +1720,10 @@ static int elantech_query_info(struct psmouse *psmouse,
 
 		info->x_max = (0x0f & param[0]) << 8 | param[1];
 		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		if (info->fw_version == 0x250f01) {
+			info->x_max <<= 1;
+			info->y_max <<= 1;
+		}
 		break;
 
 	case 4:
-- 
1.9.1
