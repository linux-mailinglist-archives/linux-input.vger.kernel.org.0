Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A854655AFE0
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 09:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbiFZHYt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 03:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232885AbiFZHYs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 03:24:48 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BCD62EC;
        Sun, 26 Jun 2022 00:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biafuLtUsftPxVG5ED7PRIbysbQyE22tKGIKKBCtdRRpU02X6RKvaa76Wr5WT4kWUtnvBhMxgbLTbnpx96DvNhwDnISw8b//DwToIcSFsagEiWo65khd/4as0dLlTXTedgSmqN60FDBF/dun83SPGlWtqcaXR+/GXswahYRQYxLvXakG9j6/37Cf+AbW5uoMhYf4dww+8Xd842bWArqXUUd9W5wmLbgrsI3NBuAtRNYAj+idJqs5Sjhxsv+DiBG3AdmccjjNZUWDh2yEx0mZ94UP58GZCGJLwrbhrkCBxvjYNNuduzJLmABhr79NFt6SvshYs/DhIRZ3ILVAJ95etg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LngwRDPwhEJcu35ghhZTz38U9Ak23ch7jnKxkmah7aQ=;
 b=m9iFhqVJx/gFU7hWQ16gPLXEE5AYpNXefg7sRTQEA5YPUGkk3VLof9BWJrw7x1EK6WU/4FlYrwgnSfrAZuJYnIgj0U3Gp6VCyGEkAgUdm2BZZxXlDJp1G9JtW9v6XSpv3QKukxLFEHysePsdUwr6M/P/nUjROdDcLxZyS2rMPFl98L/6FC5jysYyjf2DrEnEVrjxufVR56f9c0u7+EcmKv7fqxGn56Tp1pjwa5jXZ+dBCeUNNii40Z3Or868ar0O2bPN+4hNc0uvdNSsbFrKKf0BiSSL0z7CSs7DTirh4/u1cNMyFSH36eGG5zNK0WbOyT8iaRaBjG3+jqhSPlLUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LngwRDPwhEJcu35ghhZTz38U9Ak23ch7jnKxkmah7aQ=;
 b=giU+fIsqIcnH1myRkDvyk28GH+sL+f8hf114/j/ejRCxRl+FFKETvFFIsgfqdlfMZTn4g9ciAuR6ruWoH9nmdNXYGbFiieY1f11gk1Zocz8Pjw4zd76+pi0IVlH9In8mt96tECMbdpyRQtoWWjLc4ms+5IZMzz5/le6RmcnSJ+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN6PR08MB3395.namprd08.prod.outlook.com
 (2603:10b6:405:66::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Sun, 26 Jun
 2022 07:24:46 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::2c67:a29a:4e8c:3ac0%7]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 07:24:46 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 2/9] Input: iqs7222 - fortify slider event reporting
Date:   Sun, 26 Jun 2022 02:24:05 -0500
Message-Id: <20220626072412.475211-3-jeff@labundy.com>
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
X-MS-Office365-Filtering-Correlation-Id: acaa5d6c-490f-454b-81f7-08da5744f237
X-MS-TrafficTypeDiagnostic: BN6PR08MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCfnKsOdiOvbuvR+5tDdCUKr2anr3HimMxoKvN7Qpe1UxH0llWcjtUwqfXirEKhaT7MiVLjee5SbLyEiJrs6Uiw+BD00+1GZnGJrxZfNI6JsmNcX6F4uNcAq6tnLwE5wGcuU6+q3SUhRDWbZBlyjl+yGCpkQTXZ+JSRzVCbLBsGOmn4Ldhnr3G1ZZfep2r456DnyVQyDVKPj+oijDEYx1K7q0RFQMxVS0lPQgUcmY0nQmndjx+QJCakLWzVsDUrq/HaaEnAJWZNTtb+pHK5xiBSsrKaOwbeO3qoecTYSt16okAs7G1MMuJ192W2xL0gTBQy01tJIzaqcJEfo57uNHK0NslySLMTsPVazuvJVZ5phzEJNDZQ/5klBMcEX6t2eQqwwbCVyHpQe1CTKXKZLXvWWeGnGvGEzJgu+krdoUn3dlF9dzb22dYHQoqkePfh6tkt6RycAZ4Msri8I6FoMwUmA/afqD0g0tgUMIKn1AOB1n4mQDWB6UR1GF6HHDAygCtmc8knBtij2YqTDLuJoCzQdYsMQ4bYIeydW3P+Q+M88HXGAIw4dz5VnbcGVHSp/EtUBEgBsdmJr8kIWBNmmshYXGrdtlmt3XREFeN08MFZTfSXInz+4+2ydMLu8IUELP7AzuHLyyW9HA+VEXOWQhkcJRiLFcWC+eY3cmY9Dd/sex1xXxAa86DtgXJxrQW+KpYqXOebx4Ht76A4aO4vVLgRXqr0alk0aCIBmv62m/lUL2FKuvRH31tGFay+2GfWepD27COhV+P//RPetHaDKkIbRzK+yG0Cz5GFAZDaDRiI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(39830400003)(136003)(376002)(396003)(2906002)(107886003)(6506007)(8676002)(316002)(83380400001)(8936002)(86362001)(1076003)(36756003)(66946007)(186003)(6512007)(66556008)(38350700002)(2616005)(52116002)(26005)(38100700002)(41300700001)(478600001)(4326008)(66476007)(6666004)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LwC9Fmx76wO2cJvnj8LNzhgsAgng2Ts6lXVx+0JjSWsOhl1vw7WeEvikkdme?=
 =?us-ascii?Q?SBBMk0Nnu2yZHd9yUHH65yWx3QfCY8c7/yMbgHESeTftEic46qe3f50wHcss?=
 =?us-ascii?Q?BorYnYKRFDZcpxF7Sd8bgnSzktIZ9kCO0T+1Cm9dko/IEeoIaXnb5lv73mjt?=
 =?us-ascii?Q?xnofa9rhAlGzlVb3yYe7sS2rsQ1AIf+VyKzd+Dtqi6YTm8SrMLgCiLskY1xT?=
 =?us-ascii?Q?/7uL3HIigtvfG00BPmFfNCUJQ21NDTPymnMo42LAt5Lm9CJyIieR4P1CDt5I?=
 =?us-ascii?Q?2VvAf5VFWd2foAMQkaB63fCaJ2HCR0TuXHDtPQZBaLgWpNPW7uAG0aaICIpO?=
 =?us-ascii?Q?EzA5v3dF1tDNBpVywBRVOj45N/OF0d61YQnn2OfQZmt57IindMqS6kqTUXL1?=
 =?us-ascii?Q?+omRcSY5KI/80kSeb6lPTFEaSCv45WkRwvvfchSid1tbWawG00SSZha3buC8?=
 =?us-ascii?Q?aD2EQEDZIP2CqTWUeCfJh8lzMkUsXzPgdftKeE6DlyapwLkgz6Qwz+xVtJ3y?=
 =?us-ascii?Q?Owl+89jYbCIK7sheH/8GW2kh0febMZJzhkopS67socNuDfpw7BghdXaHDA9P?=
 =?us-ascii?Q?5bB2SOq1V7pITs4AkV1d7zSfxmnwphHr4lYDGS9YraTxtHVX3hUISSZmFZX5?=
 =?us-ascii?Q?OIdITZyNx0n2G3UHGGGyYkCU3fsAZzQL7xYLNbuBGfHMJLxaHJcRcDzK85no?=
 =?us-ascii?Q?6lPmijK8Mqwzs+ANaO/S7FS20xWdZBivypPgujiFq0LuOfhX+t+0UNDtUu4+?=
 =?us-ascii?Q?K0sJy4s88PuFNZ4hsjolf1P8aKQpavHzdHvUhGmdQNFQgd0fanglqRtrqc3Y?=
 =?us-ascii?Q?inUb9ltcT0PrS06usiPgXNgBHUrn1D/xdIXhOt90Wj62IqrHFNZIVhZkFIaJ?=
 =?us-ascii?Q?64xLSA3sao75oI0N8DRm0YBeTlAz4wBnosxMrGZEWtNCZWnwuigSQF6lCelG?=
 =?us-ascii?Q?uH01eyqKTKSyKi75cxC80xYe10fJHpuABgRiFS/XSaibYcYekiT57dC3hqP3?=
 =?us-ascii?Q?YcNKGziOXurPHwS9jTNFEcKPQ2ITMnoR1WaBxBOuL1Bwo72EnDS/0lBspkXT?=
 =?us-ascii?Q?GEjn26LjIB5IH1AyCYHTjQSrQvZXmlR30XnTHMpGJ0DGROhfr73EVMUY4zQW?=
 =?us-ascii?Q?xtjeBvT6aMQ7mvCFSJf19oyuJt/SAembFP4Nog7x35mvgkMvhvmwvbt3TH4B?=
 =?us-ascii?Q?Hovlxm1uK3rh3Cgu6qCddu5Q50IzOon+gHEYBhErsXWEScmGFGaTmexJqzaz?=
 =?us-ascii?Q?T1plU6+WtFWvxU4v2LMCDqU1pl1eyusVa45HUwvmflHg3cHNfIhwhXej+cs4?=
 =?us-ascii?Q?1h+xfOcFwFGb26JUWEzLhiUDUnJ0KQ6EqTPd25S7n68nJMe1ZoqED5pOS0cR?=
 =?us-ascii?Q?AYPBAnJ+rQyhRty0ANlr23tKOcJ+WrJ9u651MNqAg+ghO7r2PzQg5YHM80aF?=
 =?us-ascii?Q?uRSBSI5L4giU+bt+wEyJ8cMt51girCZ/ooSgRCHNlqRjm6c5E2H/htWbTHsj?=
 =?us-ascii?Q?C5YhJl+1wJmVARNdcztyldX50/EgMQ6lLLdyQdxliz09+6F8Vd9nNVlcGzD2?=
 =?us-ascii?Q?TfBgAacxuAQPVSOQ1ANQ2bZPPtL+jMf993ITBsLI?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaa5d6c-490f-454b-81f7-08da5744f237
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2022 07:24:46.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myn29WLPBlYbIurOapA8e/L1mTxjDtctmH4nBgrl1+f0blLuuEu5tSKEHuy5aXUViBBYQGjiOmiANoYH2L9lBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3395
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The release cycle of any key mapped to a slider gesture relies upon
trailing interrupts generated by other unmasked sources, the timing
and presence of which are inconsistent.

To solve this problem, explicitly report a release cycle to emulate
a full keystroke. Also, unmask touch interrupts if the slider press
event is defined; this ensures the device reports a final interrupt
with coordinate = 0xFFFF once the finger is lifted.

As a result of how the logic has been refactored, the press/release
event can now be mapped to a GPIO. This is more convenient than the
previous solution, which required each channel within the slider to
specify the same GPIO.

As part of this change, use the device's resolution rather than its
number of interrupt status registers to more safely determine if it
is capable of reporting gestures.

Last but not least, make the code a bit simpler by eliminating some
unnecessarily complex conditional statements and a macro that could
be derived using information that is already available.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Minor refactoring to include GPIO-mapped press/release event
 - Added support for proximity-mapped press/release event

 drivers/input/misc/iqs7222.c | 96 ++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 38 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 53df74f3a982..57616a7ebeae 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -40,7 +40,6 @@
 #define IQS7222_SLDR_SETUP_2_RES_MASK		GENMASK(15, 8)
 #define IQS7222_SLDR_SETUP_2_RES_SHIFT		8
 #define IQS7222_SLDR_SETUP_2_TOP_SPEED_MASK	GENMASK(7, 0)
-#define IQS7222_SLDR_SETUP_3_CHAN_SEL_MASK	GENMASK(9, 0)
 
 #define IQS7222_GPIO_SETUP_0_GPIO_EN		BIT(0)
 
@@ -54,6 +53,9 @@
 #define IQS7222_SYS_SETUP_ACK_RESET		BIT(0)
 
 #define IQS7222_EVENT_MASK_ATI			BIT(12)
+#define IQS7222_EVENT_MASK_SLDR			BIT(10)
+#define IQS7222_EVENT_MASK_TOUCH		BIT(1)
+#define IQS7222_EVENT_MASK_PROX			BIT(0)
 
 #define IQS7222_COMMS_HOLD			BIT(0)
 #define IQS7222_COMMS_ERROR			0xEEEE
@@ -135,12 +137,12 @@ struct iqs7222_event_desc {
 static const struct iqs7222_event_desc iqs7222_kp_events[] = {
 	{
 		.name = "event-prox",
-		.enable = BIT(0),
+		.enable = IQS7222_EVENT_MASK_PROX,
 		.reg_key = IQS7222_REG_KEY_PROX,
 	},
 	{
 		.name = "event-touch",
-		.enable = BIT(1),
+		.enable = IQS7222_EVENT_MASK_TOUCH,
 		.reg_key = IQS7222_REG_KEY_TOUCH,
 	},
 };
@@ -1957,8 +1959,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
 	int ext_chan = rounddown(num_chan, 10);
 	int count, error, reg_offset, i;
+	u16 *event_mask = &iqs7222->sys_setup[dev_desc->event_offset];
 	u16 *sldr_setup = iqs7222->sldr_setup[sldr_index];
-	u16 *sys_setup = iqs7222->sys_setup;
 	unsigned int chan_sel[4], val;
 
 	error = iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
@@ -2003,7 +2005,7 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 	reg_offset = dev_desc->sldr_res < U16_MAX ? 0 : 1;
 
 	sldr_setup[0] |= count;
-	sldr_setup[3 + reg_offset] &= ~IQS7222_SLDR_SETUP_3_CHAN_SEL_MASK;
+	sldr_setup[3 + reg_offset] &= ~GENMASK(ext_chan - 1, 0);
 
 	for (i = 0; i < ARRAY_SIZE(chan_sel); i++) {
 		sldr_setup[5 + reg_offset + i] = 0;
@@ -2106,6 +2108,22 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (error)
 			return error;
 
+		/*
+		 * The press/release event does not expose a direct GPIO link,
+		 * but one can be emulated by tying each of the participating
+		 * channels to the same GPIO.
+		 */
+		error = iqs7222_gpio_select(iqs7222, event_node,
+					    i ? iqs7222_sl_events[i].enable
+					      : sldr_setup[3 + reg_offset],
+					    i ? 1568 + sldr_index * 30
+					      : sldr_setup[4 + reg_offset]);
+		if (error)
+			return error;
+
+		if (!reg_offset)
+			sldr_setup[9] |= iqs7222_sl_events[i].enable;
+
 		error = fwnode_property_read_u32(event_node, "linux,code",
 						 &val);
 		if (error) {
@@ -2117,26 +2135,20 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		iqs7222->sl_code[sldr_index][i] = val;
 		input_set_capability(iqs7222->keypad, EV_KEY, val);
 
-		/*
-		 * The press/release event is determined based on whether the
-		 * coordinate field reports 0xFFFF and has no explicit enable
-		 * control.
-		 */
-		if (!iqs7222_sl_events[i].enable || reg_offset)
-			continue;
-
-		sldr_setup[9] |= iqs7222_sl_events[i].enable;
-
-		error = iqs7222_gpio_select(iqs7222, event_node,
-					    iqs7222_sl_events[i].enable,
-					    1568 + sldr_index * 30);
-		if (error)
-			return error;
-
 		if (!dev_desc->event_offset)
 			continue;
 
-		sys_setup[dev_desc->event_offset] |= BIT(10 + sldr_index);
+		/*
+		 * The press/release event is determined based on whether the
+		 * coordinate field reports 0xFFFF and solely relies on touch
+		 * or proximity interrupts to be unmasked.
+		 */
+		if (i && !reg_offset)
+			*event_mask |= (IQS7222_EVENT_MASK_SLDR << sldr_index);
+		else if (sldr_setup[4 + reg_offset] == dev_desc->touch_link)
+			*event_mask |= IQS7222_EVENT_MASK_TOUCH;
+		else
+			*event_mask |= IQS7222_EVENT_MASK_PROX;
 	}
 
 	/*
@@ -2301,29 +2313,37 @@ static int iqs7222_report(struct iqs7222_private *iqs7222)
 			input_report_abs(iqs7222->keypad, iqs7222->sl_axis[i],
 					 sldr_pos);
 
-		for (j = 0; j < ARRAY_SIZE(iqs7222_sl_events); j++) {
-			u16 mask = iqs7222_sl_events[j].mask;
-			u16 val = iqs7222_sl_events[j].val;
+		input_report_key(iqs7222->keypad, iqs7222->sl_code[i][0],
+				 sldr_pos < dev_desc->sldr_res);
 
-			if (!iqs7222_sl_events[j].enable) {
-				input_report_key(iqs7222->keypad,
-						 iqs7222->sl_code[i][j],
-						 sldr_pos < dev_desc->sldr_res);
-				continue;
-			}
+		/*
+		 * A maximum resolution indicates the device does not support
+		 * gestures, in which case the remaining fields are ignored.
+		 */
+		if (dev_desc->sldr_res == U16_MAX)
+			continue;
 
-			/*
-			 * The remaining offsets represent gesture state, and
-			 * are discarded in the case of IQS7222C because only
-			 * absolute position is reported.
-			 */
-			if (num_stat < IQS7222_MAX_COLS_STAT)
-				continue;
+		if (!(le16_to_cpu(status[1]) & IQS7222_EVENT_MASK_SLDR << i))
+			continue;
+
+		/*
+		 * Skip the press/release event, as it does not have separate
+		 * status fields and is handled separately.
+		 */
+		for (j = 1; j < ARRAY_SIZE(iqs7222_sl_events); j++) {
+			u16 mask = iqs7222_sl_events[j].mask;
+			u16 val = iqs7222_sl_events[j].val;
 
 			input_report_key(iqs7222->keypad,
 					 iqs7222->sl_code[i][j],
 					 (state & mask) == val);
 		}
+
+		input_sync(iqs7222->keypad);
+
+		for (j = 1; j < ARRAY_SIZE(iqs7222_sl_events); j++)
+			input_report_key(iqs7222->keypad,
+					 iqs7222->sl_code[i][j], 0);
 	}
 
 	input_sync(iqs7222->keypad);
-- 
2.25.1

