Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D786B2FABCB
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394462AbhARUsB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:48:01 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67]:64404
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394486AbhARUqY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:46:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjpLpugAW53viAJF2tkvEG4WZVZlddW6MwKs1z80n7OTsRB3Q+tg/ML8sxb0FTkmuuqtPU3wi2kMaPC+oRaEFNilN0peLIzM/XbgPnUE4ntUUwCjNvovsefuWFx0xadFB2zFkEaz4HljPiWwvIScojwvDCViVhw/w6QK3w+atE1pKOiZxQEDS6trNeAspPJTQrCMfCo9SdqeKc0CGutOU+dkskK+xrKoF3ATocWEWioDJfzriU61+kfeYtu+0UEf+ORPKAeAGZN2OMeKVCp6sNWMZlHEFrLygqVuQs0lao1SJBqMkJu6hV21qTsBtnQ36ZRlmu8eDwbbd9UOJGNXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99tCFmaIP6J0T2csL+YpzW5tvg7QBkqXq6sXE9ql8VI=;
 b=gONKKbvvxh+jNWF9xebhifo6CRKk8ZCgHBF+9lt2AH1HBbwfKrl2Fki642ObPk9fKD9h3kWW33/gSpkqh0hFUbCHSC9fm0t1e59wZR/tywOLKcLPr1U6bNtTbDGdyPFMo5pt9fefzkKqcDfVsqSyd5OBDNNBH6qTI3AWc2z2kYovopEd5cEzh5sQdwxoLRj/KhoKNB/eP6wooquCyIkdsOycwSYi70nbIwtCfk4EbG6y3R/J7iSsw0HF8MMrQX98R0g8ne8zSBSZaiHJjgY0iMjkTL7kPuk4V7NRC6AU0Ohb8gikI8TXCs4Tj6IUnT5oEwyjkanJZy31jQU9y1Fe0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99tCFmaIP6J0T2csL+YpzW5tvg7QBkqXq6sXE9ql8VI=;
 b=CNYSiIqxu0isfaJV0jNKbVORvMw45FvHH8qOFTtiUOd1HxKl89LDwdd0/G3r4jBQ0bR79DTUock/TYy/CbgVnWCeDy0AIdprtdtOleI4QXoHbj/ALyRtrkvvyx1x/91oPcN9+jpW8YsN8ztnXtYkUJU/0q4lPg2lg/YCfz2NkzU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:46 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:46 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 07/10] input: iqs5xx: Eliminate unnecessary register read
Date:   Mon, 18 Jan 2021 14:43:43 -0600
Message-Id: <1611002626-5889-8-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611002626-5889-1-git-send-email-jeff@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN4PR0501CA0137.namprd05.prod.outlook.com
 (2603:10b6:803:2c::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f41aacd9-5d06-4ee2-6acb-08d8bbf1e3e0
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4846A4FB684811548DEBD3F2D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0b5FflrVgRjN2Rq/2/vnFiVj1NLLVA7JbHe1PrYw04MbU21OWGIjO3aCMjBhg+wIGTjZRdPPk02RP6RoqQwzUGDYyZYWPZw374nRFq9YdzPleNNW/fCBs01BxFnPsgUdObAr0jCIr/fq7/Jv5n5cO45E3YNMkepDXKRfUx3q8JR2L7y3vklfuDfIeaMi/QHAG6YMD4E7rE/HLU924vBN+Z5BY1DaXh0VglrAblHNaKTSj08Rkst943Q/wOh++MZT0dUGwmPCAZGRV2to/5FXxJNzFXEOBLpOKBiiYZsmrUoHzES4r95kPYjtn925X4jyatm7dnOzd7kyZIPLmGKj2jqASE+FgqiG1CifmDTwKqqrJoMe5ATpAY8w9BCKXNwY2Yo41KKcjhA6Q6XUAV5aXNNxwYWy1/T1MiwCefcaMi8gb628gS6nvAK2+vIv6HGR55H7v+RmdGO/lQH8fv1KB4emb8dgF0DoybUzdNP0K68=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?acG9U5VCo0DI/TMyZUTIX1DYYzZJT0LyT4opvhWa7hrpY3J/INw8KfTEWwGq?=
 =?us-ascii?Q?ghLubN2djtO/BzDkPF+V+QYtH3WJ/pRHzGMVc/rRJ6LId04xyPjhLZzQB26O?=
 =?us-ascii?Q?H8WPV+clv36DtCCXywOKE0aDvlGfCIc9Y+iR2itiIyHIiUlRH4MkGsxRX5OO?=
 =?us-ascii?Q?BsUiTMcwQ6ydxTpwTqXIIInm0gQPL7/LzkwnsB/aMntLrqLgX+AHRvlXD7op?=
 =?us-ascii?Q?poIeAz2kTRLNT3SCjLMwd0f97EUrxPMrj5UnPlsC4mFI4ItedCIEmrnmaRlI?=
 =?us-ascii?Q?7hUnfcb2Shl7DpXlOmooL9aBMTsfOWnzP3MUlaTnx/hSfNNnCrEpGqLwpJRo?=
 =?us-ascii?Q?M3e/jfEIOxNovO7NJjo9UaLY2PACvcaWh7OUABCMcifdbj6nqQmqaL+XDEFh?=
 =?us-ascii?Q?SkXDryqQKXZuba8ebf1Vng/QX9Jh8HtkGfV3HTOxG+ttMrAEQcqi7SFWwMJq?=
 =?us-ascii?Q?MtMi+j0iTJ20hFL35nSFoDYyZqoWdASoR+2n0bNxocFAuewz2hfNwD+mHLJV?=
 =?us-ascii?Q?OBE41g6Hdc78Ab5ddihTNun82EEGK2+JQFR9nQjTzg36pJrny+FAYY5VXTn2?=
 =?us-ascii?Q?jSG9xn9SL4irJGW4vep9+tnyxNynNDFh8FaSn+3wf/eD8UGNXe39yT3884+T?=
 =?us-ascii?Q?wUhIHWh58IQRPYvYZXQCwQ2JGu0QpICENlwYNbwqRn7KziCrfcvvoY/R2OBI?=
 =?us-ascii?Q?vp+Jh8pIeqRp+5dyAjZSA9Qgnsjgik6EwXyipXLCr+qR/JlM5ZttHN+yvDR1?=
 =?us-ascii?Q?M8VvttO5QrpdRBhP4vIDb1kSc8luNg6spN+jRk4kOrCXgRCGuc7yrJowzBqQ?=
 =?us-ascii?Q?8JBqGU4arEUCK4M4SrxPniRIasEUSG7fqWI/l7o1FxbMoEeWC+k4tiG9WERF?=
 =?us-ascii?Q?GoVaHy4olDwdegbzx2wNa/YF3IMX6euDRxyqvoNdb9Ex1ba78cbYi65sf0V6?=
 =?us-ascii?Q?Q5qCnTwRWgfO+kPb++Wsft59I2mrBZFxY3H/wiNv+8LvqsvBeAlFlnWtPYot?=
 =?us-ascii?Q?HZJf?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f41aacd9-5d06-4ee2-6acb-08d8bbf1e3e0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:45.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUg3GEVvJiWvKzhEE86zt/yieCy73pOS+xAG9UImfPvpztt8a1SAXHnjw5up3Ag5uxNK4GQs4+98l21BV5N04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of relying on firmware to enable important register fields
and performing read-modify-write operations to additionally enable
the fields the driver cares about, it's much simpler just to write
all of the pertinent fields explicitly.

This avoids an unnecessary register read operation at start-up and
makes way for the iqs5xx_read_byte() helper to be dropped.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index d802cee..50b9344 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -46,10 +46,13 @@
 #define IQS5XX_SUSPEND		BIT(0)
 #define IQS5XX_RESUME		0
 
-#define IQS5XX_SW_INPUT_EVENT	0x10
-#define IQS5XX_SETUP_COMPLETE	0x40
-#define IQS5XX_EVENT_MODE	0x01
-#define IQS5XX_TP_EVENT		0x04
+#define IQS5XX_SETUP_COMPLETE	BIT(6)
+#define IQS5XX_WDT		BIT(5)
+#define IQS5XX_ALP_REATI	BIT(3)
+#define IQS5XX_REATI		BIT(2)
+
+#define IQS5XX_TP_EVENT		BIT(2)
+#define IQS5XX_EVENT_MODE	BIT(0)
 
 #define IQS5XX_PROD_NUM		0x0000
 #define IQS5XX_SYS_INFO0	0x000F
@@ -188,11 +191,6 @@ static int iqs5xx_read_word(struct i2c_client *client, u16 reg, u16 *val)
 	return 0;
 }
 
-static int iqs5xx_read_byte(struct i2c_client *client, u16 reg, u8 *val)
-{
-	return iqs5xx_read_burst(client, reg, val, sizeof(*val));
-}
-
 static int iqs5xx_write_burst(struct i2c_client *client,
 			      u16 reg, const void *val, u16 len)
 {
@@ -562,7 +560,6 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
 	struct iqs5xx_dev_id_info *dev_id_info;
 	int error;
-	u8 val;
 	u8 buf[sizeof(*dev_id_info) + 1];
 
 	error = iqs5xx_read_burst(client, IQS5XX_PROD_NUM,
@@ -633,18 +630,14 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	if (error)
 		return error;
 
-	error = iqs5xx_read_byte(client, IQS5XX_SYS_CFG0, &val);
-	if (error)
-		return error;
-
-	val |= IQS5XX_SETUP_COMPLETE;
-	val &= ~IQS5XX_SW_INPUT_EVENT;
-	error = iqs5xx_write_byte(client, IQS5XX_SYS_CFG0, val);
+	error = iqs5xx_write_byte(client, IQS5XX_SYS_CFG0,
+				  IQS5XX_SETUP_COMPLETE | IQS5XX_WDT |
+				  IQS5XX_ALP_REATI | IQS5XX_REATI);
 	if (error)
 		return error;
 
-	val = IQS5XX_TP_EVENT | IQS5XX_EVENT_MODE;
-	error = iqs5xx_write_byte(client, IQS5XX_SYS_CFG1, val);
+	error = iqs5xx_write_byte(client, IQS5XX_SYS_CFG1,
+				  IQS5XX_TP_EVENT | IQS5XX_EVENT_MODE);
 	if (error)
 		return error;
 
-- 
2.7.4

