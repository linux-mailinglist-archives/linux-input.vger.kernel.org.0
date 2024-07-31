Return-Path: <linux-input+bounces-5225-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C63942A97
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 11:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BEA6285E4E
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 09:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DE71A8C06;
	Wed, 31 Jul 2024 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="ahltzD1c"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2133.outbound.protection.outlook.com [40.107.236.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A401A8BE7;
	Wed, 31 Jul 2024 09:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418411; cv=fail; b=XL+aEHNSNPGyrrhAp0s1mF906VDK3on0m9n0jIqbvlsRYTl8LtS3Y59MWRMIcEeYHBz+ojIAi0DEeO6gw4/fdhdlFsgxKFbt+bULITpWwq4kVK/3eIxv2SzvdYB+zJKK4tEHP+CoGxjbZoVlmaqOXdjjEs4NO2xNCcKlC8InlJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418411; c=relaxed/simple;
	bh=PBALEkxo1DXBjV4RM/gsdMnuE+fqWqxlnORs+KryUVo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l9TKS+fmAEXNWMJcYktG7rQWaFf+nNrC6SoGMYvFBv/ZG/5ttIX8MTvb8z+F955kwUT1wmTFDcErLEemEJvYXzGtrsKkX9Pqxb8RKlYiJ4pye/Fqy5c1RFt7MKHSmbkF6KzKM7G9nex3DplXyoL6CGLap3d1LkAjZBzhRW7kYao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=ahltzD1c; arc=fail smtp.client-ip=40.107.236.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVeSv6/O8EzSTzqsB8vqwX3S7qO2hMAd78d1eNQLAQSRgVbS7rx+OveW3rRNpkeGFP2pedmvu8YsbXhF4dvpWDRweP7kQcs1r6AV8Yvwf5Jz3dfQlYzw4yfRz9ochSLEO0vK/ZFwUUf4BjjaQ3feP6UQXQS7p+8UNg7tmwrWR11FXT/N+NHS+YjJUFAPW3YxWnfNGMr9YxUlXlJ7/oZKjN2h8kLIP7fqOS1kZETs5roBkPbqjLm69KfixLHpuF+8thQLE99beob+N9r3gToAMp0udvZUOJwuZir1sMrtvkeu+1IUfGSoyRGsktqIPArT07Gi9vdbgvsbA6OdhC4hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UISErGH+X+lwIOd5lXLNXt+AQwDHRwx7yidR3S/xCBA=;
 b=aR/kRSFoNxT6JVJkAfukRgTes55eGALyo9GKnRI95W3kpW/TxWGX0y+nGKBtwHdbqrQY/cuaQKVxTfhNjAZVcoVLQYvOmB5aIC16wv0kUgNuuj7qNEvCRj/uEXaHM7PTYbv0n04EJdWnlIMoE5Tz1cuXewTl+eMRl9SbHn2bHgGXpImn2RgGfORiRfmzp2h3jloxoopl3Nk+HpVlD6rtrxEJDCleOBfnbwWo0uT4tfP466gtTFmCO6137spaLXidhSA1VGOTuqF4wx4T200NuIteAwWSIJWxZU7xrO2YJc/vxPYaKr3NFwAojqJ1OmAO+BYLXRRUJ7dBDbri4kZ7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UISErGH+X+lwIOd5lXLNXt+AQwDHRwx7yidR3S/xCBA=;
 b=ahltzD1cej1DJuQ6R8pP4srD6ygcbdxcDF7DVIiAI8nClXQrpNCZ0GQbOhQ81DtHmgeHgAMn12vnVlaS4mdPdRAV7emPEnZYZ8LTTTw8UAGsAothOYW6cYCMVymJFVnL78356cuKUqFr2dw/unEYGhNlCU+PjccLPlu9mqtsfeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by SJ0PR08MB6701.namprd08.prod.outlook.com (2603:10b6:a03:2d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 09:33:25 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%4]) with mapi id 15.20.7784.033; Wed, 31 Jul 2024
 09:33:24 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: adc-joystick - fix optional value handling
Date: Wed, 31 Jul 2024 10:33:09 +0100
Message-ID: <20240731093310.3696919-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::12) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|SJ0PR08MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c2b248-14ba-4f08-4fc2-08dcb143d32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QvZ5Cu3gNwfsHALB4y1f0I8CPafl8TR448+F1HFk+pV47K2QWnyCjkERxLwo?=
 =?us-ascii?Q?cSEqYai4sUJ0F4ainMxoEIaPyN4nnBDNno+nYM9UCUJ3i0BYiTgXJHCd0363?=
 =?us-ascii?Q?p+maMAHzTsV62xkpni7azUbX6FN2w3Ks1PQAGtOWu21kBVM74wTz4CIEs0sB?=
 =?us-ascii?Q?nv1GV8OODLYLiyzoXi7SgM6JSi/wYdpcqPi1NPfko0UEzYFvVSlDgOWTNyLh?=
 =?us-ascii?Q?c4xCzM4VrzVItozAVZ8tQfv30toKEpVk+BDgkKHGHiqRnX+W4zsgM62IPJtg?=
 =?us-ascii?Q?//kD4sD4wMJ3k6g2cM1QkAX9ExmRg8AoZSG9SW0ej6yYeZ8x8w0z6aogZjNY?=
 =?us-ascii?Q?NsmJRWAjNZGWoFJhpGf1Y5oBpy7cPGBDU8AqXSDzpeMWcZnZrvuXV2DwpkBN?=
 =?us-ascii?Q?t55Rho4dK/lx+kxGs3R2bujt7dI9HqTVboAkfuyOCBOEu7AYRqNcNh7d73iN?=
 =?us-ascii?Q?O7xwCTBx18mnWczt+SDyQKijRZNckYrhIab3z7sZZxxrcfSFVSqNlegW1lSp?=
 =?us-ascii?Q?ueQwkbAK0jqkNTPf+l0R0NvqNBxIBCxeHoFtzh0leSC2r3JWpXZo4BqLLi8O?=
 =?us-ascii?Q?X9k15G2tnPaLgo16sioSANvO5cuhovQJYIAnM93zTcS/xEecrDzRbq9E0ls3?=
 =?us-ascii?Q?rq1N+vIf9HNOs7GJIAu5VoOzpLYDL43FcHuIlQlwL6PU6hAsbZ8M0QI3uexV?=
 =?us-ascii?Q?GlR0ywcDyqp/YGKrganIJlPxM9qsDQefQiwyaIuk9VHVP3Uv3BZrK5z6M9P3?=
 =?us-ascii?Q?8vO3F0WL7RQNKlqQ2HJSiD7Tnsfp+5+MBTuu7ghhLF0Y5WTNhz5270xzzRt2?=
 =?us-ascii?Q?ifbHn24wJUrKHEvZ98sd+pxTbQucL6XQofqodOUCtS4RdfRaDRuQvxcV/60V?=
 =?us-ascii?Q?wgNnRy109lGETq4KfYAT5h12gSBEm0CN+Czos7CWKSimvlCqrbKGp18TYtlA?=
 =?us-ascii?Q?TzxTYegenjcunq8py82eEDQoEJgYNpxbRuRQ0g6zWFu7ezs4DQT/OlKDwCLL?=
 =?us-ascii?Q?0piDDTb7b1pKuM3FKjQSW7E5Vq8TWkQzV5fl2FQi0lfDsISOzt8R3xNI6sbS?=
 =?us-ascii?Q?6O7qG/1Dcny4tPsHe+7He409RJNqZdUzz1FselVdSP8abKLQTHl9DpCsxfry?=
 =?us-ascii?Q?f8VmZvi2L2L8JydjfARZV5SSE3KFoEPoJQazMkYL2U7/b6o1dz4sz1uMy4TB?=
 =?us-ascii?Q?QCV7kSFcX9x+FPTPjztp/pi8xDZPCrJmvF78CVzCZMCmHHhqeNshaAZgvB4V?=
 =?us-ascii?Q?S6rLVtAGhnHa0Pizc/54FiyuaNqW9YhR2zNXuisZoLNVNwpv5zi7RftATMjL?=
 =?us-ascii?Q?Bzt6GFLOXmSYvgvr7q3MRId8ndYIUrJGxsqcuYMdDtHcmaD1B7+9lmdPDPBG?=
 =?us-ascii?Q?dstZnymfGAr8ze6nsZRlzSvKWWdgyUxtPuZirOlNpqCxnTM+iQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LX3XCi1dp1xghE8NZoKPX5WAWNCf6tZka/9QAZMCX705i32x+yp6WHep8y51?=
 =?us-ascii?Q?BKQsxIojpjCuFTVZEPBz1r0hsZYLxrouzagkQf5HkUBMgvdZs4BvffS8WWUL?=
 =?us-ascii?Q?M+Z050FZiw24NN+FCIB+nqb5Yi56gBZCemEaZ3Wga7Cb9inDxBvBXQl45y8S?=
 =?us-ascii?Q?Nj8nn6+O7oLaj7boaYLwQ29F/8sTzrFfUu70JTIaQr9TxjO2CDRdQhrox43L?=
 =?us-ascii?Q?ykIJjR1tH44l71eIKqT58W4DOe9uwjQlvFKLfrwU4yHG+m1vDOCIDtVKspAd?=
 =?us-ascii?Q?bkOjtcZTHkBLuyqJMpGZ8YRbGH59r6NR2rBt1NTYkk577OuqNnpY4J7jJ8Ph?=
 =?us-ascii?Q?fS1b91jaLxjpuL7pVVzaCoizAqLleUPX5tUufpwmAtYKrLX81J9FleKsLPZw?=
 =?us-ascii?Q?hCvU5ZQnWbNQbqZmYiaDS0Jc98XFtjF3kMqZAy3BF7KV96X/mFLUOmGukTqz?=
 =?us-ascii?Q?fp3+yiaQ0c3CGqwL/3hEORYO6znS7I2pZtTs4/KIVOR+uZi3NTRUm+uJjS67?=
 =?us-ascii?Q?hsuu2x0oCd/S2zycf8454jntU8Ef6/7Pir6JvR5JMkjC33SkPZCh1QafTPzs?=
 =?us-ascii?Q?RJzPU/e4BglrywgF07LChMVH8n5WVt2eESx3cZL03m+zL1taVRymwNbApF7G?=
 =?us-ascii?Q?YmvJVCDg+Ko79QI8p9u/HH3g1wbZNa1HgvLceI6zJvF2mcHL015O4mrgyC7Q?=
 =?us-ascii?Q?/rghp5jIoB6HlwnnyXJobiVysnZJHFoBhXi1Ec0kdbPiVvmCXSChfJw40in2?=
 =?us-ascii?Q?NaYj66QRyiqfV8tGoqsHHP73TREkML4O4DmB43thAiopbeA2dXbD2Nz4V1QQ?=
 =?us-ascii?Q?yAgz54dkg/Z7Z/yZVkwF7Oxa2A0SpWafZWFaWzRG96Z24uf8WSyLT5/ozn2i?=
 =?us-ascii?Q?biyBQPUZoGMdlMw3nWcsgtHfEnYSOOBXM2jqAAD2RwJ4qwpUwe9Ef5RWL15x?=
 =?us-ascii?Q?ZplDfkXe3zFPoWLSgWrzhHeJ6JJBFbbfDTUMQ5R7RVoMN78vp8O63V7Fb/O9?=
 =?us-ascii?Q?ONntXRew85jncLZAE8criIvxxCkrbfY1frR1gQfgOAwvLKduWjgFi8vSU60e?=
 =?us-ascii?Q?rjfXF57YC0zucJsyTwL8Mszj6liRZI1EUZ4CaU6axrGZKKRjQVl7DUVs2h5z?=
 =?us-ascii?Q?Tbklk/3Z31VbLdVX6CpKCBMbJ4ewacmmNN6Z3BPw8+q9iGtoBuyJ0a+c95m0?=
 =?us-ascii?Q?G0AKyIrF6cMx8Ki3RS35jrn72bHF0mwG01mFRQ1tnTLS937ztJzMuAcPGMKp?=
 =?us-ascii?Q?X5lJRhiaUloCc6l6bQs4Uh/RL0bHFsSfNCPQZfRgSn2P2XGBCaxPPHCWntGq?=
 =?us-ascii?Q?+ZtoeUBJV1s+uyKhQ7Lhxtgel4h50KHIV8qkAuAol3BcPSM2b7oRCFMG7X/B?=
 =?us-ascii?Q?wZtpo/pSTBlxPehZ6jDPLvemCa7u5Fd4FqYBG5jriKKiOw7OdTATEpKGLbYQ?=
 =?us-ascii?Q?k2fsX6ULi8oAEyAT1YvbqJW5P/20p19fYCxEOeKa2u0Ahk2JrqtODoCYqbZt?=
 =?us-ascii?Q?fDwJwcZhvfq9lXAJfYPk+Csgg37GAOaqNp5rCb2bqrsqlUbKjrn7Jg9eTSAQ?=
 =?us-ascii?Q?UFYk4At3asvdMYdWl7Rj3jxw2mFd81PTGuv2SCeAXG7wsvCJeqV+J3RVsiBE?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c2b248-14ba-4f08-4fc2-08dcb143d32c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 09:33:24.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7WDgc15uDLMRBW5mruYK5Hkms+iEVqs/1gACNHSUXN53ytGgGq0m5r2RTVELFNqUEOo+map0Q4O9dxeQ/R5pkBk1Y64BHHLzOduebxTtc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6701

The abs-fuzz and abs-flat properties are documented as optional.  When
these are absent, fwnode_property_read_u32() will leave the input
unchanged, meaning that an axis either picks up the value for the
previous axis or an uninitialized value.

Explicitly set these values to zero when they are unspecified to match
the documented behaviour in the device tree bindings.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/input/joystick/adc-joystick.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index 130245be884bc..02713e624df1c 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -180,8 +180,11 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 			swap(range[0], range[1]);
 		}
 
-		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
-		fwnode_property_read_u32(child, "abs-flat", &flat);
+		if (fwnode_property_read_u32(child, "abs-fuzz", &fuzz))
+			fuzz = 0;
+
+		if (fwnode_property_read_u32(child, "abs-flat", &flat))
+			flat = 0;
 
 		input_set_abs_params(joy->input, axes[i].code,
 				     range[0], range[1], fuzz, flat);
-- 
2.45.2


