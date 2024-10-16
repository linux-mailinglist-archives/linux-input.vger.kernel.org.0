Return-Path: <linux-input+bounces-7492-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 884AC9A07E2
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 12:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC1B1C28802
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 10:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48A02071F7;
	Wed, 16 Oct 2024 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=synaptics.com header.i=@synaptics.com header.b="AS+gAO+O"
X-Original-To: linux-input@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020081.outbound.protection.outlook.com [52.101.193.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C881CC14C;
	Wed, 16 Oct 2024 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076159; cv=fail; b=a1TwikdJ6NzL5klUen/0LiPGTtZ9stg1W93JYeCeKpXqmQfZV3VcyGN30MEFrsooxCI2kuMO4R0K3LdXb0Xz41P7TXwJuieluB6Zyw78d8tZSp6kQsxcl7opt6CZeDuODxMuYZvrmSEno+25UMQb5js8QUyxGPCShuRajJZ5LC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076159; c=relaxed/simple;
	bh=4FaxxgYDbnoLkPiQihb7k7+62uIjkRq39aDdHaYKaCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ae6xS1yODE26lEnIBMFISflvL0syVmIB59gfUbyzVqbm1qEDdsAnt0pw6aO0fDHduaFzAzWTu5nT93tGGwD0aszTa3D59tWIzTqhANKuYmcnEhIuj8lWFs4HZSdJLvi4m1X03HAN8WU5j4jUYKINP1NIMSpVkwKFvF3sU6KxrBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=synaptics.com header.i=@synaptics.com header.b=AS+gAO+O; arc=fail smtp.client-ip=52.101.193.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWrozu1dUCWmXI9arR8QxtbZDGWckBP2UcJOhIPx1pusW3WdiFhDkv/H89i5ffz3eT/e2gHXUFCCkZY3eqwAz4XfHNVJDe00mH4ZTNUgnXJxeuGswIgPud8CEiEuH/DMTC0vrr0rHlhLGrU+/UpKI7V43/N8jZbr8pgWAxWfpsZvqOhzicD+GjftqGCXlAUngnXNQL//ezRj4bxFytPcdbFt1RuRz/t2rhmPDnuinQ5nlkA2L29tvsWQV7J9r5/o8bROeMsWYLiey5PNPEUiBRkFAH1O9cevG9apuJ1LM4tpvGe3rcGsE9PNedvEOIK1VK1A47LQXetLSS/AmzOE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5LaKSvtPJG7Dsp+N5IJ6pO92lZmaW2aytVhXK8nuL8=;
 b=WvpRVIVLLBLJK+uwjKnok3e+q90s/SaII3G9yEW5SfLCQ7GkhVVZUglw+htq18W/i0iLVuBApKgjmInpgy+76aQBz76fxCAqKdgjWVPUXNU+aUouIDDIa0DmvAYlRr8MohMa65xtlTgRdFus63RK39rrTpNtXTbTitCkvfvG5qiWP8qRZB0UFiQKy7rB6F+MfYsc0do36ei25hQW5/T4gr7yQrEFj3iyLkxO+gGILuykea9jhRg1B7E6u1/XEXQ1CVY+YlP7IQel1PnJwpf0PDHCux+KiUtxnlNjb2QSZp0ptxe/wNHyPqhQDxgN4dJoDsUV+Wq8pMFxbFXHbSx+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.147.44.87) smtp.rcpttodomain=kernel.org smtp.mailfrom=synaptics.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=synaptics.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5LaKSvtPJG7Dsp+N5IJ6pO92lZmaW2aytVhXK8nuL8=;
 b=AS+gAO+O56gokb7r8A4+kIMh3C16kc49keR1EGVKWheIWhOrE6hVbpd/75BeeQRFuNmOQMS73GiYui5KdM9qen1mKnUbbuCbhKolzgPlE8ciUtwJaj/bCSHUDKyODKfAWAJ8KetvYl2OKsz3WPYVC2dWstd7l8p/Bijmp1r5Rgs=
Received: from BYAPR02CA0047.namprd02.prod.outlook.com (2603:10b6:a03:54::24)
 by SJ0PR03MB6518.namprd03.prod.outlook.com (2603:10b6:a03:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 10:55:55 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::7c) by BYAPR02CA0047.outlook.office365.com
 (2603:10b6:a03:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Wed, 16 Oct 2024 10:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.147.44.87)
 smtp.mailfrom=synaptics.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=synaptics.com;
Received-SPF: Pass (protection.outlook.com: domain of synaptics.com designates
 192.147.44.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.147.44.87; helo=sjc1uvd-bld04.synaptics.com; pr=C
Received: from sjc1uvd-bld04.synaptics.com (192.147.44.87) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server id 15.20.8069.17 via Frontend Transport; Wed, 16 Oct 2024
 10:55:53 +0000
From: Vincent Huang <vincenth@synaptics.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marge Yang <marge.yang@tw.synaptics.com>,
	Vincent Huang <vincenth@synaptics.com>
Subject: [PATCH] HID: rmi: Add select RMI4_F3A in Kconfig
Date: Wed, 16 Oct 2024 10:55:49 +0000
Message-Id: <20241016105549.250515-1-vincenth@synaptics.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SJ0PR03MB6518:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: da476475-2aa1-446f-7287-08dcedd11b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7CPl2jkFrxY9CQX3UnN/eyTLTdMR0BWmjthFhrFAl8Q0zEM0vgG6QvFE1Hpb?=
 =?us-ascii?Q?4Da8jlBZgG+8q/91iZ7s+QVOY5O2g0W1l4YV7jQHI772rmFwp+ux8oqzOkBa?=
 =?us-ascii?Q?bLwHLfrgfeOvkHR0z4egJUnem+Xw/lBZ4SnLWtNKswjfoRrhTZA/P3nwtmoQ?=
 =?us-ascii?Q?pcISOPlPZa8R67qWzMrQKnxuDBYRo00mDtDlzzWvSgbKgZ7tvXpfratJqd0C?=
 =?us-ascii?Q?OSpcT+HnkTS4bSpiaWxftlQoInNAWdG00vH9G9PawwEy568x7njCSc1jf+nj?=
 =?us-ascii?Q?UJkigzddd7Tdjy0dXaAdD97ygAbUovcBjktU+pRrVNIZwWb5Ik+gOb9fEWpb?=
 =?us-ascii?Q?AnCs/HXhpo8A2W/GYtoFlAs9/It3yYWlMLhm/en1gbMH4JIAAViQeVSQBrFw?=
 =?us-ascii?Q?+xECoLoUcgZlPvDxYK4lbGXNcdniQGW1TIBi6WNHrZJKu/xCgH5ZVTGUyXh8?=
 =?us-ascii?Q?jwouv76864TPt31VveBinw5XgvEhTgbV/qza2iWbtYwawDMV2SkXnN+YLWuf?=
 =?us-ascii?Q?lR7RTVLdJa7mr52ndjhWCMCDzhYBLfeBS1u7btnl8YPdGXlYnbnk19dgBwHT?=
 =?us-ascii?Q?/Dk+1sZ7YJj37csYla31DHgJFlrxZE27r0sc2EGHfmX3JzZ3GHng7HCp8ufR?=
 =?us-ascii?Q?g3npr6yAyTSny96dkp3o1S+UfqoFUduBgSARoKmn8h0P6aKXJYTWkSoxZLXZ?=
 =?us-ascii?Q?LovQi7fSdcuiMrq6lrn0YensE1g4KfV2bne5sNDY5wRiyYk8eZtYUmoU8l94?=
 =?us-ascii?Q?Bkurie2lkVDxx1rUARVNi5LJsCKcdSHsZdExymuIN9Kdk8m5e6MYa3yY1e4t?=
 =?us-ascii?Q?DE2sRQ56K407GnKU76w6vqB9UAgFl6xVV0fJskLJGRJykRCHqyfY+SFw0TmG?=
 =?us-ascii?Q?RE5uo1tqBAxttxYvgp9m9yb4wDoVCHw7pllzqkvabS2hG1VR0uZmte68UOD9?=
 =?us-ascii?Q?8Tk+Gd2V284Px+uOW8DgLdmN4KlVZzmCXCXwbyypFZ4n8Vqe//nGFOHp0rZJ?=
 =?us-ascii?Q?D/hz39MAwlQq0wVnp7oVaqTRWj6hIHp9UxBkwPNkxqqw6C7yiAtQZxo5Sjdp?=
 =?us-ascii?Q?+SLcDOKvHUGYmr/+KIE82O7U+Zqb6iY4VUf1CbaWbwEKcdoNIOWJe2a2lIby?=
 =?us-ascii?Q?qipRDP6a5mxfnjjY3xuvjekxN6jQ18Obar9A1P46EAvg67W1+1TicNSszicE?=
 =?us-ascii?Q?NMfeqswrSVy7pJPPqT67lN7aovY0op/9MurzvdAzrHdoC1dDbLTMuX/3w2k6?=
 =?us-ascii?Q?oMSy3SUGkaPlw+Ah1SoXDi2sM6thFEF75d9n/JOD2UsJEQbho94cUJ7Ruouj?=
 =?us-ascii?Q?YseDPk86HaFlK/O6VOZ7iCTbawaAwkWYNGkIVAox/kpeai6vEDRjnYEB2OPE?=
 =?us-ascii?Q?kfkX/Gb4HbpaYS6KeJgZAWvdRknY?=
X-Forefront-Antispam-Report:
	CIP:192.147.44.87;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjc1uvd-bld04.synaptics.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 10:55:53.7481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da476475-2aa1-446f-7287-08dcedd11b15
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=335d1fbc-2124-4173-9863-17e7051a2a0e;Ip=[192.147.44.87];Helo=[sjc1uvd-bld04.synaptics.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6518

Add `select RMI4_F3A` under `HID_RMI` in Kconfig to support buttons and GPIOs
on newer Synaptics HID RMI devices. Future devices will use F3A instead of F30,
but F30 is still selected for backward compatibility.

Signed-off-by: Vincent Huang <vincenth@synaptics.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f8a56d631242..f2c4f9e89cac 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1096,6 +1096,7 @@ config HID_RMI
 	select RMI4_F11
 	select RMI4_F12
 	select RMI4_F30
+	select RMI4_F3A
 	help
 	Support for Synaptics RMI4 touchpads.
 	Say Y here if you have a Synaptics RMI4 touchpads over i2c-hid or usbhid
-- 
2.25.1


