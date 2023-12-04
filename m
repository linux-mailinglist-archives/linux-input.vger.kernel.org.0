Return-Path: <linux-input+bounces-452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB8F803084
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EFE61C209FB
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17E022313;
	Mon,  4 Dec 2023 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BvdDLX17"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124B3D5;
	Mon,  4 Dec 2023 02:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYLHAU92dY1V6hidTMUYpJQBtmSCA0D3DpmXgWEQch4u2zoVTxaVXSGh6zAUUFR4poGUtUbRYx6v2b0NFlR7DOFY+iPwVwbPu8Mlp0LqOfEXFUTNtZaGzzww+1RiROkY5fhuY0010cJGXA08p+xgHes9nASt3q5MBcOko32J4B+C8AJbBojmheW2wtb8lyGX62j3JsMvC9p+4VoqwdzbCDO1aRMkz/HYXzXn3+fcxvifMc7qjiVrvQ/jbUdYM9Ngp+/CSpnb4l4P4T3kJX6jvkWAC0yvOpNAlzT0FV0XVmM1LYnu1HPoGIiAYhsrI0/h2SE7elaTg3BoKqfVx7Qgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TSel9FvYaXgVjLIXlD9BbTmn1CmlqvGyMSN6JNXh8g=;
 b=dSswQ7OcdxrGaXDs873nlgfHsowevOWR7v9LZcYKrEtYpumx56M/TfFsPQEeCbhavFSNvFS7GlfJWVcRinuSh+tJFWVgbBhO5eY6vZ89GyczpTR/Uw60vwe04pZqWiMb2xej92YgfLf223/3dZRabF2PJWW6y2b4nGtprIuH0C11Vo2dOsLveRKoACOj/7k8H6/BAZ5xzQAhIsP9+JGIUbsGPTUIKcCxkUHjohqiJFssbBImgD0r2jrCtnQp+buG4hKT5M/ll+/klY3Ck4GSsKmNUe+vo/y8IaXvAZhZehOTQf6aApeKGvO1vRbStWdy1OTe34IvCugyTIxlefv4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TSel9FvYaXgVjLIXlD9BbTmn1CmlqvGyMSN6JNXh8g=;
 b=BvdDLX17ENoGBKjpvmUJSQJojGWDqeLu6EMgn1dqaV9xJadlgzirPDVamVufb59reKVJW7DupPB3w8IXOgM4kOxX6g1MyrvKAxRB1CvnsT7VxQBEuikbUMVRvCze+GqSiAG1XwmVq8LDV/OiY8IO/VAp4Ds0YAwk80kzfM0gbBA=
Received: from MW4PR03CA0327.namprd03.prod.outlook.com (2603:10b6:303:dd::32)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:37:39 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::aa) by MW4PR03CA0327.outlook.office365.com
 (2603:10b6:303:dd::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Mon, 4 Dec 2023 10:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:37:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:47 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface for HPD
Date: Mon, 4 Dec 2023 15:45:47 +0530
Message-ID: <20231204101548.1458499-15-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 932dcf98-c5e4-447f-18f3-08dbf4b509a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZFN9VmhmDaiC5UURgZJiDtUjkLcQSFTIk+FDllzfzAWoeXxQE9wwNeI6FbCTkaKtJR7gYks97M6/4/wQ7cCMH38LuL9BF8jYqsLdiG1kpcCdNvuYNELrwCwpTDi9V8zk3I7co9drIrcUrAWoHh0TgJjCAH4riELJ/p4XYw06vzWLfkOUrpONHLCKSo6+zrRRQIBVFvUnueo4c3Ztn18NpQ6x9azfZBOE7wyVM9yhsObGJCuBO9h3iUNRRDUFNXyEo8FRqAFTK4/+WRRhUy4N+i9le21qOZCgosLI+h4cAX2JRRnGo8aw5NruXmYu573FJWDLhWkXymgkrshvM/87qprG07JavO3dOyly7BCPOSW2YVYpRI3Jd5coiLFEH9dqM0CXp7jfQH7UoVyiadhl+gLUOnbPd3t20A7jUwaKqr9mjzusBtUjV3zkwf5WZfuKARRQh2koqMg4TD2K4MN5jylxkrMtoxL4wFDL+EODgJ77XADsMdDjzY5mFLa1697hNwUeVCr5as9hDUftNdwgKlEGJV5jsT3gJpPiYVGL7j0a4wlqy5K9F1ZutXcr9C5/H5Ms8gcPk/5qcZRpFQiv1Z6fInsYJKGcB1niF/tow+5NC9nXMOg4bPxkYhxnApYcV1FECZ4OAr42BF+oNiUTd5fMKulKvsgNQVobPc3xGG6M/i5Nv3uvymZQMkJAGINW9Z3V0K0PY8bDNKxOIpE+oofA8tW+HDze2NHy6nYTG8kIY8cAXJt5NW1gq7w8UkWNWykS2JAKHDhZhcGsuRCJgg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(1800799012)(64100799003)(451199024)(186009)(46966006)(40470700004)(36840700001)(478600001)(336012)(26005)(83380400001)(16526019)(47076005)(7696005)(356005)(81166007)(426003)(1076003)(40480700001)(82740400003)(36756003)(2616005)(316002)(110136005)(54906003)(70586007)(70206006)(36860700001)(5660300002)(4326008)(86362001)(2906002)(8936002)(8676002)(40460700003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:37:38.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 932dcf98-c5e4-447f-18f3-08dbf4b509a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

AMDSFH has information about the User presence information via the Human
Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
Add PMF and AMDSFH interface to get this information.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 14 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 33 +++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 drivers/platform/x86/amd/pmf/Kconfig          |  1 +
 drivers/platform/x86/amd/pmf/spc.c            | 22 +++++++++
 include/linux/amd-pmf-io.h                    | 46 +++++++++++++++++++
 7 files changed, 122 insertions(+)
 create mode 100644 include/linux/amd-pmf-io.h

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 2643bb14fee2..cd57037bf217 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
 	dma_addr_t dma_address;
 };
 
+struct sfh_dev_status {
+	bool is_hpd_present;
+};
+
 struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
@@ -47,6 +51,7 @@ struct amd_mp2_dev {
 	struct amd_input_data in_data;
 	/* mp2 active control status */
 	u32 mp2_acs;
+	struct sfh_dev_status dev_en;
 };
 
 struct amd_mp2_ops {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9c6413af24a..0351b0fd394a 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	int i, status;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		switch (cl_data->sensor_idx[i]) {
+		case HPD_IDX:
+			privdata->dev_en.is_hpd_present = false;
+			break;
+		}
+
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
 			status = amd_sfh_wait_for_response
@@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
+			switch (cl_data->sensor_idx[i]) {
+			case HPD_IDX:
+				privdata->dev_en.is_hpd_present = true;
+				break;
+			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
@@ -259,6 +270,7 @@ static void amd_mp2_pci_remove(void *privdata)
 {
 	struct amd_mp2_dev *mp2 = privdata;
 
+	sfh_deinit_emp2();
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
 	pci_intx(mp2->pdev, false);
@@ -311,12 +323,14 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	rc = amd_sfh_irq_init(mp2);
 	if (rc) {
+		sfh_deinit_emp2();
 		dev_err(dev, "amd_sfh_irq_init failed\n");
 		return rc;
 	}
 
 	rc = amd_sfh1_1_hid_client_init(mp2);
 	if (rc) {
+		sfh_deinit_emp2();
 		dev_err(dev, "amd_sfh1_1_hid_client_init failed\n");
 		return rc;
 	}
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4f81ef2d4f56..f8758fb70b1a 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -7,11 +7,14 @@
  *
  * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
+#include <linux/amd-pmf-io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 
 #include "amd_sfh_interface.h"
 
+static struct amd_mp2_dev *emp2;
+
 static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
 {
 	struct sfh_cmd_response cmd_resp;
@@ -73,7 +76,37 @@ static struct amd_mp2_ops amd_sfh_ops = {
 	.response = amd_sfh_wait_response,
 };
 
+void sfh_deinit_emp2(void)
+{
+	emp2 = NULL;
+}
+
 void sfh_interface_init(struct amd_mp2_dev *mp2)
 {
 	mp2->mp2_ops = &amd_sfh_ops;
+	emp2 = mp2;
+}
+
+static int amd_sfh_hpd_info(u8 *user_present)
+{
+	struct hpd_status hpdstatus;
+
+	if (!emp2 || !emp2->dev_en.is_hpd_present)
+		return -ENODEV;
+
+	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
+	*user_present = hpdstatus.shpd.presence;
+	return 0;
+}
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
+{
+	if (sfh_info) {
+		switch (op) {
+		case MT_HPD:
+			return amd_sfh_hpd_info(&sfh_info->user_present);
+		}
+	}
+	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(amd_get_sfh_info);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 75267b0fec70..2c211d28764d 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -165,6 +165,7 @@ struct hpd_status {
 };
 
 void sfh_interface_init(struct amd_mp2_dev *mp2);
+void sfh_deinit_emp2(void);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
 int amd_sfh_float_to_int(u32 flt32_val);
 #endif
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index f246252bddd8..f4fa8bd8bda8 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -10,6 +10,7 @@ config AMD_PMF
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
 	depends on TEE && AMDTEE
+	depends on AMD_SFH_HID
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index a0423942f771..5e769dcb075a 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -10,6 +10,7 @@
  */
 
 #include <acpi/button.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
@@ -44,6 +45,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
 	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
+	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -147,6 +149,25 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	return 0;
 }
 
+static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	struct amd_sfh_info sfh_info;
+
+	/* get HPD data */
+	amd_get_sfh_info(&sfh_info, MT_HPD);
+	switch (sfh_info.user_present) {
+	case SFH_NOT_DETECTED:
+		in->ev_info.user_present = 0xff; /* assume no sensors connected */
+		break;
+	case SFH_USER_PRESENT:
+		in->ev_info.user_present = 1;
+		break;
+	case SFH_USER_AWAY:
+		in->ev_info.user_present = 0;
+		break;
+	}
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
@@ -155,4 +176,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_smu_info(dev, in);
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
+	amd_pmf_get_sensor_info(dev, in);
 }
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
new file mode 100644
index 000000000000..5b6d29d36922
--- /dev/null
+++ b/include/linux/amd-pmf-io.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Platform Management Framework Interface
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#ifndef AMD_PMF_IO_H
+#define AMD_PMF_IO_H
+
+#include <linux/types.h>
+
+/**
+ * enum sfh_message_type - Query the SFH message type
+ * @MT_HPD: Message ID to know the Human presence info from MP2 FW
+ */
+enum sfh_message_type {
+	MT_HPD,
+};
+
+/**
+ * enum sfh_hpd_info - Query the Human presence information
+ * @SFH_NOT_DETECTED: Check the HPD connection information from MP2 FW
+ * @SFH_USER_PRESENT: Check if the user is present from HPD sensor
+ * @SFH_USER_AWAY: Check if the user is away from HPD sensor
+ */
+enum sfh_hpd_info {
+	SFH_NOT_DETECTED,
+	SFH_USER_PRESENT,
+	SFH_USER_AWAY,
+};
+
+/**
+ * struct amd_sfh_info - get HPD sensor info from MP2 FW
+ * @user_present: Populates the user presence information
+ */
+struct amd_sfh_info {
+	u8 user_present;
+};
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+#endif
-- 
2.25.1


