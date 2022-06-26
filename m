Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2655AFE6
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiFZHYp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbiFZHYo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:24:44 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D4210571;
        Sun, 26 Jun 2022 00:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSPMSH7Wp/Ip9wvGP9pFWGcEQgNUX5BTzem/nQZFNQZNnglCWCmv+haOx10Om3ytrKVu1td6rzHO2gt4qOCn2p0RwzIBAJgyBHz0JNhcQQi5APiSs8dZC4pNRhTNODlftz1ukwfhM81Aq4Tyy1zryRoF7kxWZOjAvKJe1kQ+R8Lz8wrudSlRsqDZzB6YttjHZSODaWImG0w9BS97PGdKcq3/y+h2Vanb9ccfwtUVr0Enp2dfiFNF47lP7CpCuYOdzabEmExuniiRXmjJhiXBUuPgKtzya+I7LndWMxOXG8DCAZEh5lXX/u2dO38cEzf+IVy+kJvQ+StRkVy9shJ9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lnNN83Xs0GUQ5fcRT0kNeDPc47CuH+MaGIvX5JJsuI=;
 b=Q+8FvfjWUDWYLLqm+oizgEz86qQ+crc2Qzv3h+9Fke6jcRl2QMVgXLZl4ZiGFD+ugLULWYwoFQKz3zswJqF1IiUpts2Eew8wyHahznIWWK2gSMrmWM4+tlPMs+dxm1LlLYIwRjSZgA7g8fAISP5wq3eH1TlX/0tr9DyRikwYuQ8HV/7zRHs0YsanNrwR+jXQuuPYoNza2WTOCQVl0HrHs/Tsh48WZNFemxuNoZP/C6X4fBrA82JKMyhHKSlkDTY4otq96OyYUBsiToa5lXdqJOhrRRorJCfYyBfxoujO/lSz7qD+pXEdZbw0fMZGE029bO7xEc6FgY1o4c49mpOxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lnNN83Xs0GUQ5fcRT0kNeDPc47CuH+MaGIvX5JJsuI=;
 b=smz9hdPBerh96q2zubAkfngwAs6rOVVcMsBeByB8Uuu3vWOq2hUEQtNn3tH9v+sMB81IP1Ie+vKLjy3Vzmd6sHcmf4rKmfBdBKB9p5SIPzr5RXTOO+O+uHXP6XN64dR45mlf1sqqScqOQy16CoStV8PLjJFugFkC/RAJWtZWIUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:24:41 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:24:41 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 1/9] Input: iqs7222 - correct slider event disable logic
Date:   Sun, 26 Jun 2022 02:24:04 -0500
Message-Id: <20220626072412.475211-2-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220626072412.475211-1-jeff@labundy.com>
References: <20220626072412.475211-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:806:121::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af4ad5b5-6606-4ff4-6382-08da5744ef7f
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpZvVGREAvkWRm5ofnp4t9te5K44gN2KOH2cV7mT9AU4OTxUkROKa+DOhtdfLycCJjHNzc3AujXSGfe9ssiT7ix6BrBDvAJ7dlG8a/T0jKwZOYjAITOwnwE92TrYAO9/AyaPAiUvhBDNbT3sUpZUAjmmRtsAHDSxePvA5ufzgNnnFw+1GFcarbQqYGma0YuM1GnIezYWd5FcUEbUlwxR2bpZQn30h/BPNnUS2ReqkJkUNZ2Qege9MIsQjQOmBILi3n5OdHOCOFn5aceyQU+U8Yjd8AVYIjUxTDCx81zhb8alnsCoHkkr3VC9LL187KWdtEwzAj8aBIX4fkMDiXkX+LKikNVeYsVrL3Ew5mBD4X2vmADd2g1+8HyaflZ5E2r98z5jFsArWtREOazNYv8187uQUzWyLaCcKA5JVphAYCwhFqVp+J+wQ5JAYBlzfbG/5Pr5WE80U81li0BNc1mH6LTRYza0Im2HC6x7n7bLo49TAmCFmixSXekAX/lQPVt3iXr9ROStbl8ZOlcgFyApK5f07tBozmL4YvoSB9OvjTHgQVmZuHb0NW8Dyg3YignuKLIY4xZb64l+6QVvp+E/JLnOaFdxp7DghTPx3mXUj4I3b30W1QR+PsGrFf/F0CqXhop0tt2TiW/mbIIkTFkC2S2V26y0dYoSaR4paOC+9lgNdrc2anOVIskGfTkpZmDqhqepBu7RMJLIdg4rE3UItZhkEq9U90gcU3AHEptSfqzZXoSW6pQpKGJYGhHEt8bjhe3I7DM5NR1FVNB+jw1sF7AomSqfhw6Fx4dciRyKSNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qx+ym9WN2rvisiYV8AKtvprgnJi+TJG59nrFNxwZ6fiCA1jYbpM/XdMqb3qE?=
 =?us-ascii?Q?5pWNy4+cINDooDfbSdcxSDF+OvnMZykg0zZxry2xOoPyB7mFro4shmiuiDNa?=
 =?us-ascii?Q?HTd1oHizbad6Lk9jI/raH3qTMTdiFYKAps9MQlmkDpN6e9R+vkvouuVpdyV5?=
 =?us-ascii?Q?VdnPmllYvfcb1IGJQcehLwFPEgSQuzIt6BLmkALHzzVFukkEzhPpfnGmByBv?=
 =?us-ascii?Q?CkHYkNFJxSHh6dAanulI2rEbnLav4YDkoy/FDukRBo+byuIV7QStQLXmkWRE?=
 =?us-ascii?Q?OqXCVltGUq6VS2s3f0waOxwdGJlOa2WounBlu+8HfDcZf+KX9ki+181fpCc8?=
 =?us-ascii?Q?2+J21/7QkqLoX6kAqYpBgMUuhFp5fsHGvEnV3H9pZetRBMihCitkmX/oVSP5?=
 =?us-ascii?Q?rRhIUDptnIWOzQ2gNfzVLIdH7P6Y+DfDMd4t2ccOic//e3GldW58ZrXAZSBu?=
 =?us-ascii?Q?J+zGV/Vk4HF8zpHOeRISoByjKd5rEHPPCd7B+tYN21a2SJUKuacLVMMShqDJ?=
 =?us-ascii?Q?/7TYqSB1BAsY27woxcmnENX3bcZ6GMmkT32RHPudaye0JIfVG1GK/0kWQVBj?=
 =?us-ascii?Q?P6e0FNd8mTPSzzBhdyfW6xvsgTLd0xec75um1SA8sMABjjM2VRtFS3UNKPls?=
 =?us-ascii?Q?QiSlxFWsQyPzgBdL4rmR67eZ66RXHCf8sEOzSLPiCAAvhdBZrKQR2hDZAx37?=
 =?us-ascii?Q?fiNp7VG2N+aQ+LWkn+Jh0DxF1cjYhXBgoXMm5FerhHDcWbJBcfVjhe2nOZFQ?=
 =?us-ascii?Q?z05tmQ0zq6uBPZz0mgTD8n7VzgimSW1ItAqF02gkM7xiRWEOzpmTsvWjXUIb?=
 =?us-ascii?Q?vGV+QOhEaFEzAG7FxqcMpIv7eXYCXf9f2TesWYwszOK6gHHpuaETKH/Hogfn?=
 =?us-ascii?Q?1VjoTqVJ4CSnSzkTI2rpa0kloYWqwExQvS7Ju/LH7EghYqRX82X5OOcSP1Jv?=
 =?us-ascii?Q?KTODMamf+azTmBEFXMRoOoKOiySeXnkyv8j3iUMGJVt0q7X6mc4br+Eb5Q9B?=
 =?us-ascii?Q?1+Z/OPMgrK1RVGSUgfAM2zAsJ14Aw7d9d0e/TfOa/k6na8epsFwSU45/kPpB?=
 =?us-ascii?Q?paH+EbJABz+bX5HQoIHo485IqiMT7MyMOEJQRni/pg4b/xqRfbm/Lbiil1Vx?=
 =?us-ascii?Q?9acM+vZMl5m2/GW6sPCSg3O+MjT6LK02PTLdjoDN14Ecs9DbJLF+cQ6GhISc?=
 =?us-ascii?Q?8ebIASshzx+Q27SUMhIj5ppmIjCB8n3AwPoPf5hGrB2Wvl1L5Ggq4IRxDZtn?=
 =?us-ascii?Q?FrTzS4P1+38izZmkIid8mJFh0qyeCiuav3YJ66WuOs/eP/9EgZKZF1tNtjdZ?=
 =?us-ascii?Q?CFDB/KuB37uTKg6RL5jmrGAOQqEfMXEgiTPGjMUwk2mCl0JQFWeEcxc387dq?=
 =?us-ascii?Q?02GzG9L2HLuFiiLMwcmC+cBqfCLQ3wXzL4fTvMnT3pmsFGzqqwNT9YXujk53?=
 =?us-ascii?Q?lWtHILiwuoI8w/DE3tr35zS6hIjiP4traIr7JqQV2stOuSV00W58hOd/8EvE?=
 =?us-ascii?Q?yRh2UZtetNQI9pFWMT29ys1Ag5y9qCSS3IzJl4vn7mr+LUO0gwpnMkkWM00U?=
 =?us-ascii?Q?qF0cbw+JLDrB+nm29Rp0TfRn4LLra3cM5z6iNoWr?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4ad5b5-6606-4ff4-6382-08da5744ef7f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:24:41.4935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWvZt1QVr4TbM96QcsgLFv+wzT5tSaLR+cfQOkYXmulaAHJsjNnRokKHmxFHKZgW0i1rx7uDunbHf94ilvhuLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If a positive swipe/flick gesture is defined but the corresponding
negative gesture is not, the former is inadvertently disabled. Fix
this by gently refactoring the logic responsible for disabling all
gestures by default.

As part of this change, make the code a bit simpler by eliminating
a superfluous conditional check. If a slider event does not define
an enable control, the second term of the bitwise AND operation is
simply 0xFFFF.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added to series

 drivers/input/misc/iqs7222.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 6b4138771a3f..53df74f3a982 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -2081,17 +2081,19 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 			sldr_setup[0] |= dev_desc->wheel_enable;
 	}
 
+	/*
+	 * The absence of a register offset makes it safe to assume the device
+	 * supports gestures, each of which is first disabled until explicitly
+	 * enabled.
+	 */
+	if (!reg_offset)
+		for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++)
+			sldr_setup[9] &= ~iqs7222_sl_events[i].enable;
+
 	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
 		const char *event_name = iqs7222_sl_events[i].name;
 		struct fwnode_handle *event_node;
 
-		/*
-		 * The absence of a register offset means the remaining fields
-		 * in the group represent gesture settings.
-		 */
-		if (iqs7222_sl_events[i].enable && !reg_offset)
-			sldr_setup[9] &= ~iqs7222_sl_events[i].enable;
-
 		event_node = fwnode_get_named_child_node(sldr_node, event_name);
 		if (!event_node)
 			continue;
-- 
2.25.1

