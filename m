Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6817255720A
	for <lists+linux-input@lfdr.de>; Thu, 23 Jun 2022 06:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbiFWEq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jun 2022 00:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244189AbiFWDxm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 23:53:42 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2060.outbound.protection.outlook.com [40.107.102.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632E7EE07;
        Wed, 22 Jun 2022 20:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeVk4nFviqvXbIJciXUIPEnGQ0rTf9aKDl2T1/QjtUsJH4zREdOj5KesPqz9u5Re8LuLF3seXLMawCpRgj7/ON2wRU9cmJEpUZtqVLUq4z+16kE3bOmzFedV48ThqCs/2vm38pTZe3zBdK+WKcL4RoLURPsHnXu7WC4tx5pqwWlHEpA2LXg4ARPWvkUNunWmEspxNkKT6NfnK9QudHJJZhAQ3KDlPzIrdLGKcVoh/3XYW6CfVm0dYJUAA/iBeROj+4UxPJLpGvztEefcHgRamRGs4QWHfDvduhSVFZyp8gquU/BUCA5HaiaD9jqyYviZ66saK62pusbAaCp4XED0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbftze5G0Bnz8w5vLabtU8ziJ2bL7OUa1ew64sv+6Nk=;
 b=K1bfwwX3QJnI1hqUMTNMhtL3nayzjdTG1J+V0bRiz/CbeGJgYX4XtZnyBdw7umlERjNAaN+C6qFT1VkwMd35uc9//Kyvbw0QyJ7dFWlCY0QhTqwBtHaZrWnP3EXISwdBRlSNhmtvSc1eY1cYhNTxnqG+Odd4m8rCQW0itEPmIBllU0VwbJrS09FpbodNQS3FRm6uECRrT715ET/lH1pUrIYHUgYIdZnrRT2sj6aTMGEuC3muWSEL1QCkEsMEISbURMjwX+ldWJB95ung+nvCkGhL6OR8R4khGALvBkf78FriAlmc8imcd5++fWr+eCJNGC36eVHaLV18zq3ivmAaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbftze5G0Bnz8w5vLabtU8ziJ2bL7OUa1ew64sv+6Nk=;
 b=KzF2cVbW6fmD07ORxSvKME5DyQR0p68/wUtv/t38nMWJnEZZoXMe/UfDcMqdTc3IOGYyOJmqiJ8wL4DyelANZrhmdRXqUZftSEtmgXpL3KNnumLTKw4/JahkUIQYvtXwq+DVzZiVOOCZ/hvXHEd7SyNUAb/ONe00QCSmNU/ESCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SJ0PR08MB7766.namprd08.prod.outlook.com
 (2603:10b6:a03:3db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 03:53:35 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ccb4:7984:aaf2:e18f%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 03:53:35 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/7] Input: iqs7222 - fortify slider event reporting
Date:   Wed, 22 Jun 2022 22:53:03 -0500
Message-Id: <20220623035309.39528-2-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623035309.39528-1-jeff@labundy.com>
References: <20220623035309.39528-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0701CA0001.namprd07.prod.outlook.com
 (2603:10b6:803:28::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e88848a-b4da-4db5-a46f-08da54cbf298
X-MS-TrafficTypeDiagnostic: SJ0PR08MB7766:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR08MB77660215F262FBD2D609AAFAD3B59@SJ0PR08MB7766.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgndUEYvM+S+EAkrn+o5k0BWCIZqD5KSgOlA3xWya43FEPf4UNnk0ZtqEt9bhYuj1wSgBoVt20zOsjZUSjX+jHyIB6S6xzNOAbyJtmMyk3ztB35yMZyZ1dWieIUJLs1rRz2r2yn136LwPMqlzElyPNP4RCkfSC7XL2nIJYFepcAq0aUvejp0sRKdt6ic325I3dovgDP52LVTCioYWV/WOqB8eo9BPt0uW+LtA+99hBSp7AlnNpQq7k7QL4AbNl9VluPplJVZh5v5TA3yoEOUP9jPyAjAgTUQSs8OmGR0IbEufBLl1XkS9ZDf+2in599ZevGhXN+YbupaXsZz5Bo1AA/H51+AB9blKR54ucs7y16qkrBlCcGsPc7BB4OvAqFNrtOzA5gam63VmckzM9142Sj2HcK7lv9IK6kTGB6D8IejoP61dHAWM5gV8bC35jpjGVA2r3S8fx/9pGy+b+jvgWvgtZd6lQz7Cvs2apy+LYHx7L5eT+YauGdcw3cuLujO9yF+W0Iydgp8mviHUqOi5q5oqxdVLQF9Xbilt3U7aFtuBoVJhvnriOt7zVJsyApKxKi3s0JkPKfmlD78OQ/MgL5IBJ8aNBC/tzRUKwYw19U9zWeoEvsZMbEPhJNnQ9TCziCT5aoBvR7FTh1DIAfIw7ZWD9vtZjj+pc5FUqCSMqzvfKv3nDMRDlZQX+YYWf30BGCZdin0LQutcGbRSrUYcnYUlG2UIERl7hvzXa0ffm5mIhia7e51REafRdwR+IYA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(346002)(366004)(39830400003)(376002)(52116002)(26005)(6506007)(107886003)(38350700002)(36756003)(186003)(5660300002)(2906002)(1076003)(6666004)(83380400001)(41300700001)(38100700002)(66946007)(2616005)(6512007)(86362001)(4326008)(8676002)(66556008)(8936002)(316002)(66476007)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EjSpK/0lXZnjaAtCKel9euL8L1JWTkcoTOX4jcMqPP05cKEmPgXDvx1JQxRX?=
 =?us-ascii?Q?zek/9sZo4reHHJj9Jt0RxFL40yRDj5eD6DVjYjuHSK2SUNYaDDL/K9Pee/Tz?=
 =?us-ascii?Q?1RS3pUDqcgXMtYBanYc8idVqGAR6lcCxnZZycMacZ6WoPXoJrQKyyWRqTLXV?=
 =?us-ascii?Q?EQcT+mRgLCknE4fIA1nXdx/r1S/6K0Pg+uUM7zMYZY0ZIrloGzScccws5tV4?=
 =?us-ascii?Q?NxNXVptd8AtsceVSOR3opTq4gbS5uDjlrTAZ/Ljp+Fl856drpvUDUBCK7TtC?=
 =?us-ascii?Q?9BtUxRpbfCeHWhLLsV9w3/L/j+aQLaaaMQ9N67oInbJxO46bnsuK86HO5mnV?=
 =?us-ascii?Q?WcLNXChNg6APJItXyOPotNN0Cwjko1XAr4uTcBeA0nkareCYF3DQuebzO9Kw?=
 =?us-ascii?Q?bmTdsSyaXbvuskW0UMp25qhlRbZQV4ErQYyrOaz49NglzuIqHv591yA7DoGQ?=
 =?us-ascii?Q?v6EvqIjC8Zjk9Be/b2EuyguUCaxVxFX5N6zdHNCML776BWBmwDE3YGCTk6B3?=
 =?us-ascii?Q?wzbo6Yta6xNMN6wlpUVqpMkusIbRSkUOrBKSpPKTO/aXw0XrYr1rFE0uXr1T?=
 =?us-ascii?Q?7iRvyiSrCsNKpqqsAWZgDHj7ksYkceQitYPkWoilTcNpXPimzpk9ena6+nAz?=
 =?us-ascii?Q?ZzkjdE4IztOYXMmRwrABCmwL7O1IjfkvRzVno7hTqYoJgamG/2w0kpnr8RD3?=
 =?us-ascii?Q?NPRf5zIPuhmL2QP08nGah87w0CCRphkoybYA8gOifZ37mzZtVNlPEuwfOdMG?=
 =?us-ascii?Q?kNP7fzypAZCMckKzmHvfp9nn7fwog0f7tQ4p+rNHfxKZetelQIbLEM+7pv44?=
 =?us-ascii?Q?PAyTgiFuWWuQS8FezePE4f2hw4V9377cgu9Ye9bg12VONhF3l1j+XvWduw0V?=
 =?us-ascii?Q?se43Utv6jcejSaTIOgdlBaZw0eEeSao9hXlGh9rbHfnwxD/g1EaYVjYregKZ?=
 =?us-ascii?Q?j4GTphAlGhDxnZslsGRwEkhoUNvRLMJJiGKEFzGpj61VK9gemDyZuygUwuLl?=
 =?us-ascii?Q?EoD2sM/+46Cuvkufs1tr4aWD3qe4FrN10LWjPcrLprKN8wSWUe59mQ8eCf+s?=
 =?us-ascii?Q?hMVUVn95qCBdCDorcn0LjK4N9h0Ocr/Yx5YHP8CwfAVxuaBl/0wEd2Au3FoU?=
 =?us-ascii?Q?T/OJ1WyC7CXaePOuSabkm/q4YNS08NgKlkGfU5gW9KFSeXuiA1Ez8rHnJc+o?=
 =?us-ascii?Q?uO+TwZdbA4nfrd1RPc0sgAKzySx4KWJk1omKYr5LwTEaiQxT5crj8U7z4d/i?=
 =?us-ascii?Q?pg1bR69484lRa/lpEflHNSTOY2N41RdfZn/2xjqZjakL2WOjuRdh5hPSB09x?=
 =?us-ascii?Q?Cx+4BpceaYGnkwc3uvgGCHdN4UpDMZGvUED/AL5DUfYVFX3F15XDTH7qZZqU?=
 =?us-ascii?Q?2enWgW5HgG0ssVGb6rGMeyrZ8ds0FgxHa2ve/7dk5wJ7C7HG8F+uy/o2KtOj?=
 =?us-ascii?Q?6PUd0pNkLQ53FRI0+r/0t8QKtHVuFbBOimbiu6hOMqC1f3g2Wtwkd3ppIu5N?=
 =?us-ascii?Q?+sMsP+thaDuOOcuftWmyNjAOKHv8mfncKEmf9CfvJpoCdU8ZurwdKcv55oY7?=
 =?us-ascii?Q?4uZ4Dphc+Ydp97BWgu7c+vYGuh6q04sLBszp1yvEfApuJZpsog2yzoySuE0e?=
 =?us-ascii?Q?cdqoJQHLEE+VyCuGanS3vhrekBQV+oiDWq9ZRTOWat3XgYLmgnDtOEviBb7W?=
 =?us-ascii?Q?XNx6KkegFFCFCyR+8G6eA+G3Fwh1m/mfW7LyjtXfY4Akcwt2mEEf2W/UbG86?=
 =?us-ascii?Q?lNFno9NnMg=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e88848a-b4da-4db5-a46f-08da54cbf298
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 03:53:35.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj/OEqdD01odZsI2d5j3iHJJRD1JRJYqbJjOREu2hK5Q6vo95QpVqQbcp3TJ5oOA0rZhNe2eAVirxei2p1LUMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7766
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

As part of this change, use the device's resolution rather than its
number of interrupt status registers to more safely determine if it
is capable of reporting gestures.

Last but not least, make the code a bit simpler by eliminating some
unnecessarily complex conditional statements and a macro that could
be derived using information that is already available.

Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 66 ++++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 6b4138771a3f..6cfabd6e3a15 100644
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
@@ -2120,7 +2122,13 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		 * coordinate field reports 0xFFFF and has no explicit enable
 		 * control.
 		 */
-		if (!iqs7222_sl_events[i].enable || reg_offset)
+		if (!iqs7222_sl_events[i].enable) {
+			if (dev_desc->event_offset)
+				*event_mask |= IQS7222_EVENT_MASK_TOUCH;
+			continue;
+		}
+
+		if (reg_offset)
 			continue;
 
 		sldr_setup[9] |= iqs7222_sl_events[i].enable;
@@ -2131,10 +2139,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
 		if (error)
 			return error;
 
-		if (!dev_desc->event_offset)
-			continue;
-
-		sys_setup[dev_desc->event_offset] |= BIT(10 + sldr_index);
+		if (dev_desc->event_offset)
+			*event_mask |= (IQS7222_EVENT_MASK_SLDR << sldr_index);
 	}
 
 	/*
@@ -2299,29 +2305,37 @@ static int iqs7222_report(struct iqs7222_private *iqs7222)
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

