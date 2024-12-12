Return-Path: <linux-input+bounces-8514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B4A9EEB81
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D36166F66
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C300D21504F;
	Thu, 12 Dec 2024 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N6wacZTZ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACE1487CD;
	Thu, 12 Dec 2024 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016844; cv=fail; b=dxiktQktNu/f1FXUB719BE8HHHM+RJ03dwja5DH+YE8MBWmyOtzMSUFFclkZ29jkfURBdIMScfDgWIBo0eMUIAaLlfWx+mgcnvEXHgSfHV+2Cdxwo9BmPJw/qmX9lyK0hJdUXnyQAt8C6iZjs+EtfZ7cnGl+uZcqz/rja7K8ZNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016844; c=relaxed/simple;
	bh=KQhnfRSVSBncHfvvw5Km4RG2EMBw2CBbDMl4XgWL+LM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r5QY+JigXtvY3pxMpKEKUjRD3Nu40Ju76nczZp5zn03yP41c1FBKbw17iQnEADU5MrqG2MOehXZs1rLD/vPLt/lDGecXJUihmb38ZcAGqx/KRGlpDCk08061YknRBmQAQm+4yI7cnXN1rn0lTaZQqMrB6WjF+LZW/uRO11sJVu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N6wacZTZ; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fN5YA1ewZJj8sibP3lkRsAMvt1kHk6neJrSwimE+Uo2Ru739arWlKg5koTLG0lm8apphSnSxh+yOyntGIBs9CbBIh1yBXq0YnX++v36/sn1W8blf5s4hQ0iU+zzaqafYooaBoGBzhVNvjeBGB4kQ4EXEckwKYdHN7hHrcuYQqRO/2WKaRWaHmygaHP29Heq8Cxl6vl9YocQx5SQzv5h7dw8ZwP3KxpRNqO80rYh4yoMOkiuMcleP8LO/JwUSPHZ/E3k4CQEmWx5JCAPg6w08rLpaxl5Q/I7MT0jPuSIbpsp52deV9u2RflLen+Q9WoNG0SJgvDbg5fLMgMDyy2EEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=conp2llCC/5Ylv0bII52P/QOqvMp4AjH/hVlYQB3zjY=;
 b=t1taTmAqOSliim828sdp5xHkj6ZQBEWLkFCb/IVceY/l1YadflQBzPwh7GS4cEsoPRSkCiHxnbl8+u/hE3MRL6iA6aM5y56oA4jPiQQGIObDQ670VzmaA+ZSvTQpxBiSBXlbckIcSuE7XRzcndFpNFKFzxSZLxIY77LWuW/NEkY7WD/XTHVy0g2qA6mMQt3zuGP1MEePdIBku3xj1FweuBWnAyxO7B/vVYBq5jliCWeFxsaLcNyJNPF1CCiuYErOYIFivC1glZqkXz2L102BBAYPEQACFXQgWhVc6cyBIibewIWvc6bA/W31eLUKrQsTrCnBYHPbKFxaee9iowpPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=conp2llCC/5Ylv0bII52P/QOqvMp4AjH/hVlYQB3zjY=;
 b=N6wacZTZNbSPLmDet1mEZm08PpFYoNfzOKD8EF8SlxPPUiCxzYVEnj1b5lKHL/6MStXJFzWjJkeVcOG5jWEX6+WSdTRHvKY5TGF/esdkaMbweP4LuD3kHgMu7MmVv+bFkGEtoQ6nfMdIi8eb4r6kArFb9lbTo3vt66vTTtSyuhM=
Received: from SJ0PR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:332::33)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 15:20:38 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:332:cafe::b3) by SJ0PR05CA0088.outlook.office365.com
 (2603:10b6:a03:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 15:20:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 15:20:37 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 09:20:33 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>, Patil Rajesh Reddy <patreddy@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/2] Add new capabilities to PMF Smart PC
Date: Thu, 12 Dec 2024 20:49:49 +0530
Message-ID: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 19204dad-a309-4edf-fa6c-08dd1ac0883e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0pgBpP+d85ruyzeEUugRZzcNYUoTDxoonZNDwlUiMOIVOJCMFI7Yxx0HGOsk?=
 =?us-ascii?Q?iE9hwuYMj79oB47gS11GjIlPRRAgT4Uyi+nu/KObhsva4lYxY/Ns324S8H+K?=
 =?us-ascii?Q?jp4BRIhupDL6RvM4uJSOEY8CmL7GqR13IFmdOhpi2Z2Pi/G0VruuDhm4WMJz?=
 =?us-ascii?Q?bO42Cq1BB4GswJ3ZoWfrWjiNJywszrpkvw/9mtmKiFvLoul9Wm/fZgDZjcVZ?=
 =?us-ascii?Q?TerYf2zo+mmXR8p4lSRHehFLtQQ0YMFO9m5sspbXI7x6BwpIlRkTYxYKhDBK?=
 =?us-ascii?Q?HB0+DKpkd0MHjKrRqRep0iO3UPMbR9k5kk20Sp/O+/AQTAsbkyfxAMnwCstw?=
 =?us-ascii?Q?1XfVWm0Wn6wLzoed6zecpOKX9u+KdbXCPvM5OwkzVqsQoin7Qrm3cuUw+vzp?=
 =?us-ascii?Q?DC5pwwME5VGOQwhrHF0HzW+c02tRR4Lx2uA1+2hj/9grJYyknZHaE/+sa0Rl?=
 =?us-ascii?Q?hsJw004C0DZXBfDPz6baU2MV2i8vQg4ToDhqHUfjvoVCuG9oa05ZqglkNkFV?=
 =?us-ascii?Q?7KpTaq4b/w7mxtUgeul58YXdS0qpFcdEobzToJUtRO1mNcubU2/PlL2nGdVQ?=
 =?us-ascii?Q?RXctINRlxxMGKQs3y3Q2gYfwdaqElhy0bjImI6urP7BOSlHpkaSXJlv0Lmy1?=
 =?us-ascii?Q?3hjxwTQxTU7kTT3lUiioa2NIq7w5W05BdvNQ433eDZ2CgVOF1SvCUKCaHk9z?=
 =?us-ascii?Q?Ox9huBbSJ1Y4qvZQQo82UODehrTzs8gd+FxWKVajWtEo6lBU09qDaUfvmji+?=
 =?us-ascii?Q?hGSr8mcpl5GeKjBua9vFghQIdYr0TbsuGg0Vm+4hkvZPtBhU5QoOvr7uQhcT?=
 =?us-ascii?Q?Zkj8hSava+6bShtdjlQUaI+lLCZl+7l6wKUgLed7YXkrIlpClvXiIpUEXmZK?=
 =?us-ascii?Q?28/dPYr4CDe9nyZzZUMRXQ+Q9ghM5Va1CDHoMqxOC6wxvHLHDwEazNUk2Fv0?=
 =?us-ascii?Q?Q0IRxIeIwQFpY34U/+7/7psOXIzZHAhxpYoC52ufuk5OM/E712nIRF8H6CgF?=
 =?us-ascii?Q?kDvlKcnuyPUHFXKwax3TVMFqEHhl8m3J8VuPxuUW+8uP6w/scjQcynBxzW1S?=
 =?us-ascii?Q?xEyeE0ZCpG3IVY+v9GW0iHhJ8mtDYT8YHlV5GqEbeDJQjTtQD/j4M8v/lyhj?=
 =?us-ascii?Q?wt7lREL4uLVAh0qF0hNFVrYHhysPyI0Zh0e2xHCMcvIBJKHgF3IiQm6A33b2?=
 =?us-ascii?Q?P8NLtr/Oc3cTcvPmYklUMX1VSbHSuwMdDpC7JWh9kqMfVI7kNy3gKNhACyEp?=
 =?us-ascii?Q?XQgz5UannKmaPW5NNYNgsmzcC4rLhoTE2CehLJ4gusDKfgK6ctSQyTD6PO9a?=
 =?us-ascii?Q?cL7z4I8IfFnIKTn3LQaGptw9UKn12Q8qpfYUd+jZ/96U2cJ7jQoReItBXCf2?=
 =?us-ascii?Q?ypnOU64XMjLb7m8D/y4n8O6xF3UO2aKifGjqG+Fs7bZebCg3S5ZhroBLFqj+?=
 =?us-ascii?Q?Q81EWpIEd+fY8GTsUeAZr+fl8CXnKhb4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:20:37.6787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19204dad-a309-4edf-fa6c-08dd1ac0883e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108

This series introduces the following enhancements:

- Support for device operating states in the AMD SFH driver through the
SRA sensor.
- Functionality in the PMF driver to export SRA data from the SFH driver
to the PMF, allowing it to be used as input for the PMF-TA in evaluating
policy conditions that involve SRA sensor data.

Basavaraj Natikar (1):
  HID: amd_sfh: Add support to export device operating states

Shyam Sundar S K (1):
  platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver

 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 35 +++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 20 ++++++++
 drivers/platform/x86/amd/pmf/pmf.h            | 18 ++++++-
 drivers/platform/x86/amd/pmf/spc.c            | 51 +++++++++++++++++++
 include/linux/amd-pmf-io.h                    | 15 ++++++
 7 files changed, 161 insertions(+), 1 deletion(-)

-- 
2.34.1


