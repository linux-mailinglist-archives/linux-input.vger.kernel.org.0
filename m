Return-Path: <linux-input+bounces-698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF880E101
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 421051F21B9A
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C7D801;
	Tue, 12 Dec 2023 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TRJQ/HTB"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F86CF;
	Mon, 11 Dec 2023 17:47:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHTzGH3HtG1oRUlBvHbtDfVA42un8rDknJYyM53CKx+JGBR64Hc2z8NUtoKlcL5Etbt3aIchYsG5fOnBcok3nCPdv4hvjgVQvTa2utNJF+jvwUlH0aWpwEkCS1LnH2IHoQzAKJJfoCS6rLD7EYNBuU8sIyD7Jh3fbG9fvWPcv6Zz/hb6o3DaSJFUM6Iyr+Yjsi3vWNcb8CghIeW4WcWqOjxbNjqWS9DSfTp16p7T97Iqw81ofT+I9XHkpLprqT821zt5PKQ7qdHzz18bP6CMqm3G0Qmo1d/8XZyMu12xdwZDyKiL8hza3344wShznB5+hB1b/7jQAxkxKtP2xmngQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiPd19ERKkKec9NJv1/l0Ywd9SZ2PahJeppIzBoWpXo=;
 b=PUTwkg+yIONzoxCKQiuugDYW5w5Y9fyYgU7jjIGkngXbIO4kfZ7+Vh6plA3HrzjgjiR2lAp3Ll7ujz4F5Ye9VieX9LHh9MWeOV+wbC5TqUY789LrdRveMPDGrh3q16TIUip4oY857qWJ99vaWi8dUo6UOIxLsGfxY1gOJOkU72OxgyLVXWKi2WpEA1+ChvqMlDL7AOlVjgGw498soYc7BLMk7DwwauMNkn6k9OThT081FFyeKihfgkg4i+vsm/th3Mdmhe2Ul3B/5wuXoj0htnOOS2tXq1hXE9deoRhLMlS70UMgJJuyCSqNQ91TbFfbej1pdk+OlAFegP5vlmN9Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiPd19ERKkKec9NJv1/l0Ywd9SZ2PahJeppIzBoWpXo=;
 b=TRJQ/HTBXxAmV7hDzFpgD/4CqLGh2BA4uJ9pqsbfQoi89xrpjiTURBl7RKLpV0z70tNMEOXE3jtSZRfW+TAU9JnvyJin7Ve93Mrqk6Qw4zEH0uESGvu3PYn/UoPE1sEPW/PWPA03LiGkZaKdtyAVWRePryqphZ8RfhfA22qBzVM=
Received: from DM6PR01CA0005.prod.exchangelabs.com (2603:10b6:5:296::10) by
 PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Tue, 12 Dec 2023 01:47:52 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::90) by DM6PR01CA0005.outlook.office365.com
 (2603:10b6:5:296::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:47:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:47:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 03/12] platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
Date: Tue, 12 Dec 2023 07:16:56 +0530
Message-ID: <20231212014705.2017474-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|PH7PR12MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: db53f480-50c9-4131-405b-08dbfab45a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QjxjGYAf4zcY92Gqc1G2U+uawjhVAL0oRmmEpJj0SP34CSlwxY7gscoLIpGm5uXlo6aTthSf9PajjzImeRlP+vOn4rufP5u7B7EEvLgp4/d3rQlbHfov7Yefo0iQ7vXWrOi4o94py8/ROHoLpXZ7SI3zXZgtAdGo7mot4SSaQL/NVR99nDYJloC9B0fRPilaWiQ1AqAqr0GWB2t0adX4dXOBijcW38SMDdUt+A+ypL1SKkx1DXv/NawpFg6IvSz0cmy3NOlsB9qGRRZrXjJSN21YmpxQyXcpbBRcnCBe9kUmjbdVRjaSzsF3JI6D5lBeeSBv3rne7T2MnzvOSv9ZtgYuAf29S7aJEAwRWIr4Y48lpuB6auOepFigNBlX4xVpqjQ+nXELge/SQMBi0iJDpbx36EUzrhLh8gDb5rKjKy9VPU5gH9D+ha4sPp4Mzn8HXmTx8DU04aDwNqD86VQqMUMAt53aqnLMe4l2T8F+xUnynkq2YdLg5cLfUz2gKQtM9piAKjwhYp2xIeKTBEU3KWIkAkdeW910zDocx92gpA1pcBBtZj9zgxi/OmX5/sSuS/sCpB0CbnRLbBng7DTqc24nWzQIT72uFbMSYvWJEYjkZ68tq2k1DKr0or4K3qM0bTLqHV0ljy/G/OV177/TObRvKlhC3UD1hvlvfqcuXe7iQwOUnuVkrCrEs7Zz5Q056XizzY1M4Ngw4/7nI+Zy0To1OU5NohNOWewXfJfEvR7Rn5hy/ShLLoRSK7rV5ZycKeeEMZXMbDBbvdDi6H/jtQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(41300700001)(36860700001)(47076005)(16526019)(1076003)(426003)(336012)(26005)(83380400001)(2616005)(82740400003)(86362001)(36756003)(81166007)(356005)(5660300002)(316002)(8676002)(8936002)(4326008)(2906002)(6666004)(7696005)(54906003)(70586007)(70206006)(110136005)(478600001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:47:52.0785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db53f480-50c9-4131-405b-08dbfab45a77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7820

In the current code, the metrics table information was required only
for auto-mode or CnQF at a given time. Hence keeping the return type
of amd_pmf_set_dram_addr() as static made sense.

But with the addition of Smart PC builder feature, the metrics table
information has to be shared by the Smart PC also and this feature
resides outside of core.c.

To make amd_pmf_set_dram_addr() visible outside of core.c make it
as a non-static function and move the allocation of memory for
metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
as amd_pmf_set_dram_addr() is the common function to set the DRAM
address.

Add a suspend handler that can free up the allocated memory for getting
the metrics table information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 39 ++++++++++++++++++++++-------
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ec92d1cc0dac..9953619a830b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -251,29 +251,37 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
-static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 {
 	u64 phys_addr;
 	u32 hi, low;
 
+	/* Get Metrics Table Address */
+	if (alloc_buffer) {
+		dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
+		if (!dev->buf)
+			return -ENOMEM;
+	}
+
 	phys_addr = virt_to_phys(dev->buf);
 	hi = phys_addr >> 32;
 	low = phys_addr & GENMASK(31, 0);
 
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+
+	return 0;
 }
 
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 {
-	/* Get Metrics Table Address */
-	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
-	if (!dev->buf)
-		return -ENOMEM;
+	int ret;
 
 	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
 
-	amd_pmf_set_dram_addr(dev);
+	ret = amd_pmf_set_dram_addr(dev, true);
+	if (ret)
+		return ret;
 
 	/*
 	 * Start collecting the metrics data after a small delay
@@ -284,17 +292,30 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int amd_pmf_suspend_handler(struct device *dev)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	kfree(pdev->buf);
+
+	return 0;
+}
+
 static int amd_pmf_resume_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int ret;
 
-	if (pdev->buf)
-		amd_pmf_set_dram_addr(pdev);
+	if (pdev->buf) {
+		ret = amd_pmf_set_dram_addr(pdev, false);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, NULL, amd_pmf_resume_handler);
+static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, amd_pmf_suspend_handler, amd_pmf_resume_handler);
 
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a24e34e42032..6c1aba5d2027 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1


