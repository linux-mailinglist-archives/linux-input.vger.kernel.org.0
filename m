Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78466DE0DD
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjDKQTh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjDKQT3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:19:29 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455573ABB
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+AYz80CvA0AQTIqX4s+3TsjbhKYeEkRCybD7cSYGRQkAxrRaT0sZDO5y/9buswWnjfdOwAlUa64NB7plIJV56C/p0hcCZdZ5AyJRXcK1pEKq8RGcG61dxeOzrv4iVsOpyINpP7+/SuzEWI9/maxMofDdYTjqy/Jz/0tUE7Uf3uv9zMWgBQJ4bpAVyblW6g6DohsyhevAmlQ7HAxOrRhIcTsxojvKVQoxEvD+CmaDkoB91DdMP/B1qzCNvpLkvqTDuzQ0Heowa138ePWYBA+3/ffX9CJKtqaynjggbYozGYsLodpEBqCdHjhfm5UMTiAjkNgrCooOI0sF6PIuq7ytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cm451YlUOnSmy/wQeXO8Zp1VPuwGtche6wNw++U4ah4=;
 b=gEUaKkQh1+HVvSi1s+3Vaw9S0pEKmHy1+8fu6p+Ki8TNMv0lSOUU0jMZvO0sGB0QdvDdLuQU5GEu89vg+ZjhjpHjw2OuNe1Yl0oT9gneX2uFnIgYOiTmGRZpc3TvEOOT5ABEpn5Kh0u21FnokgW+bAo7bSo2jjsAz32+i0xHP+dT/ECG+j9hUCtsORHgCNx8lUQOGHboHa15YYo5ORShBJMBwd/VUNYisEISXXunVVWXGRTOEAsBlhSTzknAtWI1CK1ps+lfoxVqcknIvLc8aUtshDDosgoL/0xn6sjN3KxW3OBjv7ClvQQwZijquQJUomKyAHuuL9F25SyLo4QYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cm451YlUOnSmy/wQeXO8Zp1VPuwGtche6wNw++U4ah4=;
 b=2LGs24cmQ98HlhdFEb/wLEE04o8mnuvXCtanY2uiqQ9cS7TqCST2JPdUhl+d1slmJ4sltrAz8qh6X/WFWQZfHFaTsBJghFxmxFii7MaKZ/XNeeX1i1Ru+6zuubIx0uxN4oaBC5s/elHChuCpun3qI3A6iWvP3AXWcteVTJwYhUk=
Received: from BN9PR03CA0448.namprd03.prod.outlook.com (2603:10b6:408:113::33)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 16:19:24 +0000
Received: from BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::c8) by BN9PR03CA0448.outlook.office365.com
 (2603:10b6:408:113::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 16:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT102.mail.protection.outlook.com (10.13.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 16:19:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:19:22 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH] HID: amd_sfh: Support for additional light sensor
Date:   Tue, 11 Apr 2023 21:49:01 +0530
Message-ID: <20230411161901.909940-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT102:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: 842f7614-509a-4ab3-cf01-08db3aa883e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2OMOVy0ByQpqCGNXdpjIV9pJ06MeKt/QhuHauPIXDJbeHg3RLo+bU2MS0FkupK1ja1auPYUDBUYcLpIjjkEyb6eMdZbRIiOPdjnh7X4+lgYpbfDDds3ay306whyHJjVrUnc9XxY4BxMP4Hx9XcsjOYypJCr4Ba939KBo6Yuev8KIHNkj+vs6oEnLdGCN5LwknQByJzJFo38ByC0IsCTP7glBVYHFp4CT+MaM8I0UEEM6zhJXFI4Nrzbs1zz1z846gEYsesmujjQO8lF5F1/kpvmUSHVA0W4V+4B4uUKwaXQptoB836JWu/Ar0Kdfye/hRyB1Pv1gLsoIfyDzhUy/Qd9CNOarjEmegi1uTb7q8tlv6+rTyUUft1Ff3MWmPKPremP3N2zCn8cn8kSwkKkc5lxgpFZxkzEJp/LTpikgtsModY2IPMyQ7YLh8RELYhnVOPZUI/1IT7ZywdAi2q2ztWxvkhhyx8+J2Kc6k96MuaiOhifZwg3282ExGIC2edXI8SoBQ0JiaAkV0R5oHTTNPScAVmgFuvDoD+y+uSSZ3qGqm5mPhQMGggmSWDvWAfqSh+tY0nNYNFXaWozjFGIoQFvqYC/kguXkJeuwA4ufjb3AtDPuxBhlzLavDpTuqLEAfGoMYMgn/UhctAAgCowzjyG/MB98m8uB1iBGK6rCkBT9Q6UAjLudW/2ilFrLhNo57W2UKNRoPBkj+cZ55d84XL4AWTYDV3pHFNbBorjYCV0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(7696005)(478600001)(336012)(1076003)(36860700001)(316002)(110136005)(16526019)(26005)(186003)(2906002)(70586007)(70206006)(4326008)(8936002)(6666004)(8676002)(82310400005)(41300700001)(5660300002)(356005)(81166007)(82740400003)(47076005)(40480700001)(83380400001)(86362001)(40460700003)(36756003)(426003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:19:24.4734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842f7614-509a-4ab3-cf01-08db3aa883e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is support for additional light sensors in the SFH firmware.
As a result, add support for additional light sensors.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c                  | 1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c                    | 4 ++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h                    | 1 +
 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c | 4 ++++
 4 files changed, 10 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index c751d12f5df8..d9b7b01900b5 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -147,6 +147,7 @@ static const char *get_sensor_name(int idx)
 	case mag_idx:
 		return "magnetometer";
 	case als_idx:
+	case ACS_IDX: /* ambient color sensor */
 		return "ALS";
 	case HPD_IDX:
 		return "HPD";
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 47774b9ab3de..f37f817737f2 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -29,6 +29,7 @@
 #define MAGNO_EN	BIT(2)
 #define HPD_EN		BIT(16)
 #define ALS_EN		BIT(19)
+#define ACS_EN		BIT(22)
 
 static int sensor_mask_override = -1;
 module_param_named(sensor_mask, sensor_mask_override, int, 0444);
@@ -233,6 +234,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (HPD_EN & activestatus)
 		sensor_id[num_of_sensors++] = HPD_IDX;
 
+	if (ACS_EN & activestatus)
+		sensor_id[num_of_sensors++] = ACS_IDX;
+
 	return num_of_sensors;
 }
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index dfb7cabd82ef..70add75fc506 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -23,6 +23,7 @@
 #define V2_STATUS	0x2
 
 #define HPD_IDX		16
+#define ACS_IDX		22
 
 #define SENSOR_DISCOVERY_STATUS_MASK		GENMASK(5, 3)
 #define SENSOR_DISCOVERY_STATUS_SHIFT		3
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index f9a8c02d5a7b..8716a05950c8 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -48,6 +48,7 @@ static int get_report_descriptor(int sensor_idx, u8 *rep_desc)
 		       sizeof(comp3_report_descriptor));
 		break;
 	case als_idx: /* ambient light sensor */
+	case ACS_IDX: /* ambient color sensor */
 		memset(rep_desc, 0, sizeof(als_report_descriptor));
 		memcpy(rep_desc, als_report_descriptor,
 		       sizeof(als_report_descriptor));
@@ -97,6 +98,7 @@ static u32 get_descr_sz(int sensor_idx, int descriptor_name)
 		}
 		break;
 	case als_idx:
+	case ACS_IDX: /* ambient color sensor */
 		switch (descriptor_name) {
 		case descr_size:
 			return sizeof(als_report_descriptor);
@@ -174,6 +176,7 @@ static u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
 		report_size = sizeof(magno_feature);
 		break;
 	case als_idx:  /* ambient light sensor */
+	case ACS_IDX: /* ambient color sensor */
 		get_common_features(&als_feature.common_property, report_id);
 		als_feature.als_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
 		als_feature.als_sensitivity_min = HID_DEFAULT_MIN_VALUE;
@@ -245,6 +248,7 @@ static u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
 		report_size = sizeof(magno_input);
 		break;
 	case als_idx: /* Als */
+	case ACS_IDX: /* ambient color sensor */
 		get_common_inputs(&als_input.common_property, report_id);
 		/* For ALS ,V2 Platforms uses C2P_MSG5 register instead of DRAM access method */
 		if (supported_input == V2_STATUS)
-- 
2.25.1

