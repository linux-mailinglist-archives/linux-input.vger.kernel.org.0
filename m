Return-Path: <linux-input+bounces-8627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF6F9F4F2A
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 16:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9955616D5DF
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 15:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919391F4E5A;
	Tue, 17 Dec 2024 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HPDhySy2"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295E1F1319;
	Tue, 17 Dec 2024 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448625; cv=fail; b=GxHIodlDjugi8+jlFS00I/gSnOk9DrHdg2k4q9FiDwCFdK0GuJ6sEKrVIXhy6yYrMN4LE6cWtpzO5gEtubabXtfdJaSS2eSeqMrJHJy7P5SPq9/f4ndPtTD6B6MJ2gsyj9QNeWc7m3Lmvq9JvtqtF2S8ZiWayK9rTbKVaHQewiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448625; c=relaxed/simple;
	bh=Z6Gn1vGiEaL6zRyaiQdZ8+eXDQQvB+TJOwEPWb/q+eA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iIfj4MpR9RnskMNw7G8U6yjS4j+XBqh3N5KM4q92jet4QVzcxad+5hbnGHavYT6KME7YU5Puev33mdmkWtupfzxBKlvTMhpYcuBqK0EFSAFVCED1W9CqbqKEas7Cj/Sm8pLxHo+6zFjVnfZB4/1F3McnlRQrxgWA1A4bbY15zi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HPDhySy2; arc=fail smtp.client-ip=40.107.93.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obLDvwQTVDlpdsfmkkzVFEXU8jala4aKTmHhSqa8vcSrqDLZt/V3LA6PZ0YW3xL2i3omBzrqshESnKfsTCiHis4VHLkwI9bd1ENKY0r7ROcEQiOyAlxfYX/mSspb9+XC93sKrRlyNZDgjguJSKHlJ0o/RoluJQZi1HELN1K6h59XNbsN5FsQvgBRHnNK266W+okfVHy/AzuiI6eySE4car1p3jkrD0MYYBmM3A97Lkx7FmVcEZR+HJWeDr1B31y2SGlG+6w+EveosD8/BV9/4W3QipsSEPrvgDvhKyduTw8dFXaU8tWs+8ilibrnRUkTK62Oe9jTxZ+y2hOZYB4c7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSDveXICi1E55pMi3uynPhjFxcbVzv5UaBLOGMn8cqM=;
 b=Ct1r5XRxLYebYwEQmpT/Ok79oGu8osaJdr5go6ZjCmGswoZnr9PM1WSsTMj3WgvA5T0Gm+XWltoGwdqyZRQFyBHD/wmThhKWftlyPIMYU8wZuh7zTLR95qQayZOSIjI0DNiMQD6I7cCBjKG1hjJwMtDrbfO8BWAQ2B6Cz1LbLSH2VzOP7xGOTPGXZizUCCIfYB2HG2HZ7Vu8KrP1kYkFBplSrGM85kAk5yMGCckIQopEinKUKZHJkcz03eIZFpd/lDzjbzqBN58XIa9+QRVK8015E4yLGEWOA93AZJIaCzJYkL/uB8TEY18HErStjcoVPNPMc0X0RffsWb9XOE6jSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSDveXICi1E55pMi3uynPhjFxcbVzv5UaBLOGMn8cqM=;
 b=HPDhySy2gls5sUUWISZt7x7zty3u6v9q8FTFh8ZMm1v+HPkdWX+S4pcZCJqOPzKb7KM8bFMtLyXHyIZjSVmJ5A5djrNv9IOucHMOoiipClr9+dJtp4ByBA2K4IJEZB9fNGqdL83wtEQsk19pGXovRy4GV7pMONfFkcK7P8A99QU=
Received: from MW2PR2101CA0003.namprd21.prod.outlook.com (2603:10b6:302:1::16)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 15:17:00 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::16) by MW2PR2101CA0003.outlook.office365.com
 (2603:10b6:302:1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.5 via Frontend Transport; Tue,
 17 Dec 2024 15:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 15:16:59 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Dec
 2024 09:16:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>, Patil Rajesh Reddy <patreddy@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/2] Add new capabilities to PMF Smart PC
Date: Tue, 17 Dec 2024 20:46:25 +0530
Message-ID: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 537fb321-006b-48b4-1267-08dd1eadda3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hGxY8uSXVXzwmAW7SN2v8q5AVhtatG72XTyw8XkbTzbbGQS0G5iLPkpvX8Al?=
 =?us-ascii?Q?PbIxDNCsEHU2IQ7+ZMq3xD0ANiYKzzxgE4LIaeKMNH+xGvCKbhE+fY/I4IhQ?=
 =?us-ascii?Q?b1KBDLPyp4IHSl9i0VkA3N4/n0rlH3r8XcHUondKXPuzkfAHkVR4czqDS53E?=
 =?us-ascii?Q?kshzyrN7cszVXd8TqbJKflqdygeCYSkqP5kgHP4pWhlGZWkh8lm0a71tlPi1?=
 =?us-ascii?Q?OoMgGq2OvKXWcVqI6QjzyLqEI+NfjsbWmyLVZEaqtUUlXQDM6w9pM9ux4rT+?=
 =?us-ascii?Q?Hb4GIygh35OnZ5/grcWrRxw3Mp9GGZ0SSSbTRj/kWZimuH5WT3D45d25hZmC?=
 =?us-ascii?Q?unhBqwqfiX9MEyFxBEv+JOzEQj3GbVnw9uHkcMN5500Qr9kupOUgoN4PcXuR?=
 =?us-ascii?Q?HJYO+UUu1gSkg/jViFE2XnmPh0V/Kxm8BPdLnBu7k0Ui9VHv7/XspWK0pWtb?=
 =?us-ascii?Q?hPXF5NExO0i8NxM1r4XcL7/frsb8TyKsfvEif9527LmxkaQqilU7CQO2WaWO?=
 =?us-ascii?Q?cVqJE+4Kt2qSqONGtQgqPKTtdaZJWtA0TrCpmM0VtO7EyVnk2rkt1LoqOZ7d?=
 =?us-ascii?Q?ytzvOlhSoGXTWH2vWmCAk4ABCG0yxWNRQEbdRSEj51pJFCjYptAa2D4rWV4T?=
 =?us-ascii?Q?dYsd3VUXg+AG++/voaNJKSLiLuMTpLMV6y6IpOjXbf5Hqmq5HhA4Fvmj8wRd?=
 =?us-ascii?Q?rfTG4GNYFY4FIhqDLUB0u9Qh5wOXDsnZ8487Kekp88yeaXE2dyRowRhghxwe?=
 =?us-ascii?Q?7i0icNV7VRkJ9Hy+QPOzy08/2pbUQWDgOSkY0JaDlgPlkwRK6IVSpDtjSLjB?=
 =?us-ascii?Q?32peed3VWg+sNOJ+SK09UWow/bDYqqJK6w//rzbMvTIsXfDDLpOkseoMlVId?=
 =?us-ascii?Q?keEiiS/vUMcEjZvLZYUy+fdnUZQev/fFUUwgxlr5FlAHX6G/omMSQ5S1Oetg?=
 =?us-ascii?Q?jtvPdbX4q1iHKuwGzuEX1ygGPOCjlHMg8LYVyl4hhC09wnBZZn63jxYlu2M4?=
 =?us-ascii?Q?73jJqdvQ9Us2pqL8WHSgMOLwLg0U4+phXPPaVcbQQPkCpwMfp7vB/3TAMxpg?=
 =?us-ascii?Q?+uVmfA7WnJMQ42eksBIc/WdPqJcaOiMBBZLAA7JnRW2BWJkHNbclOxq6dO1n?=
 =?us-ascii?Q?LXSnrzzB0/j/lFVlRANRszeOJvGNwZC+UQP7DhBUG86TFM//tD23KTtHwFI4?=
 =?us-ascii?Q?Fim5lYXFjnr0vQL0mp/YNQwZSi1lJp/ofRioyv4sxf/2DyVLxClimpyVNJtn?=
 =?us-ascii?Q?dmEvAaBC+gTTMOWQtsSZBxZfvnfHE8g+nY3UYHjmJ8nMp4ucUomh8pZxoK01?=
 =?us-ascii?Q?7cZaUQ/r3fdREsnZ2wtgeOum07YF5xn5Wae9k2iJTdW7U5et5iZS6DwrTjt3?=
 =?us-ascii?Q?bj2PR0YXe9VATb2MXH9xnrlB9iFNkIskj+rUw4b3ric/whC/UmVeFqVuhy4p?=
 =?us-ascii?Q?uMI2gbEsVA+VaFIj+rGHzT6+dQ5uXAxFtX8UCIg8PrLzUAdAemgxZnl6Ka2Y?=
 =?us-ascii?Q?7ApZ65EbLZ8p9T4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:16:59.4461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 537fb321-006b-48b4-1267-08dd1eadda3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

This series introduces the following enhancements:

- Support for device operating states in the AMD SFH driver through the
SRA sensor.
- Functionality in the PMF driver to export SRA data from the SFH driver
to the PMF, allowing it to be used as input for the PMF-TA in evaluating
policy conditions that involve SRA sensor data.

v2:
-----
- Address cosmetic remarks from Mario
- Remove explicit assignment to enums in SFH.

Additional notes:

1) This series is based on Mainline(v6.13-rc3)
2) This series builds upon the recent commit to PMF found in
platform-drivers-x86/review-ilpo-next

6000bc1f5a81 ("platform/x86/amd/pmf: Enable Custom BIOS Inputs for PMF-TA")

Aside from these two points, there should be no issues when merging them.

Basavaraj Natikar (1):
  HID: amd_sfh: Add support to export device operating states

Shyam Sundar S K (1):
  platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver

 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 38 ++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 24 ++++++++-
 drivers/platform/x86/amd/pmf/pmf.h            | 18 ++++++-
 drivers/platform/x86/amd/pmf/spc.c            | 51 +++++++++++++++++++
 include/linux/amd-pmf-io.h                    | 15 ++++++
 7 files changed, 166 insertions(+), 3 deletions(-)

-- 
2.34.1


