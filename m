Return-Path: <linux-input+bounces-5868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125095E7C4
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 06:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2551F2151C
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 04:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F94A2E419;
	Mon, 26 Aug 2024 04:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YuP2xPpu"
X-Original-To: linux-input@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2059.outbound.protection.outlook.com [40.107.117.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8310F7;
	Mon, 26 Aug 2024 04:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724648000; cv=fail; b=b4CqW4PieKagC1PyL76VCqzfzMwYCD3ABy209yXI0F8+xwiT8ktmIXvhGLPLacKHiIeHiEjV5L9FSy7SlVuS78OYzrEiMKS1lCO341SkZkbpolI3g5cxc5dTQtv6R0h6om5Fd6OMlo+LL0pJ63O2GyClh6PVGNLFI3XIx2KGojU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724648000; c=relaxed/simple;
	bh=G+mg6KMIu5hrK+4pODIYqEpLsV9e+wytTGgkjfXky14=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mWvPjWrj0PF+Ra8wLLhXolSR8upo5hMwBItkAZbADYwQjzKnDnkHYaGj1xO6ZTSfQ/PV+B6LIWijcS+mqmjAgukBPT9SHTYSG93Hxfol0hu5JKc27EPRmvTku0z8mRyQzrf2TicTc3NGEFFg6AQjI7VJ1gNFcWk3Q8KEPBP0Rxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YuP2xPpu; arc=fail smtp.client-ip=40.107.117.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXaDP3laJpZcgnI/SJ7g8UDkmI1I5K1UJWS7Z2i9gfj7h/O7HkeqN4PUTVp6CZlMpXIlGX5De6rH/2lujGQuygc7JkQCPusNWXDEWrVdpVGXwhCoscJUzatLbaSSgDObrLegtVov+fbO95ec8B/G6n131hwShW4WcjmDzFPdFI6MDxSKM8sDBU/qoPiXPZkH+cT0WeUTRxm2zqlLGSUt8rQJDGUwVW1YHEE9rMD5UkVkHU3VeFtIUJ97+8AjMQ4L5RnmuaDx0kGmcgRhB9mFc7nPoDEDGsC0pXR44CWfKK7nQI6SjXSgM0POD9kBCJfVtnlrwYoq8BSyOQzf9pqAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogyw2i8X2lFwz6teQLTB8szg9UUm/rff9PfJSsPAoQY=;
 b=oHiguvOEQ1XXbsnSCdk9bHGRTq0AaM3B1cIglyN8PkWCsO9/MFdQTZpfaXrIZyPxl23/J2AAvYL07cRlUokNi0/WbpfM8Ml5r9Fn519Z4DwLzdbFSV8QITKdg3TagOJH+yx3x1coNZuUbRO1VBR8zixlD/Qi4JE6nCvF34kGKs4NPWy8obJi9FL6cMLDGjxZkWgbnSjuXGgLWKELp9IU1Dbq0zGaRW1fnD6qtmnfHWUdZnwHyyg2A52R6Kdz4GYx/HmGYADfgtHYFo0vBwX4WTBPdSwQFy7xuAM6MxVsmVWjQQnojLASl6/crY+AOrfqz5gj6/jRo2JmQU+w/EMcBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogyw2i8X2lFwz6teQLTB8szg9UUm/rff9PfJSsPAoQY=;
 b=YuP2xPpuHpJj3pMJlxO2vHm+O586E0y/fGVN1teN6Twc+vXsyrh7s9SujvA5dOuZ/4R/zDZQjTM26L4dbspI5s3qGwzCITWoBr9FRTUe4Z5U2iww0VmGyLhS2Lm2ebXJxygsMniYw9TVtmODVS6iBzqWn9x0q9SNZLU/EnZ6v/Ivi5nPSJqf/AtIdoa7I2jvkP+lwcL4TQJJ9Ld0Dfz0RZim9EnZDDA7tD77ujzliUvtwM7MkWD2XT9jVtk2NVcNVuX6+55ZGEQCkMyuvKib2PbVVfi/oLUmn6h/9XJErrDQSVFpnB2pC+foPbjFkSqoXdSfxA+K9MXtaG0XobC6XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR06MB6709.apcprd06.prod.outlook.com (2603:1096:820:fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 04:53:13 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 04:53:13 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: mitr@volny.cz,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] Input: wistron_btns - use kmemdup_array instead of kmemdup for multiple allocation
Date: Mon, 26 Aug 2024 12:52:53 +0800
Message-Id: <20240826045253.3503-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR06MB6709:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac86699-4d55-498a-4fa2-08dcc58afd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9JGAqBCgbu+Q9iX1S+UgNd/5i3Rpj110ibxDP1KP4VNwH2BvPCS4FA9wQ1SE?=
 =?us-ascii?Q?M4Q1R7uX6r4R9kSCA6unDQ/ldP1M2uCu+1vP0qcNYi8C8zMYRd8OzX44kikF?=
 =?us-ascii?Q?562cDyez8PBA+Z3ANyClsbknMqf/kWRl2xPPz29w89P5g4JijF711KN9r4cj?=
 =?us-ascii?Q?qsWeDxIczY474/SVg19VlGGMcZtm3tDhRA2luD4+TpWQDcmL+wXmqbX5IL0e?=
 =?us-ascii?Q?zmdugAv2QzHH7RhT3PRRWk8Gd4zwHxsbpkmLSY+f3ntLol+vkTuy/VhZRVRA?=
 =?us-ascii?Q?XAto5NAIebQm4+sjo2YFhrRosYX7nJld9CsWJ5zCTo5SEKXkUUTwZbN2Q33g?=
 =?us-ascii?Q?9x8HhU/WZl5ZzRK6SuQylvD99FgHl5pZxr6u13YDvOuTx62eOqvczFT3A9wD?=
 =?us-ascii?Q?INmdRH5b0gkariIcE2FiI7btxZV1w9q4dh9S4t0AsjKyFHH0LDcj7lUeqsFj?=
 =?us-ascii?Q?ulWo6/7FAa9oh+ksjX33jNVnNOg3TRG2XGSVY7l9xNP5rw12TapB1EU+ikNV?=
 =?us-ascii?Q?cLYQj1HG7Ga9Ni6hlsLjR9Mwp0Qm/lILfrJq6tIxRDDPSuoLckEE0+Wlh/3g?=
 =?us-ascii?Q?mEgF80/69WWiEyNDLOzf4zF3RPeSrGVA7fkWzM2C4CN4r/Z9lWKP46vTWlOt?=
 =?us-ascii?Q?drJBJJ+prcy8DhfMDXV579YRGz8Pyr7UzF+qZO7n3nSLAiT/a54BbBcq5RzE?=
 =?us-ascii?Q?MVkLznrY+MqN1mCZ/KZELBPxQ7IGzqdcElAo7HKK79ZRI8ggR/gaFZ64O1OQ?=
 =?us-ascii?Q?68giFS7ynUp0gAqKFlDIcPZrpl4yA8cVsE9uQzmQ3FnfNmkdX4+vEWZNWtzt?=
 =?us-ascii?Q?OjLF+VQ/3kFSgCtByCeBBaLbCjkcz7TgSPk+yIiTGHPWbgSq9Jg/Q4IUmHHp?=
 =?us-ascii?Q?4ObMlGzFdm8OltumWs3AZc17VVUVK2IksDnpThGYDbZipnw9Tak+7cnlyZnz?=
 =?us-ascii?Q?/+8Yys/heK1u1tMNdvrauOwH+NUADUhG2FsPno4CAzKXsoIooft2u9xPH1Qp?=
 =?us-ascii?Q?D5uEv4lcUo/uYlzg920ugoQedOK6HvRn/bPW9vZlFLVpuODAtK70qSp+Hw1N?=
 =?us-ascii?Q?71tv5kmk4UCaE7q8LWKtecx4P+6tPou288RZp7YBLNBhLgSR84A9WN3LiqQc?=
 =?us-ascii?Q?WlR7pObtT8Qwzn8CPDESEo38URCZgW5qL4O6Hz1zXOkZphjGlZLgH79LZ6ND?=
 =?us-ascii?Q?4BCz4YBO5R1c5fPCliFtcsonQFJf5or6v2D70uMx90TA4oNs78qx8bdrTEgJ?=
 =?us-ascii?Q?vtScloTQm0XCwLnaQTCUUtFLfb5SdZ7ncxNJYFJaPjWcXrMZQ1dUz8OsKhwS?=
 =?us-ascii?Q?PJ83ZWYqZAaJ3t9ePikJWvClFttKgslcpwMpK4jgj0SWb5/v3sPSiF6/qpf8?=
 =?us-ascii?Q?d0TnVtFDRBV39el+h9IsGosD3E+If+jWc9/shaE0DMMZhu0DMg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5AMqGW2jdCiqBE4LtAAu7fearb+RNfeYc4zJ0LYQ3DbFLngby3tN2LhcuEUU?=
 =?us-ascii?Q?eDFfnqXX5yTX9oUkZVZt1qa19G2s6JXGdC4q29RBryy6jXT6eirKDXg8yca0?=
 =?us-ascii?Q?dSnjif2z8bJ5NAYPOLjxfw5Q7UeDN9BFvj8dT1lUDNA4AY9yE8N4uyibn/Ub?=
 =?us-ascii?Q?8+vdDp8NZLWLVK88rou0jQJugup4OR28HCiYCK+KXRyjAvYTe/cetI9/VnAQ?=
 =?us-ascii?Q?64R6iro4CTe7NS0AetqR1VQCarOJRtWM0BYT+PalTOh1EaZmpoMwk3qYUmrO?=
 =?us-ascii?Q?JtgNgg+0wC8hvTalE2JqLJFi6lAbAI/t8gqzzac3Mj8RkirteDRfsINAfa+i?=
 =?us-ascii?Q?Gm9AbA/3y7He+ZiQRi9zT5SRlHy93ZYblx1kdRsjdyR3D2/Q0XqZ+CkerVuE?=
 =?us-ascii?Q?J90DCQkpRWifpPkJYaYHa3/luKSaosFVS+qsHEh698V+DgOCspAXSaZN7/cl?=
 =?us-ascii?Q?bqlF3q5MwFSDf/qc/fGHezkhsGJpdGzr3oKkiFxU3AFWzxut9dqCfjd2icdR?=
 =?us-ascii?Q?nGUwSdJzfdZ04sxaFhwfGz25yl/ybBkGUtstYRAHAeOZNegFJQcef+kMHhHd?=
 =?us-ascii?Q?vaagVRDVumqk8M7a95FM7PFDcxxm7O8bAjeyATuYOE0depshAZWM+3RbNp7E?=
 =?us-ascii?Q?dBA9wFmg3eDis4EHCXgCG0Xjp6k7mHkvVailkTgQyFWwp1taTd1vp61JmIIN?=
 =?us-ascii?Q?sur8+qb82oOpIwcTpn5uFfUAd0lpj0w3JKU5vLn4dOLUHOh3tAqsIQI5ySoQ?=
 =?us-ascii?Q?0Z4adrdGo+lppj73qc0vWGxApKFdglfmFzaljIcN4R3WTFNKMFQOVbUYZIPh?=
 =?us-ascii?Q?5gsqhs2S/llOHTW0egsiBwhraMKtNYboXTkyfRTCZueDDn3/D8gU/plzSdHR?=
 =?us-ascii?Q?LDQMG7kYVlxNyFVUTtduxQ/0C/0zzqfottJaI/hRnzYiqMCys15Ggygi2Y/B?=
 =?us-ascii?Q?eEWR6cjcSmv57OO5HDNeDPUwCKbAxcAKOjm0lshLNKgSl6Mvdeo/XH0dp/Yx?=
 =?us-ascii?Q?kX6zDua5EVttUWOcKZtJgrTXbaTIr5+Odfx41T6zhr4O5BOo54Ku5b1ZDHr0?=
 =?us-ascii?Q?uNtnx018ozELQILdP6Fu3YVJV02d/N9dyjr95GdC30w2m3Xq+W85wCuU3RqL?=
 =?us-ascii?Q?sfA+sOG/8YO2wbFAk/rZV75GvMNE/rHtqXIG0errTvHaN9PKdfqBCBIu5B+3?=
 =?us-ascii?Q?dPZOCNsRCiDZewxkIPmOHzjCU2YgRKv+JPdFMRzD5qg2lnEUKAZkPplqBZ7K?=
 =?us-ascii?Q?B43Qe5CMsxSV/yMdEB2xjqA+lnqbWlJSDddC1QhebaVW69u+I9Gx7yh9NvVF?=
 =?us-ascii?Q?c3hHmO0XePLqQH6trYo1FF3ZW0GGfYuraFtSCRcdglmEJGttXKeqFQXe/th3?=
 =?us-ascii?Q?rAlhhM+G1IuX5SSeR5ZwAQfheahKdhR0ka2t71KcGnAQW7c2zF2dSRLRmSxC?=
 =?us-ascii?Q?7a8RjK4XTkiD/9WerMdne7h2YYYLkalhpxIW2TCdW3hI1Q5H28JHxrpwlRnX?=
 =?us-ascii?Q?OzBjd8p5CRj5wPcPzA3Lak9q3AEb9C0wV6c7FK+Zfp6+frD3t28680mamab9?=
 =?us-ascii?Q?JHTzuYZwfVRfOH0+1NI5dvTUR/vHDwfaYOQg6Gan?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac86699-4d55-498a-4fa2-08dcc58afd6f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 04:53:12.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17iOU+exyeW2fgrZGZDM/IDxt3+GK9JSq2PaO8hPRfn05iwwNP+8qND9OrTZ0tJBeB13g8d4zKEjoApYJ9vItw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6709

Let the kmemdup_array() take care about multiplication
and possible overflows.

Using kmemdup_array() is more appropriate and makes the code
easier to audit.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/input/misc/wistron_btns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 5c4956678cd0..907b1a4e6633 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -990,8 +990,8 @@ static int __init copy_keymap(void)
 	for (key = keymap; key->type != KE_END; key++)
 		length++;
 
-	new_keymap = kmemdup(keymap, length * sizeof(struct key_entry),
-			     GFP_KERNEL);
+	new_keymap = kmemdup_array(keymap, length, sizeof(struct key_entry),
+				   GFP_KERNEL);
 	if (!new_keymap)
 		return -ENOMEM;
 
-- 
2.17.1


