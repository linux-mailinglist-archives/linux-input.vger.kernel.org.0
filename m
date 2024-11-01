Return-Path: <linux-input+bounces-7827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 874FD9B8E80
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 11:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46571281149
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 10:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F3C143C72;
	Fri,  1 Nov 2024 10:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Hl5VQyfH"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2082.outbound.protection.outlook.com [40.107.103.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E71D555;
	Fri,  1 Nov 2024 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455340; cv=fail; b=ruZjHRDOWb6qy2FUidgZHdZMtga6bgShMiyPsb++BA4GDISSbhdPbyEbPDUYSXcZpzhFq79l6z73URpvZUlYcCJSy0sM80qRXyMTqNRqc0tjhRHMvInp3NQq0rPWgvxas83iHIJp5GGxaJAFX3RTicka+eo0KeRRhNGsj/IG5Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455340; c=relaxed/simple;
	bh=uyTkhb+dYUB76WXOHLVkY+BjmVlzTcQHnsuxFHFEG+0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ulrai6OF6HUAVKIeaWNuYR1SkeJBxwhKf6YNNsjTLB4g82sGk+rXzMxQ322mIUo2vGrvnnB1bTDosWxswpT1gS8rDQIpzKzcRkcyiXTXD1VEu9aqSpSxAytpY3nCDujSll+bDlClyto5Xehng5h2Apqhun7odS8f+modDTCN23Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Hl5VQyfH; arc=fail smtp.client-ip=40.107.103.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYH462314S0DIp0TwzM96frX6/+9YKzhyWcArCOB5VFMr6QN/k+bxYxVnqx+QncR9dF4qp8+ZDVHASaSbEEHuIxsdZVZLe5PGUO331YLG2iTYKqSrirsXuXEra3/coy/BKj9ahlYKJCj4HCfPtqPoog+FWCsVaWWkNlbBFQVC2DQ6zMC4ruAjTFmDd+5xoxfpbrlGanVNzQ9AdF0mosK7RDyF/aBcDQh2C+duENoX5iDahDkcI201DYh3x57lOAwsiklL+mFTcr9jU2McouRVuCqnnSFRE37d5M2GtOC9C11I25jfOutX+h8N/vZQ8/WTQ5GWTw581x7g4hIFZG4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBtIWQ8MQk6T6fBsknE+7nH2BqMLMOqfcdg0Q0GeqXc=;
 b=sXTa9+phvNi4MG4fHM5JB8W/sF6wUhQIUk0Av62PPgKPVKn0/am0Uby6ymRpOrjF1GZz3Bdy9edxU13MrUPLONr++6BNbc7Vx5aJAo7f1SHkBuQzRqi4OZ3uiQioQtAStGda2vIV6d5Y9x5RjHUHxL6zR9HdinwtlAdI97eRjHd2C5W0ewET9hQ/gfbRRZMbJSXYBgasTtrycaBQgMrr+F5XIKzHZkICfMMxfMPmgiimrN+fcXfP6uX2MC0DAOekjNFHml2LCunktA2Qiuu/Kb3nIN0VOJZTk1WJpAwGdeNjzIJW0ABMCRYOPK1W/PLJe4rYC4QzfhAnw7ZUl1BkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBtIWQ8MQk6T6fBsknE+7nH2BqMLMOqfcdg0Q0GeqXc=;
 b=Hl5VQyfHdlSz4UACP5d5wADl7sPthzZjlXr3hmlQ/xpHoMXgwcMgtPkfiUbAgp1no20/PLyNN8i2RdR/TOdkmhSouJ/F73xMtEh+t0beyzaum1Pq7duiOEAWOAy+RdSdTryxe0emQA3yMHwpu5k27N/ACIiQVPXUPiiu4cQirS0x8gjDLryTbgCcpj+jjh+4LNY6Gyr4X78ijr0JCS5YlIo/9i5UEq4gweiNMRCg4ZjCrvI7izMbym00N5Fc42yUT0OWQ64m+Lfrq906Fu0RjaHolKRzgXy1nJ+pJUEWj5Y3kKqDeIBFD53xKoBz0kMtdQoNMUDAsKaBspk5tqIYOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB7200.eurprd04.prod.outlook.com (2603:10a6:800:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 10:02:14 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 10:02:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: dmitry.torokhov@gmail.com
Cc: Frank.Li@nxp.com,
	ping.bai@nxp.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] Input: bbnsm_pwrkey - add remove hook
Date: Fri,  1 Nov 2024 18:12:22 +0800
Message-Id: <20241101101222.1448210-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: b7998777-1450-4172-d6df-08dcfa5c4241
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0656TFEPQykyoEqeoJQmpRRXx2lmExnPga2UcQLZjOyn3D+H5CQ8A0Rr6s52?=
 =?us-ascii?Q?9fmYwru7UhjB2bbZJK42X2pT/kZlUo2PcYrgwInGnxoEWZXUAMhJ/achSxDa?=
 =?us-ascii?Q?ICsHss6JTbU/KKUI3FQledX4iXhHTKmPJALp93C2oK+n/640DRJntIkvLRYC?=
 =?us-ascii?Q?6TAoL+nllj/tZkPFfCwjefEGmw0941TOk/zMHBG7a3cp6gaFrj36uCbQUE4h?=
 =?us-ascii?Q?AbD2QJlkAbOc1lCYPS2AZkUUTFc0VuNPpCpvPBAqRhTsG39NIQQHk2WTNjkN?=
 =?us-ascii?Q?dJccBjsFVjAAS2eDZzQVFSPgKjRGCsmbX7WZx6D18AfbxeRnryCPQDWcIO+3?=
 =?us-ascii?Q?dtWuEjNAwqel+2VDsnhyibc91d/jWdq4Mahh7VBMf3hJwqlm9WedSK0KVLYC?=
 =?us-ascii?Q?Ex0+KNWseaGdNFP1JVlGHk6hTz9vsE8upzzBLkU7dJ3ACwRNv1Xljaxb09hN?=
 =?us-ascii?Q?rTjEj5/cgjV97RXXRANK8jhq/eMtPFS4EACBhTT0OgiSKZLUtzJXw3CegOsr?=
 =?us-ascii?Q?iDXm1V2NXPCyBPgRPeI853qlVUuXdpP6qoa3Y/xQK30Q9RvID5egIRKq3oIL?=
 =?us-ascii?Q?5T5QZ5tAotQcImOZ+AernhgkK0PrX1sCeApv3rLExbVij2phYSSIdy9Kd1On?=
 =?us-ascii?Q?zX4UTnHlGWTVMtmTYR7y7kAhoicHNmiSrtqVCffHCi7Vkfj9j7u3ZKf+PczY?=
 =?us-ascii?Q?g4Ah3FB3lPPC2sM8ziPcWWZ+04j1jpoF1YfQfcyDQakge7sy7FqdEp/nLN1f?=
 =?us-ascii?Q?OdBuwTJ/bBd7krp502ylRz6LB4HIVS2g3IEzRjIWeY0oDCcwPyk3Dy33Dfz/?=
 =?us-ascii?Q?iY/+NUciPUZ6x8tCXtg3GCrvLUzgOghGcxAUIHNemmAdhCuvI9zf06veSe8t?=
 =?us-ascii?Q?Taq8mKXIhZS5HK1Q82PHFC5Z1EUBEgGcrPv13NXgFDXc5dN+xWGfsE95Sor5?=
 =?us-ascii?Q?ueOE1ts9DwPhF45EskSAlteeFgL7KgF3XCbrc/zSDlQ8zeilVY8FH7y2QDAH?=
 =?us-ascii?Q?Lq1kIlZ8EGNgEW/whtU0bKDu/tf3DboM4CKpBOVwWXxFDgChB5LnCtzfmum0?=
 =?us-ascii?Q?YJOhVGif9Be0C4WhFmvtL2EMbXENfpsyDnkvpdNDEaKa7PPnh2L0kDcLWAK/?=
 =?us-ascii?Q?y1zBUJ+01+u/IP+TauA3vZRWvxpzo8ah1HgPzccQulLIq4T/XrV8x36ksSb4?=
 =?us-ascii?Q?iD/xLn+/qC2EYHYXeVmMgWrRnDNKC+0Spwlcdf66DLJnGmi2wj5dj7KzTo1E?=
 =?us-ascii?Q?uWpd8ZzNb2UxiVHHnl66HxXSY4qe/Q75aiJb3v66Y+qMFjIAinoQp6O95CwY?=
 =?us-ascii?Q?J2IOJTTfz8UQWOYrlx1Vv8GfC4TRhW4kxO2B40FnK8nhBHEnOJsdJjvYaN8C?=
 =?us-ascii?Q?LJNZcao=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dg+j+whEdx1G0+hB60Si3EKtAgI3BppskkIMC1KAy8FqxytDR2fgmX5lPnfo?=
 =?us-ascii?Q?IBV5ouh8CRy145nSXLMb2QbAfWnWDYj3xKyfVlNnDXtJWsClPbEIT45PaTUk?=
 =?us-ascii?Q?yBbuLL7A837TgTsLq8MlRI60gEMm3kIiIAjYf3W/kTNB1VpxaUPqROP/Vt/l?=
 =?us-ascii?Q?AedBAqJyAy3rHk+u0Y04YJrb1ie6YS+tw3Z5ec06W0MsI8j/TCZmEjq2xTs/?=
 =?us-ascii?Q?5+plNpQ58VvM8YqDslNckQFCEi3f2KBu+p67z/QuquofINr2Etk7nU37RFsM?=
 =?us-ascii?Q?WaK0ZXiN0a8De0bnwd6YbXWXqLNq9QifwMLmEeIbirCR3zyskdG+6VckGQc+?=
 =?us-ascii?Q?fiX2eGpo9OlMOKOfjIS29FoC4AgneGEhAHJs/mYyEJV1HlGS8cCCSssrXrwe?=
 =?us-ascii?Q?/Z7mQp30PlFrwjz5A1UQn+QBHlAG1iHjEwqE8q4mTnn1h9+a+XAicAQwfOUt?=
 =?us-ascii?Q?CllaSkG7nQQxE5+zWRBx5HPAmX/eob5xDE0S9QWhcJFNdP1F3gGaY9PRdPgO?=
 =?us-ascii?Q?p9WFhPN04idPh1b+GO76ynd9kBZarqlDK3H97R7ODUqsOfwPj+nI2ZxmhOqt?=
 =?us-ascii?Q?Qtm89bh9Lp4Mpt6GJIumueVJcVfudeU1jw23v9HYLnD9iHqMKJ3aHv3bhxKB?=
 =?us-ascii?Q?79ojl4ZC5c8EYzEcThTsMgN8NjolwKiQAY/Aly6NlDUH/iIhDjOiNJjbj4GS?=
 =?us-ascii?Q?wNx9tMRvlcgXrhEHKcYxFEkG+cJWLce7AwuLSTOID+iXzn8v2kGh3wqH5L5o?=
 =?us-ascii?Q?A5fr2MNNOGJhaPeW1pZMMp8f2+UsAw3iqudZ236K9Sidu+W8xUxCzd/UbWOt?=
 =?us-ascii?Q?Idp1kjI8GBYazjiJoUpxaViV4q8+QmFauiY4BYEuNfXEmXaWlI0KqhhPT0ZR?=
 =?us-ascii?Q?2Oiif0MtTQblb4e81e1JeHBpYXdQBOBhcWi0cURO+1kVQlaD5EuiSnH2CS5x?=
 =?us-ascii?Q?Tivu0DWricJpJt8Ry2wFXhau1Fyk6pP7B35xxgnQLwpD8AdA16R+xnSzC2tS?=
 =?us-ascii?Q?3GBzHehgxyXBhxFkjGGnwp5auJYH9ifBAH5LRJ3iT2bahvtw+iQWeAha8mKn?=
 =?us-ascii?Q?K9jMcYOVXXJbTnkHqXIk4a0OxRNlx3UG+3n8jCkPBx26CUO/JzZL9FfVTHcN?=
 =?us-ascii?Q?SHm3gTWNNbDsM2oyAgQXRpno7BMQU/IImaq422qZRWmh98SXZGSNMkRow+BJ?=
 =?us-ascii?Q?vguHhGSj5sp3EbunHQKYlfNeMtB7jSEuysIoYZypsJMYPOqy/yOBWmFexYS9?=
 =?us-ascii?Q?4W8aBl7t/u5vFiZOD7NJzpSWLRdy259eiJGydFppcep1WcGvKTFUIY6tcWZj?=
 =?us-ascii?Q?z/lX2PhP+Tjgs/RBMCmJbxTJQ4fMlAglEQU3R+/cCiWeAM9kGkcrUY7geDAi?=
 =?us-ascii?Q?ppG+lyoO9kdxKH+acIZ1jEnVCgVLLfOGczed5XkpbhYkilSujLZLwhUbAORy?=
 =?us-ascii?Q?towdGCpV9lv/i1RpN+cp7P5zrGH/AHU63J0uCqnILEyAVTXQVN1KHQ4vkehQ?=
 =?us-ascii?Q?N0w7a4s7HfMon49sYKFxG47mNUlnStLJULhCfpfMXtp21H98MPSkgnSNBEa1?=
 =?us-ascii?Q?EesQJ8YhNEmM637q/a0lW1p/OCLtgQ6sVhj/df0s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7998777-1450-4172-d6df-08dcfa5c4241
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 10:02:13.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/vIfTngiaHsgwf6qqS9xr/BBFSASfa9EpbXpdRvJaAjHXl7xTeZmHoDH2yR2SAXkvdk/PrDSzCXKWYpKWtr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7200

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index eb4173f9c820..847964f7ebdd 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -187,6 +187,17 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void bbnsm_pwrkey_remove(struct platform_device *pdev)
+{
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+
+	if (bbnsm)
+		input_unregister_device(bbnsm->input);
+}
+
 static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -223,6 +234,8 @@ static struct platform_driver bbnsm_pwrkey_driver = {
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
+	.remove_new = bbnsm_pwrkey_remove,
+
 };
 module_platform_driver(bbnsm_pwrkey_driver);
 
-- 
2.37.1


