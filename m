Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17673EB003
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 08:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238712AbhHMG1k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 02:27:40 -0400
Received: from mail-eopbgr150074.outbound.protection.outlook.com ([40.107.15.74]:18659
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238523AbhHMG1k (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 02:27:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akXw0FACeeNStdWiTC5a4XpGvsCIse7ABYkWx6jXBgtiU+RbgPad9nmZoDG/Xw6k5QVD/vySywrnThSAKXLrZFszYDtJ2+apzT1Mw5ckcn68bGSs9D9y14rB/lfq2iVaQOCNm+4RfoRWkAhWSACKs4/UPZmdJmOMFAGtEKDnAnAMVU308y6l1d7tc0AGR91LIy1x/MoiUONsfOFaU4a81uLWwYwrh0RA2DPLAh8YAy4sNjVjhujgRY1gexEtONLrUykJ2WWoO5T0v8uIKfyzxESY7xuTiH+m2kZ4NCYt/zHziPQ722xrEx2EBPCoxzuq+4yEKd1VXyJnlw2TAEcvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf1/Mhg9ke9LCkex7LchiW2xX7A4FaB+JV/GxfLTCmo=;
 b=lcGKNpS7WeCK3aK3QWp5Dwv+UR22s/tD2DgGQNu9FA733fKKUbkPMdls+iyo72FXCo5H6JX7KY1IaIDcvYKoIqQpTMJUBitoMNzJht54A3gZKY/g0fK0yrozi6aYWW/e4qUvnMl65myPp+q+LQ+LLeKwkT4ItyhWasjX6NA64st3s8PdQgmEZStqvxnlt+eFaBn4MPkr4k1NpgDZz4m9ToR+hFJaeX/lZ3d2FXUNQtBJzG5rvtvuQcWLnCYtd/XPSs6k7j2pBrDJvLFUmMsZw8kfv6OkEbb3ngVZ53iuZny6OUYEufpQMzHFfSt6xKCWu5oWun+050ybWwRk1hfqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rf1/Mhg9ke9LCkex7LchiW2xX7A4FaB+JV/GxfLTCmo=;
 b=T+pUX8iiXW2KNaFyKiZKUeNsmNWwSQUQDhDKjxmU6VXvriJO1QViWLttggfae7EpPkgQgrBLO55k0NiUUFlV/Abs4elHvRK/AjeoJNb70GHmHPJXRltz+/yli5NaNp7ifSY9Gykcy1bsusm4E+hAAmn8H1VDyoXjNeegve4vFSI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=kococonnector.com;
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com (2603:10a6:20b:281::9)
 by AM9PR09MB4643.eurprd09.prod.outlook.com (2603:10a6:20b:286::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 13 Aug
 2021 06:27:11 +0000
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1]) by AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:27:10 +0000
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     dmitry.torokhov@gmail.com
Cc:     oliver.graute@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v1] Input: edt-ft5x06 - added case for EDT EP0110M09
Date:   Fri, 13 Aug 2021 08:21:09 +0200
Message-Id: <20210813062110.13950-1-oliver.graute@kococonnector.com>
X-Mailer: git-send-email 2.17.1
X-Patchwork-Bot: notify
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::36) To AM9PR09MB4884.eurprd09.prod.outlook.com
 (2603:10a6:20b:281::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2.207.138.2) by AM0PR10CA0056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 06:27:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 590b5a44-d2f2-432e-99b4-08d95e2361b7
X-MS-TrafficTypeDiagnostic: AM9PR09MB4643:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR09MB464388F852312F94DF06A74BEBFA9@AM9PR09MB4643.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDkBOUrmSGRCQRnyC+076pFO7GY1N6loGo6aSLT3q1L4wMQUFlWKt1N0wpID99bKXHWBYPKS/vwasoqT4S8ruo24McueT6u8BP626WPWb9QZ6g1oXouSYf3t8VGTMi2GZeJOGOod/9OxP4wRgeouyAhqXm7ZIU50WI698WJw1taeHpIhQYEy/0X3JkZdlg5soqhWfpbMgBoRzrYR5vUHhXV0477KWR+kmV9w1fjc3guLCmzG8tCEw5WTortqlndP5LHKFbGz0thCF5pkdrtAcIkP4+Tv85MowePU0Dyq8oPc9ta0s2fzfq9cuW1rgWL3+RTuLTc4m9GTmvYf4CIxBnvEOaMGokVtTc5xrclpC93zgvR6jaog2VtcxiPi6e6CMdeOxxFgHUZZwPDMMruOJnBCQgd33cgIMA2PBxVsrYGf9wDJjJSjxke40mcYQBlb1tDjX+Q/PkD0j4/n3n9a0LRnsTUuFGfcG1q5UwjUbjamF/KOAoGGYHrLpFtGo2PdzRclHCeSEUEpJgC+pPkQdgZ2wWIb8uFBGcJ0lXeRwV3uPYsnHePCyH686a0FhFbKezmKyvnN+iMrfTmmWtDYxSCDftoR0UN/MqayAUnosuXWeFjsH9657bzJpbv5j6g3CG4ZYZ0kc9xedByLtYv1yTxSV7j3Ldw+15hmYXrZKc0TiYzQ6SL8PrIpcq4aj9mMKKjCqJ7S+RZT4RkID8S+Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR09MB4884.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(39830400003)(376002)(52116002)(66946007)(44832011)(956004)(2616005)(6496006)(66556008)(66476007)(5660300002)(2906002)(186003)(86362001)(36756003)(8936002)(54906003)(4326008)(6916009)(4744005)(6486002)(8676002)(316002)(478600001)(26005)(1076003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NamRQuV0KOH8cA6mbnqX79A99Iwph/+dOYok4t/tJ/lYBr1XO5vBIyDI/QLz?=
 =?us-ascii?Q?U1Ve19/7YlQJy2jwoVwTb59cby9TFav55b0a661itZJhTzRO4rp3xpJ/NaBI?=
 =?us-ascii?Q?vbeNl6v0qic7tnPCBLgoMu909sv7RxTRx5mLtFd/e9iFBnB9F5I1FGBy8ptu?=
 =?us-ascii?Q?lOF5ZeCxPTiVNr4z8PG2zeoKAHfoAi23E16WUYSlxGGFTdwRUqLurUOJ2y5W?=
 =?us-ascii?Q?p5OaCllWjQZyvtzYqZHLyETqMcF+2vyPgyEgXPJgQDevfqxD/UV5AQOuHxrH?=
 =?us-ascii?Q?YsX7sA//zdCkKMFU1l0klmb7yQZ7/yrfkOTLqanCWmfmPiKy5673FBT3YKgM?=
 =?us-ascii?Q?+rVl3MqDbxHkdtYw7GLLiSRvYTSyJVi+LkEiOlS+ejn94o4dhtT9Mholsl+o?=
 =?us-ascii?Q?3OQGxL4QwuS9BnkLBd1tI9rMbNPEUvdZ/UX4awif1TugKyTZeyO4JI5CnLtW?=
 =?us-ascii?Q?lI8OyaxWKp3kPANlm3c6YGuI2UHIGGQySiWAX2eUvOnxYggTYuaKEMh9QRov?=
 =?us-ascii?Q?koObxwk7l0TpE1ZTOtz3dZGXUbR/L9aAgb/XAl4Hn6DKEJ2UlxyMEBi5uoow?=
 =?us-ascii?Q?FleX7apug1HiuUp2AWyo6CltNkSMDGL1ah/aOs+FXfc754lq0t81zS9AOCad?=
 =?us-ascii?Q?0nZheOozLirYmvEpzcVm7iQMCMqlNt/+3R2uoDJTwOE4qOEFxWyNw11zShmP?=
 =?us-ascii?Q?y44GBWYuZmAhXs/j0bsMivzyQxwmVFSVRaPLOBSZA7Ivz2u3ku+cX05iIXgB?=
 =?us-ascii?Q?81XVCwHkA5duhwd4l/9VeJvSYlX6U0W1Ik7qsw2VPDjra+SoaVSTwJXfPBda?=
 =?us-ascii?Q?Ni8t9RETgWTT9oZu/gq3aGWBoX/5qsp0RQGYo3J2G+PdLqncRGk8WkCX7rBs?=
 =?us-ascii?Q?fEddQzhjpcMItdmhWePo3ulBgDPhuSLCNDG/mZvNOkF8C6EKrXVFPKJCkurZ?=
 =?us-ascii?Q?H3GxzcQh9S77zR1UzjahxeMh7wG/JE/PuZpAHInT0uIVgPmMRxVx9pdAYm8X?=
 =?us-ascii?Q?Z8R9OategSYq1TtmVfhRps64sjqyMsVHTvJaqTEdpYB2/mFVgmTHsDdNzUFO?=
 =?us-ascii?Q?2yDPGvXCz/O5awbJuJb8IEgubYV0N7MEFrcewKihZUjAFqhFQwZZAB9R6rp2?=
 =?us-ascii?Q?escHq/XUV8kjI/lmnPSSEGfq9PCgtGu+XyguPYlsz5SiXIsOICdD/ZVJmZ7m?=
 =?us-ascii?Q?MFzDtf5/nrYLMMunw0/jGMFfV0o1G+VSDNwBqvBf259yQyTN9VTie/NHMQAL?=
 =?us-ascii?Q?+QZeTl7dxSB3EJ5KT2QdElrjZhW33t37tb8cx4GAONdV9ztXDozdTts3VucR?=
 =?us-ascii?Q?1zYpq5dpgkvl7Z1DkMbGwNaG?=
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590b5a44-d2f2-432e-99b4-08d95e2361b7
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4884.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:27:10.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kck7M3HUJ3Cl3MBT4eqicsVCnf5HeS1/hiJ2OpUs0pkQEh2xua6qPxyUvMz+uB32xCaVGD1QRK6HhmmT5ySy7Ra2H+VekAfUKZqZUEjxrF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4643
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add Support for EP011M09 Firmware

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 6ff81d48da86..600c818b2181 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -895,6 +895,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 		 * the identification registers.
 		 */
 		switch (rdbuf[0]) {
+		case 0x11:   /* EDT EP0110M09 */
 		case 0x35:   /* EDT EP0350M09 */
 		case 0x43:   /* EDT EP0430M09 */
 		case 0x50:   /* EDT EP0500M09 */
-- 
2.17.1

