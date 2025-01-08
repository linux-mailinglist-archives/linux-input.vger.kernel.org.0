Return-Path: <linux-input+bounces-9064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E20A05D3E
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65BFB3A7311
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5F01FC7E6;
	Wed,  8 Jan 2025 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="rMK7xd7/"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2063.outbound.protection.outlook.com [40.107.103.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EF11FC7C3;
	Wed,  8 Jan 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343966; cv=fail; b=rBvhJNdlLuGH4ej+43anCo8Es55aQ5Otsnt3GWCk8iN1UJvwl3h4mLKuV7AHGDXeT8VYsll3PKbOQ86YOk9HJZ2O4wEdaQO7W53tEgaV0jFa0N1eCQwUerY7xA5b/K7lSPI1yWFiQjofJazjwB1qBWaqtfnKvjycJJm6xP/ezQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343966; c=relaxed/simple;
	bh=SZ8IawMGQSscdALv1+l57Chsy0NSghWWeYP6P0jSLS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rqLed4qrEo/jKAWi7Uhi8otp49ETfJq599MNa2EUdPWXeuAHA9/qOhNvLFnWn9HsgsqnpVp/xCo/xi9ug48hPrGuRqDP86qiu0TffnWK+f/sEY4mqzscL5Kfgxd6H3HmwpYy9PxAFePfkNdsH00v1UQ2NWz1Y2PqZQeDZWCSHAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=rMK7xd7/; arc=fail smtp.client-ip=40.107.103.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGAdoegbPkZj50D8TAualuR1Xf0iKUkHNb1ITmvOGZh2IxkFK8CMT4HdNkPiHCHhC6MfF1fcfO6bPFQVEPw8rLLYbWbnjRZFsCzOKOnSO6/83d6evTOCvghu5h0S0GmI8+AaIxDzUJrz87wP/NELOEtYOh3uJleNN+GVy6M8GjZQI9jardb5y5F6zFfQmZxI3npoWOJSCBLwivW1iK+iT8RuJSNmMorSGjFrg88KFsV4KBIMae1epQL71D1PVAeH5cfy/Gf49Is5P94xoznISnWlckLh/vGMDWQbME5u9OkvfnTQq3aJ45Qixrm4ydOUBv0KIYcjG5e6eksxxXUNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8xV4wzbsnpYkJ5zYS2RaI0rMKnVmxXXLEh7sRA4PHs=;
 b=jgVyv0T43oJohutQa2uGvBIHyuDoiWhpYBDaoaVl8PzsUs1fx9sdTAeWz5wHSu1N3dM/tN0Mw2t4UM+7KE4JoIVhgvDp0c8pczuO615GjHizfPInTmgfR0jOfM28LFcQ7nSINvTBvDLOyClM+b0702tZgdELY/hCCI19H6pX5Lz3aHoMvPtnt4T+yPmj/zCEkkVR+kqbX7c90suDlUnGiy+Uy9ghpLTe3fgo5OoMLKOEOcb2escnAun8iL6U5qHszFR2URIsFBf+UkV+qk7Qsh8Wq/V5ABa76Xe6hVHq+SsPwKLd+f8PtuSVJdIam+h6wpVDwhF2GDGiYcBFpqkVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8xV4wzbsnpYkJ5zYS2RaI0rMKnVmxXXLEh7sRA4PHs=;
 b=rMK7xd7/3hJD/D/+1zh/parElm7V+M4k/jq/CIBw+dY1IdxCGkcVtdt1flrdAtG3wf5hgzn8eev50F6pnd2MB1si3HQsMPedwbRODn4kLjA4p9alPVafzd9cO7+y23Tjd5sM1SA/1pWftdgCDYya1DjI+k3O2Pg68wOCLDFeRtMzvmOsUCmvv5ni5XyeXQNUKV+maaTTqcZJkiZaRjwZJxe0YRbHvTeQyjarJU5t5AMTIAa5SB6qRnYJFYSZRIHGb+h5jrt8NrJahsfb9jNwcN18FEaoNRHOeROLUvubm2f9xcKrDJVeNkuUUDtJFQym1WJCioaiV5zbDi77usT0Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM0PR03MB6307.eurprd03.prod.outlook.com (2603:10a6:20b:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:46:02 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:46:02 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v4 4/7] dt-bindings: input: matrix_keypad - add missing property
Date: Wed,  8 Jan 2025 14:45:04 +0100
Message-Id: <20250108134507.257268-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0170.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::12) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM0PR03MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: bc95ae2f-01f7-475d-cdcb-08dd2feaca84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7fF1UreMFsUWa0xHOvc3ddgrpYFsaamFoRq7fiElw0YI1AK9J2pcYeq0cvZO?=
 =?us-ascii?Q?HGrGW1OuisyIPIBnFGOVQc9+cjoklJyTUWYk+FMJ1sonsPs8YJKdTUT4pcDU?=
 =?us-ascii?Q?jHiIBIAb+x3g3lYgI4UOHVASN2vme2swLDNCE1Sz52atVL4hxukOBuN0+gPS?=
 =?us-ascii?Q?PGug987q2aJvLHoLcQX9gbmhm0+mRrudH4k0ODdwwZzTo4l1rzKx/qLIzAuO?=
 =?us-ascii?Q?gazjseZlcvfadGuJkiw5iRlpxNXlFaQNJsvCwsTSVU31y02PlM4jTIq86Wzj?=
 =?us-ascii?Q?CFPdCYinmntzQeNdhvmcAMUsn3Qm3sBCKOhhvuC0L1IGlclOX+AY8f4CFtGa?=
 =?us-ascii?Q?cjOLRI5UkitUc4OE9HflGVZlrlybB12ztTyKq1jDu1Zn8XYCBKHNE3wYBzL5?=
 =?us-ascii?Q?tGIv1E9nSSbrTgsXQoSQw3zM+nwnsDDT6KwqHHGZm5Jym5EYzdkbucWAliBr?=
 =?us-ascii?Q?Rl1l38+3ZCLHFTrrTE5tJpXsXsRRCA4U7tHR4NvGJQ7iFfsAVJ1A8B08COQe?=
 =?us-ascii?Q?F4hcId0hALg0fQtbq2ujewFR09yESGkZaR/FLbJOHfnzcV1YJlvnMvbfovDZ?=
 =?us-ascii?Q?LL0mVqxzaeKmTuGP4UDB55u123PKLdAGPa7wP1qS6eT7Fau2ikzmz0KlBemG?=
 =?us-ascii?Q?2sn1rFFXaVHJUybRPJX5C5ERUBlwjm0JnVc04cyXUHAxgc/q7vC+rA14xhwT?=
 =?us-ascii?Q?V4Sd7W1htNpVkZNZgGEZI280zgw6/iBqDu17wCdirKRzkHP8mOvaDn6b8gc+?=
 =?us-ascii?Q?0e89serkAhbjKSCYiijiMJWQYAhjPrk1+vMlCxqk7mt81QOYTu9TeoNkQHaq?=
 =?us-ascii?Q?ikzSDO0qmGpRucjs0KhIo3tbXpygNUR9bLfUrjB/EmZ+vUNo3VGn//BTAbwy?=
 =?us-ascii?Q?LdxmG8NyVUYENxSj1bEzOkDQEznFaGPvKjx+/fb3zbghuNlocUGppV45PYBO?=
 =?us-ascii?Q?huwMnfGMqauzcNcrA1gdSgmgGtz34zrHUzD5a6u5Z5H+YHs/em/VT4ys4DMy?=
 =?us-ascii?Q?etRrRRmHfrBg7ut4qVsiOFvwFDTIGywLBU/H7qo/5eaVIP/12/yzYnvrJW42?=
 =?us-ascii?Q?JrxniXjkGWyaEYRSrUPk5v31I4hXeHb/fYoKsDESVltlHEbmvWQ6+EQf8/XP?=
 =?us-ascii?Q?BBBRLMpqlfWJbkYXBYGDhRfeFUtqPiNSUWU5IgSUK0d9KZViJgXe1+gpp9Zk?=
 =?us-ascii?Q?bvpnvel8avdaRiyCDOeYI/74CneJs/DVR9kVEbu7PclgQsK/V8Kyi8pT8B3I?=
 =?us-ascii?Q?4eOfJj2TpBfhDwq6gKjPRdusr8232ypS7JPbntu7PPcqABDHFaXOPIal9GnZ?=
 =?us-ascii?Q?rWjT/GLGslzfM2oajGK4PgsSLlHp/vvWFqRIJTrt7gw1FfPpoLBxc4Upky12?=
 =?us-ascii?Q?Xek45bMOCWpy90ip9wZ6Drktu1P1pL/6EC6JAHk0mMM0jCtdVpSg59ZH0WfY?=
 =?us-ascii?Q?m+GcsTQwvcSZIqnSla8+WYO8Jkcg3yRe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O8uVDUu9cHRhG2YIo30/871sFGAd595Em6bcDB5WYLuy1dL3lA/sk60J1u+F?=
 =?us-ascii?Q?0f7ldfDJAtk5lMqQaEBptKpXpJfEh73pl2r5N0rNtn92iGFNtgTQxDvTVCLc?=
 =?us-ascii?Q?u582NsdMl4pU9N+T7P8Q8eQQLDc5Z8EvZTgU9rQesKJev8OE39Jx2RlramOk?=
 =?us-ascii?Q?rOxgUojAErJtygAZCHLyu6bCcDfL/iOtPgIOqOsY5eAMjmzBDMc6gSwaVHB4?=
 =?us-ascii?Q?qwHAwFT2w+ii+BjkN3Bbi2j4BDqFsgKJvhvCfpaSFC6K/vFUdh/Ot6MW/VPe?=
 =?us-ascii?Q?/bJUUUmN/CeM4B3m53rrVHRpP83S1oEJZI4H/EBze3Y6rYhpIf/1qXdi0q3F?=
 =?us-ascii?Q?0J9D7Z6o8R4fIxBxityJFRqGHNEY8nQmk8WNqvISgeidLu5uOY1PY6hLfV6s?=
 =?us-ascii?Q?dBSkANc9D1BdtFdsxizFgmfEARrJqbJW8CPiHXGHUNf9K1DiHN0CCvP/8H7m?=
 =?us-ascii?Q?kiki7QE/2twdpQjYy0lFg090bSO82td2XOLC0UE5GTX/GqQOSqxLcyRabKKO?=
 =?us-ascii?Q?8KawxIa/Ns40OY4agiDEyistT3K6B+ZxRX3v8jJo4SP/WlhAJy2Sxllbhlug?=
 =?us-ascii?Q?XXDsxvJSFmI5KhdgUMhRpMIHgCMmIMHgMOMjQxM3ze/a9xP8I2C4jCJGTXUR?=
 =?us-ascii?Q?OSFWQLoqDXHyMLfdnS1xdSvEhGhmfV5/dfPzjExkHukTcpAVzWvG7ddbMB6Y?=
 =?us-ascii?Q?9h/1uvsYsFwo+/w88g9gENELg9Ou7vnhmPNYlKk2g7tua12IOcilB6Z9dB1P?=
 =?us-ascii?Q?ykVyy/+c3Lr/erH9lVfahFSpAU+eZ7AtJWyIb2y2nadk2F9Als5Ae398cl1+?=
 =?us-ascii?Q?86HvOfGZDzASWJjsAhpOFEKFVblzKARV3yb+3ktoMBFApMdbl4curQUNdFQp?=
 =?us-ascii?Q?+tRbNSfGaIF9usTF9oG3TH3ZOmvz1LYj+52b/9pMv3smGP5fcP0Kgjd9eb8H?=
 =?us-ascii?Q?k1njm+YdJ3UVIcK+4NHBpriAciEO2siyic3XJsvdOxIa6UX/iBo30eyNx8wz?=
 =?us-ascii?Q?TYOGRN8wWzhvjgoFBvY0via7gQXy0aDD0zv9jylkFUBaUHlKmhfxKog6Xz5K?=
 =?us-ascii?Q?JL89cwKpYZZ+V2zTo8kjoJ/TbsNrLWbyLXh925BU68yTXBBtRHFdRCkeuLxw?=
 =?us-ascii?Q?PR22GHgPO+tON5t1Sh/Eq/ehoT9uiyMbFTbX3JuUdzaXbrsDA2C2cZuL2XK5?=
 =?us-ascii?Q?PuMjAaYHO0PtJtCdLO25bWMt1lHwAFm7iwyD6JKSP0BjBBH8Ixjt9ZTfidMv?=
 =?us-ascii?Q?Znn1CYH/yzLLZc8oMAVqwF5c3P74l+8IjcRgsFHq8kX7pEb5f2k0IlPBQcIX?=
 =?us-ascii?Q?ilY1KdqXqj3Cf274VAURYhOiUElr9ARvw6aI9X62/rdAquX6uvpqyhQX4pOR?=
 =?us-ascii?Q?jXS5515Qn1vyNJVtW5rQpi3d7w14kxWI0Lxa3idLDZvsGZ7ZEwHwYNGCkDX2?=
 =?us-ascii?Q?pDFD5+GKSZY40D20OL+ktJiCAlA6kHhjt7qvGb5t90Z8Wa97r4s8jml/7AMD?=
 =?us-ascii?Q?+UzcxnE4D8yRyBHt4KDQgYOCn+k06iZlxh36jmziKXSSV/IWYJvQHEgLxovw?=
 =?us-ascii?Q?0nhy3ztA8FoxulYN9tKhU2IQ2AweWKAQp21PzGoVU+3csdj0YTFHpx8nC2Dz?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc95ae2f-01f7-475d-cdcb-08dd2feaca84
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:46:02.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf+3G1Ptj3nwp3rSK20HnmFKvMMfMp6fRq/GmN+89EpYYBt+neBvsPJLcq/HedWySVoWw8EAB6BdZv8Ew0w7lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6307

The property is implemented in the driver but not described in dt-bindings.
Add missing property 'gpio-activelow' to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 0f348b9..0555c1e 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -40,6 +40,12 @@ properties:
     type: boolean
     description: Do not enable autorepeat feature.
 
+  gpio-activelow:
+    type: boolean
+    deprecated: true
+    description:
+      The GPIOs are low active (deprecated).
+      Use the GPIO-flags in gpio controller instead of this property.
 
   debounce-delay-ms:
     description: Debounce interval in milliseconds.
-- 
2.39.5


