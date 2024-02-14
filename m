Return-Path: <linux-input+bounces-1900-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 567E5854BB4
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 15:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0713F281BFF
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 14:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8DA5A4E1;
	Wed, 14 Feb 2024 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dmkpiTm8"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17A5A4ED
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921723; cv=fail; b=leEk3Hg7FUt4bE8VYUXI4rCgj4i4YsJaCRDbWq8saKkwW0C8tj95Gcejf5ov8fCS+i9tE7wD+gkXJdto1epii8ptHnz6bbh8juTqD4Ve+AeIampXWxNez1M2kwmlKCN7YBac5jSdVonBJVtEUh2fJLdaUA7JGX4eJiQuYjJMUtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921723; c=relaxed/simple;
	bh=YQV6Yv2phGzRAn/JtbD/URm2UYauSTZDHjD9jH9+1ic=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fE2USwCNHm1A0uVpiDc/mBetnYmGNsgHWRl2aCmzI6ji+BpxeOdbavaQMqgPQg5wP/kVelpfDl4RRIz6X+ipuwhjX0VbmRtWyRobj9ARqw2jtjwqhpbqsNEo3uhja0VlpGl4SUXfVRvCYjG+04VLDqYyYS80raEZRjO7WrlQGlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dmkpiTm8; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ+cCSr8Ey7dujC7et+F9Yd+ulpmm6p7AyuL9FVu7uS/GZQXTRxYkHNzw+LA1DIda1PibVVO8r7oSLn19gN7+wsAyJ0gXaaCgMJ9LWurZUFhuNn8+cbY7ASEfHO9rGxwD4n+w8Qcxl4UTDCY27xYvkWZEGekJWAu6cdOjyzXKDb2TtMqZ6ki7Pnc1DiMs2NHj0SwG2t8FMI19VTnDv+o+Sc8i+ouDYRLXx1XV5KTuHRGt4KZcuzrnAlAkD+HOvorzkJW2SeqAevRN4H5EJNDYdROFXBX7cI8T9Ngvm4zxnd84qZ7rVcV09IPJSSXIYrS/invV4Er3tckGd00qhF8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXDYtYS91o/7uYIGMzD6TUfl27FF/VeojLZWvtoqhBU=;
 b=ACrSTgK+PsF36UGHAkuiL3X4BhGG3Fz0hrcACkwjP9wfn4LSOWVVuhZb36tjM7W9kT09Q9Ou5nXMUpvGB0M2DQDBaZbQQgww6tSlbFIfZu3JwMrWDTiBZ32Czz9gq//3e98FC5LF8N3AQPA7iSCGJDGI6yu4QymiE8vUpKxdAz+vpBs6v2b89IJ6Efn57P/2k4Wzv+R0LcBGYL2hMNimnhvdCp43nK1S7Pa/UVnFXebmuQS0OEyYFE6X7KcsNe2qRHskZeez/oniClz5W/vSGEGzNOSyLWgu7OAxr0KzZrhEeRILLVP4LSFXQG065N1+7lkmA8MULdyDWRPL1NVkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXDYtYS91o/7uYIGMzD6TUfl27FF/VeojLZWvtoqhBU=;
 b=dmkpiTm8Wf0ly/emlFCLhiW96eF96BpxI2W9XLIR/MIkNsxB8FoI6Zznuz1kHSgVhWWsQKkuMxM1+Qd64lN3RLVg6LjxsnXIgHRWGaXtQCrm8A75obpT4VETjNGEXs2mxX1QfBZ3LZ+XwXOA3n8vhUJ1Y6jJBAaCEVCH0UAhbkM=
Received: from BL0PR02CA0042.namprd02.prod.outlook.com (2603:10b6:207:3d::19)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 14:42:00 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::f9) by BL0PR02CA0042.outlook.office365.com
 (2603:10b6:207:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Wed, 14 Feb 2024 14:42:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 14:41:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 08:41:57 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <akshata.mukundshetty@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/5] Fixes and updates to amd-sfh 
Date: Wed, 14 Feb 2024 20:11:39 +0530
Message-ID: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 9314beb8-e00c-4cd5-9d4d-08dc2d6b19f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZUI7j/j0aGfvxq7ePvKW2dd+6nqC+hhUdbY2E+lSXczp1AgW+Nm2c5iN4t8qhZBtGchCzMfT6XlvZdr0xNDxFYO6IAH9qsd4l4RBJYI1mjWLE4oqbZxYFOUlFAVXt9Z0yr3AaLt4wTFeDu/6Qwz36UsrGJdmkiKFRwemCbilEioY8jNk98WYjTfL3d1+tvnGkaMwPBRodoopb14fWFnW7AIoPWkEAQkTUNuNU5fS21PKwIMZ3MTScDwXSdCCIggsskQKtby5DnTbbT7MTqlqRmAYIEkEapeCXHtuHOLJguBBvE2swqYbP3WhkB/9O0izNQBUBnC8hjBCwdWCNUUww2FzQCs4ICJAUdDuAZ10h7kNKclVJsLSdCst5iIp+83VEH6EVC1EgLzwgJ9IGvEXXOFB/o4l9X+Sojkp2dtQXa2YksE+5sHh3QgJ0ffZ828UmEd8iHkzY8AtaAHxmEYjtBFxJ4RrbIl+OsgV6eX1GSnfabfxwVIZWfXsBi24PmLoUpOaKvEDUQ4mk6imtkALeSdFnIVmjHF+tE6B5U3jsjllRYi0PY/XRgq8RguEb1x94OHIPUbTvd85iBgeF5ccjU0dpitc8QHdfuFh/a2eq0A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(86362001)(8676002)(8936002)(5660300002)(70586007)(70206006)(4744005)(4326008)(478600001)(7696005)(15650500001)(2906002)(336012)(81166007)(426003)(83380400001)(356005)(82740400003)(1076003)(4743002)(26005)(16526019)(2616005)(41300700001)(36756003)(316002)(6666004)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 14:41:59.9732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9314beb8-e00c-4cd5-9d4d-08dc2d6b19f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665

This patch series include changes for:
- Increase sensor command timeout.
- Update HPD sensor structure elements.
- Avoid disabling the interrupt.
- Improve boot time.
- Extend MP2 register access.

Basavaraj Natikar (5):
  HID: amd_sfh: Increase sensor command timeout
  HID: amd_sfh: Update HPD sensor structure elements
  HID: amd_sfh: Avoid disabling the interrupt
  HID: amd_sfh: Improve boot time when SFH is available
  HID: amd_sfh: Extend MP2 register access to SFH

 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  16 +++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 118 ++++++++++++++----
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |   6 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |   2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |   4 +-
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  10 +-
 6 files changed, 124 insertions(+), 32 deletions(-)

-- 
2.25.1


