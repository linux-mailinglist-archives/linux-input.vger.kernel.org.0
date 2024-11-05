Return-Path: <linux-input+bounces-7869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28749BCD72
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5FFC1C21079
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580D71D619F;
	Tue,  5 Nov 2024 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="EPvSRdIt"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2EA1AA785;
	Tue,  5 Nov 2024 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812168; cv=fail; b=bldJDWz7cklEUv2T3rM2H/CAvepCbhEKx7Sb81ExoBCOKwebCFXAYS/TpugJRleGvZ203a+KG9qZV1aU1d+q047POm7k/x63LXS1tYCfL/tDVDcA37hRWvIuFjsYScpFglfm6dsDNacHRl8sEIOCSJI3FoPw1QjO/t4q+P2NXew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812168; c=relaxed/simple;
	bh=mxjAbWOV464PMVwuF6eGOPI6nsHK3o08Njk75jLKYJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aU8Z5R/FTpDJdVWcqHJAJgOL765+BReei3RjtM3Z+EgynvFvKi2JzzBHeD/8RRfFIeHXIEKr8VJKB4XuhoQ2YssMbqc0sudaExF5RyBc173ZUkHhXSFK3oR07bvYGh5dd/E3ovXr0LfmEVYFag9PAh//gPlTPP+DFAJyzWAvw/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=EPvSRdIt; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJNf53pV+RKzzTtuuFpDJiaaBlfZHqFHhmCKjMpGbGvB/7PPCsEph/MwOhFdpZTA5LzL/ZAgVdDom9V1ApSOiLYbFDu53Djex7BjZ7fNqvn8Ew5s9D1Wio5eXD8HiJBZ6GNT6k0zOkJn2DU+9ofnuDAXJF81HQvWEL7rC2uykeXxHFoNl8/Ce/AR0GTUpdhdU3RoCft87rjGEyHCKkNNJwVRoXlVmO+1c8UqHu0MSpfUKk7bR7tIGeuWj2LRF5GKKRkp9TT4ue3M4OidNfm0ONPZDOqvZlouQj57EFGJYePAWK6c8C+c62htu8MnGvSfWfYgre0tC5hks9DNx4izqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSODWt0opjE9i0NHr7kGA6OkXCCnvHRAdLpOTN3muO0=;
 b=DdhaXoKDqSlF0AsTz2TfdttCOw8btm93NDIptIpJAESdFeh8OKOTEpbk9UfnviDVXIfyRr/MkSf0JHYGHCA3dZRsVJSm0OvmL+tWryetkI5ZJlNeI1MENOhgeNHEpdjprmklBkN5vh+5h1uyxolM2jRNfevg1zf2RzXJ2mg5O2gCXU3BPxOSB/s4quOQLF/playm/ZGZcbIvRBPGCcaWFoJo/JsKRAfPsc+6Pq5aAFDWMsYE9d4ppI6uhGAkclXH4l5qru2BepWZgqvYLQVQ9wHL9pdpZlmPTwI1ny6etTJfDil/tTOtJSUUq4ZE54ug5WnEPPcq83LsYjbeeG3ySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSODWt0opjE9i0NHr7kGA6OkXCCnvHRAdLpOTN3muO0=;
 b=EPvSRdItUERXILhH7AXN9jG+DikQ0OYY4veYeHlru4o6ERAU8J4Ws7EG69x091djK9X7MGiCN0Xl3rpwjVkfKGe38lLOqP/4uqEE3B3neBIn+FehWrhCjbjfO7iXbgjqspiYAJAp/td7sUv3zPt1FYGoobqbAEtoLjCaax+yMlqU1sqLsbkVsv7oSNxXAsIvgom1O067yd52f5JpsCN+B2cNdK81FVqfGvQIPXy2EE12Q4cOMFx+VuPOMV22uHkpsQHRsa1n63RKMKKJhrGG3na8ZIit/zY8itH4zeivuqVIgQerATeeUP+2Jbh3po+U4VYdrf8NovNKxRVroTevjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GV2PR03MB9377.eurprd03.prod.outlook.com (2603:10a6:150:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:09:22 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:09:22 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/7] Input: matrix_keypad - use fsleep for variable delay duration
Date: Tue,  5 Nov 2024 14:03:16 +0100
Message-Id: <20241105130322.213623-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GV2PR03MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 513e86e7-9bf9-405b-2b58-08dcfd9b1105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lj7bE3ywiYpfnp9c9jgWnbk+n95G4AYZPz5GN9wIj1z/IJ7M9CwaacNiSKoz?=
 =?us-ascii?Q?TRY4jiNVUpvcH1swi5hSUc6Di4qWhDmQYLmoBJCSwg1/qvWMB8LSW5uGPJfI?=
 =?us-ascii?Q?Vost2lkO10eEzSfJ2rqK6XXpKIuJ0MFrYSmWQWD5Jvzyt1Y8vhB13artWvLE?=
 =?us-ascii?Q?h+BWJw4ogoVP+OzXfYXDQwaSZr/IN6Z/hXzjzCK89wQomKjMd8C69zRQAG+E?=
 =?us-ascii?Q?tf7OlPIc/9mxzKNoOlP0LhI8iElPtHh4Dkmk1y9wYGn9a4o7TBpM8tAKUgP/?=
 =?us-ascii?Q?aYb31aK+Bp6HqaRTEJZOPVAeSAvxpkaxnXQ88MrP/p4IBLrE/F5FEWdUQEj1?=
 =?us-ascii?Q?/a19hqUAE8lEMk9Yk/mkjHLElHVCUFnicaOgu54VsvF9OLaNA3wSWR6ExWee?=
 =?us-ascii?Q?kU5wrWQQexG14lbR0ORQdbV364gMpTU/ujNw7Ur1VnM8S3LBzGG2nt1Qsc3N?=
 =?us-ascii?Q?uSupkcyEfC65+j0Q/Xsp9OpY/V8ABk4PW/zu2UDlnpl5Ar+PjqCE12NXZq2T?=
 =?us-ascii?Q?gy81eRcVOQ0275w5GhrDJE3bePm+qzXMeT0h6RW3ESyelMXKWm6S1CgT4Ui1?=
 =?us-ascii?Q?rl91u0NozyDgs57nClbavY/RUwSX5fNR3aYukvOEq54EzHn4DbnhJncsTD0l?=
 =?us-ascii?Q?FyA9e6skMIa4j59YmZdyiVCvQ8SWaPTrO4zxCiRijGkS2GxNXIfaO+bCoTTe?=
 =?us-ascii?Q?HofwgdjQZ/aOyAmIk6fZwoVUGC3QqYNgURdhjI4BxK51Icxj+dXYjVIyKbKG?=
 =?us-ascii?Q?FeQH6lmYurhTAlb2wGzA1953Xe8t7S/JgdhoT43uaQLUbmi+eRC+oMAslt88?=
 =?us-ascii?Q?G0REdD0iJhk0/xKec/oGnm/atM+osmQXxsfDM5QmXvOD/ACNMghBYF5tEdTb?=
 =?us-ascii?Q?4mgVkiboV1mk5vppuQEz2+VEmazfOkgaQY12INNukfvOl9w5g+b8lFOm0pr9?=
 =?us-ascii?Q?PHFWUGGrL8ObBCuPsaoNlNdUwx+NAcvuxN9tDtJ2uUaZAaRvSZxJDz8dDuJb?=
 =?us-ascii?Q?COaaNeYwoVG16wdlE5CnWcHxu8jie5FfrHuFdOzewXoDd3Koos4F/mBTD4/u?=
 =?us-ascii?Q?qCDb83oJlXOiwLiwMpRzMJvK9Iv0E1bVZ44zRjobxnfIJOMkcBSjNhEzQzs/?=
 =?us-ascii?Q?J9pF3SYfq9rcfu+gyDTs8UF7C9Ex0TZ2K+103sR53BQSZ0be0armE1zyMi9y?=
 =?us-ascii?Q?jM95Sp1YeUSazuru4k0DVEFv1z62s91gqvdl07kUkrtEBRlNpHvPpOCRGLUW?=
 =?us-ascii?Q?lJAJT2U1h9et60xz26NQnhxTaey3YZqmDaG9QAFVCqVQuEjz4it+sSPiCCaI?=
 =?us-ascii?Q?LOefaF2Tl+EkeoInIiNnPHkhppE06F0iwCjXnTVzFYVBbiIvyvLqvuy0qtHY?=
 =?us-ascii?Q?z/uc4kVSJX6RfXlxNvUcRfEeSdkG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OSR6aQrbDUsOotBX+ZXyqP+ORvAvQR9p+umx72VMSkkd81IpsecUM7jj2/8x?=
 =?us-ascii?Q?pECLmiW4LTud5VCi9G7Flv8JDJm2eTjDtk4rYaQsax//MlV6NuhxQHtsyk5m?=
 =?us-ascii?Q?9FkM+qGn9edDBl7E1siWL3tqOiEnxhDGBqeZqGOC8Ff+K8f5kT7xK1nplLDr?=
 =?us-ascii?Q?cgBZ/WMpzJJFzSrx2HBVsCs+4KeJAk6af3O1Uv9lSoZRMB1vIsmRwyrdiKIc?=
 =?us-ascii?Q?c8XDNlfp0f+qGk2RtAG5OX5NK5gg02jBW1VL+clR90fhJtMci25/BGlaJbud?=
 =?us-ascii?Q?junWJnTyPL1pzp4TqFPe1HzVBlWug5Wy0qfmvNB/8gyUtbi2Cb/vIJIFRrRG?=
 =?us-ascii?Q?chS4ATsnuxgPeoTFNdMvSJ5KRGtuUU2/ph5pEEy5vKwyZokfn5FR+0EcxXLO?=
 =?us-ascii?Q?TB1xEMIg+qLrgPDy+L+WxuL6EDna1yY+Ff5p2HME0bY1uXrRfZ0rGpW9hrTv?=
 =?us-ascii?Q?ULBhMKvBhvo5KUf7RvEZ8sOyTpnzLgdggLeDYnUURx19WSYJni3PhAd9dk4l?=
 =?us-ascii?Q?zKvabsL6X2+cqXIs7EJgLbNRybarG0m9yAXIH2+cBho2zuo4guxyTwLpMNtX?=
 =?us-ascii?Q?9mQ3PL4nHYGAeg4Kenc6ewVVN7dM86f46jMyskQrazrREFThTGmp47cd6cqZ?=
 =?us-ascii?Q?PSeoYYVwcg7aKqQ6DmQokv9w4glBN+b+mJkUQGaVo3FvLuJ6I803jXrU+CjO?=
 =?us-ascii?Q?QsD4ACGmPw/MM++XSZAz7SReEAqHDgcoqOguy1t7oWREefh/w0FBCV8RLIXq?=
 =?us-ascii?Q?B5pv1ZbMqM/Z2nAM09ec2AxADfcqrygo0Qo6wseVAxF49qmyKnDmpEuxEpzE?=
 =?us-ascii?Q?RQsFWtDKrc45WBpX+rI7PjXw3sdyHRi+T/LJRAgyOAxKqz48fFoLyCwVM+s/?=
 =?us-ascii?Q?6/STd07ZfzRFsmkT7Kl/Qdm+yW7W4PXaYZFOFn1zjYeONYS8Bi8d9iyY3olQ?=
 =?us-ascii?Q?isv/inB5czIphh4bAm9RAJ8bVKqfyW1L5wF0yC8OHZ+bzZ96WARYwwnd4ToX?=
 =?us-ascii?Q?EpEcwQ9jtkXf7HjQdkOQ4ODXdrWED+yZF8YnuOSVLzWgR7EIydmi3ZQYVMy5?=
 =?us-ascii?Q?raA94O3Hw3Gw1422yj3GojgN0Q0sMxwz4e2ynbwAoQ56AfIiv/fnBZ42ZsKW?=
 =?us-ascii?Q?yC8v+jb/qy/hiIBUWoLS+sFaX17yvS/RRVawkwGRpXNtAr7W4HjqMUzq6nxb?=
 =?us-ascii?Q?FFUt6fcC8+91qMRTDem8s1Ho9zdrcHg0Dd5cLJiDJExY2sVmU2tWludNatJ0?=
 =?us-ascii?Q?+PfSxUhnpJR/qNRIO3wCSzJJWcw73TrXJAFnblQ/By/RM3ILj2xoQZzEkm7Q?=
 =?us-ascii?Q?ZdjlGVnufG2HTaSjIVyh6VmMRehL86q8olbOIpz28u21cYnH0os3xvz774p6?=
 =?us-ascii?Q?7o+p6/4BP1jPcVTfv5hAUR8spAXf7k+lbiN5ygc5AovU7F1RQBn/Dw30hOPE?=
 =?us-ascii?Q?IGttcIfQ6On7/Lvkx2Ykw71vM2t/oXBLqkXFcWihlmGOasGt7aqU8zwKJxXk?=
 =?us-ascii?Q?6Ide18Qz6gTe+sqlRVHMb/wZJ24fMl1UxOsseOW+vSYZP0hZ1izCAoij8NJw?=
 =?us-ascii?Q?4H5s4aL7Ua74qqkNb2FeT2T1xAJFAeRK4t8S3P5j?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513e86e7-9bf9-405b-2b58-08dcfd9b1105
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:09:22.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZfefxVp74OaI9Hq8HVUDEzJKQ5FC4ZKxga2i9/jKjwhkAtWi/BqWopZXmmPXjexMTpSU8ssTq7JAd9TdAvwZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9377

The delay is retrieved from a device-tree property, so the duration is
variable. fsleep guesses the best delay function based on duration.

Link: https://www.kernel.org/doc/html/latest/timers/timers-howto.html

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 3c38bae..9eb6808 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -69,7 +69,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
 	__activate_col(keypad, col, on);
 
 	if (on && keypad->col_scan_delay_us)
-		udelay(keypad->col_scan_delay_us);
+		fsleep(keypad->col_scan_delay_us);
 }
 
 static void activate_all_cols(struct matrix_keypad *keypad, bool on)
-- 
2.39.5


