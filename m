Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A67C3AC5DB
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 10:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhFRIVe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 04:21:34 -0400
Received: from mail-mw2nam12on2068.outbound.protection.outlook.com ([40.107.244.68]:35329
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232574AbhFRIVb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 04:21:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwIpbiGulD/fgCevEcxK8rqeywDj7kcCIa33Z0NmdNsZzoyoMUeeJH0rIcmx3K7DWzoeOXoHoQAXieMzXNA5mDwBPNbnW+V730z13+TlXtGwFAW+aYAJ/iRul6oo56E2n/jb3mMePQZIXydJW8i/zzSypBv4+um9Rsnp4FOiRiqD+TyTOaZnhllo2yoZ2aAXfJULfU9PSTVD3wK1dnmJpG4+HEsNDt5UJ1Rp/GW/V7MsyZwNp0Maz8PRITDi2zBCETGg2MoqwEOe37dlpolaWY3A0ZtkUNmEftmxaK33lgU3lBO6Qjj7nWQzkSsWJdkWiQ5P3yvAWthrMV806Hmhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC6YCTasx051jlc62sUyWaoHy20of9CqdJjwHbLiPew=;
 b=dclWRV24QUxFZGIhzbzr3ruhBGAi4dSAFlW2I4GYEC2QLOAJFwcDWJr2ZkSqiBgag34eW7VnnUiFpDp4aUOqS/xU+TV4WAW0jWdXvPz+laa1SimwkT70+K78Q3KhIQoWuVFmxmRK/MOmxHm9RTa5xGWLzHGvd2MH6aBYCLD5wZpMXDj7nEqzDi5OB5oBeuBF5+5hCBGHLRTjwZ3fdDczs+bHmxHCbyKuiJ9xB7FBGvAlLO5NhqBWn9jzBXBmB9FwjqsRMeA4Q/R2GvDOglA2lobztSQ7Gyo9gZsBMfVfYhYVTVN+q5REPQlrD5jItXV+eZgzNE6DHA1J3oTTmgEV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cC6YCTasx051jlc62sUyWaoHy20of9CqdJjwHbLiPew=;
 b=OkvWaJOHXMS89Ms+EiPXRg/sppbNGx3nY48p7lLAcm9SuuP9+llrLOQuJwNUg9LpNXp/o4mPKkRQe+ZfKYfnX6NS9Pbq1goppBoYP3QDskZ0HBBD8Seht/R+Q422O+0rrBLLm1b2PQEvmRcvK+QCcQR6/rxGbvak39EInmiTBZ4=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by SN6PR12MB2816.namprd12.prod.outlook.com (2603:10b6:805:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 08:19:20 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::29) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Fri, 18 Jun 2021 08:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 08:19:20 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 03:19:14 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/3] amd_sfh: Add initial support for HPD sensor
Date:   Fri, 18 Jun 2021 13:48:38 +0530
Message-ID: <20210618081838.4156571-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
References: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a981d8e-5d99-4504-aabf-08d93231c5c2
X-MS-TrafficTypeDiagnostic: SN6PR12MB2816:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2816184B86106E5A0380A141E60D9@SN6PR12MB2816.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpDNDO8XS8s3mU09SPd+qdw6CuW9lGaUqB6leeqh/XFd/70CLGZJdzX005T8WWCLNr9uIfX2oEBSyN4d5a31OqWiZAGYMx1yOokKMfeJyR/uxDcv7MCR/pBenluLZKUMVdupf4X7vY3C9VtFKZM3d8MljVL04OclOby4VMJByLlbWsZy7MKKod+EFxIxXMAgSEs6r5eM1h33MgLdspvR45zFD7GkCb3c6GmFLJ4jq4pJQL2Il+RuSpkMy8QcnxGdr27k84buKrXkDaqayD86FsrnBwnkws5cJqr7Zg3fgmbLHrTgnYNeoYLYudxUZr9n2Ucm8lRXZ7/zc7mGu3ZS1RncV1e5ZKcabZEETAR9C4pcS5GS/WDlPIY4opfnW7rCkkgA7RGWIkqW7UFdwJA+sg74h5SYl0SkpyCVpOi/7nquSTHYh7PoNXqC3b+Meqz2ogJs9DJcE9XsLvAjuATaRE6CMLTfnYnqbNJ3QyACvF1rCdL+zIuTDa9M+FUs+i0UmsEa6gDlj6r90XGuVD7SYVljdG+PGmF4D+UgWvDUGxEAcBp3hy9P089wdHr1PonLA2WSnHioZi3nPFCtZLKOKpa/p6cuhDKoZDG2834znqcSfScfeV1fOz1nZsTRdNtwRH2O6pxXs/t1qm68Mo87q85AhKqna7QydxAao/xO8BcSHBrpor4dS/ZPflvHmtv/
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(7696005)(186003)(82310400003)(6666004)(16526019)(36756003)(26005)(4326008)(82740400003)(83380400001)(36860700001)(356005)(70206006)(70586007)(86362001)(47076005)(8676002)(8936002)(30864003)(2906002)(426003)(5660300002)(336012)(2616005)(1076003)(54906003)(478600001)(110136005)(81166007)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:19:20.0632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a981d8e-5d99-4504-aabf-08d93231c5c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2816
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add Human Presence Detection (HPD) sensors support
on AMD next generation HPD supported platforms.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Nehal Shah <nehal-bakulchandra.shah@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |   2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |   4 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  14 +++
 .../hid_descriptor/amd_sfh_hid_desc.c         |  34 +++++-
 .../hid_descriptor/amd_sfh_hid_desc.h         |  10 ++
 .../hid_descriptor/amd_sfh_hid_report_desc.h  | 112 ++++++++++++++++++
 6 files changed, 174 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 359c5de96af8..ae2ac9191ba7 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -9,7 +9,7 @@
 #ifndef AMDSFH_HID_H
 #define AMDSFH_HID_H
 
-#define MAX_HID_DEVICES		4
+#define MAX_HID_DEVICES		5
 #define BUS_AMD_AMDTP		0x20
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index ff131f450bdc..96e2577fa37e 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -24,6 +24,7 @@
 #define ACEL_EN		BIT(0)
 #define GYRO_EN		BIT(1)
 #define MAGNO_EN	BIT(2)
+#define HPD_EN		BIT(16)
 #define ALS_EN		BIT(19)
 
 static int sensor_mask_override = -1;
@@ -165,6 +166,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (ALS_EN & activestatus)
 		sensor_id[num_of_sensors++] = als_idx;
 
+	if (HPD_EN & activestatus)
+		sensor_id[num_of_sensors++] = HPD_IDX;
+
 	return num_of_sensors;
 }
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 0886b2ad033e..2d5c57e3782d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -30,6 +30,8 @@
 
 #define V2_STATUS	0x2
 
+#define HPD_IDX		16
+
 /* SFH Command register */
 union sfh_cmd_base {
 	u32 ul;
@@ -92,6 +94,18 @@ enum mem_use_type {
 	USE_C2P_REG,
 };
 
+struct hpd_status {
+	union {
+		struct {
+			u32 human_presence_report : 4;
+			u32 human_presence_actual : 4;
+			u32 probablity		  : 8;
+			u32 object_distance       : 16;
+		} shpd;
+		u32 val;
+	};
+};
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
 void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx);
 void amd_stop_all_sensors(struct amd_mp2_dev *privdata);
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index cdc0a8d32249..0c3697219382 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -50,6 +50,11 @@ int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 		memcpy(rep_desc, als_report_descriptor,
 		       sizeof(als_report_descriptor));
 		break;
+	case HPD_IDX: /* HPD sensor */
+		memset(rep_desc, 0, sizeof(hpd_report_descriptor));
+		memcpy(rep_desc, hpd_report_descriptor,
+		       sizeof(hpd_report_descriptor));
+		break;
 	default:
 		break;
 	}
@@ -99,6 +104,17 @@ u32 get_descr_sz(int sensor_idx, int descriptor_name)
 			return sizeof(struct als_feature_report);
 		}
 		break;
+	case HPD_IDX:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(hpd_report_descriptor);
+		case input_size:
+			return sizeof(struct hpd_input_report);
+		case feature_size:
+			return sizeof(struct hpd_feature_report);
+		}
+		break;
+
 	default:
 		break;
 	}
@@ -120,6 +136,7 @@ u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 	struct accel3_feature_report acc_feature;
 	struct gyro_feature_report gyro_feature;
 	struct magno_feature_report magno_feature;
+	struct hpd_feature_report hpd_feature;
 	struct als_feature_report als_feature;
 	u8 report_size = 0;
 
@@ -162,6 +179,12 @@ u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 		memcpy(feature_report, &als_feature, sizeof(als_feature));
 		report_size = sizeof(als_feature);
 		break;
+	case HPD_IDX:  /* human presence detection sensor */
+		get_common_features(&hpd_feature.common_property, report_id);
+		memcpy(feature_report, &hpd_feature, sizeof(hpd_feature));
+		report_size = sizeof(hpd_feature);
+		break;
+
 	default:
 		break;
 	}
@@ -181,10 +204,12 @@ u8 get_input_report(u8 current_index, int sensor_idx, int report_id, struct amd_
 	u32 *sensor_virt_addr = in_data->sensor_virt_addr[current_index];
 	u8 *input_report = in_data->input_report[current_index];
 	u8 supported_input = privdata->mp2_acs & GENMASK(3, 0);
+	struct magno_input_report magno_input;
 	struct accel3_input_report acc_input;
 	struct gyro_input_report gyro_input;
-	struct magno_input_report magno_input;
+	struct hpd_input_report hpd_input;
 	struct als_input_report als_input;
+	struct hpd_status hpdstatus;
 	u8 report_size = 0;
 
 	if (!sensor_virt_addr || !input_report)
@@ -227,6 +252,13 @@ u8 get_input_report(u8 current_index, int sensor_idx, int report_id, struct amd_
 		report_size = sizeof(als_input);
 		memcpy(input_report, &als_input, sizeof(als_input));
 		break;
+	case HPD_IDX: /* hpd */
+		get_common_inputs(&hpd_input.common_property, report_id);
+		hpdstatus.val = readl(privdata->mmio + AMD_C2P_MSG(4));
+		hpd_input.human_presence = hpdstatus.shpd.human_presence_actual;
+		report_size = sizeof(hpd_input);
+		memcpy(input_report, &hpd_input, sizeof(hpd_input));
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index a23c1046627f..16f563d1823b 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -100,6 +100,16 @@ struct als_input_report {
 	int illuminance_value;
 } __packed;
 
+struct hpd_feature_report {
+	struct common_feature_property common_property;
+} __packed;
+
+struct hpd_input_report {
+	struct common_input_property common_property;
+	 /* values specific to human presence sensor */
+	u8 human_presence;
+} __packed;
+
 int get_report_descriptor(int sensor_idx, u8 rep_desc[]);
 u32 get_descr_sz(int sensor_idx, int descriptor_name);
 u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report);
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
index 44271d39b322..66d6b26e4708 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
@@ -642,4 +642,116 @@ const u8 als_report_descriptor[] = {
 0X81, 0x02,		/* HID Input (Data_Arr_Abs) */
 0xC0			/* HID end collection */
 };
+
+/* BIOMETRIC PRESENCE*/
+static const u8 hpd_report_descriptor[] = {
+0x05, 0x20,          /* Usage page */
+0x09, 0x11,          /* BIOMETRIC PRESENCE  */
+0xA1, 0x00,          /* HID Collection (Physical) */
+
+//feature reports(xmit/receive)
+0x85, 5,           /* HID  Report ID */
+0x05, 0x20,	   /* HID usage page sensor */
+0x0A, 0x09, 0x03,  /* Sensor property and sensor connection type */
+0x15, 0,           /* HID logical MIN_8(0) */
+0x25, 2,	   /* HID logical MAX_8(2) */
+0x75, 8,	   /* HID report size(8) */
+0x95, 1,	   /* HID report count(1) */
+0xA1, 0x02,	   /* HID collection (logical) */
+0x0A, 0x30, 0x08, /* Sensor property connection type intergated sel*/
+0x0A, 0x31, 0x08, /* Sensor property connection type attached sel */
+0x0A, 0x32, 0x08, /* Sensor property connection type external sel */
+0xB1, 0x00,       /* HID feature (Data_Arr_Abs) */
+0xC0,		  /* HID end collection */
+0x0A, 0x16, 0x03, /* HID usage sensor property reporting state */
+0x15, 0,          /* HID logical Min_8(0) */
+0x25, 5,	  /* HID logical Max_8(5) */
+0x75, 8,	  /* HID report size(8) */
+0x95, 1,          /* HID report count(1) */
+0xA1, 0x02,	  /* HID collection(logical) */
+0x0A, 0x40, 0x08, /* Sensor property report state no events sel */
+0x0A, 0x41, 0x08, /* Sensor property report state all events sel */
+0x0A, 0x42, 0x08, /* Sensor property report state threshold events sel */
+0x0A, 0x43, 0x08, /* Sensor property report state no events wake sel */
+0x0A, 0x44, 0x08, /* Sensor property report state all events wake sel */
+0x0A, 0x45, 0x08, /* Sensor property report state threshold events wake sel */
+0xB1, 0x00,	  /* HID feature (Data_Arr_Abs) */
+0xC0,		  /* HID end collection */
+0x0A, 0x19, 0x03, /* HID usage sensor property power state */
+0x15, 0,	  /* HID logical Min_8(0) */
+0x25, 5,	  /* HID logical Max_8(5) */
+0x75, 8,	  /* HID report size(8) */
+0x95, 1,	  /* HID report count(1) */
+0xA1, 0x02,	  /* HID collection(logical) */
+0x0A, 0x50, 0x08, /* Sensor property power state undefined sel */
+0x0A, 0x51, 0x08, /* Sensor property power state D0 full power  sel */
+0x0A, 0x52, 0x08, /* Sensor property power state D1 low power sel */
+0x0A, 0x53, 0x08, /* Sensor property power state D2 standby with wake sel */
+0x0A, 0x54, 0x08, /* Sensor property power state D3 sleep with wake  sel */
+0x0A, 0x55, 0x08, /* Sensor property power state D4 power off sel */
+0xB1, 0x00,       /* HID feature (Data_Arr_Abs) */
+0xC0,		  /* HID end collection */
+0x0A, 0x01, 0x02, /* HID usage sensor state */
+0x15, 0,	  /* HID logical Min_8(0) */
+0x25, 6,	  /* HID logical Max_8(6) */
+0x75, 8,	  /* HID report size(8) */
+0x95, 1,	  /* HID report count(1) */
+0xA1, 0x02,	  /* HID collection(logical) */
+0x0A, 0x00, 0x08, /* HID usage sensor state unknown sel */
+0x0A, 0x01, 0x08, /* HID usage sensor state ready sel */
+0x0A, 0x02, 0x08, /* HID usage sensor state not available sel */
+0x0A, 0x03, 0x08, /* HID usage sensor state no data sel */
+0x0A, 0x04, 0x08, /* HID usage sensor state initializing sel */
+0x0A, 0x05, 0x08, /* HID usage sensor state access denied sel */
+0x0A, 0x06, 0x08, /* HID usage sensor state error sel */
+0xB1, 0x00,	  /* HID feature (Data_Arr_Abs) */
+0xC0,		  /* HID end collection */
+0x0A, 0x0E, 0x03, /* HID usage sensor property report interval */
+0x15, 0,	  /* HID logical Min_8(0) */
+0x27, 0xFF, 0xFF, 0xFF, 0xFF, /* HID logical Max_32 */
+
+0x75, 32,	  /* HID report size(32) */
+0x95, 1,	  /* HID report count(1) */
+0x55, 0,	  /* HID unit exponent(0) */
+0xB1, 0x02,	  /* HID feature (Data_Var_Abs) */
+
+//input report (transmit)
+0x05, 0x20,		 /* HID usage page sensors */
+0x0A, 0x01, 0x02,	 /* HID usage sensor state */
+0x15, 0,		 /* HID logical Min_8(0) */
+0x25, 6,		 /* HID logical Max_8(6) */
+0x75, 8,		 /* HID report size(8) */
+0x95, 1,		 /* HID report count (1) */
+0xA1, 0x02,		 /* HID end collection (logical) */
+0x0A, 0x00, 0x08,	 /* HID usage sensor state unknown sel */
+0x0A, 0x01, 0x08,	 /* HID usage sensor state ready sel */
+0x0A, 0x02, 0x08,	 /* HID usage sensor state not available sel */
+0x0A, 0x03, 0x08,	 /* HID usage sensor state no data sel */
+0x0A, 0x04, 0x08,	 /* HID usage sensor state initializing sel */
+0x0A, 0x05, 0x08,	 /* HID usage sensor state access denied sel */
+0x0A, 0x06, 0x08,	 /* HID usage sensor state error sel */
+0X81, 0x00,		 /* HID Input (Data_Arr_Abs) */
+0xC0,			 /* HID end collection */
+0x0A, 0x02, 0x02,	 /* HID usage sensor event */
+0x15, 0,		 /* HID logical Min_8(0) */
+0x25, 5,		 /* HID logical Max_8(5) */
+0x75, 8,		 /* HID report size(8) */
+0x95, 1,		 /* HID report count (1) */
+0xA1, 0x02,		 /* HID end collection (logical) */
+0x0A, 0x10, 0x08,	 /* HID usage sensor event unknown sel */
+0x0A, 0x11, 0x08,	 /* HID usage sensor event state changed sel */
+0x0A, 0x12, 0x08,	 /* HID usage sensor event property changed sel */
+0x0A, 0x13, 0x08,	 /* HID usage sensor event data updated sel */
+0x0A, 0x14, 0x08,	 /* HID usage sensor event poll response sel */
+0x0A, 0x15, 0x08,	 /* HID usage sensor event change sensitivity sel */
+0X81, 0x00,		 /* HID Input (Data_Arr_Abs) */
+0xC0,			 /* HID end collection */
+0x0A, 0xB1, 0x04,	 /* HID usage sensor data BIOMETRIC HUMAN PRESENCE */
+0x15, 0,		 /* HID logical Min_8(0) */
+0x25, 1,		 /* HID logical Max_8(1) */
+0x75, 8,		 /* HID report size(8) */
+0x95, 1,		 /* HID report count (1) */
+0X81, 0x02,		 /* HID Input (Data_Var_Abs) */
+0xC0			 /* HID end collection */
+};
 #endif
-- 
2.25.1

