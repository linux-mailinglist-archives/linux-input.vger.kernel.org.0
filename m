Return-Path: <linux-input+bounces-437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30D803056
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D468280D39
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21B317751;
	Mon,  4 Dec 2023 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UEpLksRX"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1CEAC;
	Mon,  4 Dec 2023 02:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwetU3YmGBHk6o2vst1IQ3JNWyrN501NDXhcGqwk6h0BtC8fq+mm4Niu4/+18gDDlfZDcno0rlvoFVfghgEIF/uquhgL47oFLvSF0rblq2oSwhrb535VMPDBi4l0sYdcyRZRCjrSRb4iBd7jcBCqL2dygTFPiC7Ustarm6bkFjBuWSWrM+LG3yQ0w5RiU2YJU01vmKW5W92vVwS3Ge8qHeC0PfPrJkN6ZmgT1eEjQrNhA934QUvTHmzYUBw9J5IWg/YwDEDjRkEXOJmPpOIdor6jrcRYRANwf7aQvCh0sGRqd568vNhA6fICuTcACQfwhAu6FToZ0gA2lADDe2lMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1X3XhJSnnoy3Q6iKn1K7pBd8RnKmqsLT3Y6yVsdoZw=;
 b=RXJm3mamxmRdHDscAzyZlm3HyeKkyoDXUZjkGQfhHMLPYlnT2ZmdGsbYf8x2DFCkqFV9zR6mEGp1kapzManEK178NSQI4fffhmI+EBHPI6KhhSOXlMi3Idq8ijnqM4gxlxv+uY6/N5kzRIX2HsHrD+zS6n4vnPBoVEyy3WF4skZPoQGlCfZJdLPG0N1WpR/dvYjCRAVmP+vYt0SJsNqJjujyvsEwvYKe7qlz3MWb2L9/0+D0DvwplB/9ylD5y43gE/6HP6M341/yqw6nFI0JtZVY12RwxLGI4yuncEUvs7A2tY98bwMpRRZi2Jcg7gjXBB/hYtMhPL0XPc0SLUbFjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1X3XhJSnnoy3Q6iKn1K7pBd8RnKmqsLT3Y6yVsdoZw=;
 b=UEpLksRXTVWCfUJGYBRVw8PS4tH7yKwNqlJ6KKozwfib23Lye8WRw0vxEi3asHFMXkgcsRnltaj0Z3eIxzDfNtIU7IVbzcCGKz2F+DDGMbAxB3+D0i9OCwfal3KMmNfq1l42uW/ysXjNV0VRhuucIF1xc1gT1bGsjBZIHIW8I80=
Received: from MW4PR03CA0332.namprd03.prod.outlook.com (2603:10b6:303:dc::7)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:35:48 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::32) by MW4PR03CA0332.outlook.office365.com
 (2603:10b6:303:dc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:35:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:35:44 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 00/15] Introduce PMF Smart PC Solution Builder Feature
Date: Mon, 4 Dec 2023 15:45:33 +0530
Message-ID: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SJ0PR12MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 208ef248-f873-4e78-d75c-08dbf4b4c7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6zyoVK83Rcfv9EZjdrHm8Q7DH9WKOSAxCCucuduTU+oDLUIT/pAZsfn/QlsaCjNlSndve0qvDpaMVFz7jq8QYvGTzUiUuNYkQ+zdwnsJyh7VksMFv4nhda6nGHBcVkbZxWZ35nRG+kVa5OKljs8uM0WX3BB0mlme0FwWo8uC3l1RaD1w21Llbx5TF2JJhWn90qmAFzDlQ3GVVVI1UXLqJPuJ0gV6k05IXWQPO2+rdaS0uGcvISQkKRVirKdYMYSWbbHPRtq4cATcVTZrkg1FPM6tyuKwiNpabQ1VgjqV0Nv2FG5nHlfKuhovoq9ahW4QziuquTjHprDb3z9m5WquvVkaDq4tyk6khspjVLgW48bAeEtRavdH73QkNuNCa03QHr0FfxKi/PjRm6PE5pY00DqI/OOBMDP4M6OkTLTCEJqM6uoiIykKuOS8C/JGgCG8cWj3OIe2kJEN12U5pORi/KxQxZl7lSr7auh3c0yU4BpmGPn9ECOn05Rr/fkhowGwAs67lC+kDGxp1mMERcwgghhue9HyJmbHqGVNwNCcrtLi2ch/BGMtg9IYIEJDU6P49JJq4g9gL/S9XbFJXlJrq1cDl4n7s8MSGmcy2R2K9ViThiIc61CrconIqjwMPOuiYVOYTiyZ1k3qHmpzeWaMfM8V97lEiCbQeKxiNqELUQ/3dUHnNsP6zNZlwr+x6UZQbScNifIrC/wWH+t50MBVPfbdci1NDlR/NlnRiLe5U3lSpIfdwFqBPuAFkNUb9R49QtQ8EKbQ9Q6yJXBQeE25+w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(40470700004)(46966006)(36840700001)(1076003)(2616005)(4326008)(8936002)(8676002)(7696005)(47076005)(40480700001)(356005)(81166007)(83380400001)(36860700001)(336012)(82740400003)(426003)(16526019)(26005)(478600001)(40460700003)(6666004)(54906003)(70206006)(70586007)(110136005)(316002)(2906002)(41300700001)(36756003)(86362001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:35:48.6604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208ef248-f873-4e78-d75c-08dbf4b4c7e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733

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

v5->v6:
---------
 - Add Ilpo's and Mario's Reviewed-by tags
 - Drop 13/17 and 14/17 patches from this series which are GPU centric
 - Drop separate checks for battery handling.
 - Handle SFH failure cases

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

Shyam Sundar S K (12):
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

 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/pmf.rst             |  24 +
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |   6 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  28 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  20 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  52 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |   2 +
 drivers/platform/x86/amd/pmf/Kconfig          |   2 +
 drivers/platform/x86/amd/pmf/Makefile         |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c           |  37 ++
 drivers/platform/x86/amd/pmf/core.c           |  63 ++-
 drivers/platform/x86/amd/pmf/pmf.h            | 203 ++++++++
 drivers/platform/x86/amd/pmf/spc.c            | 187 ++++++++
 drivers/platform/x86/amd/pmf/sps.c            |   5 +-
 drivers/platform/x86/amd/pmf/tee-if.c         | 452 ++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  50 ++
 16 files changed, 1105 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1


