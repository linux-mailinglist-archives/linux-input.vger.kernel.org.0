Return-Path: <linux-input+bounces-449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6F80307C
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE784280F87
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBFB2231E;
	Mon,  4 Dec 2023 10:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NgD6CQo5"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E9EF3;
	Mon,  4 Dec 2023 02:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvJZx/xQbxF3cEexIIso5/OD7ss2RaADPq8Y1Zru6tI0Xg1pBGMqth0m+lDtVfDiXM6MS/x2iieWWWRENAo68h4h1FbrIwBPx/IkfDAAh8e0SXkbQbz+qCBICDSTjjVwQQwKzm30REN867dtDcTeiJjQGXNHRLCf8AtcGlTNdEuii7KHGkQKj4FLiQpfaRWtCpLjLWeEh/Mkq/PlcU+VyjycYWDIwVwj/XHWBIQdY0PKwoj9i/jVrcl4EY8stawmNLkLNj5RV/85qOsVIHahIzv1V8yPGmhZUT74wfkEE1FoOtXVSRYdWGnZQt0ngK8Mwr9Uja0/Ml0SsGg+WJZpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bj1BubFRihkLxwu+R54eVOgVd//cWVTBk29UwVPcKY=;
 b=XRUpjMvZugnYVUEuKdDaRLLtUNBeb0G7S5KkETcSmBwXtZ3v74HI6m2o09gvtKyp7h+RRTldRY+mGnxqig7goAVyyxOR7mE+wj7DVCuTXp0H7eRgd67Yjq8FuD1+yrQvaR9PL1wy/IEy6CMZVmP3hc+y8pUGyNTJ3mkFacxXu6f/05P4eFHPW9Ke6tsGen7W0+p1clWqs7uJ2Cv56BdmDKSScjqQeDHI4tWsp4xvC7IMWpgNxLjip2M8JR5bViT7a11Me0+3q2n1U6iW6DUIlfPuip3Q33paS+QFpb3ZFKdkNPpOGZwUzP5kzjQi0NdDEJJZ6KrndmGZ4toMqbGnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bj1BubFRihkLxwu+R54eVOgVd//cWVTBk29UwVPcKY=;
 b=NgD6CQo5JUifhYJwCrYhkAfGED6Qw+W/aI/6osKkk0DTXAyJjOyFvQ7gNvktYv/m8B0+TQKru2HEIYlbaRqJvgBpfg6OdWljrSUlfvY2atSd6d8XS99abdKQJPzKvPidaRYlqkgZ+7BFCHKu2PxynTrcfsC2GSJpI2f3+MqJV2M=
Received: from SJ0PR13CA0122.namprd13.prod.outlook.com (2603:10b6:a03:2c6::7)
 by SA1PR12MB6971.namprd12.prod.outlook.com (2603:10b6:806:24e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:36:45 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::7f) by SJ0PR13CA0122.outlook.office365.com
 (2603:10b6:a03:2c6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:40 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 12/15] platform/x86/amd/pmf: dump policy binary data
Date: Mon, 4 Dec 2023 15:45:45 +0530
Message-ID: <20231204101548.1458499-13-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SA1PR12MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: ee739c52-0c4b-40b7-b10c-08dbf4b4e923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G54783TJZKGWwZv1JqyVwNNFFe1VRmcRLivxS9jcvMpMWhUzbEdTNnNkPgtbq4kf1GN0tLgPKn6biNBjr/Vc4c65UuFN9vMqPo4d652Otkee51XsHqBP7dDMJgaNiRxK4h3B/aeBj7iLtiRKwBUlqISKqhCx9t5Eh1Hj3ihJK9n6JzEJ/BTawrPqfUCAyBmKCknlSKqGjq/e5Q58Z2ITG4rAxQ60XIFKD9xMJPu0gyyle06itl0aZuvGaZ877iojyYNv+/YmSCvqLMFPrln2MTatNNhxnONfWIltXiP/iwC7oFUChmOiBBlQkSeyMaT809gMERB/Rj141nmvFEmNclGUjZmCt5WSNlHUrT1woIjjs/EsA2VFtFpackZulbfZopSPOjUy9/2k/6EQNMa4WavPlMpFQQ5HRhn4tbA9YkgqeUMa3GKSwnrR7k9BZim71AYQ+kivhrVceZkQdLrKUgOEc2L9NDWRNDLUZoFud0zpbCduFLVOmyRQhWzUmPYwBiimYFFRoh1+XAmVaZTvvhfwc5lFrJoErvtIoYhf3a9YbtXA95o2R+ec/kvvE7okYmRTvC+IWfqZmClftbt6VP4/oKpUOhrnearVhWN+E3qm55Yfvn389mwffGf6W5sIGRIJUtiuM8kWB2HSRfsBcIb7XDMqXhDjKJb1exbVqGbwH/hHqF226EXM2XylecBB6Fwwrjaq3NXohDHaziKtkdeDZHkWS86Z78XQz7sOso4EfeLz6PEKvCwyKYU9b2/69VTw3+I39lZbGaFJSFwv+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(186009)(451199024)(1800799012)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(2616005)(336012)(1076003)(7696005)(81166007)(47076005)(356005)(70586007)(70206006)(54906003)(110136005)(316002)(36860700001)(82740400003)(16526019)(426003)(26005)(40480700001)(478600001)(8676002)(4326008)(8936002)(86362001)(5660300002)(2906002)(41300700001)(40460700003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:44.4215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee739c52-0c4b-40b7-b10c-08dbf4b4e923
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6971

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


