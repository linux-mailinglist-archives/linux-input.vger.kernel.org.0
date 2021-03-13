Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D5233A039
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbhCMTNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:13:23 -0500
Received: from mail-mw2nam10hn2207.outbound.protection.outlook.com ([52.100.157.207]:25712
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234010AbhCMTNS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4cF8sR0B27I30hucdzirjbgzk4se98j//aeHAYO28pEHwE2ca3rENXNVWO8A3fAEky6vCwgiS7/3r8pad1J/Sa4BC/eGATw0DRwE23kI9PW5BdSyC/G0EOJx6ew0WfD4Fp+SQltZ/hVkMq5+WVWmPii43RYh2czhU9wbsZ60OEBdeSykt8COHnlNFU0du9a8jMo6urtcOkxwhdHYKruk+K8Q7CXS9A2LxW30uu+BAY53L0QgsttqYN93vDd6L6TkLBSMxu74+pVPNClN2VrS2yrOCLU8igB4UZBpe+Uy3jm2lHn7KTqAm+dJK/l5LYRYLwjDbFcbvJhrNDtccwA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgTVGHCwrxUA2MwXrEDHIa4uo9zxIR6YuOKLFYAvSWw=;
 b=cQ6kQem4Wd58kR6TG+NkCyrzoxGiYrvb09v7GrRPO8upiIj2YPdM8bNaMJK2VYfsHpKiOM8b6HE4XBj6jnfA0umyNcGSQDGth31Fe4M+yApA6VaKkwXpHJtKkU6vYe85SrPaR/MY4PmO3vKVkY0f1ShFj9XzbyR8UP5h9oZ9nzvYfQ9RNMAl27DtfTYA3x6l2IXbMPwcFtOMiwlMR8540FRoLkgpS5lbbIreOq77wl5Gr7mnktxvx4Z+TYT9s1kLU8gnN4gkh+7eNvKXiJUhzK1MKKn5PXtNDvejqw8p+fuzIzD5YWRUR3eSdoY9dIvW1nK2/17hTfLI/O9Xw2UrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgTVGHCwrxUA2MwXrEDHIa4uo9zxIR6YuOKLFYAvSWw=;
 b=G5MGuvGSPtE+KOC6Qqg0xdM5fBTHZPiryBfdpGEDWAzeo1tVw4lA7dE/GAC5shYlFVGvf0xabRQLFAgjopaABTlNEy0Yh103bnknfUtJMP1qGs602b+VUKwh9RFnfl30tRHII87J+PJ75B0EugIzVZlxwiKBY5LehaQyl8TfGEE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:17 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:17 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 2/9] Input: iqs5xx - optimize axis definition and validation
Date:   Sat, 13 Mar 2021 13:12:29 -0600
Message-Id: <20210313191236.4366-3-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ee152a5-5308-4844-d70f-08d8e6540e88
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56944C64F1BC27209D55EC77D36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bxuOyq2ney2yX+STJcqRcIN9fFpBxYvliC6tNe47yvw/ZK3vNgyjxqpcMlAe?=
 =?us-ascii?Q?iVZ/EXlllCjZCxY8+a2pjRbliACNhUd7yxqbln86R3dqNRnT0h9QODa6DILT?=
 =?us-ascii?Q?yF+a9L+tGfB/CIa17/HlB0BrI6bSWh/EvJDOGPqMz07/3K8OKAfMtifm9V3O?=
 =?us-ascii?Q?iLHp+gUlZHKStHEXidrJ/+msfEjKDj/wm20AdBA1/Bi3M8OSmEcPk7nB8Sn0?=
 =?us-ascii?Q?8lPU5ShUeHfLQVzsywHGLoh8MVYFpkKRu2tWSr+xfUTn0/BFo3vuXIEc0b5B?=
 =?us-ascii?Q?aHoXZQITkIPDsblUEVv/78SsGjsf8DMSxSKOCdnzNBMwlfu5BUOkLgvwWgjA?=
 =?us-ascii?Q?ssirlYnBzWF4CCQBmPrDstqvXqxzIH1bgzj0snOJActBbLpH1Fty8crR6TCM?=
 =?us-ascii?Q?1GXnspKUkqHWi6hNAYlSHPgf7OncaOyZaRq0ewsSfHmdk8rk0KvcM20ijlc+?=
 =?us-ascii?Q?9Fkroh4X8l76kZDKDFrelHGFWV8bM1asceuWyLonzjehZVZRDhRB3YejYl/g?=
 =?us-ascii?Q?n8/QwOr8DzahRakQWwFe0NYX8iuM4Hjqn2Jwlp+E2ISZhgSAEhGWA9cU10Ij?=
 =?us-ascii?Q?TNUDVHF+hk/V3efafNEeLc1OXOibhpstt/QIq1IKwoK8f0cB+LDVwACIch97?=
 =?us-ascii?Q?+d9Lu9y5o7GfuGmrfztWwpdV8EhjjR2u7UA4jwmv05cfsCOvKvmHwDvXchE1?=
 =?us-ascii?Q?TjekyXWhVq41nGB4UZrDWTObNyik8tzL7OoWVa7i4csIVcUddluDi3hVP6x0?=
 =?us-ascii?Q?u1MEy9871qSU2CE4zodud24/SEyTaGLvQdlGgxftIrACUWa0VMA9ziFQhwDd?=
 =?us-ascii?Q?gXAt+mK9yUIZAP9Q37+SrnrMxr7ZBnpWzmmWE/rF0Rpf9cQGNf/mX3dDi/9o?=
 =?us-ascii?Q?1dGuULtGOD38HX/qiJR8V1aBz8xK86RR5VL356MZMqs0LBtSoMhVVpgqYVdC?=
 =?us-ascii?Q?6rD9sh7QL3obIClkx5rcEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IkjcwXT864ziz/+CIhYe5ROfkj4b74C2qeCCqt35ucbHbnjxXWMkRHIOsg/q?=
 =?us-ascii?Q?aA50rHKz2B7Nrgw5fhudalWOdRIYyiAe0Or3ubBioFr8xrOV4oJNH11eo4OQ?=
 =?us-ascii?Q?tn5MvgHXIWnIKRWZNcn/CrbCmYO5TA+ChYT5Fuvec/qiG29VnirTD7Xfua4g?=
 =?us-ascii?Q?qmdnA3WOYmW5gnobsFwyk2Axe8+YwLV5lXUq+T7+1qPNyLPXV9Jq6e7XYhXg?=
 =?us-ascii?Q?nB4AUOQk74YVGKR4dYzkR+L9ELGEspk0fpfVKaOwJUZ+xX4r9CnxfbOKZ9Z7?=
 =?us-ascii?Q?rQnn8AIUzfxtYnU8n1u7t34JE0Izu02SfKQ55ICWw6du9S/wWPFWFTL11KhV?=
 =?us-ascii?Q?ZwyYj3TVYe2TTKijj5V6lt2p3AJ4iSLwjwcRpP7wygDrS5zSP0UXJFRfRI72?=
 =?us-ascii?Q?XCh2xOn9dhJKJa3+zgq5lY9rjiBFIPcKrkbcOZhxIPpoXVcxpleinqPgISLV?=
 =?us-ascii?Q?5v5VyFk3ZCDQOfvnSwE6m55Vk3XIxJ2MSvRNsB97sV0NOC6SojyzJ8WOfXLN?=
 =?us-ascii?Q?2hJ9Y82hm9901AZHaqpKkAWvmGwhxwr2IiN1al68d4w0ezaQY+R4RYYXzCUe?=
 =?us-ascii?Q?1NSLra/XnFawz/+Nw6OAubtk9Vhn4TxlYDzoxK4jvOr1Cy6TfsQp1MSQPepJ?=
 =?us-ascii?Q?X1aF5dcb4dQwdtXjwlmw8kcpw7pOzWT7ZtcoJdGAv7a/+7pZf5elRn2cQiF2?=
 =?us-ascii?Q?XxJm2Dy+1Q5RdCDpMyO8tQ7m5z5vZ4EQvWqzg3lp8xEFo4HpdV84++S6lB4U?=
 =?us-ascii?Q?UZ8/JjrZTL4sUQdd/aw9wmdf1jn4kd8bggz9EXkeBkq1yAIv4ZZIwbfxhUUf?=
 =?us-ascii?Q?6xn8VqKvbgQd5AZ6yht6mYbu+S+HrVKzT6lR0hXrSQfoZ8/7ayILKp0RS8WK?=
 =?us-ascii?Q?sv+eXlF4AAsDgKa8LR/PpW1NsLIzMR5cDPVwyhlZHMxchIkoFDkJ40CeF56q?=
 =?us-ascii?Q?c6jTqvCQaMASUzvvc9gCYgWJgYWrIPzZ9dNmcJiGksxISafBrRPesxhpyUm6?=
 =?us-ascii?Q?VwRcs33vTU6PHqu36wXIE3Ll5DXejkPLAmyQDNK50EUyQIDXCq15D3Aysm9/?=
 =?us-ascii?Q?T37taaDmfbuC9OfgFZzNqQVpqZA+hLaARRZhjU0VwJt4j/SNStrBiyekrLkV?=
 =?us-ascii?Q?LsSMLIU+pvf6Or0pfH/CVo4V9mfXRJD8kZeZnkAEakSrGDt37eB389IcdoTL?=
 =?us-ascii?Q?6hesOBufYeH4B1MiLuT80LMyF4EhkXvqn5y5YYHYgqgk344d00qzpPcZl7LT?=
 =?us-ascii?Q?YkQbGC0Ht9WTk2sJw/R8k+NGWbBuv5xEhqcInGHpAP/vzNmBr5OyBAfnV1zt?=
 =?us-ascii?Q?zbNKGjM1x8gdsXDWbnuY7dw6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee152a5-5308-4844-d70f-08d8e6540e88
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:16.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9bk/vVe+omaxtJootNQEl152htbDvn6dLDv16VJterTOe1CNCNZz7dU8NPmohZdfnLFyiq+oY1IQAiIv/+HiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Set the maximum ABS_MT_PRESSURE value and use the existing U16_MAX
definition instead of a magic number to validate ABS_MT_POSITION_X
and ABS_MT_POSITION_Y.

Also use input_set_abs_params() rather than input_abs_set_max() to
avoid having to call input_set_capability() separately.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 403e251a5e7d..2a4e048f1400 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -32,7 +32,6 @@
 #define IQS5XX_NUM_RETRIES	10
 #define IQS5XX_NUM_CONTACTS	5
 #define IQS5XX_WR_BYTES_MAX	2
-#define IQS5XX_XY_RES_MAX	0xFFFE

 #define IQS5XX_PROD_NUM_IQS550	40
 #define IQS5XX_PROD_NUM_IQS572	58
@@ -504,10 +503,6 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 		input->open = iqs5xx_open;
 		input->close = iqs5xx_close;

-		input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
-		input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
-		input_set_capability(input, EV_ABS, ABS_MT_PRESSURE);
-
 		input_set_drvdata(input, iqs5xx);
 		iqs5xx->input = input;
 	}
@@ -520,26 +515,29 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 	if (error)
 		return error;

-	input_abs_set_max(iqs5xx->input, ABS_MT_POSITION_X, max_x);
-	input_abs_set_max(iqs5xx->input, ABS_MT_POSITION_Y, max_y);
+	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
+	input_set_abs_params(iqs5xx->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
+	input_set_abs_params(iqs5xx->input, ABS_MT_PRESSURE, 0, U16_MAX, 0, 0);

 	touchscreen_parse_properties(iqs5xx->input, true, prop);

-	if (prop->max_x > IQS5XX_XY_RES_MAX) {
-		dev_err(&client->dev, "Invalid maximum x-coordinate: %u > %u\n",
-			prop->max_x, IQS5XX_XY_RES_MAX);
+	/*
+	 * The device reserves 0xFFFF for coordinates that correspond to slots
+	 * which are not in a state of touch.
+	 */
+	if (prop->max_x >= U16_MAX || prop->max_y >= U16_MAX) {
+		dev_err(&client->dev, "Invalid touchscreen size: %u*%u\n",
+			prop->max_x, prop->max_y);
 		return -EINVAL;
-	} else if (prop->max_x != max_x) {
+	}
+
+	if (prop->max_x != max_x) {
 		error = iqs5xx_write_word(client, IQS5XX_X_RES, prop->max_x);
 		if (error)
 			return error;
 	}

-	if (prop->max_y > IQS5XX_XY_RES_MAX) {
-		dev_err(&client->dev, "Invalid maximum y-coordinate: %u > %u\n",
-			prop->max_y, IQS5XX_XY_RES_MAX);
-		return -EINVAL;
-	} else if (prop->max_y != max_y) {
+	if (prop->max_y != max_y) {
 		error = iqs5xx_write_word(client, IQS5XX_Y_RES, prop->max_y);
 		if (error)
 			return error;
--
2.17.1

