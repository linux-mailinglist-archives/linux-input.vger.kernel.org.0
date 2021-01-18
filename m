Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656FC2FABEA
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388600AbhARUxp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:53:45 -0500
Received: from mail-mw2nam12on2082.outbound.protection.outlook.com ([40.107.244.82]:41600
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393965AbhARUrC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:47:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE8SB5MVvCDPhrnIMrV9WvlUHYUXVS3bhlEKMmzRQ8Qr8JYP+nyL5KQMPxPHJAMu5q7yKOxQ3y58XW7t8g4bgM4R5U3TswMMOBWBXAvTJ1wXqfpS/N1OsE4x4MFDFGCotgcLxQ2phHzblzqdua8zA+wLEzOIAxVzueIzsuK5Ye9hheADDIIGd1lLVWL28Hc0hKhy0+amOeza5w2tAF8vN8+zLCVKtE9JzyFdc6upred3uaGgXOhenYZH14E3idEnb6n2D3rvpW1TvbNqXS0bKCBoHIx3uyUaMMMyqisKwhT6b91hmtDy9AIZgkpnUXXz2R/oOJlxRIOCDVtwstMk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lw3PHopsNnuO4c0cZYCaXl3JgtQ7M7kRfKOK6Pvp3Go=;
 b=hDUYmIR/Q0v6M60x0xE7eVS78T4zJalYYpyXn5d13AD8Xn8KOMWsFxrL44hk3AhRc5cLGDL2CMnTqnKm8TsRmJJaEz9A8o0oSMnkKsNcn8pvcQQxk4DVRzw/J0MJ4g9zwYJ9bMCzkbL/PEFaQD/O3gHVeHu6uGlnB/veYTxkyTik31dLX8YYu/s29pznPil7enTwKhT6LnBpbWmkRrWyH/kpfPCVfqd0+k+OV1oiA2snL6pCXtb3S/6jZTt0lrxNbkSNTcm+8m0kVJmgGek81Dz8psVh3ImHEa6uT7MtvP7Rh2WC/Lid1ylMKwdNK1JRHT8FYwaJDY2syG8ZyZqqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lw3PHopsNnuO4c0cZYCaXl3JgtQ7M7kRfKOK6Pvp3Go=;
 b=GogmlxKQe26pJw8+LXiDf8USzts6FJi6uV8e0A+pqxU4t1lu5v6zTj3TOmZEN84qpcezDWuCP94npJmURHKJMM1CtsCznwoUtvg2ICnmpXrEOI1gkP8ffDzLl20sqWMHHzuuEc1wiHMFinN9P05EnfPmkL+vnmrBCPmNaC5yNEo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:58 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:58 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 09/10] input: iqs5xx: Make reset GPIO optional
Date:   Mon, 18 Jan 2021 14:43:45 -0600
Message-Id: <1611002626-5889-10-git-send-email-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2474bf77-d1c3-4ee9-c893-08d8bbf1eb4e
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB48461E0FEDF84AB3C3231BC5D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0uD4Y7N0nv9OmheLZBlpCFvYkQt9OyTLZmEMyH07fpd8zrsW9zHKtdlBzO4FilMvbC5Tun8r+9Axx+lV6kEcnHvS7T8+DJ6kcEHY77X/SOe9PVrkG8yiJ/NmInXF98s0a2BGrS+AonpCGEDVNeVcmxJwxZQIP4Eaq/BgcqhRLcchkfcyHkchGwb6gc0gZToM4D+P2XVXT5xewUEliuFEoLFV+bF77bU4x/nSfH8Qad61FE19FTc4L+9tsLF9R/+ZHRtKSVun4ZzHM66Ge2POYDfhTTf4ZTWlSpuUbinJOnhXyCSGTlw9wgkALSvEHMN2TXQ+EvC//9ymCIuWwd2U08jXPEZey99Ret2CCbzbORf3ZcGX3SdNaWxNTfs22hy21tJdt35ZcGPAaR5KxMiJ/AIg1+9B/AA1LOUHlEDQnWSkLZcabe/WkBK/zgNaC4jB2310YkiOsZbJTgUyhAVCm4+5mm3/FJ1EGfVW0G2h+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y+Ph5gs0ji7t3kN4w32MdoWnGhhlKPlco65StriGaYboeZWSJ9ReeZHKpxPz?=
 =?us-ascii?Q?/U+soEDmWGLd4MzyE8ZASVS2VT4LwC71oZ5X2IJKGJof0JqyhBH2lYqwhkYZ?=
 =?us-ascii?Q?QRel6BGyqCxR8b/rbBUxsb1VcdFQToboob4nxxeTzrK3w7W3O1ljIIrzxJUo?=
 =?us-ascii?Q?GYDlhlOtHNSDoBxapKX5+UKcA/TqAqmNh3I9CPXT2OmQBeSrLW/jd9NAmxf5?=
 =?us-ascii?Q?Xts14f8Pt589fdXeo02XdshuBCRyXqgwZjHlSs02YN2M6Nt1ZE0GCr3PHwy7?=
 =?us-ascii?Q?clbWJ5bFUPguwnCdYgDl2r8zmjCYG6jNSLW+b3Jrn/BBAHmkGBZJ4MrtdlaX?=
 =?us-ascii?Q?Yg2zbIPBHBAxYR911cj540t/RmFx2mdNVFtTsM5s6+1/BRvImf2VNOZA200R?=
 =?us-ascii?Q?MNh6kGSUJFHrcwPgyd7r5mIUdKq5wMwpKFKDlE1Kv/u4XuYGXQ42CyMOArKb?=
 =?us-ascii?Q?ZmV4IXN84VeycIknk5zgCHM2KUdASTfyNiNqqG5zrwZylvft1p54e+qi4O7Z?=
 =?us-ascii?Q?5M1gR0hGArQFmxwDdzlSerBTO/5agLVZSjjvPpfPFIljHdWlnD+YBf0aTjBD?=
 =?us-ascii?Q?J1XOzE0RWR89G7t1hwkV9dvQIsZ8lUsVwFffVA4TmJQ3Ir3gkeyKZLrGCiZS?=
 =?us-ascii?Q?FYTY7NlT7x5wJ/PGBtQWOFnE+n8HwOGnKO+RvIzpxq64okX2qQmWvHh8Y5lf?=
 =?us-ascii?Q?+XvbkyqH3/s/1iqtvdV1Sz1wqTfJ6b+uXG4Gr7h44+uycQs8d+m1CP5grpQQ?=
 =?us-ascii?Q?CNRGDtLggUQx6GnbK4GQrybRG5TsvlyF0pheNnjR/RxH6L6pAWu4YlMqXm4s?=
 =?us-ascii?Q?dDEYsyt9SNa3x0ggw1kZirRCbJcPLe1oPFJb8jsffduBuuHkYEW2wTQHPMdA?=
 =?us-ascii?Q?6ANIUuZfJIRr2z/E+SNB21Qrcu3AdsE+FIrhtMY3RPTB/khALbMKbzOSxGxx?=
 =?us-ascii?Q?h4wLOnNpqWYZt7xD+TJlC3Yp7Lusz6F0OegAlqC9PmUnRlDKOpUP63Xy25CJ?=
 =?us-ascii?Q?WX6m?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2474bf77-d1c3-4ee9-c893-08d8bbf1eb4e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:58.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNpWi6lAkkIQzb/bTGNzP4PLcp8rOgpQG3lGvBVsmPck5tVz7G6JnK9JtA2vbZ74k+RLSW+1uAR5hMtxos1jvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device's hardware reset pin is only required if the platform
must be able to update the device's firmware on the fly.

As such, demote the reset GPIO to optional in support of devices
that ship with pre-programmed firmware and don't route the reset
pin back to the SOC.

If user space attempts to push updated firmware which would rely
upon the reset pin to wake the bootloader, attempts to reach the
bootloader are simply NAK'd and the device resumes normally.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index babd1f1..dac132b 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -242,6 +242,9 @@ static void iqs5xx_reset(struct i2c_client *client)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
 
+	if (!iqs5xx->reset_gpio)
+		return;
+
 	gpiod_set_value_cansleep(iqs5xx->reset_gpio, 1);
 	usleep_range(200, 300);
 
@@ -1045,8 +1048,8 @@ static int iqs5xx_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, iqs5xx);
 	iqs5xx->client = client;
 
-	iqs5xx->reset_gpio = devm_gpiod_get(&client->dev,
-					    "reset", GPIOD_OUT_LOW);
+	iqs5xx->reset_gpio = devm_gpiod_get_optional(&client->dev,
+						     "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(iqs5xx->reset_gpio)) {
 		error = PTR_ERR(iqs5xx->reset_gpio);
 		dev_err(&client->dev, "Failed to request GPIO: %d\n", error);
-- 
2.7.4

