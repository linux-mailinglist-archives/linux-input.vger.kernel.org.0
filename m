Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1328F296B9A
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 11:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S460812AbgJWJAX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 05:00:23 -0400
Received: from mail-mw2nam12on2087.outbound.protection.outlook.com ([40.107.244.87]:20416
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S460791AbgJWJAW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 05:00:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1JIRbFGKItHRaXuoMa83Ux7x//mc1FGAfdW8xdV2rxvdNBX9zz2NEHhyfuZhBqGTJGvDouPHnPcj1+3mBkgRy3JDYGiyRCkIYdwrn8BALk3xWEe0LW9oOVIqlHR+OmDtQwonsvcJB1eqFLDsD1vXwBVhcX7F4tM3LdoFK3AfE7bcxEOR+mKKsE7OTE64xybs+sicHqtXetWkc82ANHT20MhwlHvMeH5XIBMdKQ3UnWVy87WG3jZMFRj9NGyjiFZo7BOEHJLA7qYEonm4QCTOnyjdN934Y8ghFliZnAE+Z3vyq9KNjAcKrMfRPpSp1uIQSgTK4kFQjaMoMUuVRGJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tbe6b4yArxPUiye+IBtPG1wM0EGlD9sThHPwl7dNVd8=;
 b=HghJiNNdHu1sXZQERTiSE1JPNZUTm76bCHCq4bn6jTxaAuUejukfhphW9FNllStpRaG9qAXxgBklYa+1naKY/dwpyitstQ7YgMQ7RFPXAmOm0A5nv734dK1FtW1y+SlP6opmEF3YcxVEC2pLi9PSNRuG62HW0WObZmRE+3BrqGawAsG9Jtuxf9/GK68crlQoO5G3WgLnHZIApAtZKLWAlqm3gFbQcrJEX2/Kx2Xx4VrCVR84E/2T9rg/ZO9iLPKpyoSLkHcKKk8QmJMKgk/DUmqCd2wbgFkyL+O3zMf8MJ6iRy0iqQiPx43242pfaRAUin0uAp5db6pd/lWr/1G/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tbe6b4yArxPUiye+IBtPG1wM0EGlD9sThHPwl7dNVd8=;
 b=M+OjETXZZPybH54UQdzse6GfAi6BTfVqZyfgRG2eNs1G5bo+8H34Z8+Ps5P1Rode1YGTZnwygH4yftyrGjZopuLL2Ax2SNkuDkjqzCD4jMtxzdkIue6fQsy1K5dZTU/aeeVIx7g40HA6tF8J0KrXk9b7deo67FvaZd3Ie3qeyMo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 by BYAPR12MB2902.namprd12.prod.outlook.com (2603:10b6:a03:12f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 23 Oct
 2020 09:00:18 +0000
Received: from BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d]) by BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d%5]) with mapi id 15.20.3477.029; Fri, 23 Oct 2020
 09:00:18 +0000
From:   Sandeep Singh <Sandeep.Singh@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jic23@kernel.org, Nehal-bakulchandra.Shah@amd.com
Cc:     Shyam-sundar.S-k@amd.com, lipheng@hanmail.net,
        Sandeep Singh <sandeep.singh@amd.com>
Subject: [PATCH] AMD_SFH: Fix for incorrect Sensor index
Date:   Fri, 23 Oct 2020 14:29:47 +0530
Message-Id: <20201023085947.459045-1-Sandeep.Singh@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::14) To BY5PR12MB4098.namprd12.prod.outlook.com
 (2603:10b6:a03:205::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR0101CA0028.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Fri, 23 Oct 2020 09:00:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6c5a573-37d7-457b-c41f-08d8773210a5
X-MS-TrafficTypeDiagnostic: BYAPR12MB2902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB2902F639C882AB83A193F606E01A0@BYAPR12MB2902.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S//H0w2vWlVbPpD5wplIII7uDk2kZOFqH8PoO3aQB1KefRsozqMSz4fdVnU6pao3JqEw4o7XZx052jGoHrMdNwDnnZax9nSkB7nJu0ixJPnSXRNJJFDWStRX7zh6nt8S7GTrc3Ogxv8iE4LaVrU5bZLF+zNpd+GTSh0M9VKvLhfm79b+Bq4AGZ5E2lhl8ZEqUjCVedRLTlnfYBf2PWuG41e7fgSNkMrK1ew+yhGTWEUispHs9/UYMtFdMfVA4esHbi4VbTb2kHVgkvRoNPGbeJm8bYnufJ1aOc18jz3sJ2NNhOXxOlMvOnx/0vfhwmB0BJdza8H+V29A9xBip6l26w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(6486002)(66946007)(316002)(86362001)(26005)(2616005)(478600001)(956004)(4326008)(16526019)(8936002)(186003)(6636002)(36756003)(8676002)(2906002)(66476007)(52116002)(7696005)(66556008)(5660300002)(1076003)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kvsalSQ4tRKEmeGz6wAHsMIlUKRwt47Uc2CxrxmWNcbcBWvPDZQnpOuLCZI3bXH7IOYnxik2rD+kYhGRjwlLt5Dy6zLcfVTJA2CWzbxkKa0159OdzT10frjJcFEw3XlysMm6oD2u1q0hHKywgOey02EKP4j9DdvqIRu+6Gb+IfXSFCgDT6yzlV7Qcz41EaDkqRE3yrAAvVpQ8bQqnMbXBJWAyG4nMnfGfVsFrpF2yrpe7x9Vu19sMIx5v17scZ5dnyigqMnpLiILHZmz6g1/mjJ4OasKqaao7HMhrppKPXpE9FS1xGRPgzA5CJnz4CnZyK9unX4Tj53u21dYJP3S3mSV6Kktl6H/rsM7pSAYLwJdLDuuziwaHwgr8R7TXY2tEF9KH77vhMI6yU1KMb6capGuoyHQMbCiTx8Y5v35/tIFmifHBE8Eu6sdJ+oh+MOMRU67TGv0lOjxeDJlxHg8wermHo7GfuTc76SS1QK+oX5JhdtbnQc0/zgjbuWPffKewu/0rYVXsKCp9FSDCVRrvboC5AfgisJtMGY24MD6sIxvoStAlHcSLijpAqNV184JIGO7+o066DKkjhU6L0BniLii/hdf15pxVe0f0EvpyByWK79O0LLFcKtTEg88HUstZ/dzEQmh6uI/vItiyLFqqg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c5a573-37d7-457b-c41f-08d8773210a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 09:00:18.6335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQkCdWaQg35OJ4xHoKAkkJT1NiEYsCHgU2K7UrjhcknSYhG6RTyXZnubce3x/aLU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2902
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sandeep Singh <sandeep.singh@amd.com>

Add fix for incorrect sensor index and minor code clean-up.

Reported-by: Mandoli <lipheng@hanmail.net>
Signed-off-by: Sandeep Singh <sandeep.singh@amd.com>
Fixes: SFH: PCIe driver to add support of AMD sensor fusion hub (4f567b9f8141)
---
This patch can be applied on = for-5.11/amd-sfh-hid

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

