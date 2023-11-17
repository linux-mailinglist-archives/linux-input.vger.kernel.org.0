Return-Path: <linux-input+bounces-92-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B87EED34
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A9A11F23816
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D46FBEE;
	Fri, 17 Nov 2023 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sWlRVJPr"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C89A131;
	Fri, 17 Nov 2023 00:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igBB0J/0hImDg6jP11cUMTZwYHYxMQ3jmG8ek0onl5U6NYIuZ7Aq3Cdol0LWxGIbLcP5kuBv6nLFHy2JoLEVgN4xwgf9smt0HYIQ9U3zaRJSh9hsXyQdSKuOBhrEPZmuiMNhyPv4ZWufZEK9I00GWnEFinVs1gY7zfvCRjb+onzpJIJrnJOcqWJs352iqRId0+hFGMJbCG15eWNlKlRGE8QsTkM/Lj1y0mwhqeuaNqe9luhg8Nv2MU9JPzL+fUEB4aaZGHzEOCFs+EhJtaDnO2JhCfJKV4WQ4BZZz86SMGxUcuWgqdriMvRGDQPgEdiZN63eI1XrYA3RAHef3UsrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAs805cqAVfVdeubEW2+S1Hr2MNxuMSIEnRFX59Z5Rs=;
 b=WCTM0ilJ1X10H+FY1fPAjYeQQpQzabYLT2wuSJICXsUahmZfIgTki2KEfdO6FMiaDnk8vmZRv+6/Wk8XvMpmOEygiKn/1RTzDb7xkaY1Q+/coBEwu8jVqHgBNa29oilIwxjk++LvtEvGVrLGOIV+IpajHBvAjlGOfI7aJVAnVaGOEpzX7hw5bCAU9y7PhhLnGH746cr3WEFNYizW8QT17psW5EWsqyP+/n++1OpCPdy8hrVRth/BBvGiAuDVOz5HS9bnTYwgeIcNYT0u4iMq+5rlktVtGDp4XEON353Ztkz555QTKOnKveBuznF1PAx2t1fe1hL6myzBb7WkZGGcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAs805cqAVfVdeubEW2+S1Hr2MNxuMSIEnRFX59Z5Rs=;
 b=sWlRVJPryG6YuxU1FKRmLza1PmObpAp22nfL+253WzDKZc9ceITi4Ye0SbET4bGdmFC7qjg8wne4D0hNwlhZpAhAYdNPlX2Gq73yOtbsv9o8bs9IYEOzO9KpWlvmG3nYUQ4VIuxenmPNnifbVYXS3lIkJbLgMIr9I4fRrCAWGfU=
Received: from SA1P222CA0189.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::15)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 08:10:09 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::70) by SA1P222CA0189.outlook.office365.com
 (2603:10b6:806:3c4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:10:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:09:43 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 00/17] Introduce PMF Smart PC Solution Builder Feature
Date: Fri, 17 Nov 2023 13:37:30 +0530
Message-ID: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5c2717-6999-4de8-1cb7-08dbe7449dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kCtKFLMMpI9WfMIn331urCVsVxififgMzG4Usnr0ABKBhhSmABMtJZG5fsFHdJ0LroSMTPM+IFgA7ZVz9sxX/lFLeV7Kb29jVa1uYKmysW6EAp7af3fIahoFszZSOw5l183lPVRDJenhvx54OllFyVPrrqJOEqc++wSLTagYLRGiHrRzpBCy7Q8yJ+apfmyaV75LZQdiqVkpGaQkLGgXMLM2vZnAVnnZnHT71dPV25b1KjH78NrBKmDCu6fUrHx5Lg9gkoQBLeENaoaOHZDUlbS3M87y8ThmQg8l5P+rJf6xr0iaAODzeYv83L33atdwGaYynoW9jOydGq8O15Zhra1M1XMlflrDHTY9mXQgWV2eVFp/qLGjky8Ayl7HQaTs4mN1Sw/fHDDcaRtXStQtXzhgXmmgLHIXArOfv0Lh8ifFqnCmBk/9AplMqs8hBVw5MqPNnXiyfNFBZZ0EaekRr9zvd4OKnCnaojwZLFF4p79LBvjh2OWULIctmJMkBlV0ziz01Hhcrwjh//ASZ0N9LjS+dUcgdtD7bO6o5/Ljj76h8nPrr/Jub3o6qsOh/UovrvyG6jJlTTSSOH1HSVL3+wivSfZ+OwQ46C+3IYSQ18Fat3Zta+hHyoI+8C25leXKYn+URAWWRVcz27H85e5CUX6RpNluJsUPdOtS0L2yCi6OM9xxKoaK7aZ3P7xF7h9JS4ihWkFCcpRWE2AE5+2X7sy981yFHjSpT1jgSAk86Dwe3w2sSGA2jHKWbiUM3jg6y3zaGFTfycuXGdjEWzJiZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(110136005)(54906003)(70206006)(70586007)(40460700003)(316002)(47076005)(83380400001)(336012)(1076003)(2616005)(16526019)(7696005)(36756003)(6666004)(426003)(478600001)(5660300002)(356005)(81166007)(40480700001)(26005)(82740400003)(41300700001)(2906002)(36860700001)(86362001)(8936002)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:10:09.4319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5c2717-6999-4de8-1cb7-08dbe7449dd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344

Smart PC Solutions Builder allows for OEM to define a large number of
custom system states to dynamically switch to. The system states are
referred to as policies, and multiple policies can be loaded onto the
system at any given time, however only one policy can be active at a
given time.

Policy is a combination of PMF input and output capabilities. The inputs
are the incoming information from the other kernel subsystems like LID
state, Sensor info, GPU info etc and the actions are the updating the 
power limits of SMU etc.

The policy binary is signed and encrypted by a special key from AMD. This
policy binary shall have the inputs and outputs which the OEMs can build
for the platform customization that can enhance the user experience and
system behavior.

This series adds the initial support for Smart PC solution to PMF driver.

Note that, on platforms where CnQF and Smart PC is advertised, Smart PC
shall have higher precedence and same applies for Auto Mode.

v4->v5:
---------
 - Remove PMF-GPU interface from amdgpu driver and add DRM/backlight
   changes within PMF
 - Add module_softdep for AMDGPU
 - remove error checks for debugfs_create_file()
 - Add "Reviewed-by:" tags
 - Add kerneldoc for kernel-wide headers
 - Add checks for acpi_backlight_native
 - Add early return for SFH path
 - other cosmetic changes
 
v3->v4:
---------
- Split v3 9/16 into 2 patches, that addresses using generic fn names
- Add softdep [Ilpo] instead of request_module()
- return proper ACPI status [Mario]
- Update comments in code [Mario]
- Remove missed double _ remarks
- handle battery status branches [Ilpo]
- Address KASAN problems 

v2->v3:
---------
- Remove pci_get_device() for getting gpu handle
- add .suspend handler for pmf driver
- remove unwanted type caste
- Align comments, spaces etc.
- add wrapper for print_hex_dump_debug()
- Remove lkp tags in commit-msg
- Add macros for magic numbers
- use right format specifiers for printing
- propagate error codes back to the caller
- remove unwanted comments


v1->v2:
---------
- Remove __func__ macros
- Remove manual function names inside prints
- Handle tee_shm_get_va() failure
- Remove double _
- Add meaningful prints
- pass amd_pmf_set_dram_addr() failure errors
- Add more information to commit messages
- use right format specifiers
- use devm_ioremap() instead of ioremap()
- address unsigned long vs u32 problems
- Fix lkp reported issues
- Add amd_pmf_remove_pb() to remove the debugfs files created(if any).
- Make amd_pmf_open_pb() as static.
- Add cooling device APIs for controlling amdgpu backlight
- handle amd_pmf_apply_policies() failures
- Split v1 14/15 into 2 patches further
- use linux/units.h for better handling
- add "depends on" AMD_SFH_HID for interaction with SFH
- other cosmetic remarks

Basavaraj Natikar (3):
  HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
  platform/x86/amd/pmf: Add PMF-AMDSFH interface for HPD
  platform/x86/amd/pmf: Add PMF-AMDSFH interface for ALS

Shyam Sundar S K (14):
  platform/x86/amd/pmf: Add PMF TEE interface
  platform/x86/amd/pmf: Add support for PMF-TA interaction
  platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
  platform/x86/amd/pmf: Add support for PMF Policy Binary
  platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
  platform/x86/amd/pmf: Add support to get inputs from other subsystems
  platform/x86/amd/pmf: Add support update p3t limit
  platform/x86/amd/pmf: Add support to update system state
  platform/x86/amd/pmf: Make source_as_str() as non-static
  platform/x86/amd/pmf: Add facility to dump TA inputs
  platform/x86/amd/pmf: Add capability to sideload of policy binary
  platform/x86/amd/pmf: dump policy binary data
  platform/x86/amd/pmf: Add PMF-AMDGPU get interface
  platform/x86/amd/pmf: Add PMF-AMDGPU set interface

 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/pmf.rst             |  24 +
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |   6 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  28 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  17 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  47 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |   2 +
 drivers/platform/x86/amd/pmf/Makefile         |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c           |  37 ++
 drivers/platform/x86/amd/pmf/core.c           |  64 +-
 drivers/platform/x86/amd/pmf/pmf.h            | 223 +++++++
 drivers/platform/x86/amd/pmf/spc.c            | 227 +++++++
 drivers/platform/x86/amd/pmf/sps.c            |   5 +-
 drivers/platform/x86/amd/pmf/tee-if.c         | 564 ++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  50 ++
 16 files changed, 1269 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1


