Return-Path: <linux-input+bounces-2115-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3086ADE9
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 12:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22DB628D252
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 11:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544523BBCF;
	Wed, 28 Feb 2024 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FTU/8WOr"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415B3BBC6
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709120379; cv=fail; b=sZvUH6B99TKOoDeORaJvCJAtz26olEhwhP6SLwemnU70i9h+cZLrssPYIzNxnF02eAG7y+4QKhnxQjEhG7vrYufV3Njta2sq+pYhtGzoju1khyNUDMCXZ7K0bba71VpItIPzUOGYgyQ9swVIKx5ldPuC7e6fN7sLAgFBaBy+Ans=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709120379; c=relaxed/simple;
	bh=WGRhM3q4cD5rXF9EwNNY38i11utb5+Cn22AjkZ+Uyjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FVSGKsRcR+GfSH8u/Yw0E4/Yg5IzwbRXxlUDtlwHV/KpOwB13Hr2HVDx4ULUEC5qdkfUYVPxxpbjQnWpbZndtE79nzeRKXsmaakn1YRp1hCgELLyHE84y89k7vMwG8UETY526jBUP9N2Ak6y1uo4eeFhoBUhTnNZv4sM/akvrWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FTU/8WOr; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXnH+fdoELFcyPjpNjKL5iigF77s5TuSBx5x2wY7/86hWbFHDRrabmGh2jKAQI8QbOmIJQd26hnnhutLKwhWuwVpqacOG4wzXxXVoHPvXUC2FRtoD9X2dwo+Iya8U3oAVs+C6BuE8DgGdupH6AmbNDpRWy+JxyA4BNhI3o6vrO5/28bIJHHz5KEKzVl+aMtYYwPuch2EOA88ILFWcaqnbc+t2EV1zpuTvnHQkc0m4JSyw8Tzfykxlb73qrJ2B2DnHcXVCzwy/uIwkoyyQk1adFByBIfT4oS8qvORMtQVG2y0HS11H22b9yXYSOQv6+uO0Smc49Hphkxo0fw76GkFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zctAgXOquHPhsr5dKr3LAxr8jnLg2AzmVp7nKbKZ50=;
 b=dd/cCH/bMGyJVa1L9+0kOwTSLRaQr8iuNV0xMxz9202GI+Vt9F/n92jgcV+iFy/uDcm+PANcHtESVcf5rsiD0DjCeqGgRPrNNzDEaiMJaLsXthh569bDRJyH52XRX1nsdPdDWwA69FgShy9CcQ5UC67qiy3tW24UedGu3JwtEYren3Sn/tt9VumBM+17Jz768X0rTe9blrarxLq2tjglBrA7fqxJOo0/rNIxKR4y9Jdrvqv6X3A2hEkb05XtrKjqM6jk3Fys2HXYqm/TTF2bnrWew6TD+4swyRMkvgtW0EJVsBvtqcvhDJqQUy/eCNSMG3uasyDUFL4c40yg0LQ0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zctAgXOquHPhsr5dKr3LAxr8jnLg2AzmVp7nKbKZ50=;
 b=FTU/8WOret+X/U+fVkjpUVVfQZtM6Yk0n0ZLvruunfTbZXTZpGo2f0jCRLdR18D00LIZgb0h8jOj0b11FnxvS3/qP4tdZjBCgq6OPcv9wQx2NAHSZBKjDaLOtafMJOeCwb5mLEWZVrmu4UTFEPyq4NE8MNEREvovRpD/aiXUcI8=
Received: from MW4PR04CA0390.namprd04.prod.outlook.com (2603:10b6:303:81::35)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 11:39:34 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::98) by MW4PR04CA0390.outlook.office365.com
 (2603:10b6:303:81::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Wed, 28 Feb 2024 11:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 11:39:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 05:39:31 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>
Subject: [PATCH hid-next] HID: amd_sfh: Set the AMD SFH driver to depend on x86
Date: Wed, 28 Feb 2024 17:09:14 +0530
Message-ID: <20240228113914.3864232-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed8b735-335a-46a7-d713-08dc3851ef4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LCm05mxTyU3oxoB1IAv9lnsXx4CT8Md0g7keFX6a17pSaB3CFpZC99mjETuJ11n87WNedGiE9F3uJBVwN9DUKCNV4a8nh/mD0S4/2n5rS0l4UnfhrNR2tNCTmp+dNtAymQntgmYrW4awjofmRZpI0ltpYdNRk9sXpCkzIdFipA14AFhcU5SkfzWnwDxnN1BTODVYWIzgj5tdhb8DAk4MB7JsDXqWeClJy9mqXmaHj31vvtV+uzENTBYGQ82KXIU6cYIgFSfS84gVOFMEN+1XLbp196nL9dTD8JuRT7KCNd1r18MCJfD8BR2aWyPO+HLCiVafwMVcx/IsDV8Vk5PnMh3P3cw1N8RciiM9o8Vwq9I/pjeqZ06iNYxVSC3GdPZ7GPR/rxF/eBhkZiE9TgGGcCNOoJudf0fiq/eWnZnwnKKx15m6kuCl8mabiVrAveX/8DjvKEohxGTZwueXSat8Nen06S3iM9+U5dkAso07wuyqVOKY/UY/pKYnXGJpbdP3AQhX/wvFVZLmUXAPZh9sv1VulHzou8o3MX0uRamcERrgRYANF2qBIWn9B3xLiY3wHvYqc8kHs5y/UbE1OAic2tU/ULke82k9cifpGAqj/hVNkzv3kO2MUGiy6BTyFKqUIYbMOShfzxB+m/fRCj8y9IViZoZXcPz7oiLufY0ze+DcNH/V3Im140IiAqTtkI4qLzft4/jwefns8bD1A9BrbOPlTDfsWY5KCfpmUvaPg08Li0d4ubsA9eL/AQhPZwNP
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(230273577357003)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 11:39:33.6658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed8b735-335a-46a7-d713-08dc3851ef4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470

Considering that amd_sfh exists only on AMD platforms, set the AMD SFH
driver to depend on x86 to avoid build warnings or errors on other
architectures, as shown below.

drivers/hid/amd-sfh-hid/amd_sfh_pcie.c: In function 'amd_mp2_pci_probe':
drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:21: error: 'boot_cpu_data'
undeclared (first use in this function); did you mean 'boot_cpu_hwid'?
  413 |                 if (boot_cpu_data.x86 >= 0x1A)
      |                     ^~~~~~~~~~~~~
      |                     boot_cpu_hwid

Fixes: 6296562f30b1 ("HID: amd_sfh: Extend MP2 register access to SFH")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20240228145648.41c493ec@canb.auug.org.au/
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/amd-sfh-hid/Kconfig b/drivers/hid/amd-sfh-hid/Kconfig
index af752dd3a340..329de5e12c1a 100644
--- a/drivers/hid/amd-sfh-hid/Kconfig
+++ b/drivers/hid/amd-sfh-hid/Kconfig
@@ -6,6 +6,7 @@ menu "AMD SFH HID Support"
 config AMD_SFH_HID
 	tristate "AMD Sensor Fusion Hub"
 	depends on HID
+	depends on X86
 	help
 	  If you say yes to this option, support will be included for the
 	  AMD Sensor Fusion Hub.
-- 
2.25.1


