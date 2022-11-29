Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B4463B87D
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 04:04:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbiK2DEP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 22:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235458AbiK2DD5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 22:03:57 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E5C4FF85
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 19:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRci4RMu8ASaZsUrcKHe6pJUhUaHAoKMHbRydoEy0KChv8S/5xBLg58NCsF7+GvgJbKqxDccqzxtz4uf/gYA76lyL73F7cG5U1BzUHFSaPAYBgjBGfqGe6WdWQHnJXFMMtasnc7cgiIbjr7KT7hNP58sO9ELbCeWZnVjfp/aSTTrwo04R7OC3nMH2nPTts9UkU1cETZ2taq51JQFgjHQGZ/gZGl/Ij6yER3QOxAo/sBoxFnAsUy/MMixWccK+7UGKBctxiI4VYllTDm0G/bq9wMepnNjtTx1vJNi6FR0XcSOP6eCJnLdZFQjS+ciVQZQveLiSZ39VrmAuZgLn+4Ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl748P9VVPr8yxU3X6hVRhj0uPvP3R8mafC+8GLGff0=;
 b=RBefqvCjT3miCAf9Fi/EtJ4mxKItLyZqyZLAIHeRrbOZrZlJXwm94Pzw0zBFmF0r8/41dNgMBcDau8EkFnkz5HtE0Hz3PNmIDvwNe/p5Rp6z8B7jcwcP7waWowCr0bmlnB/HpYwmAZaFcYcgG0EM05uoEVaM43y7pocWEs0E4iCrh1Pw9gMVhKTN3GHmslq281IR8IzhwSVDTK7SDHQR4xVp86oogmwTe4dn/QDsE0uHVGno/MKXrhbzjnMkeLkKeJRK2ilMbDSqDuJC13yw2yyPtX0T7SW8dUGQSikr0rmBGIzzPU//rv7ofIaEJHbhLwrPvLMsmEdxky+b9nYTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl748P9VVPr8yxU3X6hVRhj0uPvP3R8mafC+8GLGff0=;
 b=W4nWscQ+WGQ4KTxREAlUkp1fw5NglSAcoBG1UI3fySZsvMc3rMqBa6W6G7KHpyvrVpYblKLEm2zPw9VOfbWAA8eZQIY4yKX+objpP7pDhnO6EDxw3XFUmVce7ynb68E0zr38SHdPQNwJnEa8HoKio7Nhb+ILfd5XyPG5sn96dfk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BL0PR08MB4546.namprd08.prod.outlook.com
 (2603:10b6:208:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 03:02:43 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Tue, 29 Nov 2022
 03:02:43 +0000
Date:   Mon, 28 Nov 2022 21:02:41 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH 3/5] Input: iqs269a - configure device with a single block
 write
Message-ID: <Y4V2UUxc94P9YYyc@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4V16ey6osEaaZJ/@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71>
X-ClientProxiedBy: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BL0PR08MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1d3b7d-6227-419f-2225-08dad1b62f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RclgqhdrEXKglbvT2sH8OFvdWghK1uZGOwcf63ktYLy2yJKq9KGCAkcRWoiHyp6nP7bri3UQ7KKVa7FK2CjrYCvzhjWqqWcV15JI7Fk0v61okFf7E8BSHWhp4bGI3Bz99BAtT1hy2vXrcl++rgBUFEtB0XZdAK9d5wt8AwRUlRkryix935sBbFF28DkOii13AUM1HntUyR1Z4v27dzIP2QE40xzjH5nz7AnLIVxUMhNGUL7oEKnRMEXN3IEbHrW0zAmXCi1CFGkFp2rYD+j7rLDz1A+jg9+qy1LbnKpttSXwM6G0ItKrA1+Er93zyBXuZCknOZ0HpG8gmqxKKbgYNItMYiPjGtgIsUG+vXLG+jEPjcoAAwp9CftO3bzqEOXreEAc++1OCrp9FHD2vz8UJ5DfvifRhcEeMpkmahUo1axt0x4vhlNpLqp5VsVxLxgu2yaHQ73gVVm/gveEIyjN7hl4bWdzxcaEKU41CnKxuPjFmPWy5gJOXzKbC6Y7PU3AOwqdSOyGoyld8ZbxGSKCCdtRWByFwFzbhMUnM9w2XLwuS0G3E39SNZM17fdOY98qdzqTVsBsTyxpb6sa/3h97hoOfwqMLKDJuAKDj1G1iVVssCfsFts8r3qMGH53h2FkFzQSAFecipugTUdfWiZxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(346002)(376002)(396003)(136003)(366004)(451199015)(66556008)(8936002)(8676002)(66476007)(66946007)(5660300002)(41300700001)(107886003)(86362001)(33716001)(6506007)(6512007)(26005)(9686003)(83380400001)(186003)(38100700002)(6916009)(6486002)(478600001)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6pkQ5XIHO/eUz01rZWwSUlWbJVTOMdjBVpMaIbEado0v3dNIbdPRL4UzXYZ8?=
 =?us-ascii?Q?rEVsm6tKUfJoxSBAXKi/SYTEi8CrPskGRlDtAlNg9rovKj5xsT56k/K9FPj4?=
 =?us-ascii?Q?8bUEq1ZMZTEHfkcZYNBDsv0QqC9Fzfb1inxjQD2oBCkYJag0NeZr0tMsYa39?=
 =?us-ascii?Q?R4w9KFcyTsX029q0Nl5mf7ojNyuMRCzOOCx3NjaWOJNvPnsgybaKgESPLWn4?=
 =?us-ascii?Q?4YdYSeiGkw91/Aa7ekSC+ibdAX+T2bKnjxX3p0cHiTh+oUKfjgXf0uNx42bu?=
 =?us-ascii?Q?jre5XdsA0wzH26nVhlISwpndlcIupM3gxwTcG619MElWGtenHL+AC2wVM9dn?=
 =?us-ascii?Q?OBCat9mpAKy812VXurNoxZ4IyBevfjbjaFyT3xBITgDtAw/qM0TEPBPxf7SE?=
 =?us-ascii?Q?+swINLMztXhBRYKloSchqBLDbld51EegW8oggXUhFKebPgEo5wlNeiPq1nwz?=
 =?us-ascii?Q?qOPhdfrSE32844WjYH3dXXXb9MMIoFDxFA6icTX8bmCjDj7vZnNvcAfxPlQE?=
 =?us-ascii?Q?xLcA1GbwUpKM0TptznNHLKzgvmc0UMq3v3kXWSuwCp4Pjs93e2VOj5AlXkcP?=
 =?us-ascii?Q?STspNLjNfVSrB9HiiYqGbLb7Lrqi6ZQAvVm0mtyJEBPF3c1D93Kd29l/OFE7?=
 =?us-ascii?Q?ucMgdRmzLFBrP96Ny1q8bTYdITjqGBSZ3M27E2jZclS8BTcMnkG0z4vCpGa/?=
 =?us-ascii?Q?8CK6dwnPTUCztrPvSF5Fdl08x7iQLQiYLKMv5BkkQ5NLPBxlfU2jYkOpNlvw?=
 =?us-ascii?Q?lGWcjvnzDwYHepvpxEv5jCHIdxctdlPM26adnZ8iE7BCcZisVkUi7BVtHEpe?=
 =?us-ascii?Q?uCpHy1FyuVk/yJjhSuv5zJVX99eWYmaFGf+hyLqzhhjRTZmz6C0noiKL+F0/?=
 =?us-ascii?Q?xHnTJ90o+hq9rusFxoIdLbFEcMErG7kB0b8njrfIw31sPm5MFVcsRAuussNa?=
 =?us-ascii?Q?gOpdBJUHOpbqKcYVHKbpQQC5wW0WQnwzoh9YHmpPgUvea34JjpTnvgAC6ufg?=
 =?us-ascii?Q?Ndm9boxt7+FJsNvFb23Mtbf3TltbhbbWukvNRGUTKGhVdXno0psAxsb1w7wg?=
 =?us-ascii?Q?cIhTlcr+6DHhvGpdqi6yJfyQIkDUpvTkrljTg01PU382LigS+iY84eKqklhg?=
 =?us-ascii?Q?nCB3hFeE2wa2cwliQgowFjCDex5q23uXl8Pd98Jo3lx2U7clwhyT7VFkSLEC?=
 =?us-ascii?Q?OUOvjUEz6NWqZSCRrKVvwzp1bGRvCDGHr7cVIOCsyJpJfB8IME/7/TEoHPDm?=
 =?us-ascii?Q?hTxKhLyOAN0avnwB23gLcmRvGZJjmodA1lCnQpycr9xmdh/Y22h+eFKQr3E+?=
 =?us-ascii?Q?BZFPC9Ww/2MeqCOHl6sGMOQN+PYOcWbyjcq4SYr+38/5lWBsbu860lzK5mCr?=
 =?us-ascii?Q?VaLx9ps+474E97GwqwQyWdZV0Tr2irtiq2uGZrr39aa05gVcmMG6ClqHwjgJ?=
 =?us-ascii?Q?UNYHqWTHZwv8LxksTIgy7ntzC2T2WOUXxrkG6FMaizqTjDVhZcj+nUjiC/dz?=
 =?us-ascii?Q?Fzuk1GP56uVyuHBAUdMFZh1EAEXJbLa6VlZT1I1fauQ4y92sh8VdHtx5ikzu?=
 =?us-ascii?Q?Lv1Br6rRGSyE9A5lJxDxrT0XFr9H8muOwLqdyGOB?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1d3b7d-6227-419f-2225-08dad1b62f6d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 03:02:43.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCImSGU9VjX06KI1ltemGfEOITJ4dBEQfLngvOxwHMhiRkqogP72vHqA+VMbiN9lrw2UhimvR2jsfRyBZNMPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4546
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unless it is being done as part of servicing a soft reset interrupt,
configuring channels on-the-fly (as is the case when writing to the
ati_trigger attribute) may cause GPIO3 (which reflects the state of
touch for a selected channel) to be inadvertently asserted.

To solve this problem, follow the vendor's recommendation and write
all channel configuration as well as the REDO_ATI register field as
part of a single block write. This ensures the device has been told
to re-calibrate itself following an I2C stop condition, after which
sensing resumes and GPIO3 may be asserted.

Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 98 ++++++++++++++----------------------
 1 file changed, 39 insertions(+), 59 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 711e67db71a4..0eb3cff177e5 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -96,8 +96,6 @@
 #define IQS269_MISC_B_TRACKING_UI_ENABLE	BIT(4)
 #define IQS269_MISC_B_FILT_STR_SLIDER		GENMASK(1, 0)
 
-#define IQS269_CHx_SETTINGS			0x8C
-
 #define IQS269_CHx_ENG_A_MEAS_CAP_SIZE		BIT(15)
 #define IQS269_CHx_ENG_A_RX_GND_INACTIVE	BIT(13)
 #define IQS269_CHx_ENG_A_LOCAL_CAP_SIZE		BIT(12)
@@ -245,6 +243,18 @@ struct iqs269_ver_info {
 	u8 padding;
 } __packed;
 
+struct iqs269_ch_reg {
+	u8 rx_enable;
+	u8 tx_enable;
+	__be16 engine_a;
+	__be16 engine_b;
+	__be16 ati_comp;
+	u8 thresh[3];
+	u8 hyst;
+	u8 assoc_select;
+	u8 assoc_weight;
+} __packed;
+
 struct iqs269_sys_reg {
 	__be16 general;
 	u8 active;
@@ -266,18 +276,7 @@ struct iqs269_sys_reg {
 	u8 timeout_swipe;
 	u8 thresh_swipe;
 	u8 redo_ati;
-} __packed;
-
-struct iqs269_ch_reg {
-	u8 rx_enable;
-	u8 tx_enable;
-	__be16 engine_a;
-	__be16 engine_b;
-	__be16 ati_comp;
-	u8 thresh[3];
-	u8 hyst;
-	u8 assoc_select;
-	u8 assoc_weight;
+	struct iqs269_ch_reg ch_reg[IQS269_NUM_CH];
 } __packed;
 
 struct iqs269_flags {
@@ -292,7 +291,6 @@ struct iqs269_private {
 	struct regmap *regmap;
 	struct mutex lock;
 	struct iqs269_switch_desc switches[ARRAY_SIZE(iqs269_events)];
-	struct iqs269_ch_reg ch_reg[IQS269_NUM_CH];
 	struct iqs269_sys_reg sys_reg;
 	struct input_dev *keypad;
 	struct input_dev *slider[IQS269_NUM_SL];
@@ -307,6 +305,7 @@ struct iqs269_private {
 static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 			       unsigned int ch_num, unsigned int mode)
 {
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	u16 engine_a;
 
 	if (ch_num >= IQS269_NUM_CH)
@@ -317,12 +316,12 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 
 	mutex_lock(&iqs269->lock);
 
-	engine_a = be16_to_cpu(iqs269->ch_reg[ch_num].engine_a);
+	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
 
 	engine_a &= ~IQS269_CHx_ENG_A_ATI_MODE_MASK;
 	engine_a |= (mode << IQS269_CHx_ENG_A_ATI_MODE_SHIFT);
 
-	iqs269->ch_reg[ch_num].engine_a = cpu_to_be16(engine_a);
+	ch_reg[ch_num].engine_a = cpu_to_be16(engine_a);
 	iqs269->ati_current = false;
 
 	mutex_unlock(&iqs269->lock);
@@ -333,13 +332,14 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
 static int iqs269_ati_mode_get(struct iqs269_private *iqs269,
 			       unsigned int ch_num, unsigned int *mode)
 {
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	u16 engine_a;
 
 	if (ch_num >= IQS269_NUM_CH)
 		return -EINVAL;
 
 	mutex_lock(&iqs269->lock);
-	engine_a = be16_to_cpu(iqs269->ch_reg[ch_num].engine_a);
+	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
 	mutex_unlock(&iqs269->lock);
 
 	engine_a &= IQS269_CHx_ENG_A_ATI_MODE_MASK;
@@ -351,6 +351,7 @@ static int iqs269_ati_mode_get(struct iqs269_private *iqs269,
 static int iqs269_ati_base_set(struct iqs269_private *iqs269,
 			       unsigned int ch_num, unsigned int base)
 {
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	u16 engine_b;
 
 	if (ch_num >= IQS269_NUM_CH)
@@ -379,12 +380,12 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
 
 	mutex_lock(&iqs269->lock);
 
-	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
+	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 
 	engine_b &= ~IQS269_CHx_ENG_B_ATI_BASE_MASK;
 	engine_b |= base;
 
-	iqs269->ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
+	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
 	iqs269->ati_current = false;
 
 	mutex_unlock(&iqs269->lock);
@@ -395,13 +396,14 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
 static int iqs269_ati_base_get(struct iqs269_private *iqs269,
 			       unsigned int ch_num, unsigned int *base)
 {
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	u16 engine_b;
 
 	if (ch_num >= IQS269_NUM_CH)
 		return -EINVAL;
 
 	mutex_lock(&iqs269->lock);
-	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
+	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 	mutex_unlock(&iqs269->lock);
 
 	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
@@ -429,6 +431,7 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
 static int iqs269_ati_target_set(struct iqs269_private *iqs269,
 				 unsigned int ch_num, unsigned int target)
 {
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	u16 engine_b;
 
 	if (ch_num >= IQS269_NUM_CH)
@@ -439,12 +442,12 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
 
 	mutex_lock(&iqs269->lock);
 
-	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
+	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 
 	engine_b &= ~IQS269_CHx_ENG_B_ATI_TARGET_MASK;
 	engine_b |= target / 32;
 
-	iqs269->ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
+	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
 	iqs269->ati_current = false;
 
 	mutex_unlock(&iqs269->lock);
@@ -455,13 +458,14 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
 static int iqs269_ati_target_get(struct iqs269_private *iqs269,
 				 unsigned int ch_num, unsigned int *target)
 {
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	u16 engine_b;
 
 	if (ch_num >= IQS269_NUM_CH)
 		return -EINVAL;
 
 	mutex_lock(&iqs269->lock);
-	engine_b = be16_to_cpu(iqs269->ch_reg[ch_num].engine_b);
+	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
 	mutex_unlock(&iqs269->lock);
 
 	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
@@ -531,13 +535,7 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
 	if (fwnode_property_present(ch_node, "azoteq,slider1-select"))
 		iqs269->sys_reg.slider_select[1] |= BIT(reg);
 
-	ch_reg = &iqs269->ch_reg[reg];
-
-	error = regmap_raw_read(iqs269->regmap,
-				IQS269_CHx_SETTINGS + reg * sizeof(*ch_reg) / 2,
-				ch_reg, sizeof(*ch_reg));
-	if (error)
-		return error;
+	ch_reg = &iqs269->sys_reg.ch_reg[reg];
 
 	error = iqs269_parse_mask(ch_node, "azoteq,rx-enable",
 				  &ch_reg->rx_enable);
@@ -1048,10 +1046,8 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
 static int iqs269_dev_init(struct iqs269_private *iqs269)
 {
-	struct iqs269_sys_reg *sys_reg = &iqs269->sys_reg;
-	struct iqs269_ch_reg *ch_reg;
 	unsigned int val;
-	int error, i;
+	int error;
 
 	mutex_lock(&iqs269->lock);
 
@@ -1061,27 +1057,8 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 	if (error)
 		goto err_mutex;
 
-	for (i = 0; i < IQS269_NUM_CH; i++) {
-		if (!(sys_reg->active & BIT(i)))
-			continue;
-
-		ch_reg = &iqs269->ch_reg[i];
-
-		error = regmap_raw_write(iqs269->regmap,
-					 IQS269_CHx_SETTINGS + i *
-					 sizeof(*ch_reg) / 2, ch_reg,
-					 sizeof(*ch_reg));
-		if (error)
-			goto err_mutex;
-	}
-
-	/*
-	 * The REDO-ATI and ATI channel selection fields must be written in the
-	 * same block write, so every field between registers 0x80 through 0x8B
-	 * (inclusive) must be written as well.
-	 */
-	error = regmap_raw_write(iqs269->regmap, IQS269_SYS_SETTINGS, sys_reg,
-				 sizeof(*sys_reg));
+	error = regmap_raw_write(iqs269->regmap, IQS269_SYS_SETTINGS,
+				 &iqs269->sys_reg, sizeof(iqs269->sys_reg));
 	if (error)
 		goto err_mutex;
 
@@ -1355,6 +1332,7 @@ static ssize_t hall_bin_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	struct i2c_client *client = iqs269->client;
 	unsigned int val;
 	int error;
@@ -1369,8 +1347,8 @@ static ssize_t hall_bin_show(struct device *dev,
 	if (error)
 		return error;
 
-	switch (iqs269->ch_reg[IQS269_CHx_HALL_ACTIVE].rx_enable &
-		iqs269->ch_reg[IQS269_CHx_HALL_INACTIVE].rx_enable) {
+	switch (ch_reg[IQS269_CHx_HALL_ACTIVE].rx_enable &
+		ch_reg[IQS269_CHx_HALL_INACTIVE].rx_enable) {
 	case IQS269_HALL_PAD_R:
 		val &= IQS269_CAL_DATA_A_HALL_BIN_R_MASK;
 		val >>= IQS269_CAL_DATA_A_HALL_BIN_R_SHIFT;
@@ -1450,9 +1428,10 @@ static ssize_t rx_enable_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 
 	return scnprintf(buf, PAGE_SIZE, "%u\n",
-			 iqs269->ch_reg[iqs269->ch_num].rx_enable);
+			 ch_reg[iqs269->ch_num].rx_enable);
 }
 
 static ssize_t rx_enable_store(struct device *dev,
@@ -1460,6 +1439,7 @@ static ssize_t rx_enable_store(struct device *dev,
 			       size_t count)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	unsigned int val;
 	int error;
 
@@ -1472,7 +1452,7 @@ static ssize_t rx_enable_store(struct device *dev,
 
 	mutex_lock(&iqs269->lock);
 
-	iqs269->ch_reg[iqs269->ch_num].rx_enable = val;
+	ch_reg[iqs269->ch_num].rx_enable = val;
 	iqs269->ati_current = false;
 
 	mutex_unlock(&iqs269->lock);
-- 
2.34.1

