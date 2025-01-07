Return-Path: <linux-input+bounces-8999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A41A041B6
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 244057A29BB
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D549E1F4E55;
	Tue,  7 Jan 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="KlKMmb1z"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4653C1F37A9;
	Tue,  7 Jan 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258635; cv=fail; b=fuQmZ6uO2xyC6VN4yYzpdbqkDiNlmxU46NrwnnqQfa5TADVCI/Jl6LkyWZiQM5dgG+VYAOpabNJO8VVbWSuYv8o01Ag9dnw2Go3EaWEawfTaOLtdAo4TlX0tRjY+WspbuzvN0EqkZHpYUY+j3Pt/NzI7faHOCFkjPC1/UXrkvCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258635; c=relaxed/simple;
	bh=7h6h9w6vEUzZigk2JdoCjfHo3ypu/ZX/g1RMssC2Ows=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nbkGwEzdzJeePATTkR0KpCViE4o0n9vK0D4cmJzQGbXFR77l3ZeRRZ9dZaC2cKAo2VNDBmwrkZUKQnmEteQmibRMRVaBp6XOn0txRI7CNsqKJVy6G4ixR4vSxkkUx4G2U9LPCAj52B9b0MoDnFT1c22njrdGXVaFU75W9FU1ixI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=KlKMmb1z; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzr5IAtjBzW7ks+CVaDmgHAh/V27AEulPnMPgImzfdu3t6QZUgDNEweG05z6wH8SZgQ8MT5/5+mlABdkTs30mMOxNpaNi4cTBIXk0EJLiditeQf+/OBXVdUKE+/BVUhYrw8FBQZUhCyYg4tG1ywp/9ha/VeU4OMTsuH+J/+dY8GBW/iw8i+y1lx8wRtF9eavZJbzVJkwKsC71yv21p0ldCzMGHe5Fz6pfotSgjsLP2ncF1MBZBYPSqTGrg5P1JlAhCYn5lx7UtKYmuFPfbjiA5o2FpdlidF2R6V+3AzUJh2iv/6JFxn7E9+0gw1NvMYFWN5EF0mq3K2f+lHE1gojhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTrPZW+q3wg5Z2hgOj1Ic3fDii2ONsyXjf9jC040i1k=;
 b=PTHtfD0xFuV3npWPB2PeP0iHYmAsHm30dNe49PVeSq+qfYXrRB/wifQGoN5Kk4NNaIeIXx0sUgZmoMSFbe3HpPYswKygtMnlf1A+x/8S3+JyCtZyKt9Jvu+JJ4mdpGVj7voAGOeuEjD1MBoGb8GwBQ4kj5gzKwwjZaI1zbMINSrmDxfPsNtKtUWhErSUnMCUA9z9QDY7HZVdz7ghAM3oU/A2Az2qN6svYZ5w1kFsiVrxYOZUiVy7eUMJna1LnM1qjHLOJCYwDZ7oDV1rX68cCxD1fak2CJGxDwAEtGc9pu+8/EMnlFHtIAu69V/w5513Tt0iHvnVFnj7ccjoE3TOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTrPZW+q3wg5Z2hgOj1Ic3fDii2ONsyXjf9jC040i1k=;
 b=KlKMmb1z1Ewcx6voQL0ltKL/vQLtA22exfJAXPXXFNIKcstmj4qvMiDGLMkaCXIH6ZlvevNHzB2mcWqUViyeQGTxTexYexH8PuZkOWv0TmRI/AXDJGu2rl/CzyRrOVXYs4pj1etJzgc/jFa7x8qudClB4ZAR3XUCLQR4p+jMzcsH2mEfNKVabtO018y7BbamBppniQua/wnvt21EQ6/bPMkT0HX7bZeJlvo+yo5Do2kKc9yyz2Fgzvs7x3sZATmMIkzOVjqI79ViotmGdb8MmBZrGcjj/VlwxjF2caND3eNOSB9HeW19Jm4N3YAW8K850QfQt1hF4a2gVdHhrWm89A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:03:16 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:03:16 +0000
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
Subject: [PATCH v3 5/7] dt-bindings: input: matrix_keypad - add settle time after enable all columns
Date: Tue,  7 Jan 2025 14:56:57 +0100
Message-Id: <20250107135659.185293-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::8) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 5662d712-3247-4ff1-e3b3-08dd2f240836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HJH1Mlgv5MiDUPMt+gmtw3cAt8lESjTXjZlLYiyk/ZAFni2e/hLtodTG/ufq?=
 =?us-ascii?Q?Ub7HiXRFlyPjIztblqZ2y9cD3jA0AFrTeP+HwAxKrUp7LrnvzfnYpqEW3WuK?=
 =?us-ascii?Q?QoOJzu/HgAaG4MlHcBRxFhJ03abRm9IRoGDuZMKiYFPV9wSzOo7rQgPtwQuV?=
 =?us-ascii?Q?8SCIv4blEpILhl0kzvQ65iCVQ8GQGYkXldpV+xMvk4kirFIg+3CnUqAWIHck?=
 =?us-ascii?Q?EG6A00xDUdHrOiNR+Atw8095QHgp5wsg/NrEw04mn4BuEW5uUnbHQJhRdd29?=
 =?us-ascii?Q?+2Qb/QAp9bJfP3pPpUiFwoo5/bOosIgLHqq3GHAwxRjgzi95q4iNiCTJJNkM?=
 =?us-ascii?Q?ebZ6xdKzzRYnbAHFR2MJ8/1PEzlF0L158xzV5r3G5Hp8OvDCCvTjxHcTlMez?=
 =?us-ascii?Q?A3XY+virECNRBP/9OhlFe5hQrRerwG+sMFw97nxSwAv0cXPpfmcVW7qgvDjr?=
 =?us-ascii?Q?HlVyF/vqZgSUazLN9X87oHiU3RJ1uE/7CrxqGGn43YCttILA35xB3qb+cscV?=
 =?us-ascii?Q?wkFI0LbUUgtXQI71noG8nsLCoJn9OCr/DuyW3Nm+6UakGrnGoqlUWOZ6fzej?=
 =?us-ascii?Q?X98rt5cMCyArnq7wGh43VCo3RHlE+RhMbqX80vTNGHLcDwHXeoPmVjLX7Qys?=
 =?us-ascii?Q?nyjm4p+9PmVvTvCKd/U1lVeEmKqcRFqKQG1cKkj2ASwebUCzozDg2rnCfFSA?=
 =?us-ascii?Q?cFivZlPH7f4csj7mgZCI3ovtrYfEgcpYg18KF2F7z6S3z2Ws+NPyLUNJfnj9?=
 =?us-ascii?Q?jAV8nWbLvi0PEjy5Q36i0eHh93CgL5JVIfFWUksfSwZyJBHpvg21InxkCa6v?=
 =?us-ascii?Q?HUO5pglLgVojxtADKXOL9/AymcXuHKQwzxuv/lUqiP6U4bpI452ZIIaqbTAi?=
 =?us-ascii?Q?o0c5FylJ9Inzmlj5aGyrbet4FoVJTZU2lyVq8guFVfwUUP31oMNDCD4hXA5r?=
 =?us-ascii?Q?j1slcUX9hW1y8nRoU8RfDdrGp0O3Qfs2L9kyikgV3fbbFW+KiRyWG4lbnAkw?=
 =?us-ascii?Q?DHUVwemY2kCX35M8dwPne+CrfnvzbBL50WWEl6F9CbrcCcb+Y/5SlGDfHYGW?=
 =?us-ascii?Q?/hyoEgS7NtSqPcDlhzdCheAVmNmnCKlQ7aV2891IsrlyKH7NDEpZ/8W+HKzF?=
 =?us-ascii?Q?FJ4wkmtQnIh0HDKx81R4TLIM5Z49p40Hb+l3bkd9CN0pvjglI82eCGhf38ZM?=
 =?us-ascii?Q?8Ex/OmhdMwnKmfjH4eBnyTy5SgV3F92J12WkGUTazwCPwDm9kUTyevFVMija?=
 =?us-ascii?Q?o6Ypyp+HEkTbzcFZc20xy02AOgDsL2kEhbAKacOSNMbBsccEpISmbqR9j3L8?=
 =?us-ascii?Q?mLU2v16PMppGtcPhrverQadk5DR6dSUxLMj7NPpqYwB/Omjj1YEqVAu/sO7H?=
 =?us-ascii?Q?Vi1pB6pqRwilA3+FjDbwH0neth6pSd3ZNTKNo/lmIjYk4OiXQkOdWdDmzKc0?=
 =?us-ascii?Q?uptEh8u6LYiUDq2uD3Pd9yScoMxdxSvY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AoK+yMUJDibHDyAqwPIqU5tBWZREu+6b6yt7SnSZpngKlZqv3anLlurcOFS?=
 =?us-ascii?Q?yUYdipi31dzqZdfRPre0irhFJ1ECdhgrFaJfNiwara8myFthsP74qYUCP1sr?=
 =?us-ascii?Q?/srVnY4D3xAmgK38H9w6ueFc/9WHByznrjL0vG4lXc0Toe8RZ78RgFuS/sK2?=
 =?us-ascii?Q?6bIZncGFjCWQVvbWuULCU2H70emg+QmpFgMF0HFoBkEX+B4kTSJeEkwjStpm?=
 =?us-ascii?Q?93Rh88irdk5WTcNWKmOmmZngGr0VpBWt5pfzXUhYJumGgPhizUuVZp7oLzmp?=
 =?us-ascii?Q?4lqY3bf6a2RXw+6DwkZibOcXX82J7hrjq0R251udVHWnsLdmeh5OS0VL8prg?=
 =?us-ascii?Q?hRRWKv6gFwoisE6uno0lFmy7gExusaFhw/0QliBqFUGN6azGo6ObXpMJ/W63?=
 =?us-ascii?Q?pVLTdZLahrPw35BR1EJdgS3HagahiQQSiQD4vCyTc56oR5eIJpHf2BQEoccv?=
 =?us-ascii?Q?X30Aaw4ukcyHdH7NYMRv1KBo+X4XyFbcLicYrYpa2jRzgZD6GJeyi18iGW+2?=
 =?us-ascii?Q?+99BvvHCdM48fz09hzZ3P9P2GBat4QUvofLSKz/c/5xDpVfC+d4yYLO8AQrT?=
 =?us-ascii?Q?B1u4Dl0xTwAvaPb9KQ0Gq/7svo7bHGff2jhceH7sOfbX5C3YJVK4P6feA5nL?=
 =?us-ascii?Q?pvR3+xPAaK87wrklwNIQK9TvPFNLzfQACguPO+KYNndmFnWwPsoqJi3qyRUV?=
 =?us-ascii?Q?em3Nc4ozfRnY18iXo76SaYwLOIylmMZIAy+OR5iMrI7vvjRn0AXCrGtlRuCI?=
 =?us-ascii?Q?TdKQryMM+XVHxw7npr+xWzl6IibfjSAzNYDmeaQig1/IU9eTcEIqtCTSWElO?=
 =?us-ascii?Q?GO5zIElexQ44fDAUgGjmT6t/CkIx9JJkTJv8H3ZzsSegDHZzCh288smOot64?=
 =?us-ascii?Q?Gfo7PQg2XKmDNlrKnI9tbpcMxP5doNJExcNFhfvhN2vsqVCe4hNcTBfcDaD3?=
 =?us-ascii?Q?pojAfzAs9q6hNy4AZ+bgXmcvZOwdGeohTorn3tisssP5HmQmQf4NhA5fiHsI?=
 =?us-ascii?Q?uV8c68GQu7K7WZVJDHZSQHr8Z6dkJnpM0zuO60IRytZok/0+DRsiICQNMZ/h?=
 =?us-ascii?Q?Ov8MXxPjYr6m1pj1Aanrib8b6iWCLwZqup36k0dNxnxXj6dPyDuGtTv41Q9e?=
 =?us-ascii?Q?PCXn119zNPf3n+s7FsApbKEi/0wywF69ONTDJtjB0NAW0zDAQVIDQzuJ2hzy?=
 =?us-ascii?Q?VypSlYGZgQwix+4IH9rWqHVbjDN9/tz5e9AzjG2U1XG0aQ8PHp7LTmhi0KQt?=
 =?us-ascii?Q?itKJ4nhGMSn6kn5wTHV0x9kGyoE3pIqeNLI2zHQNoQVr8W2ER2bVEcVfKz1U?=
 =?us-ascii?Q?f29iKETkW/QKEKyldrW+LhR6am6663zNaFmfCcnPetFLj/IjqDhM5aVTgEmx?=
 =?us-ascii?Q?+41y4bsnu+zZP950QV077FvYuECDhSmvoMRRUc1JhRK/+aCJ4sBrhj08ERZt?=
 =?us-ascii?Q?RzJtx1i8DhSkWgfJNMDgjT4nHG0wqU3q7uEg8HN9Xcfm2DKJ4XKgg3WP+oaM?=
 =?us-ascii?Q?ZoBVp6AkIyH+CjOghqKuLmsvvIK92BhGf4V04pj9j+DBDuXtOQ6DJ3cwObXp?=
 =?us-ascii?Q?vy3cqUsJ2Hw5HiKAkqEICUXzkm3YRbt2tY8RYDQH?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5662d712-3247-4ff1-e3b3-08dd2f240836
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:03:16.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ9DCISJv3eD8st+ovJSnyqXK6trrOUB/IGUPSNpfz7Ki8JfRjYyTJm+nyYJ+phLcKJs+RadMOEjaNEPIjD+Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

Matrix_keypad with high capacity need a longer settle time after enable
all columns.
Add optional property to specify the settle time

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index b10da65..f527f33 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -52,6 +52,12 @@ properties:
       before we can scan keypad after activating column gpio.
     default: 0
 
+  all-cols-on-delay-us:
+    description:
+      Delay, measured in microseconds, that is needed
+      after activating all column gpios.
+    default: 0
+
   drive-inactive-cols:
     type: boolean
     description:
-- 
2.39.5


