Return-Path: <linux-input+bounces-104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8297EED55
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94AED280E1D
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D2CFBEF;
	Fri, 17 Nov 2023 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o9mcDxOM"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA162B3;
	Fri, 17 Nov 2023 00:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1GReSqElBKbM7MKma8K51pP17UHWnZCDhIThVNallitmaZzp3cKdCTPIaJvMDHBYxn2HpbmFp3vj/15Mnvuve13Hk/Iwr/9vDdkMuwjtoBLpG9Wie66WrOKRSWyJ7VzZ9jnVk8iYe7HGPTShjKaQZk0xRTfvLzX7/MRp8HMC0z5b58l4EAvNaiRO9oBCv0qlXTR+d3TuXYcncfZmskgr0/OEdLzMhPN8NAqzY7E4shmOnOaoKKkTOAAFko7KoTUEX5hbFZVMjXe1Wkn+aIrX6MlSHnw1IaZ2lYv6OSwghTCsaqeFjE8gw0q35Qc1KtEWAMqITdYK5oUwr76ron54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bj1BubFRihkLxwu+R54eVOgVd//cWVTBk29UwVPcKY=;
 b=TgiyfBe9Xhjb2kDIY6tmvqhPhV2Eqerx2VXq9Vphmv1t70gQYMnePbPGDL4/dTuJEDSzgTrC7rOG6PSi5BF5+mIu2sBg87eVTZh2ItoC5SvenPuB4ot48h3A2wRRRemtSG0knVHRlCvK63EWTnL/MlcsXJ80sGZMr6bxrgIBv6cqc79WGfvoOfZkbljWhrQXvUa/HtMsSPFP9mlBtXFrDyZ8CFCFEz0wWrleoBWTBsNmU7rY9TReR9aM12q/7DzRGvOGePZwvNE11NsxK/4UOUgAkKAWoAzxMWNOfzrTrOYbOsPjtUjbHBN6cj7VLguqeTOTKPKnQfQO3SdxI+BmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bj1BubFRihkLxwu+R54eVOgVd//cWVTBk29UwVPcKY=;
 b=o9mcDxOMo7gh7s2QLj/f++1k9hLh5P+PaZh+KxSDPbVVbakCZoyTv4xuRw2FN9gmVJ3m84meNQ7Yw3i2lTCaQ0vMcE/YXzJ8R0adRbv+OplMkMkaAwpAlp0ib1cwinwlLIwfFsKdPlpowNGAFQrH/tZ/VP1ocgS6EC2fkjmC7/Q=
Received: from PH7PR13CA0007.namprd13.prod.outlook.com (2603:10b6:510:174::17)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 08:11:49 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::71) by PH7PR13CA0007.outlook.office365.com
 (2603:10b6:510:174::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:11:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:17 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 12/17] platform/x86/amd/pmf: dump policy binary data
Date: Fri, 17 Nov 2023 13:37:42 +0530
Message-ID: <20231117080747.3643990-13-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DM4PR12MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8b2543-d917-4541-b0cb-08dbe744d906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z+h8RK5BA6++TmyrJHcsteB1DZYrs+Hf2VOIbUZOGGCtiWHq1euzvyI3W0iAvabh5/oJgUVRcJcX6EclCZxx7FlwsBPCJ7QCV4qshZcierDbbVNRcCIh67ESjbVFDZFN6kKxDTbbnab3oEtOUEzr0EohWQY+/z1rZs+PH1/wEgycxWJ2sgk1Ulur554tzzd61XDami9lRW2tUyLQJsN09Uqur2GURjNrUpx+Gp0GHjP8lCtp9KzhulNMpvFI0Hes8BuhfIZHh+jXkLfPN/2/5C35ormy7Hw7V/INYIOrrtalEePqNZTH/P1yibckOtq/8F6K6gG/VkVg4rcKPxw9Ik+WhVh0C0KvGPaFuzWTGOVJCNppu65DE3RS6AzU6FT4WmRZE1PrsuPQ8jfxzaK7h7oE7s+XecvszO7yulE6SZ2ePIQ6rvU7wfD5Ak7fI1vIjqY4MyVeyLfk87+sCgcFhdadks1ImB8nBaEnA+YK4y1Ax1nLdMHXJyaPLulz4ZJTYZQRH7Sfu2pHgvJqD3HpygZpARiwC8B/Xf52pkEsEXZxrkiZ+SWSxaL+asHbO3H47dDIaC/QiWqFU6C0/aO0B6F/0UKtzNKmiL8t0FaLLHvbk426p5GMXBC32tK1lt2DUKCOKWC1dofm5dXYSDieOBnmkpTNzo5+ObPt9gW8s8oUh1dixuMdNHs6m4AoBVjUdDOqu48XGkeWjpmDYNjJz/yaSwOcJEcm76FEYe8wa+Kz3dWKFJ/mdWfsiai4AdrN5JwT75bP5+21ZVPphi4qfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(316002)(54906003)(36756003)(70206006)(70586007)(110136005)(1076003)(26005)(336012)(426003)(16526019)(2616005)(478600001)(7696005)(40460700003)(6666004)(86362001)(36860700001)(5660300002)(47076005)(82740400003)(356005)(81166007)(2906002)(40480700001)(41300700001)(8936002)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:48.7318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8b2543-d917-4541-b0cb-08dbe744d906
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913

Sometimes policy binary retrieved from the BIOS maybe incorrect that can
end up in failing to enable the Smart PC solution feature.

Use print_hex_dump_debug() to dump the policy binary in hex, so that we
debug the issues related to the binary even before sending that to TA.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index f73663c629fe..81b1bd356e83 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -276,6 +276,12 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 }
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev)
+{
+	print_hex_dump_debug("(pb):  ", DUMP_PREFIX_OFFSET, 16, 1, dev->policy_buf,
+			     dev->policy_sz, false);
+}
+
 static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 				   size_t length, loff_t *pos)
 {
@@ -290,6 +296,7 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
 		return -EFAULT;
 
+	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret)
 		return -EINVAL;
@@ -315,6 +322,7 @@ static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
 #else
 static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root) {}
 static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
+static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
 #endif
 
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
@@ -329,6 +337,7 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	amd_pmf_hex_dump_pb(dev);
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
-- 
2.25.1


