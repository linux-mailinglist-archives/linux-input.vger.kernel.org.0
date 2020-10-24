Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA7C297B1F
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 08:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759817AbgJXGsJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 02:48:09 -0400
Received: from mail-co1nam11on2052.outbound.protection.outlook.com ([40.107.220.52]:21440
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1759762AbgJXGsJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 02:48:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EphFO0gGdDfIVLCJ3WG4RSPNirLqVt4Sig7ikerw224Z2IwIx7vBfcr7+LH5m9XV76NuMx/eR1KPKtNiopiw80+SK3v3AYWDu9EMRzaO/ikrAdTlzxbKOYQrX9Ab0m7S5BILkebrVsETpJdmINFC5+DSIhqQhrt9k8Ak5AahSefD4KUHbsY2oozowNIipskGvhwJxxnsyQzJiNCji981wQQf9q7pYIpwNdYz/RwdJ1vIIUBsQcC4d3r6tR1SDU0cQZEz1uvPsQyfdcZjMvjxKyVgGKtq2rPSfW61Tb5YJB3Wmz2sgIf7JBCJINyzFUXZF3gE5JsxN3TjEycuW+H5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKUgIFwVvzN2HN0kOS7zv/hW4bzROd886lAjKCqq8IA=;
 b=lShgKWB8YFb2ypxOiQ7qHmeSMm3Z0ddlnLgFf8Ddx3NHC6RC8gdph4Zk8Ah9g70RauUGN4V9MWuwDwiniQGcZgHh6TwEOyE1LaH+c9KIYG/p0rQFU0LJFD/H46PhtKSNO7WVa3M2NaUXlyp0TrgR6n/pigbzWaCQhGy7vM6+YPRUl6Cihavhj+JNWniTMGLOmxDZDRUBgBLr/hyD2fkOT7Y1c2UppvIn/P8PzbiRgGK+UFyka/3D4GivHvdFCISxRuJOVot1rrlrNJJY8CiFqVd2VQYwNeT/z81xC17Z9+uMNRa5eAbgb6BE/3VUA3mwv4h6jvQCy22j08SyANpKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKUgIFwVvzN2HN0kOS7zv/hW4bzROd886lAjKCqq8IA=;
 b=ow8qUBHrWimceASw5A3y4TQxlzchzt07RD9mmMsD3jdW+AlFhk9gIj2fbi0jqojg/RZYhcWrs76gD0kW36whrZ+brUoycmoSqUrJkLgrYcA79zxb/p8yERzg4SgmD/Z9ccL4EhiIksv+rTiqbhGyIsP+RozLo5yJW3lZEU1D3Yc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Sat, 24 Oct
 2020 06:48:06 +0000
Received: from BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d]) by BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d%5]) with mapi id 15.20.3477.029; Sat, 24 Oct 2020
 06:48:06 +0000
From:   Sandeep Singh <Sandeep.Singh@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jic23@kernel.org, Nehal-bakulchandra.Shah@amd.com
Cc:     mail@richard-neumann.de, Shyam-sundar.S-k@amd.com,
        lipheng@hanmail.net, Sandeep Singh <sandeep.singh@amd.com>
Subject: [PATCH v2] AMD_SFH: Fix for incorrect Sensor index
Date:   Sat, 24 Oct 2020 12:17:42 +0530
Message-Id: <20201024064742.763600-1-Sandeep.Singh@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::31) To BY5PR12MB4098.namprd12.prod.outlook.com
 (2603:10b6:a03:205::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0115.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Sat, 24 Oct 2020 06:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f3d3862-e85c-4891-e3df-08d877e8c2e5
X-MS-TrafficTypeDiagnostic: BY5PR12MB4242:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4242D175A7E301D30DD28E06E01B0@BY5PR12MB4242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2aRfbK2tE8S0DpdaqOJNrTo4N93gos64MdN+LWMQhrMy63lHyxfstdpzrsRP5T1sKAD8tqagvsAEspMqgL/IWjG2i3DLaX3O/GibsxnGai0D0O8THBTiP+Q3c8aCsdSQXaxthNlPNKDV8/BYEEJOqhE2FidxWTAnu5D3e1paMlsOHu4cOm8EhutmoVy2HVSD4u4TomOsBS8Ba0nWMU4sQKRTJ6dDZ8aL01KXAbTupC/YemnmBTTZIP/40Pd7PBwDZ2LjHoNufsXHp0BMdvCDSCxTwrJ+WaG+A7qGDj0lxL+V5MMYMR2FglU4k5V+cPjv1OgrIlL+oMj1kCF5d7E4ZhJvQPk24iDrly2lVYrzains1oh5S27lripULs/dgdE0rmzCq8WCHKwMtFZ75AB7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(316002)(66476007)(4326008)(186003)(26005)(66946007)(86362001)(36756003)(5660300002)(52116002)(7696005)(16526019)(6636002)(2906002)(66556008)(956004)(478600001)(6666004)(8676002)(1076003)(6486002)(2616005)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sAhYvNNrofnAK7ok1lcIFYwAI2kMY+gTUv+tH2ITodpjHxHEUThSOnGppr/j5jNne/CyQCO6xhvHjCHodB4PfhrG393aq/zE+9yqZvTchWYvu2dcQyXtVnq5TkPKxTDHK742dTCyGR9iQ9A1aoI4zafAlxeHhGBTBvf5TqLLbiO161FB4xa5Dn/hNJJ7+X+La8RUbn8V18FudfBLxMzfBbUsgBunsRcVygPnkhkXjzsPn0ItHJNNtA4cZFBIbB0MTS5qm6GkPrFz/XI8S+eLVIJeTr730FQBog2/HMgCAyhKXpTbiVcvPX/ViOuEXq8lPE+jlT+H0KsifacoXjmV9c3meTpf7B0hyrE6Pu/3GUhyRDnZuKxevRMmQ9MoNauRN3SDx3dUw3Z329nNq+dAbhEUU5/yfbXiRaF3G4NcK1BfhzTfzfLXHYp1BQmT4d2zZZj3uTK7TJrIvh/37xkn9HNFPFQJ1K5/bvZlTqL5Pb/U6G0YRzuIU8yjUbr3kC6+NU0X9U5E4q4Fs2+9514c3NIdcycCkvmiiMf6J5bYa+CWdYc9HLmvySEiEo5eB9gAhdGr+LZ/sox3xARgmwt9Hzn7i5mulp56Jve3RGlDrI3Xunvx+4EX7PvucmJ77SHdIPYy4gzI9YTaUn7/L0WvzQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3d3862-e85c-4891-e3df-08d877e8c2e5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2020 06:48:06.1955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H795OxWmX4d5db+z38P4yM/HaH3ranMuFbhpF9SMyFPzww575n58vLrpZLfppgGC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sandeep Singh <sandeep.singh@amd.com>

Add fix for incorrect sensor index and minor code clean-up.

Reported-by: Mandoli <lipheng@hanmail.net>
Reported-by: Richard Neumann <mail@richard-neumann.de>
Signed-off-by: Sandeep Singh <sandeep.singh@amd.com>
Fixes: SFH: PCIe driver to add support of AMD sensor fusion hub (4f567b9f8141)
---
Changes since v1:(https://lkml.org/lkml/2020/10/23/172)
	-> Add Reported by : Richard Neumann

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |  6 +++---
 .../amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h  | 14 --------------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 9c5eb442e1a6..a51c7b76283b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -20,9 +20,9 @@
 #define DRIVER_NAME	"pcie_mp2_amd"
 #define DRIVER_DESC	"AMD(R) PCIe MP2 Communication Driver"
 
-#define ACEL_EN		BIT(1)
-#define GYRO_EN		BIT(2)
-#define MAGNO_EN	BIT(3)
+#define ACEL_EN		BIT(0)
+#define GYRO_EN		BIT(1)
+#define MAGNO_EN		BIT(2)
 #define ALS_EN		BIT(19)
 
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index ac9a01cc1454..095c471d8fd6 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -16,11 +16,6 @@ enum desc_type {
 	feature_size,
 };
 
-struct _hid_report_descriptor {
-	u8 bDescriptorType;
-	u8 wDescriptorLength;
-};
-
 struct common_feature_property {
 	/* common properties */
 	u8 report_id;
@@ -38,15 +33,6 @@ struct common_input_property {
 	u8 event_type;
 } __packed;
 
-struct _hid_device_descriptor {
-	u8 bLength;
-	u8 bDescriptorType;
-	u8 bcdHID[2];
-	u8 bCountryCode;
-	u8 bNumDescriptors;
-	struct _hid_report_descriptor *reports;
-};
-
 struct accel3_feature_report {
 	struct common_feature_property common_property;
 	/* properties specific to this sensor */
-- 
2.25.1

