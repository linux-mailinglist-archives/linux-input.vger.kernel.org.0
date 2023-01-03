Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1FD465C58A
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 18:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238401AbjACR7k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 12:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238339AbjACR7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:59:17 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF4111A09
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRnMD6DZTfKqb2MWTKKUQnKwXYZ9KSQ1Ioi/mHVvVBU79OaLpldgYxS4JvsFAd0nMaETmDeRlbBinFim8GlCvaXUDyYY/Zx8wdo4rUwBd0dczNZZesaADNzYKEzGqkvGRoQfuZtyNk7/2bbiEP6mTMsPTCb29T8Asv0/uy608/kWMyDBJCrLElZieFjD1b/eG4XS8+RFIm1EIEloitU6zdJnphyvCNR+GqrS/e7xZ+pym04Uh/kN1ueKKJSHAtxjJSoCZJb8vjJfL+7td223meyK8FMy0mR9PqGQHFh3Lof4IOz6WWzfm+bAlF6uVbxUlHJtYB6D/xwcgmKjn+LiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eCUba0lerGkttyGd3zinZJ9+4yK75ibktkHqKSZm14=;
 b=ZzBcvMYrcwK8xTi5epNj7Osy2MJQq+hJFxwpjxCxWuBsvpqQcA7rtr97YxkjWvM9oOvSAQbqFNgXw5+w5gKxvxiUmIHVsRRflp7TniOjA4WdmsL6v+rHLqo8HY8hm9a5l3MMaLQUG9nPFXWRbfXkr5d9QDe2ck6zCEUg4VGcVUnFhydYILIBIEZS362Mk8uMePJYbOVdBkbhrQbIeWEhgbbw/5Omd7E7/twfLrwbQ9n5lw8fXxwYbHagSc5Hlwvsxw7PwYAEJiNu0wcH3mEsl6E/IPwbcuHIg5Wv3vZ0wK7NgAbVpm+XyioLOfPf1dU74Eb09whRxlACI9nRFAk+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eCUba0lerGkttyGd3zinZJ9+4yK75ibktkHqKSZm14=;
 b=qmzHy3PrEODux5r7XI+BzgDEO84N93ArqouSz8Dsim/jS+N3r5nasDdzf4jz6xU8ej5TVMNM9Lw4/2Xz45Wi6YDZUi+ofj8n6oKwVG4qlH0IMTfBqU7++lBx4EUSIEyr6VPlozLSDFKZcG1dPirKllRPIEC4pNPYUc7lomQ7MfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB6592.namprd08.prod.outlook.com
 (2603:10b6:a03:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:59:14 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:59:14 +0000
Date:   Tue, 3 Jan 2023 11:59:12 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2 3/5] Input: iqs269a - configure device with a single block
 write
Message-ID: <Y7Rs8GyV7g0nF5Yy@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7RsTqhYJOZs11sK@nixie71>
References: <Y7RsTqhYJOZs11sK@nixie71>
X-ClientProxiedBy: DM6PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:5:120::29) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SJ0PR08MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: eaaaa282-9724-42df-c650-08daedb43981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JfqMda+9xv8LkNn2H1BHJT5/Au49/HwA8p+bbcDNYSLRf+pd+6Agt++AhMa4D2UCSahdKgEKINzYUo9mqnteZdd+jAl8dIXtFKE+PS2+j9O/iDG5oBEWPfVTra48/HEnxQIgsknwmciJIppuTdXjwo4XB/HwueTYeJ70Al7ilJvR2cg15j9HZ3Gc/jZweLKCX1OdiksKruRlSFg1hL1rJApY/ec3q+zReIxmwVopuzlZPONRYoezxdjTMhZC1dqieBvFaj/NNVvSfc+2cpnlHBfk0lwMIMIneH9axyYlPOCBxRChsEZT7qIJJll/ImX1HH4z2uUH6B/jPTLMZaAUhcJvL+24qD5CBaSL3V9fWgb7T6095DaWW/c7YTCj5vT/g5CfkeTJFS2022NKvJebBoDqRhYmEJcQ5MtmvDe534egrC9LzsjOUKjj+lMCJ50hrI3AxLikSJYwy8sJfV8SCNwb5hEGQgJ3diDoJdG2vD5L4NdVnrz18m2s0Fnk952wAy+65vbYYXERd2D+RDkRYyUUiC93VrXPhVmKwngicqhaYMER+kzF5fb6YbJEfo+JkcCnBW8V82DgaIH7kSrozMY+J1c8PR5yCT/BDCKf/xsjPiLGv8LUFbXvBzoy25UvzeZ/CTfNiOc9jz51MdcubIh6annoI6t6GbiIdTJdvU6NFJxgRG+YmUTqTDMnWBmH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(376002)(366004)(396003)(39830400003)(451199015)(186003)(26005)(6512007)(9686003)(83380400001)(86362001)(33716001)(38100700002)(316002)(6916009)(2906002)(4326008)(66946007)(41300700001)(8936002)(5660300002)(8676002)(66556008)(66476007)(478600001)(107886003)(6486002)(6506007)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cIWUEi+nvSGdIqHh9b6DwQRzo/13Sc8hsH5Wx1+3HU/NVLVfy1AD5/XvESMO?=
 =?us-ascii?Q?sZy/g5OaKeEYT7HAIcUuVlYMNGfU5Lg7HS5zYnUGoTetEf6SxOPe0aF+Feno?=
 =?us-ascii?Q?1M495RDnIqROhH+uZ+uaT/TdZVikvw5lfYPjfeUhLu+3bBteZrvV3AlCYZL3?=
 =?us-ascii?Q?FkkO7Bla2h9IQyrDfA984ue9yYaeMau8fT7sNHGdyoLKlHzCRlWw+5NlRi6a?=
 =?us-ascii?Q?5kaEf+Y+9XX87KPKhP9WsAQJOT1fkPepcR42xWySuqa/CDUwtNYm+AfP6o4d?=
 =?us-ascii?Q?TRcF/RTC7Jl2SoZFQEtAtkgU+ivDI8GydJfNuyMVKxMv8sS0EHFqNhKfDrUU?=
 =?us-ascii?Q?l2lf7HAKV7AtnlyuxDiqKoOi3zgvXQmMfNP7ArXmONuRu5abLVFzFrQIOts6?=
 =?us-ascii?Q?lsbmezQBuzMej9eO2nCMYbhwBPnA3amgjl3X/eZwjUtn/1+tf562j2FL/9y2?=
 =?us-ascii?Q?qVGYwiS0xQ4tl4Tepcq9h8aZID9QEsswIpbVFjJz6ipVgfWpZAH6cVMz6i+H?=
 =?us-ascii?Q?G+FwVuJxfjjg7feFzkClGjVAaK7S6vy/FSylr8BicstjzDWM8MNhrLmUKRRb?=
 =?us-ascii?Q?WqzOdar+qo1q4chBBMzjDrOXFXO7UUDzrorF8TtXWThWkwe/Gw+/Qyw/mUxv?=
 =?us-ascii?Q?PRxZjR2nziYlagQ1nF/iU1R45fMna5wPCm+xX4sxYOm/OzQtN3hZsoF71MPr?=
 =?us-ascii?Q?yoSZLUSfs1hmUAsCVWS8IbHmrFJDwxy+dD35bRTv9/5CaqUpciOje8B7TcVj?=
 =?us-ascii?Q?chY5xjR4udqc2CRRyL5GOP2u1Cqc5u8et7GHmEIDvZK2KKNyirr/8iizdvKe?=
 =?us-ascii?Q?AYb1zunB4maLERG533RlsuDPTJIGW35EWBHIPk6tRLOVTAO8rjIjpKdKcn9a?=
 =?us-ascii?Q?6tKn2LTZ5kWl8Rmwc3jBWP3AQddI+eAz3XL24GKJAtk1lMSBaL9ButlPtHzT?=
 =?us-ascii?Q?09joTeH7VHE0yaAi65MMMY5HAlf9xudSlwL+TNE5chkoNDjxCU0P0DvsSnUO?=
 =?us-ascii?Q?jAz6MEXHlgCsPC0IMlzmXCYG3ulhJ+3OdBoxDj9b+pAFELRi47fyICxjfbyg?=
 =?us-ascii?Q?QspQj5LJioHJa5A2LIOEfhHqb0kASVsCsmw7HlFK4yDyRCmgjtRb+JL8ZykG?=
 =?us-ascii?Q?5n2IvDb+q7Cj7SB7Q2vjIB7/tgAo9lWSg0+e2Zf8JUTEoxM7H3hnHjH1tMZr?=
 =?us-ascii?Q?4fZE+19pzclieyqQVa+oU03G1WnT5KVoTWL5ReXyHgXKZGzOJAgmxg/ESdJv?=
 =?us-ascii?Q?e8Fkk/RWZAVCwk8eiGwa0zcLp/wfrhGjMth/hSqOE9dK8tTO438rAkL+V0K4?=
 =?us-ascii?Q?VTc+WHJ2MIrtFBm1ae1PyN1quN7JgB/5/nRkUqDGHtLOUtKAUN0JJjBJV7YV?=
 =?us-ascii?Q?Wdac+cHHN8jZ9kDQ9PVKTc5bLmt8TdcYjvKII2/cpCZyvnGUlVFaxcsMcS4a?=
 =?us-ascii?Q?z3D/zeC/3Eb1cycvE4HRdGelh/Bvd82Pa9PjhmzIkhj6mBcv723IADQSgSuS?=
 =?us-ascii?Q?gVLUt3D0HvEgufVE0janV/zRZyg8wjFNv48W3Q1abV6cgYdqncqqoMlLaTk5?=
 =?us-ascii?Q?CVv5uWWXLFYTCLCyNPBMLRz2sjFbZMbg+cBMHyVC?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaaaa282-9724-42df-c650-08daedb43981
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:59:14.2298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8nDdceFIGoRwt7a0BfJhee6QdfCiU2BHLp23nlyoSTGTFO+dVrP+XWghO7LMnSY1qbWNQKjANXBno0f5ImUAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6592
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v2:
 - Added Reviewed-by

 drivers/input/misc/iqs269a.c | 98 ++++++++++++++----------------------
 1 file changed, 39 insertions(+), 59 deletions(-)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index ea3401a1000f..1530efd301c2 100644
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
@@ -1042,10 +1040,8 @@ static int iqs269_parse_prop(struct iqs269_private *iqs269)
 
 static int iqs269_dev_init(struct iqs269_private *iqs269)
 {
-	struct iqs269_sys_reg *sys_reg = &iqs269->sys_reg;
-	struct iqs269_ch_reg *ch_reg;
 	unsigned int val;
-	int error, i;
+	int error;
 
 	mutex_lock(&iqs269->lock);
 
@@ -1055,27 +1051,8 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
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
 
@@ -1349,6 +1326,7 @@ static ssize_t hall_bin_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	struct i2c_client *client = iqs269->client;
 	unsigned int val;
 	int error;
@@ -1363,8 +1341,8 @@ static ssize_t hall_bin_show(struct device *dev,
 	if (error)
 		return error;
 
-	switch (iqs269->ch_reg[IQS269_CHx_HALL_ACTIVE].rx_enable &
-		iqs269->ch_reg[IQS269_CHx_HALL_INACTIVE].rx_enable) {
+	switch (ch_reg[IQS269_CHx_HALL_ACTIVE].rx_enable &
+		ch_reg[IQS269_CHx_HALL_INACTIVE].rx_enable) {
 	case IQS269_HALL_PAD_R:
 		val &= IQS269_CAL_DATA_A_HALL_BIN_R_MASK;
 		val >>= IQS269_CAL_DATA_A_HALL_BIN_R_SHIFT;
@@ -1444,9 +1422,10 @@ static ssize_t rx_enable_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 
 	return scnprintf(buf, PAGE_SIZE, "%u\n",
-			 iqs269->ch_reg[iqs269->ch_num].rx_enable);
+			 ch_reg[iqs269->ch_num].rx_enable);
 }
 
 static ssize_t rx_enable_store(struct device *dev,
@@ -1454,6 +1433,7 @@ static ssize_t rx_enable_store(struct device *dev,
 			       size_t count)
 {
 	struct iqs269_private *iqs269 = dev_get_drvdata(dev);
+	struct iqs269_ch_reg *ch_reg = iqs269->sys_reg.ch_reg;
 	unsigned int val;
 	int error;
 
@@ -1466,7 +1446,7 @@ static ssize_t rx_enable_store(struct device *dev,
 
 	mutex_lock(&iqs269->lock);
 
-	iqs269->ch_reg[iqs269->ch_num].rx_enable = val;
+	ch_reg[iqs269->ch_num].rx_enable = val;
 	iqs269->ati_current = false;
 
 	mutex_unlock(&iqs269->lock);
-- 
2.34.1

