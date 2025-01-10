Return-Path: <linux-input+bounces-9129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2FA086F3
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEF2B1691C1
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EF12066E3;
	Fri, 10 Jan 2025 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Oie7d9WF"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0D9746E;
	Fri, 10 Jan 2025 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488213; cv=fail; b=qJnp/pfUB8lFSzf/dD8nb8ZdL9qbx7/5G0GIUtb+47p41RcIhr6S+uwOOJFMSjm34/0owsZ1ibeDNhiGSRvSTysLZcwL0vhvYw+lft3kXTyKleloETWMMw64cfuyd0Uy1GXvhAu6yE8i4rEfVj2r899b/u8gNFft6DIi93lIpN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488213; c=relaxed/simple;
	bh=Xfzox5PcAJY0Vf93eXYbjU2/B3WWS3ocjTDoCwCZ4yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxmfNlZiHoCi//YBxsWyOt5Td/DaRLf4H6/plg43q+owtp4XLkCYFWrQfo2BU04v6pIzyjLBWVx0XDT7Ye5kgBqrYZGRfN9CmxJJNRLbXeXD40wt5VOd/QdeujzGESQl2ChQAi1uo6QCTzS91dUTpzq3ggHvehpExfPdA3vQdKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Oie7d9WF; arc=fail smtp.client-ip=40.107.22.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbrAk/mSttAVo0nmq1/JoY4s8Eb9O9GNfXTWpvY47+7olddkkyp45vJfmLTo05UmYPLEbkd64DYtMQbhAEEjpovq5D5CrBGl9tXeHR1f7mScin0VEe2hscqh336Nnm0KkSlgrKT24kZ2kd3spul+xftEzbatADlU3X85+9W0QB943T42hyuWMFwilDvItgQhc+6zu+Ki1xwda5tzvIftytKs2JGnGmqYKf2UQ8M95jP/wEmNAfUXsHwy7BN8F9Xmie2TkY0hm7B5lI/oDP28+M4rST4znSr3yh5YgGxk/fcAInpE8l5xFSg5G9pcw5ne5wqkLkg7W8D3Olzyx+GdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZI3BvU8z1GIGEddIcbgkXGABPLGMCgmwctzoeViF9I=;
 b=XCs+9Z9b+d3BGfQBVMRK3uYnodZUPZ+cBRiPmhWiFbnwgEVrs3ZwpNOAMYMBUYBGPVn5xv+MCVD7JjIhRYzkeBppx2VswzVvBEp7UIlbxDFaj1k3EJZQ2FXBD5VcWknAFoTGOqtE8VjbxS0F/ZO2DElO9tFCbNbmdAaRlEBMgRUQWsOt0WdY6IddQvwoxN7bob2qjCZ5rhlBxsyWz4VPPDR1tyiGe39hHCljEtlzQVYbjs5jQ8u3EmSZaNx1fnK8bg4fhn7TcPKka04Tm54rPN85fIqOtdlAxk8xfGWepNHCif8Vln2ejDzPBhOwrCsRjw5mLE/vQm69hfjJvjP/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZI3BvU8z1GIGEddIcbgkXGABPLGMCgmwctzoeViF9I=;
 b=Oie7d9WFJiRGWn2eaXl7yfv77yAqOmAcGKWH8PhCqVlTok3nwCViWc9AWJ56xmmTY8ZAU4/FM0wUMDgeZSlczcu1JtQNaWcd0LBsjNwpYDchAe9lCZb+bzkXpMwpFxTH5ZZq/FGrjfVHQqh58KtOpb+6lDJoT4PnvcBf6uM2D+NwGpQb1k/iUvkd+SuzLhimAqvVuqaeI3QZeHZy33VPRf/1kUYs5+4SlhMk/MDpLKy9Zs4wUrUsbKMmaw8ez3RI5EIYGtDdycMtm98KvE/5L8KXev3I9qDVOkRUyimaKBFAembQJxxCDqdmsB+N6TJF5SnWTj1bKhY296N93ny6yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:50:09 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:50:09 +0000
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
Subject: [PATCH v5 2/7] Input: matrix_keypad - add function for reading row state
Date: Fri, 10 Jan 2025 06:49:01 +0100
Message-Id: <20250110054906.354296-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0082.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::15) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: a49f4a0b-21ae-46cf-c2f5-08dd313aa477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eVs2z6Gai2cWZ5U/Toy9tQFPdjHn5Zcefxz3GlUV/uy9Q32rJjqawgqZv2ZA?=
 =?us-ascii?Q?jEjrnz+ojLcUbuU3NzkQ+S9CwPU0Lg2OWiB7irseGjIlK4RbF+C8pMN5J5zY?=
 =?us-ascii?Q?KwCKYm+evPJvfBFXZs3eT38ZyY2T0sPrVnv0QiE5xA7h4FBz79v2mmZGSFEL?=
 =?us-ascii?Q?xnbM778FAJC2Ka5eeC72p571dPy2TMuPh1tHYArCtFi8NPJ9X5DhtoeRjrCk?=
 =?us-ascii?Q?vFfI6kYIIpNkG3VWx0/SPTu69H1OMfqKf7ZFqd6Q/VMzg3rwv9QQIsDGOHmy?=
 =?us-ascii?Q?IS5a4RKC5u9zyzzxu/AbAWpfqKIqzbb5BEseE/79PqYcc2LDZrJIOpESHdR1?=
 =?us-ascii?Q?QIPuChFMNbCpj9jaCaLw4qIj3CIFvtFW7qOWnP7DP9ocjAljg2w7X8gzkgL0?=
 =?us-ascii?Q?H04ndaCqWuUwyo+DE/hhjT7b1kTGg1yi5uxaTtV+IB5Tu7hvse3tCcQpJnbP?=
 =?us-ascii?Q?nLD7/oAoS1xvo+nZOFEwfdz3tINUhDjopuPEcV7VhsZ4IxXxfMHIVvVIHZEi?=
 =?us-ascii?Q?AFgmRXaIhLk20JurS7eqLFRCRpAGOa6xtsxpgdAKYWMtGenbG7pAGBaDxeD2?=
 =?us-ascii?Q?eRUjQIZrzYfvmoDMj1k/1ltWFaMM2uT7jclLizU7tssi6ZDrR9crem7hTiqH?=
 =?us-ascii?Q?gABZKJFFtreFdc0fOJslV2kmfC3JrJSjnEDEQP3CIxqsy3kE94166e093Xc4?=
 =?us-ascii?Q?lXmMPmQpRnGc861nYMJUvZz7I1gdKNunpvxTX4OqvbnUwI3j0/RqRqbFB5kG?=
 =?us-ascii?Q?Et532a7IXHOsE2RDLxr+Bijik2ajqdRNKOjJcqKgZwueCMOGYgEtJFL4UcHe?=
 =?us-ascii?Q?HBHqPGIEScmqpx3QPRARs1gUfbpDEXCWJbLkYRsoYgR0MR15GULSScf1V/hq?=
 =?us-ascii?Q?TQ7EmNhCsGWFTYh4cWpAZZhtZcaJe0RK3swaE1RtplInB5wLBDvoYBZuryRp?=
 =?us-ascii?Q?5x0ZXc1CaL6gaBjI2P05xmgURqJso/aD5s/HLYzEllIXn7xsFB3P0YfwV6Al?=
 =?us-ascii?Q?tTs4rMVXUhRvP3h+lEiE7e/cvCTuwAEaRX+br8JfiRJIUIh+aVNc/BXBxL02?=
 =?us-ascii?Q?musQa4CczzsF9rgZdobB5nbOcbkC7OzBOB1qrOIcYGMi3XkkUHMMuQRivtvN?=
 =?us-ascii?Q?yv8UBQl4m4d7wbQV6Dw66M9fwNUp2wPluYFnQvlIdA77WLnxnz9p0eDCNIHm?=
 =?us-ascii?Q?E1hL4Pn10D19uJOxS8OSddBdV0IdZkemvf23IBxtWoFCokz5bBDaupzDEyzH?=
 =?us-ascii?Q?bZky9F43dyO03hraXAhlaqdPaVVn14FYLPqWz6CY3eUvf1zZO32uyaOuDK3S?=
 =?us-ascii?Q?d4UuTzLI7qmDobErS2/7AjqNtCRCL8jOFNlExPHK98/M7fdqT+QinGFwqeU7?=
 =?us-ascii?Q?zm2f6D7ZVTl9imD0Y8I6HsKV70+YOr3wPduidEp+mUx7Zph4aBQ4jlXBgfME?=
 =?us-ascii?Q?qivRUQieuDBNyrVNsH5f4EeHf/dUy6jW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?za5EaOr8mRxdxUqx9b3f2P7uQlJamSEDvOEc+o0tq34E1mmm+A+4kKIV/4xA?=
 =?us-ascii?Q?70tFK2u5DkkCPSTKuX+yyOzmS5qY3Pf7KB4M4HUSwvAqVfv8K4yXbqCWtA/h?=
 =?us-ascii?Q?mXaBjnH1NlpQ9XW9afBA2Ka/1GLmJyU9rKJKFzXT7USDiaDlOTwDpkB24NoA?=
 =?us-ascii?Q?aNOVK6/YSopLotM08uaVd40vtWP3R0aCN8XYDuOVae+C3Cdo70PMFTNrubmp?=
 =?us-ascii?Q?HwgGw7o9JtlCePENp5IfS3vsMJUReYae7fr9Nqx8E/a8FQSNRovwafHJtWHH?=
 =?us-ascii?Q?+eYm7S/n2IxTZXW9TeP3lrb0Yge7F66MPcHlz7c26RU59l3CGycqu7NTdErQ?=
 =?us-ascii?Q?yAHmBDpyVlh8qTZd1Mr2FdbgUXDdhqc1tr3IHCZTBNHKSqqkTsprVmH6BbJO?=
 =?us-ascii?Q?si2v+NCuesTMujSZbRjG5m8sMvwbw5PaUPKTHP747/MMT/36lpnbAFldh96W?=
 =?us-ascii?Q?nvvQPRn84dwHKAFjG09v/DZcG7quOZUGqzJusAIjOr/CF9CKoHZqAnr88Aju?=
 =?us-ascii?Q?Fhpu7nNtd963zmIgk0TxK3DKKZOTHgxd4upkU+cdmNZeQ5D/hiHoJ4wwM8tU?=
 =?us-ascii?Q?KC9CIo8qyxEBi54AUnMdKXun4To3qwVu5PTnV/MFN4vFFzweOQ6z4s9y24wT?=
 =?us-ascii?Q?iTFrEBosB3TcNuea3oIerL8+lZVo83taQp9lDG/5hrIZXkV9fdEg7Mw1Y+/g?=
 =?us-ascii?Q?I9MpaFZqQTiHbpJhAhkqo74H8Y/B6KbcNRdly5IqqN/JYr/mI3aQUFL6qh5z?=
 =?us-ascii?Q?a3Yw5nTMe3iefssJTxa2SPi/kCSiSP7Z9xkHrZENYCCXAxYu066L7Psehjz8?=
 =?us-ascii?Q?TaLXuRTsCU0VgMclVpW15RPwZzwmObQSIsJaPMaGyFMTKnuMiEFoEYlFFmMj?=
 =?us-ascii?Q?o5EwdVZ/TnMMjuORFOTOyuJAIZDfKW3P1vlhzxXc20X3JktIsOTvx7GjYUdk?=
 =?us-ascii?Q?s+szkCazUU4mgFMCApj+B1QZhu8SkL7lbmdcTDQfLYKPa5gKGCrD7Yjijk4g?=
 =?us-ascii?Q?cc8q9WQ6MWqsuA4uTuuEF8J9GVwsX/8Sld4Vw7KMZKhOKM7RPpYTz0Tx4SHq?=
 =?us-ascii?Q?bqNDi+oXu0kRHhYlrk/Ia82mr9h3mIS2pkQWqNcL+b31IInvfN1IGbBmKsiP?=
 =?us-ascii?Q?JIdvRx8rXk1LLPKMz99vALUwfMmlmS+6sqnqGfu57Ren4eM/yhRnjw4oy21I?=
 =?us-ascii?Q?A4HkN8PH52Dh9LR5fAIYJB1KxreWlk1SOHjvsWKpzVNXbpb7vllubDkDAMfu?=
 =?us-ascii?Q?a277AVHJShgP4GyWAGpu+aQcAI6OCv18Y+mZQIhMcGENpWMOIWbTSdIqass0?=
 =?us-ascii?Q?mOvNpjg3qJ9kHeJmzVAr76irxELuC5suWtJNlVDFMum8Zxls8WThQf8UvyjD?=
 =?us-ascii?Q?1XoWD78dk+3QTljxEb60dxik0fv2E30P3n88SN1DvQ+BVi9tb2e7DLY5G3mq?=
 =?us-ascii?Q?7BNg9LgwV+UOI6ILUWduJW3shW4OvPi5xF6X/TGuNey2aF+iub/rWu8amx2y?=
 =?us-ascii?Q?JS6oa/6w3oLQTR4ryc+hq4sXSyaHwGqti0vJjrC7Bqfbfj1KmItXwFEl2ee7?=
 =?us-ascii?Q?pSPmCzD2koraQuu5/C3Q8lCyK/wG1hJWlr3rtfAo?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49f4a0b-21ae-46cf-c2f5-08dd313aa477
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:50:09.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YOAuuvym2c3/H07Th9ahhf9NvzXFYScO8UbG2LulrQuOZ3i21fuHUJbVK5L6/aJqgz7fLtX15X/NUuprM7N8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

Move the evaluation of a row state into separate function.
It will be also used by a change later in this series.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 5571d2e..90148d3 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -100,6 +100,16 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 		disable_irq_nosync(keypad->row_irqs[i]);
 }
 
+static uint32_t read_row_state(struct matrix_keypad *keypad)
+{
+	int row;
+	u32 row_state = 0;
+
+	for (row = 0; row < keypad->num_row_gpios; row++)
+		row_state |= row_asserted(keypad, row) ? BIT(row) : 0;
+	return row_state;
+}
+
 /*
  * This gets the keys from keyboard and reports it to input subsystem
  */
@@ -125,9 +135,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 		activate_col(keypad, col, true);
 
-		for (row = 0; row < keypad->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(keypad, row) ? BIT(row) : 0;
+		new_state[col] = read_row_state(keypad);
 
 		activate_col(keypad, col, false);
 	}
-- 
2.39.5


