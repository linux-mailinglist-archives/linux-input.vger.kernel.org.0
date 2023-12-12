Return-Path: <linux-input+bounces-695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B8180E0FB
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFDA11F21A1A
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2806B800;
	Tue, 12 Dec 2023 01:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EMDfR6xq"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3D6CF;
	Mon, 11 Dec 2023 17:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVXyoQ2Lh6y4rG3GIPgupFSsS5HwZJXrwt89aJRnF02reGqNJMaQmo3l/aRB+U8yPloEU+AEpbePgsEfytd0y3NSGIW7kr1EJlFgvO8SRS8CCsYgm4FNMcAc0NWfo4ei9KiO7j3CEKdIyoQPy5StDPo7JFm8i3dF6PSkuQgpNftGF/7BdSQe2PpSJDKor4PVXk/B3EHTRnaPZsex50uKe4/gQO3zsxuP6jeiA88mW4ah1lZu9zt1Okmy/lst122ryawPh9KnPtvBbzsL/Ifgx0guSQcHtZwXDo7QFrmpwcOgyxPO9yDveBZvaCsDeY2+MtLQVJxbPiqoicDKUIS/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEEAIoIe9i27IQrglKnz1HZteAoCJMWX2asdd4j7IAU=;
 b=RZk7P2ZPRzUNwxVuQYXsmVnxs6/dZy8D7+AQjTAAa1iAbC05r8tNW5louxpm/fYiNUa6NpjWPLmKzX99u7l44y5WgqL+TVmTklo6tJny4r3LaHgfEM6UvjVcusa5KhfhmPr4iBJQaig7cz8cRPGCwke2B0hzEiZa54F52PqJqPBp9zsGj/tWCucXNCdFDuITwf1ul7Q7pD2gJWdfcktjsuf4pvM+WjzE4A9gA75SxlUEPDVaUSM/CD5gXIIqcy7icUSIMPuNAendYevt6tJYYshC01m5Dyy4vR1OQbK6MnvpswTrK32iOyhaZP1tOxyYAGZh6VjEBWUt0+8OjU+zrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEEAIoIe9i27IQrglKnz1HZteAoCJMWX2asdd4j7IAU=;
 b=EMDfR6xq2hxr1Q2VtlQv2fKk0EwBehzBzWMTKRxI0LP8V20vXfYGpv2AYg6750P8J3xUqZIC4w26WfROvfV96zTVivle6yWf3sGhQcNIAau4Q4kAYm++XrEYrLylRWXEYlo8egVSVml1U3H/2IaLVOs/BYsW9lpvjQZ/BiCp+5s=
Received: from CY8PR10CA0042.namprd10.prod.outlook.com (2603:10b6:930:4b::15)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 01:47:42 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:4b:cafe::22) by CY8PR10CA0042.outlook.office365.com
 (2603:10b6:930:4b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:47:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:47:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:47:38 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 00/12] Introduce PMF Smart PC Solution Builder Feature
Date: Tue, 12 Dec 2023 07:16:53 +0530
Message-ID: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d00761-a65d-4421-0c5a-08dbfab45480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	so9tGy2SbQt5kvp5Cow0fFmtTailjd2a1UC3DhYkBjHfhRNoJiraXxiUps2edCCGAyRezUPZEXLE9L7o3llaGRXHBOcFWj0npHZXymFFq2mVz1NF+NoTSyyOcT9YYOL5fdUYgFcFXLyszIO+OqdwKoR0VdlgZxaXa/utDuIHpLz+ChIDlCxVNCA4CvnrbRHlkMfk9EwtpKjhqnB66c2PRdq++yZ3PCNt3kthBMCllODtq4gQ3YQfHkh3h3GNEwGRTJmLxElv0NyKbAqIHTnFVAe8VioClS/kkEJJwsgj6TiDcztkuWWa2DhPXg9ec7eYRADER6KgzsPhbQBows75iA2XpSu36ZSmf3zeLKk5+jAs4vx+byKxJr+QAagn4nZbimBQmRDpYSUmPpYfjMjpZRCx+ZelDMmO6AiwKvA4re9bDlT1smVvUkXczFMDVsI8IPgAlHn2ehi7WeoB3P3mex79hHNUIOs4w8zTC1i7uGrnAzYcFRbr6lNvmfTtw5Zy6XLLJTGYRDXcSrgT+W9jXHcIGcuXb8S/zeAn8/uy+n8Nv5Pn9rHxQDd3iqcGeK9+0gNDTYVVg2aKJGgIN8g51Dvfq4rPFRjuHuEuQPCqkxy+q2qOx94+fqtYtqqwJ+ikBTRxeOuZRsGXf/aYOOozPd0cTRPs3rRLIJqja92kN2fhZ2aL5767DYAp0iVPXBRqUGl+OJ951UMwwAIunZxCDP/RpNuMSyIHMvMtSLS9Ui4zfFcVL8UhRvD1H03wDmMMt62whyjKGpm5eRU9K8mRfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(1800799012)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(41300700001)(36860700001)(16526019)(1076003)(426003)(336012)(26005)(83380400001)(2616005)(47076005)(82740400003)(86362001)(36756003)(81166007)(356005)(5660300002)(316002)(8936002)(4326008)(8676002)(2906002)(6666004)(7696005)(54906003)(110136005)(70206006)(70586007)(478600001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:47:42.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d00761-a65d-4421-0c5a-08dbfab45480
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966

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

v6->v7:
---------
 - handle buffer free during suspend/resume
 - Move Smart PC checks within Smart PC init function
 - realloc a updated buffer size during the side load.
 - Drop patches from 13/15 to 15/15 of V6 series

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

 Documentation/admin-guide/index.rst   |   1 +
 Documentation/admin-guide/pmf.rst     |  24 ++
 drivers/platform/x86/amd/pmf/Kconfig  |   1 +
 drivers/platform/x86/amd/pmf/Makefile |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c   |  37 ++
 drivers/platform/x86/amd/pmf/core.c   |  52 ++-
 drivers/platform/x86/amd/pmf/pmf.h    | 203 +++++++++++
 drivers/platform/x86/amd/pmf/spc.c    | 158 +++++++++
 drivers/platform/x86/amd/pmf/sps.c    |   5 +-
 drivers/platform/x86/amd/pmf/tee-if.c | 469 ++++++++++++++++++++++++++
 10 files changed, 936 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c

-- 
2.25.1


