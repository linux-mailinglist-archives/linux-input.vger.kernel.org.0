Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E132ECCE1
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 10:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbhAGJdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 04:33:24 -0500
Received: from mail-eopbgr140049.outbound.protection.outlook.com ([40.107.14.49]:36439
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbhAGJdX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Jan 2021 04:33:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdWeRpt6oBrOm5mB7PxqR5LHQNKegRnotZpJQEQwsxWb5KSJwuiRjSg2YtuM6oRJZyPtR1vlV30JC10IAixQEcDoc7B+hsaMlEowtzxa1qndNlKO+Xjtmlvkapr1kjCaU04qWd8hbQoUh1jKbX4jyDs2Uz0pNS8QM40gWD8vZrIrOfO6y0ARe5Kyxy27BwulVwJTyjUnuEeQQWlfT2MkqL1zA+NFrfWM5m5cS1XQ9XqUCvHiYiRDJck/gChkE30a/aBYZWv7e9C5yxBQZuroQKdzuehyAJgm1Cuj3qLi82RLCd8fCYgKcQekaDZ9EnhvseK6k1Z7lnBJXkgG7ikIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNIu99YL4DPnXTrAqI6LDymgjO6dbjIkYSrONh4xrRU=;
 b=aUBHsVRKS6eDUGBnYoump/Kluh3DdSN6cFLQzWtUz0pUICE4P0yuVx3tny97yYTUmn3rRrpFEB/xHdOHkl4fmGgtudp1vPz4DbLBg/dSuj1ZHHdQ+jjb4u+HcbqLcgP/YBPsgHGZ6zfkJUl410KjL1gfhPQaMuQ8pX/TSuhu6hkbEN7j+n0uL8L/53MJ9+dlkcODb9L/3M1ljPcDhoI6YqhVEouCQGyQee51HDsU7Q+5Q0XwYXpKf9qHG2OSk6ceJRNuhIc7nILPq8w2WiZBGx/iz8Nlrv1bBd8KWmMS1fXVm2DE0Q9OotuPVYZWtcpLHo49OLm0XtUIkpkAvmSoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tbs-biometrics.com; dmarc=pass action=none
 header.from=tbs-biometrics.com; dkim=pass header.d=tbs-biometrics.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tbsportal.onmicrosoft.com; s=selector2-tbsportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNIu99YL4DPnXTrAqI6LDymgjO6dbjIkYSrONh4xrRU=;
 b=ZujitiIK6SxESh6TJEAO/rihBDC5fzvepU8wg+k9XdzHTeFhEd1CooQvuJNAW6nUjtRH0fxNE4fAHQ9++I/DIogmRolm28sOnpfjaHtRhyQcD3NddJpHyA4n6esz4UTQUXdzUFINGW000Qskv3CO40PDiBBDI7YAj14tX+SpC1A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=tbs-biometrics.com;
Received: from AM7PR06MB6769.eurprd06.prod.outlook.com (2603:10a6:20b:1ae::15)
 by AM6PR06MB4263.eurprd06.prod.outlook.com (2603:10a6:20b:1e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Thu, 7 Jan
 2021 09:32:34 +0000
Received: from AM7PR06MB6769.eurprd06.prod.outlook.com
 ([fe80::9d44:27b1:7c16:da27]) by AM7PR06MB6769.eurprd06.prod.outlook.com
 ([fe80::9d44:27b1:7c16:da27%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 09:32:34 +0000
From:   Radim Pavlik <radim.pavlik@tbs-biometrics.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Radim Pavlik <radim.pavlik@tbs-biometrics.com>
Subject: [PATCH] input: auo_pixcir_ts - add missing check for gpio
Date:   Thu,  7 Jan 2021 10:32:17 +0100
Message-Id: <20210107093217.2499-1-radim.pavlik@tbs-biometrics.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: VI1PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:803:64::14) To AM7PR06MB6769.eurprd06.prod.outlook.com
 (2603:10a6:20b:1ae::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-I556OUN.local.tbs-biometrics.cz (176.74.132.138) by VI1PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:803:64::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 09:32:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 613317c2-6935-4f64-8918-08d8b2ef2a4b
X-MS-TrafficTypeDiagnostic: AM6PR06MB4263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR06MB426327A88F6E42FCD936E169BAAF0@AM6PR06MB4263.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDgdoxZJwN9lmjLCAU5yYOP7n7UheRmcRZhTE99SWynA1UwfrSUumTsUvmp0EWwNk0KKwRM08FLW/sUWgf1um5ZNU8RaOjFxpfA3kvLoW6D2hIHiPPdKyR07df7d8NiBIW8iPRbMZNZeCEcoGWF7J9XmD8F1xIS6FuBNyI64iyvkbf51pGbUcvS9ViMZMaos+tVf8q7oMIp2/6P9Hfc2NYbA4rXCZPButsIf3P+L2+1S5CLP9uqQu6a5r3JQ99/J7C6giFh+W4E0vsAWz/V3EK6ZPjRRdfCe3DDWPV7sd8OxvZ4Qd748lHCM91GB71HL4WKabwBvbrzlfP4sDUa/iSV8oEFwXSftnhFUDZadz/Xf9ldfQlVF2RqACg2MQ6MY1JmiAXUNq29LhG+UUXJdFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR06MB6769.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(376002)(136003)(39830400003)(52116002)(83380400001)(6512007)(36756003)(2616005)(8676002)(956004)(6666004)(4326008)(186003)(6506007)(16526019)(86362001)(6486002)(66556008)(66946007)(316002)(66476007)(1076003)(2906002)(8936002)(107886003)(44832011)(5660300002)(6916009)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JdCSZ+o8nsIsx+f81evDOUIlk1MAW7UOJ5eMu1ADglmi0KkyrlKakyaNFf0E?=
 =?us-ascii?Q?SytktMXr3kjU84OyPp/SPQYtCGuBEbsg0M2wx5X2Dt2fWzFIjduYwX1PNgsB?=
 =?us-ascii?Q?dbkugPVLzgBb59MdpvUwWfgoONVWwjRFmibpLf3dzBEmi4d8jQNYAPlJNOXq?=
 =?us-ascii?Q?wcGbRbfUdw2nBD4mqh3QCNXxbEVUP1VKz/eF4X2frUeCC2UGplbgyVsueht7?=
 =?us-ascii?Q?1RB00YvQSntzOSecZo57uhAuDUTGY7sSk/jkl8tunvr2Qoss9afljvbukSQF?=
 =?us-ascii?Q?jWK+vJ6A1uRsZiphQ+M5mAekQwMpEHmXDLCXVtXKP6cFkK4hpmkapICTQX0S?=
 =?us-ascii?Q?/Hmbm1PbOBWJpdjh3WrbwIG9F27cV+ORHpmxDX3GKah1ABtUxdOXk5ACPdwz?=
 =?us-ascii?Q?1V1uXREXgcFwdBiSmWWUIlXCY5y5KZ1r0bnxrGnhW4xHHXrrwpB5m32GZV6s?=
 =?us-ascii?Q?N1iToK1KgBZzR10o60UTIy3UjzGlcs1SUrLw7+UiHHDZVYjqo59XHe0pW9hf?=
 =?us-ascii?Q?mkIOmnYULTEdj4rbmY/dnstrL9yvlH6HvopNc4qxl1LaqfQrM0pxlcLwxkvw?=
 =?us-ascii?Q?Vc00AxKOFAC+sMJr/723QjwMFOa6IDzFAZpzE/UbR5FOZSS82hEiyb/t3Rdo?=
 =?us-ascii?Q?VTWr274IBZSuzwVUJoYXQG4mt3j7gd1XBOFj2XTg6/S/4IE7cNodxzlwhoHQ?=
 =?us-ascii?Q?tekyB6JiAFi7qpWoaE0lm226oxKZ47MXk6MdUG6EkuF8hV9AhPgcd601ww1h?=
 =?us-ascii?Q?NE+8cqEQpZRd9f17b+hpn1TFN4Y/5rAhKU/r6ni5wUuSXpR4bmeQYP84wIue?=
 =?us-ascii?Q?sNYxtUYs+ahNKgjbRxoBuIf4ZI8uWCx8EXU+m6HVgqDY/hpXxaDSeT0tWdQ2?=
 =?us-ascii?Q?QY2DNUKd3elmt6Lu2CLLZvB9MZqDaQcv0fs4qdPREN9LoC8Y2w4g1645rxOO?=
 =?us-ascii?Q?SJBJelyRonwhiSeCYIbZJ9gPESqe762d9uztqNbcmVR6WaXVXQ6x2Nd1XMRC?=
 =?us-ascii?Q?Xakz?=
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR06MB6769.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 09:32:34.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03c5283b-bdcc-41a6-b827-b66aa8b838e3
X-MS-Exchange-CrossTenant-Network-Message-Id: 613317c2-6935-4f64-8918-08d8b2ef2a4b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LzgMABYz1tZNVdn0RO1KDYSBmMkMNAmfi6XUEDQeNE7MXh/L0t5KyAMd2bgdy70CgHZ1ErEWPDMCOzKYnTGJBlMEBe2SZeBWNlc0vYDw/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4263
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The of_get_gpio() may return error, so check it immediately. The old
code might fail with EPROBE_DEFER which was masked by the
folowing gpio_is_valid() and returned EINVAL.

Signed-off-by: Radim Pavlik <radim.pavlik@tbs-biometrics.com>
---
 drivers/input/touchscreen/auo-pixcir-ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index c33e63ca6142..8f3cfd743bdd 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -479,12 +479,16 @@ static struct auo_pixcir_ts_platdata *auo_pixcir_parse_dt(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pdata->gpio_int = of_get_gpio(np, 0);
+	if (pdata->gpio_int < 0)
+		return ERR_PTR(pdata->gpio_int);
 	if (!gpio_is_valid(pdata->gpio_int)) {
 		dev_err(dev, "failed to get interrupt gpio\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	pdata->gpio_rst = of_get_gpio(np, 1);
+	if (pdata->gpio_rst < 0)
+		return ERR_PTR(pdata->gpio_rst);
 	if (!gpio_is_valid(pdata->gpio_rst)) {
 		dev_err(dev, "failed to get reset gpio\n");
 		return ERR_PTR(-EINVAL);
-- 
2.29.2

