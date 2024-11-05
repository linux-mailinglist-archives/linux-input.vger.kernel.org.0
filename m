Return-Path: <linux-input+bounces-7871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDA9BCD7A
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2557AB20DE5
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED0E1D61B7;
	Tue,  5 Nov 2024 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="ekINm43W"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638F1D5AD8;
	Tue,  5 Nov 2024 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812188; cv=fail; b=r2CCT7gNyR4QacSWC6jmHiewE2PpDLVA9slfn6NXUXVW+dS3ZpzEL59dWCAnQRHmQqF/G6P9yDTgB0ckdV9iSJ5hy0w2AtDDXqisHvV9VvM6+FOtgDkpAv5gJdLCA/zfVh6o1knNMqu8o5gWfktbOMcO9CPpN1LX/AUPvdWPmjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812188; c=relaxed/simple;
	bh=D4Ak6jcKklaQNd9P5WXiyg8rFu4ecgUqmYcpaVN0Huk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xdma1ZEJ4mZh4OnmDDXBPc0RRTlmMdDk+gU0HyQXEaw0CmvPAJlMleg2F9MlVdwx3rJDFXGB/MgqF5/COxUZ6b0l8K0Df1ZrVX0GR9vuvBzcKq3Z0yQChFNcbjT+b7R/yPADSkULYlZcAXHoAm+7DYGqY2LhHUnzDwkfKma3F08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=ekINm43W; arc=fail smtp.client-ip=40.107.21.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZetmmI0mMhShX8uuJRoOs/o2hPrpoRcCNwlCMCqeWtoHk4S7ecw1a06FML05h8fSUbzZlf2XqadpMxt8suB0lWc6u/Resw6JvQqczwHkEL748Am2ZIb2l5nJG2QUFiNLGw24ufCSMXj4gQYlA69oqMZOxBgIXsfyRhc3pDrTgkBZ5Q2UV2trWYOTHjWSmwiqmzYUJgevFcs7bwEFx2rZ11qHGDSPyg/SsAindhgBGen8Z/+hV/qm637dvIqwhKO3OXsa+WpQeS4UiMx6AAfgCWKJMw2ilJ0oEV2NfNvkRu6F88+pr1hb/kpPyV+qjg9xhU8CIWMrClnlK5jMiBFO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCaMny5/duH60dVwnVNbsO12yqHuLzmpEI39bRaipvU=;
 b=L5yo/un2sqeiQyB58iS0NFCfFY10kyzqFQcOijQGyUar0TG8jj0xk9516NSmracgoAO4cSqKolVFpDkLIsbEd/qXzKyC5pIJJKewGHU374VghIXY6dTcJC4rvvhq3PoKvkZQRRH0fRNd36kw6a2sRJB3fqrS9rD3YhBD348j3ZOUm4lYS552VfzLYYzp3FGRxdueXLE2XGFceWH/jE85Omqz1qWuyqv1yMwQpe8/pfVF4o0z+CWcfc92vgPhkxZcpRxU/7ggIflA8OCP1RTSBJtlCsEgnJcomZ27LG6YWtltG0v2Hq18IlnSa7E8e9gE0q5gt9t1i8POqueSXi33mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCaMny5/duH60dVwnVNbsO12yqHuLzmpEI39bRaipvU=;
 b=ekINm43WBa1RwJuOTWyr0qDyAqdmB+qe+qhOIUkoj029n3zFRIFfgCaS2WdyUCc2qmceygsaEk3TtRknSm14dIXiBVoqY0X/hD/0a21Bfo1xRiDC4qa3apKDsTnwBwP4hN/2Fvs35ivp/PKnhajzMtyxptL7DzdO0EbLlD3OaXSq1xKSOvMjD/+HrKJ+MvYlWKVJbPQbeA5Kx6MvUf7ur/JaWYniWTc7nJXT6Ppa+zDj4lgknOivacL0GlwWqAqKE9Vt/d5nxwBSHPjlMfsEJE9CorPrWED2kqlNa/sucoIGifPJwjaSts8byvZqbaAvnGuvd6mE+pShqqJ9ag5QiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9211.eurprd03.prod.outlook.com (2603:10a6:102:325::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Tue, 5 Nov
 2024 13:09:38 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:09:38 +0000
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
Subject: [PATCH v2 3/7] dt-bindings: input: matrix_keypad - convert to YAML
Date: Tue,  5 Nov 2024 14:03:18 +0100
Message-Id: <20241105130322.213623-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0128.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::7) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf6abc9-24d5-441c-1951-08dcfd9b1a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hZ1AEuPr6Hu8icpMhRxk04KbfbU8gs6eb0VoBEwzCQ4N2rEWekfEY1mRR7L4?=
 =?us-ascii?Q?eYBvlbb3Gpbp0fHTfOLn1qsqcsO4nzeeWdeKFTF8GLyZGRPxKsekDjPXe7xX?=
 =?us-ascii?Q?GDwmjB6thynZzLvqs1qwatvByacPHLact1kMXQ0+TgkiiYFACf9pF1Wp/lld?=
 =?us-ascii?Q?Pk+A7wRiOlxaBgRRDWOxUbURYrDOPgRKTtVnEn7WNhgtn21Gfp91jAMeGyRi?=
 =?us-ascii?Q?2dRLg9mG/mhuKmpN7WGqzhGZgrMppwUXx0ZR4KwxWLACU3y0Ki9+huLA/LwJ?=
 =?us-ascii?Q?3p+xqRzvQM1tRyvgf0x5d+alhmW5j40m17sQN1qaFs67jLVmfqgKJ0CmsW7c?=
 =?us-ascii?Q?lS+6Y00x6Tqi/Bkjo3GXHtjBLovZenoAiYG8vO+et2OJb07Q5JdJQInTT1/n?=
 =?us-ascii?Q?/XuQaPYh+FDO+BAeE3LXH3+3N51X6q9fydFjjNfaUB5bcYjt9bDqqAGMGAaT?=
 =?us-ascii?Q?L+VPw5RF2mvBR3MYD7kcN0b4xQ11ngwQ55n3/Tp/3pRA+D4aY5lj5bqCo4Dk?=
 =?us-ascii?Q?OTnH532Kl4cVzb3rxdOUK2i8ksFYypdJkjd94y4/QcStU884hJpN/l01J2D/?=
 =?us-ascii?Q?EdOBMBapy+XssHG/+bE5j1EkumWH7SVxo8VVUPDH0B6FlSYGUXirMLmQVP74?=
 =?us-ascii?Q?vh5KG0SJU3Wd6BPegJAoKnbZsG/yxoa5eDVUjnHI7e45w0igXkDRXnGHF/lc?=
 =?us-ascii?Q?wZxr1yXkZLy17jVC4U/eMNa+hzoFq30Tm0TsL1aKC9G+BTnbYdLrhb+cnBQH?=
 =?us-ascii?Q?VfHPLm3024qZC8qx/aoeVM69zN/g03Gp+mQuUcHIo2FTXPh6PSlH5RYlLYv6?=
 =?us-ascii?Q?ao/i5CJD0+WEcHZJ0s+INRom3OJpEwbLfK+aPCwpOOvRRv4JKa3micxgLYmg?=
 =?us-ascii?Q?8jQVinBotcDRcgz3bjnJQyOng2WilvNcpxn8esQmIccHRl3YKH3dSh4YuxYP?=
 =?us-ascii?Q?UyXEqv2MTf5x3olQS8xon2WJVTLHmGvlAAgRBrxp1bdG/O+jrPzXl/OaO5c5?=
 =?us-ascii?Q?g6BnRyYmbiDbwHkLzaSLQtVXlDfd8GkMH3pIHpdn4BSNgmPgtxkS5xDkuDnB?=
 =?us-ascii?Q?GwDiPtZ7EsCWX/n/U27WsSGMuIYn8FixvDSxKhYGDliMnyoWaFcVtNFhPo9Z?=
 =?us-ascii?Q?qK+z7A87UqAqUC+f1bo0TaFFg26tPZXnMpffB4nP0LZIBvlXUXdateL0gqnd?=
 =?us-ascii?Q?Q5dGjHbuDN/jf8QrzaJNjzBor01AmKkcNMDZBcGgCgvUnxV7tvN4luVw9S35?=
 =?us-ascii?Q?Lm7IwYWglt5jPECZ/zHdtAdW0owStJR2S4wvP1HjhcGylwGzLljutT9Hvf7f?=
 =?us-ascii?Q?DAJ+8jUdR3B1MHfQmESDd2R2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNEK+NVxJg0iAxIXB/9/XFLMnyLEHUdpei8lcfIjj9rVeXahDzIjmUaF6/MQ?=
 =?us-ascii?Q?gd/rL3syJI0ekk7qKGoXZRPdQMbtmS4MEuUcYHzKY4Qr0l3Jl2N+QTV6lReu?=
 =?us-ascii?Q?wWIyhQIhsSp+10Mm06Jof0lx0MWJRNhGI+T6KOu8ImimjJgDrHPxJQ7xhqzZ?=
 =?us-ascii?Q?ik7DnYEDCWPRs3mmEppivRPOYjaZY0Zr/lgzRWirXPMtZY70of1PXDKK11V3?=
 =?us-ascii?Q?+o1uc68PUp/vhbHC2xiE4LASFDmlbn60aR/VZX5UM2tjSszB0twZBirpHdaI?=
 =?us-ascii?Q?2XdSN3lJjn2mb/ZxoxkUX7wqDYa6l2AGVlp5jdGcnx+9GJAMEkblt/Vx+7DM?=
 =?us-ascii?Q?1g/2mv59J+3XM2RQ1Dx93yqyebJ1mObXmZL59hKkyGvFsLJEwt1bhy/r39lJ?=
 =?us-ascii?Q?yB71CTu7oHwJtfxNOSJSWPME+Y0Aup7JxgKjB4OK/y7lsqNTlcFusnpEA7MT?=
 =?us-ascii?Q?3LAGrFAdcUuZztNQVAXbKORqnRBaWHUwrNLfE95D41h6cGT//J1j0i+gUHUl?=
 =?us-ascii?Q?gAb10W8hXYA692VhgZgmbkrueqhzJO9mjnpJKPAdm6+Mn7atZVaJFuW45zlr?=
 =?us-ascii?Q?+9MuKfl69mSllrQB7hwyqaVMXbTcLyPPa145dX/rQb/6uPhTfCdwIYMq4BJC?=
 =?us-ascii?Q?q8HnigsjNnUH2g2muzJR9iHU+PVY8VVYKH9UHsVFaMg+WE/ruqEl4u7AJ3EO?=
 =?us-ascii?Q?3Nb+K4J1Cib3fEgC7j8QIf8H4NPWkPIMmlk2h85ClLeJbbUZDn2wVGzlCZRf?=
 =?us-ascii?Q?p21hGY+RFUf0y/IVCt3IMAyuGZRoZmqPEya6vK2Vrwn+o5I4RIzUiWJq3zTK?=
 =?us-ascii?Q?Br7gss9MC6JUv9VMW22cWJ28CtpuSL6m2cRCt4dC+Z7XfGaYuI6LhqNiVkLh?=
 =?us-ascii?Q?Ver7VRVf9dtrZ8pVc3Ok7ncXYShCAV+eV0yfwDM4OPxLzPNB6jWEWCOPjIwn?=
 =?us-ascii?Q?hfZiEu92LBQg64IejyHzmHZxvmpQWdq1sveF0AI/LlcPJ4oMhyqX+fBKy6as?=
 =?us-ascii?Q?wIs5Y71hYgbiBxLcW2bNFSPHOCkWp1Dmc+9ZMv+jKb4iSDvJjUULecGUExWd?=
 =?us-ascii?Q?GypkRhD1I36hkQsoSkTyJWyjRepfC7a5LOOXe+U40mKTDNq7mfvnquh6uYg1?=
 =?us-ascii?Q?HxPpdDvd3ncHdof9lUMJh3lAp5SBTzbE2QjE4UPvurObnOVgoOojcLWni0MN?=
 =?us-ascii?Q?s/uPeaP44u+7+pu3EaM3k+UgFkWeE/uo+xfaXzXh5oLhw0hZOk0IPnjDaDtM?=
 =?us-ascii?Q?/E1pUC4Mwjo0tAKBkq3jCWr2pJkDzUfJKwZwu2qaRivmwMVWn1kFExgL1I0r?=
 =?us-ascii?Q?7vhJuubYAL7POdZqLwyiFCuV0CoXAmFVr+QwuQZrRDsd3csYNgnWSGKzT7Sx?=
 =?us-ascii?Q?WgqCOEpocdmBpu6Yd1FpO7Vb3fR+6EqlFTGx3M7R85umaJOaOQ2wPDfXbkvr?=
 =?us-ascii?Q?fteKkaTlK4hoee9s4R5unGfKagpv1ujM8Kt9F8mjOykl412fphAyZefaQdeX?=
 =?us-ascii?Q?agUjR8g2cKQoJTl9WVda3p101Eej9RhuQfBWSRB3gC8Tb5ySFpQ8z6gOjFZe?=
 =?us-ascii?Q?DkWEHRnFsKA5VptUpv4UMFhmlbxW4Ek+pqHr+b9u?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf6abc9-24d5-441c-1951-08dcfd9b1a2a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:09:38.1248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFpkvq1GkEH9pq9XoR38j3leLnDI1qGE0M7/PoLXo6q0rTjK/foNsni4yDBq82iMXuDUzX84vYgxM1gJRK2lgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9211

Convert the gpio-matrix-keypad bindings from text to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../bindings/input/gpio-matrix-keypad.txt     | 49 ---------
 .../bindings/input/gpio-matrix-keypad.yaml    | 99 +++++++++++++++++++
 2 files changed, 99 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
deleted file mode 100644
index 570dc10..0000000
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* GPIO driven matrix keypad device tree bindings
-
-GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
-The matrix keypad supports multiple row and column lines, a key can be
-placed at each intersection of a unique row and a unique column. The matrix
-keypad can sense a key-press and key-release by means of GPIO lines and
-report the event using GPIO interrupts to the cpu.
-
-Required Properties:
-- compatible:		Should be "gpio-matrix-keypad"
-- row-gpios:		List of gpios used as row lines. The gpio specifier
-			for this property depends on the gpio controller to
-			which these row lines are connected.
-- col-gpios:		List of gpios used as column lines. The gpio specifier
-			for this property depends on the gpio controller to
-			which these column lines are connected.
-- linux,keymap:		The definition can be found at
-			bindings/input/matrix-keymap.txt
-
-Optional Properties:
-- linux,no-autorepeat:	do no enable autorepeat feature.
-- wakeup-source:	use any event on keypad as wakeup event.
-			(Legacy property supported: "linux,wakeup")
-- debounce-delay-ms:	debounce interval in milliseconds
-- col-scan-delay-us:	delay, measured in microseconds, that is needed
-			before we can scan keypad after activating column gpio
-- drive-inactive-cols:	drive inactive columns during scan,
-			default is to turn inactive columns into inputs.
-
-Example:
-	matrix-keypad {
-		compatible = "gpio-matrix-keypad";
-		debounce-delay-ms = <5>;
-		col-scan-delay-us = <2>;
-
-		row-gpios = <&gpio2 25 0
-			     &gpio2 26 0
-			     &gpio2 27 0>;
-
-		col-gpios = <&gpio2 21 0
-			     &gpio2 22 0>;
-
-		linux,keymap = <0x0000008B
-				0x0100009E
-				0x02000069
-				0x0001006A
-				0x0101001C
-				0x0201006C>;
-	};
diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
new file mode 100644
index 0000000..745652b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO matrix keypad
+
+description: |
+  GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
+  The matrix keypad supports multiple row and column lines, a key can be
+  placed at each intersection of a unique row and a unique column. The matrix
+  keypad can sense a key-press and key-release by means of GPIO lines and
+  report the event using GPIO interrupts to the cpu.
+
+maintainers:
+  - Marek Vasut <marek.vasut@gmail.com>
+
+properties:
+  compatible:
+    const: gpio-matrix-keypad
+
+  row-gpios:
+    description: |
+      List of GPIOs used as row lines. The gpio specifier
+      for this property depends on the gpio controller to
+      which these row lines are connected.
+
+  col-gpios:
+    description: |
+      List of GPIOs used as column lines. The gpio specifier
+      for this property depends on the gpio controller to
+      which these column lines are connected.
+
+  linux,keymap:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      An array of packed 1-cell entries containing the equivalent of row,
+      column and linux key-code. The 32-bit big endian cell is packed as:
+          row << 24 | column << 16 | key-code
+
+  linux,no-autorepeat:
+    type: boolean
+    description: Do not enable autorepeat feature.
+    default: false
+
+  wakeup-source:
+    description: |
+      Use any event on keypad as wakeup event.
+      (Legacy property supported: "linux,wakeup")
+    default: false
+
+  debounce-delay-ms:
+    description: Debounce interval in milliseconds.
+    default: 0
+
+  col-scan-delay-us:
+    description: |
+      Delay, measured in microseconds, that is needed
+      before we can scan keypad after activating column gpio.
+    default: 0
+
+  drive-inactive-cols:
+    type: boolean
+    description: |
+      Drive inactive columns during scan,
+      default is to turn inactive columns into inputs.
+    default: false
+
+required:
+  - compatible
+  - row-gpios
+  - col-gpios
+  - linux,keymap
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix-keypad {
+        compatible = "gpio-matrix-keypad";
+        debounce-delay-ms = <5>;
+        col-scan-delay-us = <2>;
+
+        row-gpios = <&gpio2 25 0
+                     &gpio2 26 0
+                     &gpio2 27 0>;
+
+        col-gpios = <&gpio2 21 0
+                     &gpio2 22 0>;
+
+        linux,keymap = <0x0000008B
+                        0x0100009E
+                        0x02000069
+                        0x0001006A
+                        0x0101001C
+                        0x0201006C>;
+    };
-- 
2.39.5


