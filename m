Return-Path: <linux-input+bounces-2107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781686A941
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 08:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A0F0B2122C
	for <lists+linux-input@lfdr.de>; Wed, 28 Feb 2024 07:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644A625567;
	Wed, 28 Feb 2024 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j4n1hf6M"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6B241E6
	for <linux-input@vger.kernel.org>; Wed, 28 Feb 2024 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709106693; cv=fail; b=Bb7RVlE4jYyDqhablUMTb0EoJsIMZqZUY8mpemhbk7NftLZDeu++i9xVZP0Lpoj0qqpNpahwqzzIAlxzHnF+AHhgFDwbjtPbGAHyjba9USV3P2J61kNMcNEbn7wEnwSseI306s65i35BlyMo5oTk3JxPmYFQ7zphcJWaFtLAbng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709106693; c=relaxed/simple;
	bh=mqr4U8sD+qE3ezn0gi+sGECEoiikNMsGThydIZH4lRg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aH6mPoTYS6CFoxmBD6EwRMPEJfFJ33+OFi6673ChTzoy/ALxKnayXhqY/PvtOfZItYvxDPlELXcctnqB5DICkmNKbKOm+SQsC68d3MIEragy1dqDUXqd8aBF/OW5rIPTfHZaFt1p1Cl/oP1QCNWq600EGawI12oe40ihrc8ldUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j4n1hf6M; arc=fail smtp.client-ip=40.107.93.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqymlrNvvlEShhAFt4tD+rl8WIK9qfvTXkGpABOUuWBsqZ/sohmjOTZoERYCY+EYQMbM+/Tmkv/RdvVWv3h2rniCBuB+pAfBz92DvTRnsrJRKt82mweZXucPYMfFJP8vAAsw9RhwSrxDU9IzVosZy2yV5SzQrjdT2q1gxMM/WxkLDkcwwNtkvEJfUP+K/rlOgOY1YSBL8gZHZwaU1OWm/ABAzwRABLqaK1IrTGiWcdsKR5BkD8XCb9r+wtRXMJy1Ndcr9YRx8tO+UEZrJMO5KbleVDtBM/sID12D1qALcq0TESAkpuGT8wlQcQx9/lEiI0hlRXMXN6wpa1qFxRylQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4ctBcwv2v4GUO9tt87JI/X34jXohQx/qchCuAiLS4g=;
 b=MEn1IN7TPqxPplBMDp1ZfaFfVLWrtLBlXr7PnDWutwd4P1UdDp6ox22YwkR75hDbLtOaDR6Q1nrg18EkJm3EQXrTKv5Jl9r2QtUQzUcOtW0V6zhlpDuxj6JGwp6IyrD4moADyII7jQ98N6CxsD+3TYhHyCGpQI05CXsdzuflaIArV86ytO+UgXHwnxxBXZMifezC1V3bhDr+cR/BriXwZU1TzWf1OzWA0+raafxEcR0erAoZEd+y+BBAftoauSidY6SmnJ3ZOBX7z8SWWng5zsZEUZ9FmwxM4fEdYPPP9QP3C1Pn3FiIrsIZCOaHxu7lIsRjgI984JkCkA2LAuIuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4ctBcwv2v4GUO9tt87JI/X34jXohQx/qchCuAiLS4g=;
 b=j4n1hf6M7aCmhf7iiRG5CQIBj42gKRlhD3nERfwCnsAZRR2Y+Ovi2QkzzLRwvY0ASBP/kMJ8IL6U8UHtXFOQCg44SgCyPrXPmxxA/9gPyv0qlAyiq0gP7FJU1sW4NhQxY7ZQtvi0w+t9L6Bd7JJgRJIskd+/Ev3nVTD+JEj2URw=
Received: from BN6PR17CA0028.namprd17.prod.outlook.com (2603:10b6:405:75::17)
 by SJ2PR12MB7919.namprd12.prod.outlook.com (2603:10b6:a03:4cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Wed, 28 Feb
 2024 07:51:29 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::d1) by BN6PR17CA0028.outlook.office365.com
 (2603:10b6:405:75::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Wed, 28 Feb 2024 07:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 07:51:29 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 01:51:27 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>
Subject: [PATCH hid-next] HID: amd_sfh: Fix build error without x86 kconfig
Date: Wed, 28 Feb 2024 13:21:04 +0530
Message-ID: <20240228075104.3495081-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SJ2PR12MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b4271c-2c73-4561-66a8-08dc383212ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+C8+C6iYW2fKqRQAEkZ4/rtynDWH08oPy/h3WxphazmqeGUwDBVEkNa5z0mzcVVrUPWapd5Fh1dcsZ1KK59luEqAMSnRdSrBlmq069KdXksiQ9m+BNRRa/at2DpYMaKz/OZi6rvB/B0b2G5VH3+kj/c0GXyfgHbuq1/NJM51GHQ3XxLYxZxnnnzNpkIflS0sJeCKoG69LBKQoBMA13iKSNfZYh/qmSH53JavgEL0vR+BeyiC0ZeUyxPdWxgtkEULntpv5HQewhCXE+rhRbq4ElGlwyBCddCrOnNVxH/dZXCItu3PF7s9MP6v3SkAqPvbnyvExD+metWlh91UTfBpR6nHag5xnN92Xe+ZLMtPfxwFuImNNmPrCa+iYq3/zuZ9W/Qy35C+TwlQCwXHg7+bkBnqvh9puJCMHqvB6al+jQuRUf73EKZ2N4jgj3ZUJSoSP06MmFhzBoAiUsT55HYILukZO8Ssw6iWrFbctTnaoCNbiqrr2tcLkjlOj6lKGcNWVlGNUSGPNSuAuELbWEneLxqB/eiRBg3mf9s5y+oMPuaWBLsvLqTm4cRAKL6/oSB4G4c0f7A9JTK3xmAXd24b3RLTmtlVYGtZZCrInDHx6nKci2TMZ8xrlkns8VRyvseXotTA6qJlyXuHOaOlqT3aVhDTo2C0Y2vJeK+sF8MP8ut4UMrzZuXcjG2NslCwnc0qIyn/CWAjU0orVgH7ltbfYac7BjOxLZgG0uhUMvU6hBhyBiJHn6lhN8M1tAqDDne
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 07:51:29.2198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b4271c-2c73-4561-66a8-08dc383212ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7919

This patch is to fix below build error while using the kconfig without
x86.

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
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 9e97c26c4482..c815f2f54321 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -410,8 +410,10 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
 	if (privdata->sfh1_1_ops) {
+#ifdef CONFIG_X86
 		if (boot_cpu_data.x86 >= 0x1A)
 			privdata->rver = 1;
+#endif
 
 		rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh1_1_init_work);
 		if (rc)
-- 
2.25.1


