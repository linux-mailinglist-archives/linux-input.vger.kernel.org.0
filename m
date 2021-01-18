Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2936F2FABC5
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394440AbhARUrR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:47:17 -0500
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com ([40.107.244.46]:61569
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394477AbhARUqT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:46:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPypcKjw3Fw4h1v4pCZHy7ALnyJ3tBp/KXdbzky1mlKEuXG9FB0PFHBTDO3JUV1VwcBbgNpB42JpV86iHoFXHYbGEx3JC28CbLTQ5lRNMQwIQAf+YB4j10Xg5Kx2PH6QQnSovtIuNacFJY+Oxp7rT/Cp5esQd2LNWjsX7/irDauJOAQEKXKUCd1xv+BhFaN6KEbsL02shY5oGQZ1I2pvi6+uZtYp89m6HlOVrKdQ0dz/PSfYn7mYsed24fZMcvyfgfAjJReIeZF5Bre5rHi1j6n13A915kVj6h9XEIGSGLX6DWjiNf7SFwvP/VPA6XJwnFrOGce3kXihvQ6vpuK8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ01RHokEiRP8Y7Xo84pfFxsa8XvVbhYj9GqvMpcTpI=;
 b=SpKNu5hcjwIJmhsgZvTd7d9MMlb9M8Fp14RgJ3GyKla8PHErGZt6snKZoe3GrjJ2DS+kt+hokCWdk8p733BgImHHsw5mCVjiSc4OYs/YGkBrpzm8+bGlQtlwIfyKEt340ffsEd58RlZJ+kivsypSvcyQ3mYaYE30YbvI5DkoflZDwCctJNAe8G33ORMfOjF1UQh6SRud48bJ0pbUp07WYK2EriCx/8BxdUaRTYdheNBKNB71hWIK+lush5X3yAoKifUJyCLO+r2QnSVVYMXZIh6Wyq7isHVrWJGanXFzfJnMZXc5KnUXok/6gP4LQwZIcRVIANHV2BsK7nf+j4OiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ01RHokEiRP8Y7Xo84pfFxsa8XvVbhYj9GqvMpcTpI=;
 b=VRq6caHy+s3AHY04jRaVn5AsCpyWwP8gv1lZpokJKByXLhLyqjPny1ld9PNRPhCudNzB059OYWtGCc70C/5+6pqJLm/06sP4HEdeSv8j/B3CS/UDl6JzMHzi/UbURX+BepL1obYrICFi29HcNvTsRXXX8jgk31vzNWu3tAh+RL4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:33 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:33 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 05/10] input: iqs5xx: Re-initialize device upon warm reset
Date:   Mon, 18 Jan 2021 14:43:41 -0600
Message-Id: <1611002626-5889-6-git-send-email-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8810707-73d2-447e-e686-08d8bbf1dc5a
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4846C480B332FDB0BA7562B1D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KimiJg7yhm+K1I3zk8lkLG7J3eeJOH+U2798jPLq7gE2kI+193OU49bxtklJNsPoFIE8GffzIYHg+3mana4706OaduH4q7ozRrV6Qxak7OprYWC86e/1kVLUqfG1Xxvk8eCWxOZRGS6bpv3PZJg5NBcVpHFV6gH1C4xusMGd+2DJ98Ibj6wXMTKsiKHIYOXv6m6Nt0GwxwlhYFvQOq0LNwVsoq2V6Mmdb116h1CfG+T4aczaOwlVi08+s7m4MHdTApj/368PYHfVJShXhrbic6CW6mNqLnDTRx5H7nTCLbw5tNWM3LDP1ae9f+a3jSjPG5Mb+BND5nZvLr8TgBGStZ4LD3vAWZyUQEt4b+D0vn4S/U5PDeAqRgKGBLgpI6SYQ9stPUf3ChViqhqeh6PjeexOHl/VF3t8vh0giioyakhf82pPmfy7hreG2MT0v6iU9qX9qONeykCJCRIHGgZ86w7SPg2JxvErCDy+3aotTDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZUsv09sqgoA5IEodzV8CI7f82OvGcr06uVz7NP0UEHY3xbKuxaqMQzD/2qyV?=
 =?us-ascii?Q?5JZOeOa5mpzQ7TMGtUq+w71bOb2pMS4UIzESWtGLgzuvaq+ioPPjs6TH1iSu?=
 =?us-ascii?Q?syYmv0HMz56GMIJNeB+uzHV4AsrVNA2I3wUmxNVUd7Bc+sVCWMyp0OkkFWXd?=
 =?us-ascii?Q?Bql1Bur2qjrNQg3QQGmowCLGHbvq9zGysiBEI6uBrKvISVVV4V1PCoKomCWB?=
 =?us-ascii?Q?N4J068lw9lnm7j0+nvMpIoMo/MKivyXdg0CQvIHXHJd0TcJ2ht5/iq59YICE?=
 =?us-ascii?Q?SLjmQjcXKbCWoicbl67Vf/JP5BJV88UBWZ00MIANT4ai9r5FG5q6X/WfijkD?=
 =?us-ascii?Q?dCvoOUbLtREbanvpIgUA0iPksyOBqGBMEgyd1jeIwbVejrw5EayXQ+k6MWDc?=
 =?us-ascii?Q?ilMNppJWIPqjMdEcvhoigCqH+ueKTj30Pauq48SebDBePq9fwtumM2jveITV?=
 =?us-ascii?Q?s1v8COsXRko9rq4ztyJMS4V2+NdZx2Krz819fqMeKvSOBZOG2LYCs3pHJjlR?=
 =?us-ascii?Q?owQalPKsajNhcr8y6rA3DPSdamsXNKvt4rC8fJ8BizPv3+QLx2NpaBpDkpne?=
 =?us-ascii?Q?1rlN5FMPQMGwwUcyraxCVwI/lH7edEseONVSd7QH7tmg3UyA09DlXad5371W?=
 =?us-ascii?Q?+wkfgcNBeKIJXC3H/me2dTfkQWl74fIV6bCfst0rmeTYXk6wMHV9kW+E9Qp8?=
 =?us-ascii?Q?WxJOgS6xkjUQhlhQV3IxBGznIpDaX/3cxMBn6gK33c8Ay52NOM0Dk9TZJehV?=
 =?us-ascii?Q?mp0i32oqx4lqw8HpQlUn6YeIMZcAZHB1+ebvIlJYvcWZN9oSD0kxOMUx//Ed?=
 =?us-ascii?Q?naEOMLylI75/Fq9UOjXNmZuT7UDPTenRQt85+EFhIbxQPBktGE0DAa1/TKRp?=
 =?us-ascii?Q?V1OfGoAEOnn5NFstD0zQymfrrhIZJWhHIGCyHqnUzJ160DfzoCPnLsaHnP9O?=
 =?us-ascii?Q?OsRsUX9+jxLyozNIycHYta/TdKVHW6HHXoBNj9Xj8vqKu3qWErW9EQ3zR2Bs?=
 =?us-ascii?Q?CVO6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8810707-73d2-447e-e686-08d8bbf1dc5a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:33.2515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbW2zAJ3+rQbSbkZTn+oMNUrSIyQr5KkAirvOTJGZUqy2LCl/+9kF22BdDt4U1W3yYkfkEcRiSDSJdfqYUoG3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device may be inadvertently reset during runtime in the event
of ESD strike, etc. To protect against this case, acknowledge the
SHOW_RESET interrupt and re-initialize the device.

To facilitate this change, expand the range of registers that are
read in the interrupt handler to include the system status fields.

Also, update the unrelated (but nearby) SUSPEND register field to
use the BIT() macro. The remaining register fields are cleaned up
in another patch.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 51 ++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 5ee22ab..9412fb8 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -40,8 +40,11 @@
 #define IQS5XX_PROJ_NUM_B000	15
 #define IQS5XX_MAJOR_VER_MIN	2
 
-#define IQS5XX_RESUME		0x00
-#define IQS5XX_SUSPEND		0x01
+#define IQS5XX_SHOW_RESET	BIT(7)
+#define IQS5XX_ACK_RESET	BIT(7)
+
+#define IQS5XX_SUSPEND		BIT(0)
+#define IQS5XX_RESUME		0
 
 #define IQS5XX_SW_INPUT_EVENT	0x10
 #define IQS5XX_SETUP_COMPLETE	0x40
@@ -53,8 +56,8 @@
 #define IQS5XX_SWITCH_XY_AXIS	0x04
 
 #define IQS5XX_PROD_NUM		0x0000
-#define IQS5XX_ABS_X		0x0016
-#define IQS5XX_ABS_Y		0x0018
+#define IQS5XX_SYS_INFO0	0x000F
+#define IQS5XX_SYS_INFO1	0x0010
 #define IQS5XX_SYS_CTRL0	0x0431
 #define IQS5XX_SYS_CTRL1	0x0432
 #define IQS5XX_SYS_CFG0		0x058E
@@ -127,6 +130,14 @@ struct iqs5xx_touch_data {
 	u8 area;
 } __packed;
 
+struct iqs5xx_status {
+	u8 sys_info[2];
+	u8 num_active;
+	__be16 rel_x;
+	__be16 rel_y;
+	struct iqs5xx_touch_data touch_data[IQS5XX_NUM_CONTACTS];
+} __packed;
+
 static int iqs5xx_read_burst(struct i2c_client *client,
 			     u16 reg, void *val, u16 len)
 {
@@ -676,6 +687,10 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	if (error)
 		return error;
 
+	error = iqs5xx_write_byte(client, IQS5XX_SYS_CTRL0, IQS5XX_ACK_RESET);
+	if (error)
+		return error;
+
 	error = iqs5xx_read_byte(client, IQS5XX_SYS_CFG0, &val);
 	if (error)
 		return error;
@@ -712,7 +727,7 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 static irqreturn_t iqs5xx_irq(int irq, void *data)
 {
 	struct iqs5xx_private *iqs5xx = data;
-	struct iqs5xx_touch_data touch_data[IQS5XX_NUM_CONTACTS];
+	struct iqs5xx_status status;
 	struct i2c_client *client = iqs5xx->client;
 	struct input_dev *input = iqs5xx->input;
 	int error, i;
@@ -725,21 +740,35 @@ static irqreturn_t iqs5xx_irq(int irq, void *data)
 	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_RESET)
 		return IRQ_NONE;
 
-	error = iqs5xx_read_burst(client, IQS5XX_ABS_X,
-				  touch_data, sizeof(touch_data));
+	error = iqs5xx_read_burst(client, IQS5XX_SYS_INFO0,
+				  &status, sizeof(status));
 	if (error)
 		return IRQ_NONE;
 
-	for (i = 0; i < ARRAY_SIZE(touch_data); i++) {
-		u16 pressure = be16_to_cpu(touch_data[i].strength);
+	if (status.sys_info[0] & IQS5XX_SHOW_RESET) {
+		dev_err(&client->dev, "Unexpected device reset\n");
+
+		error = iqs5xx_dev_init(client);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to re-initialize device: %d\n", error);
+			return IRQ_NONE;
+		}
+
+		return IRQ_HANDLED;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(status.touch_data); i++) {
+		struct iqs5xx_touch_data *touch_data = &status.touch_data[i];
+		u16 pressure = be16_to_cpu(touch_data->strength);
 
 		input_mt_slot(input, i);
 		if (input_mt_report_slot_state(input, MT_TOOL_FINGER,
 					       pressure != 0)) {
 			input_report_abs(input, ABS_MT_POSITION_X,
-					 be16_to_cpu(touch_data[i].abs_x));
+					 be16_to_cpu(touch_data->abs_x));
 			input_report_abs(input, ABS_MT_POSITION_Y,
-					 be16_to_cpu(touch_data[i].abs_y));
+					 be16_to_cpu(touch_data->abs_y));
 			input_report_abs(input, ABS_MT_PRESSURE, pressure);
 		}
 	}
-- 
2.7.4

