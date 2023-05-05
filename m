Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3637A6F8268
	for <lists+linux-input@lfdr.de>; Fri,  5 May 2023 14:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbjEEMA0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 May 2023 08:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjEEMAZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 May 2023 08:00:25 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2110.outbound.protection.outlook.com [40.107.7.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD441A606
        for <linux-input@vger.kernel.org>; Fri,  5 May 2023 05:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP5ghNQ16ry98yUep0LZq8PPy1kx+da42HaOUIUNIxwvtiWKtVO7etU70BjZ9UtQCOnkxnQee2aIpC5VaONnKu2dTzfO/ATOzRRaPq5zmaPQfYB57D+Pf+U1jZkj1Zet8eYEpeYK/jCyd2+fZk6Snr6DNfZwp0j5zFCR/xWs2UOaCrLqGXF7+Uajb2kMLLUok0/ZIMfYfZAF9az6FeiHP2oUhv5RGaZ+GoJ6y3hTto8DnOmVvU7Ra/4LEDixI9G1E6lpcOxOjvd5AiVsU11gjmI3XbEcJXVVV9+3G/4fQi2p0g07VwjdZ7oq81+gbJJXIONCxmJn2UMkxXMAq5parg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX8qekvsz+j7TYlXlZ99everJyV4qXJTXur/t+IZD74=;
 b=CbhxaJCjxeEwwJPc6VhTVYx2cJWfLiEZ0KfcxtIlaMKubh4iyM1kELm0r+wrLU9orK+ByYiQrEr7nPoNvDp3NVBCtTTIJ8QrY4gJkIcZU52oqOKXiv8J08ca/FR/aejlqFGRcxc7V3cwlPnweTJFkNgdkEiEXKSYLWeahFRpvU4i9wTak8jXeIKKMacRz2irInXo+K9UApa0slAqaCdoXEnFcMVSNIZWKevGnnzUsTnC2UuXC8p3ZRscK8CYdw5Tl5CAa/J6OBGmdPOfL/qTDAypCelW/6yiue3YQkXtLZ6+YQETpZh/X2SonoEN0zYQdMCOO5uBt/KapR3V3g7oOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pironex.com; dmarc=pass action=none header.from=pironex.com;
 dkim=pass header.d=pironex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pironexGmbH.onmicrosoft.com; s=selector2-pironexGmbH-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX8qekvsz+j7TYlXlZ99everJyV4qXJTXur/t+IZD74=;
 b=O80bPxUejBHg22DO99dMJGjBnaoBZGQlo4w4TkcRmuY1n9ou1GKrIGq4AZ1JzVpl8IxJIyRzq5O1Y7x4FVbcOQckpzWZv9nbAr2MI/QoxR+NFqi0SfSWo3DSplq4dfvdlBfX60OeFc4LjaxnTZE3FnkjCY4i4uUD7An3Tp2Aqdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pironex.com;
Received: from AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:158::19)
 by GV2PR10MB7486.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 12:00:08 +0000
Received: from AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::816c:a252:20d9:e2a3]) by AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::816c:a252:20d9:e2a3%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 12:00:08 +0000
From:   Philipp Puschmann <p.puschmann@pironex.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, dario.binacchi@amarulasolutions.com,
        michael@amarulasolutions.com,
        Philipp Puschmann <p.puschmann@pironex.com>
Subject: [PATCH] Input: edt-ft5x06: Add delay after waking up
Date:   Fri,  5 May 2023 13:58:24 +0200
Message-Id: <20230505115823.545803-1-p.puschmann@pironex.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::17) To AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:158::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR10MB3601:EE_|GV2PR10MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 298f60a6-8fcd-44d1-fb29-08db4d6045cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1m/rsIE76fP6uldxHLvF3x1bJf1lT7PIMquxHJu/ggam2zDafmbCKQVEjgF3J9E3eZqNH+m1y//+xM7WF62FDnqL/FxlKVzcElxfQyGtOd8BsgBM0FTKPHOen76nQpfB7KqQgr93v5zYIfQwQbjmZXJpbltowHmg9Lz9DDaUHOQ53E8O57JkmCfGNOHU6fmdOl6YUs0Aq2ym5E1KJaJhdu8H48w80V6s22a4dWijQNy4rVChWWg9PBS54W7HzChD0OQCEL5ax0UIQLdmURBNi7ahrd78gN/ZR6O8T8CAizEVFi69S6o+q3ghoVEI/Kq/I4fo0NCSizfn7m1JAT+dcVFvC6ei+6lVTAgg6sIQtvSahnivs1J/94GKTt2q2lwTr5aJzXDt/AfAj1FS+BuD95k6bpaq1Y/J/DhKLcGYCqEe8X+Qzt7vioRPP4nPUOyQLlwam+Bk/wAB2ds540r0bnpa8mBipl+UhUJNMMXbIKyAcGvVAzPUfg3Kl75s7gFIGD++Z7G7/lVP3/Fad/Cpq+XkmqTOLG68MNJgmzLCi0lsubLl/rP21Bt6tx1Xh21C2X4rTIHUk8c0qUvtyXa+eo9fm9oYJeCY/meslXH4OCZCOMdpmmSS5+FsOG+SFT8i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39830400003)(136003)(376002)(451199021)(107886003)(26005)(8676002)(86362001)(5660300002)(38350700002)(4326008)(316002)(4744005)(41300700001)(2906002)(8936002)(66946007)(66556008)(478600001)(38100700002)(6916009)(66476007)(1076003)(6506007)(6486002)(6666004)(6512007)(52116002)(36756003)(186003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4NW/VlNZIyjbzCWFP8Bcz0cSpAgBUQqGCxchYcSlWw0jRki3gUo4JZSB4pxm?=
 =?us-ascii?Q?GqIq0O0RVx6m2sU1PcwpG4Rj7Q7wJQ4xh1eGHXVrp/hfPyd221nlYjB5ddxm?=
 =?us-ascii?Q?r6IdZ/JksSjXYPVxKNUxsbm8Sdn1PMlgO4Po7ulI30TgJYJfaT8kV3BdpryS?=
 =?us-ascii?Q?6avb5EIrkrsPcqy4hjzhFXvyPch16abeGhq0pg9Sg/cG71m7kwTWPx/nSh7M?=
 =?us-ascii?Q?iyDvFyuXbOUPK7ARscvi2Nql8ptKaAZr0MtdMWa4z9xpT7pQGGMHE7b/ca9d?=
 =?us-ascii?Q?ULnLr0MVAeBU7GZdZgNlAtqg8HL0O2bBxhN5PT3c3SLOotj/9E0gQX+MKBwV?=
 =?us-ascii?Q?ozkwkKlop6impi+KaVEdCsiEkiaIyA1KxtoRNpW7M1ZJ1LdrXozNfEXt6vzU?=
 =?us-ascii?Q?aAlFNf7eJ0+vaCYwNSw6+Sf9cYRplnsLAHB5GwMfLIUuc5/tumDJARdi19yf?=
 =?us-ascii?Q?uDzvib5WIVK1N0JUGZNBWIj4PZUz1V29mF3CQMVKZ0ci+WzOaaXAkMs3erCW?=
 =?us-ascii?Q?8VJNubWMWzfoXM3JWLsVXfinQryx+SI6JN8ccw989uWBwsVqfN2BE2aHLXwz?=
 =?us-ascii?Q?UosffeJBYESMhw72bbXRXby9Rxwm9w/G3DI4xsvuGBiD3S06oWQdm3PCbYUH?=
 =?us-ascii?Q?vAV1SWsthz+eECs5l9jPUCq2500JoOaxEfQg1Ai9uwklXYtxbQFobdGqIWA4?=
 =?us-ascii?Q?2gwikoBUz+CZDv4Ux1RYGjjk691/oHbZi5hWehZljdpegS275gQHIOAhyWlB?=
 =?us-ascii?Q?IrwXrWKWcuW+ZM5+axk6T7JVntrH545NVbcmLzBk6jAemomDaFFH2MTi6iGm?=
 =?us-ascii?Q?M+YlOqxq+UuCM/MPIUdYot4kARhRW91PlqoSD1g7eLaMl5BF8JzQQxzg3DLP?=
 =?us-ascii?Q?RFU/LJqo+FI4+KNgMiPrpmZ0P/xUjnMSTQQaiBGPBVOtrgN0G2f7YHTXBTDn?=
 =?us-ascii?Q?NpOuoRGCXPoG1z1CEk/CKCUuvW/T/qbUeT8a7G583xdJMopVJPoIYZWqQwdh?=
 =?us-ascii?Q?Rlhb6sFhk0gijdBiX7NneEwjcTEFnK7qVLcuk29kGbcKuQrDzYO6dy4gGi3d?=
 =?us-ascii?Q?pO7syeUAM6GYi006iYuMTFzJv3DnLD1Mm/SVlNt8yTccjREuGFNZySGXf2lM?=
 =?us-ascii?Q?23tEL0188OdOz7uL4QmT5Lrrqt/Gdyf6imoq6DfrfSlufk8qi52OPKWJn1Fs?=
 =?us-ascii?Q?Unxhfd6Jl5j9t4UK9DtumtSISebfEWnnBCCDT+IxkCHSYcQmReStJbki4LnG?=
 =?us-ascii?Q?ifKVj6BWWLlCpwVJqSj68w1SCbZTlwH6J/Fud1Le1a8U4zNztlYD7962W5vX?=
 =?us-ascii?Q?f7VeTeFPYkG9W7+SPuS9P7rubcDOJnw866E8tJHo6HCAERXmJNggXBI6ywT/?=
 =?us-ascii?Q?Zj8LFXXcGwAT8vVQz7zziRnoN2lELfXiSnaXy3Lf/vqAG+v5ePYPiiUVgpaK?=
 =?us-ascii?Q?Vr53J5mjLM8+ippW6TmrTJblq1STrxqgNf4uhFzQbrBuUN6ESXBDAD1fvDMn?=
 =?us-ascii?Q?t2jxHHx5Jab85ae+rbkFUeLbmRoozLwrJXkm1JgMJK8yhv+gEurQh767m7WM?=
 =?us-ascii?Q?JyjJQh+lhWU7Jkiltna5hjPZdFhnCHXDTzS/LwtzR/09zTBS4z+6zZyrC9Gb?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: pironex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298f60a6-8fcd-44d1-fb29-08db4d6045cd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB3601.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 12:00:08.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00aa8e52-eebe-489a-8263-3195e0a468ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgyE5muzdEWV1qSa6ocSm33EFhbcVK/HWEcTjgXWXmBKP94lVSgF3egAYJSpMZPZKcqJvkjLgsfPyGDJLANwXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7486
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touch controller needs some time to wake-up after setting the wake-up
gpio. Without having a delay after wake-up probing regularly fails in
edt_ft5x06_ts_identify() with an error (i.e. EREMOTEIO) that was caused
by a failed i2c transfer.

The datasheet sets the wake-up time to 5 ms, although it is not entirely
clear.

Signed-off-by: Philipp Puschmann <p.puschmann@pironex.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 24ab9e9f5b21..3a1a5e76cd68 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1241,6 +1241,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	if (tsdata->wake_gpio) {
 		usleep_range(5000, 6000);
 		gpiod_set_value_cansleep(tsdata->wake_gpio, 1);
+		usleep_range(5000, 6000);
 	}
 
 	if (tsdata->reset_gpio) {
-- 
2.40.0

