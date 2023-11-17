Return-Path: <linux-input+bounces-97-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9347EED49
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64945280D97
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A826FC19;
	Fri, 17 Nov 2023 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MCZ7ZaFg"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99067C4;
	Fri, 17 Nov 2023 00:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1yDjS16zraheRqHaSZZvWrsF4MO8Y/pCtxnRCKwgYPMXeYNliHStD2yXtCNat2qTkcB1Jsd4IErZNsxo5sW38xDeXJIhapwlgVB8N5aPwtOKtQg+TCnzRiwN/2VD2YvLNTwvzOEGwPouceScBR1PaobGSoIVTf+08yELt5MVn7oh5qdVPX1Hb5O47ure19/dfrL6Mfjiz4O0t58V8TinLsCT7NVov4iIK9zG0Zk8CWm2HQIGnO+QnBNBG/+FQozSqYnOJHiixR0ASR3q6/AED8mQ1eL6qaoryU3vqZvLZ/q1rfmJMtGiQ0zUAnEzRtyOQhwE7Go5kkOu48PGBsX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/YbupjGoS/lgXiknOa+geJjoTcviN3AVo7Z56beCcE=;
 b=ABXS2V6sFOLfnzSknhZ0TFOoVZhE52fYlh4FVdpdC7HTxIrG/lgjR+vcIpjax1TiQ+iGU+UqO3e/ZaBPIeaARJsyJ1+ClszdfruPl8vyq1npIjmoibIGIrs2+NtrGrxQ5+DR2mu64jWpAy+rYOPyWa4qvS0Q4ZAQND/fcJYsu+CCFbxtTDprz4BV5i1lI34yi8jIroIsUuG5Gw0cVxs8pvzVJQIvMJneU+Gh7ZUrdRk17uRQLE0O0c5x6gs1Tz07tuvx1/0xxZS1TkZn1PjGY1Fj0XRvh0AMBZckvxwChTXfffuwYWDR5Uqisg3NjhFA2mNApv/Cvw48OnxFzLAxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/YbupjGoS/lgXiknOa+geJjoTcviN3AVo7Z56beCcE=;
 b=MCZ7ZaFgpxO2H93DtgTaOXyMPmLDMHn8ndj+Fa6AVBQjJdk2qtxx7XRjuxdCSgMvx+A87IoC9rZPr8Tria5KBPk6TZcWlGBNaOsQ5ZWxMMfpsMbfK5JrWvIRESSi3bPINrzlvYLw7sVcdrbqZvROFPG5MjLIWS8bFmotFXnfen4=
Received: from BN0PR04CA0165.namprd04.prod.outlook.com (2603:10b6:408:eb::20)
 by PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 08:10:59 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::56) by BN0PR04CA0165.outlook.office365.com
 (2603:10b6:408:eb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:10:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 08:10:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:10:19 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 05/17] platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
Date: Fri, 17 Nov 2023 13:37:35 +0530
Message-ID: <20231117080747.3643990-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc60d09-83dd-4f60-c839-08dbe744bb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2rsvrdhjBJLBiJbo8u4m33580d+eECPSTLbQWLM97e2gl7r2heOukAEbJ3xFkPPasV0a1hw3RCir4Qahiieg8N+aHxjWAA/L+E99WO+2VI3TE+/tj/3ou7avveb9M7Sks6WCbZPyU4sR7PVdblXhG5ELUBNxKkggG4X0eze2MjI2omtkOjJaqZKJEggoX+hRRNLDu8ORr6gSLwo/cD6wrD1ZwVppyfkNNVgUeuHLPwpuKetRXgKC/hTTavl87ffQnpnRTvzwCaXhjXBv6cT2IlreOzYYLVvqOdzwDIKcS3jTEHpGw29fMaZZhkTZwVQ9+2gIhe2jpu+LCYETgjSnw7RbR+7KRO0SLJBCgkuZBoGWZejrec1CqC8v7SgDSPA1A4dmo5Ygf8B3jNfTvQA+puDgPIgpg04HWJSdL8qfZH9KQN/McZW9zJiJbNZ/zBNOZZfYMdVLwJJdes8mygrA4+AksiQx8h6rFKCYdB7S2yvReo8y1A70quN2JlDih8Z6fcuiApZB2XX9FecCFHTtoH9keID/aaHQknJ6o1nh8IkX/hiG5FyRUuztCdoEzGzL16Iw5V7bjG6xmzai8hs0OSnAZN6QntppZXWesL9qKhRQyiu55+10rE5gXCKUpkSRgh/cme1gXsviRIYotShgCmmep4u2DL1j29M+nI3V0D6mdKFWwNBGlcDv+hPc96QKJ21Am9kT6GUtqeTqPVhWDiYScHGp6kED/vUDfkSYNRK2nu4Vn0SSOThPw7C+aw16QpaQKfsCmz2u9UqwxiUjtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40460700003)(70586007)(86362001)(70206006)(54906003)(316002)(110136005)(36756003)(8676002)(83380400001)(4326008)(16526019)(1076003)(8936002)(6666004)(336012)(426003)(2906002)(26005)(47076005)(41300700001)(2616005)(36860700001)(7696005)(5660300002)(82740400003)(478600001)(356005)(40480700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:10:58.6171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc60d09-83dd-4f60-c839-08dbe744bb27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

To sideload pmf policy binaries, the Smart PC Solution Builder provides a
debugfs file called "update_policy"; that gets created under a new debugfs
directory called "pb" and this new directory has to be associated with
existing parent directory for PMF driver called "amd_pmf".

In the current code structure, amd_pmf_dbgfs_register() is called after
amd_pmf_init_features(). This will not help when the Smart PC builder
feature has to be assoicated to the parent directory.

Hence change the order of amd_pmf_dbgfs_register() and call it before
amd_pmf_init_features() so that when the Smart PC init happens, it has the
parent debugfs directory to get itself hooked.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c8f6ec4c2e2c..4b8156033fa6 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -442,9 +442,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
+	amd_pmf_dbgfs_register(dev);
 	amd_pmf_init_features(dev);
 	apmf_install_handler(dev);
-	amd_pmf_dbgfs_register(dev);
 
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
-- 
2.25.1


