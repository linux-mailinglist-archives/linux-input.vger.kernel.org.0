Return-Path: <linux-input+bounces-8442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E189E8CB9
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 08:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431E4164B98
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 07:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D545921506F;
	Mon,  9 Dec 2024 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CsqPOnSM"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9636C215068;
	Mon,  9 Dec 2024 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733731090; cv=fail; b=swbUcCav7bqnp0v81AziijG1ORXyLJYZHLOz5m9a8UZn0tkQeBZjFLTOFUktTem18DIvcXJsLDJ9VwzsXL6yeJuJ0eEkYhbaV85h41x5RRvvBW/giBwxbQswTXknpc31JClW3Cc9r+lsBfWnPtc0zVk1iGNLVyJ2vp6Cb+vhJVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733731090; c=relaxed/simple;
	bh=3qVQaLR85WD76RlPC89UvTbB1Qj+ZpMFxZNcT8C0QeY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Tnqsmal892cbPCmUO8JVkZ7bcvlovkPZqdxZo6gd9sSVED6tPcF+u5QYGLgXNB972JO0auPtCrk1nKsoww0WP5vzMKnon7fxQzBfJxxNdmkdWoUjukt3EFi/c+jcPb7JX+/vtRmYhNbghBk6mtk1DEz7kg7CeqoJ4aAwiSXm8Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CsqPOnSM; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AH6kiLoDjaiEeZFSyG3WpyTedR14f4Yku5WIe8SIQeSKzSveYEg+hmrH9SZ+HVH4MSN7AV/p+JZ32eDpq633/jg2jOHVU+bURyO/9SAOe6Ivv2DfKtm+pTMnaiVHrARwXuR+DflYott/soeE2DsNewM91ijUpJwP6gcnlZaUDmVITgIP2HiYDTF+2USIWyXNZtvgvXv9M4yse7fEWgpVGQcDJh7vIenJ9ULzBrkNHvs/nx5eozv6pxlbF4Kfkk655BpPyNFvo1eAnjpqRMBU3WeoVO58Z33Qq0cY6TbM9r52bN3SyyOM51d7AxWVcXlGCGRG+jb89lHFsdSZRWhfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HOqQwUzjPxmfWmOFzUs39L56GyUCvAWjZCW6zs22z0=;
 b=jmvUvQRJQB2dfJq2UjDlGi074jy5Rwv/VFyJ/czCPPrZu7C6B1X7FlJ6pJT8hMLANho2gvU4x5Xlsh2zS/D1xu6rAB2UBMFu4RTz0qaDROYv2eBWFmjD603Aw9/E4MPxrYymV4WHJQmIxUVgvjhvtv6kZqOf4cPaWMV58PSSojcmjOvw2efQSqJPcJms2JQRhHMEuwuTpoC0KYw6fJlYWlvjZRd51rSZSOnxAe/soIYpV4HvlQWON0f6FyxGeH8DI3Qjtt8GaNX9ELCd+3Jlm7VHMTagNNttX63FErjd9obGW/5ZtKCqhEEtSyX1amwX5ph1TH9+pMsi+HrULpnDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HOqQwUzjPxmfWmOFzUs39L56GyUCvAWjZCW6zs22z0=;
 b=CsqPOnSMMieLsuEqR6bGsHdhIYI/nbmF/q80ikJ53bo/gju6MdvBt+dRZRsOyKr931Tg2xq49A0CbRoJ6fg/VFVHcmp+S0ZPQbcz4D2TNzTEiHd8SDUKOjRJA3Cu8QHYQEqKU+NerE+6HZMCrw1axZ0xaDVLenSNiHcCwHbcTsQHgz9ZiOCc2OFsbof5YiAEYvrBBVKdM6I45rdhF26isE7m+rQ5c54xfyxjIfnERzJ2pt4kXWjO7jEplf3QeMTKTY78EejbMV2z4HIX9VaH2RLb6d8sh3i6Il7s3c/dJo++FJ5ABQ25wYF0Rhm3u205uDaJqMArtfYu/kpqyLFSGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7411.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:58:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:58:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: dmitry.torokhov@gmail.com
Cc: Frank.Li@nxp.com,
	ping.bai@nxp.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH V3] Input: bbnsm_pwrkey - add remove hook
Date: Mon,  9 Dec 2024 15:57:33 +0800
Message-Id: <20241209075733.2504229-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0be582-3533-4305-c0a6-08dd1827360b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UEjoqA98TR3UkJHVQEFk14u1rFQH4QUbFHSTHdSIYWg6eYt/Cs1ORbSw8jQZ?=
 =?us-ascii?Q?LdS04it2qeGfhbHAzP0A+IUvjaz4R0YWfl+rO0tDJwpk3g+7J7E8oe4cgSfc?=
 =?us-ascii?Q?dm6l/Iiqav0eMwGVkp9Ld8XFyAqwAjZG5y4D1UhLOm+e/MJrhmaBnS1H3Sy3?=
 =?us-ascii?Q?GyYOG0c0hu9k+b9hBj/1S9pN9mG55rSgSApWP9zYGTnTM0TWgS8aBZ+7W2g4?=
 =?us-ascii?Q?5n1EmhCAg40+cYH1AF3Me5IYUivhVLWfjKywvHjDDgvnw4i2F8Py6IqX9Dmp?=
 =?us-ascii?Q?x3l10V4EaGt0tGQTTTzOnPfDzezaFWWuexbf1QvXDGgbyC835qL3H9ZltrBb?=
 =?us-ascii?Q?Dl7tdyS6RdbrubOyO0WfhGeB0h2WyDBknrTT/hkwkf8WWSPQusxOSznZE0qs?=
 =?us-ascii?Q?uqjeFB9AAktlZsjnvxIDwHIMO1MPnqPjp1HSgjWR1gc3kimfuNkyvHQW/pyX?=
 =?us-ascii?Q?Dg0E5UIoVX6aT0vhbJwpwqbvTPJciyHOHDXAH9tAI5lUGnRDvdLtrj1pLMnD?=
 =?us-ascii?Q?rG0UEeANv0+YnFnh+4sLeUGo2+iF56gdmCV0X717gTFe1V13wjECj6LNfTIW?=
 =?us-ascii?Q?tePLhwgDZup8TEa2odEwplVuzdZt/k0Ol86w9eh9UWGtGFFkPU4AiOyvYIdJ?=
 =?us-ascii?Q?qiimvf62HxW/ZCmWQM+AfSVLVTd5IHIxqJl/JQH8rpp5KB3DG6zVmfZaSUdf?=
 =?us-ascii?Q?Au4rDrzrqDYD8fFtkfi701g5rFmp8YegKGz4PzhyNmgWn+0ggQpEUsaJTp30?=
 =?us-ascii?Q?LMbBDxRlzUDPJdcNFRl9PYc/BobdyExXZvHBMSBVlsmRFMQLBrr+4JQHnyqu?=
 =?us-ascii?Q?Tn0eQNMIQeVOvOgzIJ+EZqSdvPInwCNiq/s0JRs89bKj3XBR4BewR76uHkg7?=
 =?us-ascii?Q?DuBiqVGHimcOm5hWne33tAmYXNr5Gto+kQmCnZRgiU8AjTU3p9x7A4cAs3I/?=
 =?us-ascii?Q?XoVa/EEk1pj26995xCr+9NJhP0GcYGN1NLVXV4t2UcK2ai6/FqnHXRP0eXaS?=
 =?us-ascii?Q?FBJAmIBtjyUnI7CvXkOmnvueWNOVIPfCYO+exCzY/C/fGzP3upUqPkrP2XIc?=
 =?us-ascii?Q?QGNgykoHebQvWhDSWYeK+anVV5K436nZTq0vtwTYXh1kMcnxkTMKEVFUOb1n?=
 =?us-ascii?Q?sDhGZ9cdGeE3g8JUbTmTACIBlv6wPj6kN2lHxB9JMYyjAyC2wDkdaRQWx2D3?=
 =?us-ascii?Q?ofz8Mk9zNsNbjAtKVkg9fGmBjqcexglveMRpOtLvgJZ82O8HwtuOmQ5d73uU?=
 =?us-ascii?Q?tFuap6CXGdB8SepoRLIbV1Ida3UBluLSpqaRP57IZJXDK0ONaXwl55wvQRl5?=
 =?us-ascii?Q?JdZ0qvsIX119LqgGOtQmbYJNZIM096k1y1ygMABC615ii9ivJiWnbQK/pnKk?=
 =?us-ascii?Q?Se2/dZlHI5ceh57sNBaER4lO3efJHMs7iL1r58air3KWzICCtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HPOoIT8idL/FqwJxUs+7OCa8yJwSRLxlnNEP8msyYfMNx7wvV2csPrfjhkt2?=
 =?us-ascii?Q?4ifbwhZLmgaasLeQGddjl9ns6QLi7tftbFf4rPID2vLAYY/YeTPPdt9w4run?=
 =?us-ascii?Q?ThXpJcCEgKrRWz6bUm9lsUyWD1G32AL2toCvt83sdm1RLojOTx3+FSphqMRs?=
 =?us-ascii?Q?UkbKuVQ/rvJmLy8tql7jZa8EEkZPnM2PQ5yrTDlhvI3NGEgDfP/aEkhOsxgP?=
 =?us-ascii?Q?sCplBFj0/5QZa2CY1k69tFfAmTxls5nphjs6QehsCkVLuVG2G9KR6QBp+wHv?=
 =?us-ascii?Q?iCuGA5IY+oAwWA7apVPA597I5kqIg3XZyhYy1gycQZZiDZez1Am1LIXc/wcp?=
 =?us-ascii?Q?8Q+7+jPdt52UysaDwQZ6OR4inC4tknSV0f5cq3womN0VEZd3rohmVrvB+How?=
 =?us-ascii?Q?DhiAgStyRrBp9ahsM5StcWRY/JNjKxJeW2vHHiIM7DMcyeIDzYjrKRArugun?=
 =?us-ascii?Q?B2nsWK2EKEtAioJJDwXATufHAm1+ei2JqqIVlhS0rvQF/b5n6hCAByBjss3R?=
 =?us-ascii?Q?moDbk589vYLMeM8seOCT6jq4H7pr/ktCf0gq80sn4A8dNE7nJRbFiV9T1aBz?=
 =?us-ascii?Q?EM6D4M64EAkcR1Qc7NAHjjPvZ3q5cMKZewVIWqXNOfly3v0fbTm0VVlf4VCf?=
 =?us-ascii?Q?2QigK2lSOWKYW3bk48NwJ94ONoZ1xv2J2uPO9mQwtB/0LSS4fIiR/l6vGfY6?=
 =?us-ascii?Q?Pi+rAClaEt1wxjTFnCUaeb5scQYF4kmTUhwrheQjJ5DJM1PguBc7yGSUZkAT?=
 =?us-ascii?Q?jCYw1F6g+sWIKE802sAM/eLZPXMGbAr1pbCuXPJxzpbVYC2DYXSNmL4Q1N9h?=
 =?us-ascii?Q?YsdFxA/LsHs63PQ90b3i9Uf6BBwcsARoAsIKSmaMZjmIrkWRcZPNrLIM75OR?=
 =?us-ascii?Q?biv8vwjv+Z7sUMH79RSokQ968yp5AuZchV8jZRchNHchas0Q7VFI5MwQDEOs?=
 =?us-ascii?Q?OMFaIIgEjTVaIQ/lWIJTRkbEz+SgGrWtaP7h2RPY5Nvz4GWji7L++Sq5gk2Y?=
 =?us-ascii?Q?q4EDyJg2oJRWQvTvdQvY7PaBypw3Fcre9U+HHW2Txvk9FI5L/LOIPpkxCvni?=
 =?us-ascii?Q?7Rfpqx7avuj3MGodO6HJb8aL0p6+yFkbTukXjF54cCbG75vISt3BnnjgX1s2?=
 =?us-ascii?Q?m+5to+z4j0lWlGxMDlGBHBTcGxOxA+tMC+BbbE4du7nyRwa7EbP/eGic9zKx?=
 =?us-ascii?Q?t5VgpYV9NpI4Cr7f1C3tsC2vC+FO9U3IkB6Epp143AoSsD+fOgWNuPepJVOz?=
 =?us-ascii?Q?lpJM87Com1XFzSylRyN+CM/XDzrMAsg5f7R8p0NKTVAcyRt48OadpCRY0lFi?=
 =?us-ascii?Q?aXiqNS6N+bJ8lsOj2xaSPBuFBRwqbpLO873yUfBfadZ3HST6fXIpHom1IVac?=
 =?us-ascii?Q?WwGItDNrJWzBGZWtrJ6fI5zpIXm4Q2L0v6U0M6qaxyXOGN235K5KrBXmUXQH?=
 =?us-ascii?Q?s9J+ARIQks7dtT0oNGYbt3iWGEdNEKuDo6p3R2OV1I3ROFcHlz2fhpM3qWHK?=
 =?us-ascii?Q?PKXvITucUgE5Yb/UBsTaeV8odxpMIcsPFbo1bvC5qxhoOal9cGrIUgifPpET?=
 =?us-ascii?Q?dZmL2RYFum6PnIQhKaiJrFki9NQoMR3VPLmjR7ji?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0be582-3533-4305-c0a6-08dd1827360b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:58:04.9183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdM7ApysrPXQlb7pX4OaDWhXYYFwI6EjxKC6RNfGQm76kBXCZx3bBVIT97YK6gceNOTqnhRbrP535m+h2M1gAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7411

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V3:
 I tried to dev_pm_clear_wake_irq in common code, but Greg rejected:
 https://lore.kernel.org/all/2024111213-eradicate-puma-3592@gregkh/
 So post v3 with input_unregister_device dropped

V2:
Per Christophe JAILLET
 Use remove, not remove_new
 Drop checking bbnsm pointer in remove

 drivers/input/misc/nxp-bbnsm-pwrkey.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index eb4173f9c820..63818956e376 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -187,6 +187,14 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void bbnsm_pwrkey_remove(struct platform_device *pdev)
+{
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+}
+
 static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -223,6 +231,8 @@ static struct platform_driver bbnsm_pwrkey_driver = {
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
+	.remove = bbnsm_pwrkey_remove,
+
 };
 module_platform_driver(bbnsm_pwrkey_driver);
 
-- 
2.37.1


