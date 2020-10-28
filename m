Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5966029D8A1
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 23:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388027AbgJ1Wep (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 18:34:45 -0400
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com ([40.107.93.40]:41825
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387529AbgJ1WcG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:32:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyF+fjToWT52pGgbOmP3kv6a0TQscugvPXZrt5eUTdxFRQhKxCLVxIm72YPts5jjLhVedJLoOn0+qrJGvcwbpA95vpV7ODCnJ31Uwsem10oGHJcNNAdWModirr2QHZzxATHzJMqfiNE3NXGPABNLB1Vtm771GGNPC/0wxbO60zjbF9xy0GAhjvupeFUBZ3tlUTf7mWSXKT2ouo19PryoRT2Kycp4RtKSAmxjmn91VPi37roz2Eh2HD+WtdYkvmHC6hCrJyMWCRJw+beVg38XB+tlY/G+zbmagTYe8Ww/D5YalnPuexehwf0xJwpR26nhbnMb8JhncmuhBYUb3MzUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNHZ6QE2kz0rzJDxJ8agwRI+miR67gp6zQFzF2f2+Cc=;
 b=HpJcCqrp7ZbkMwbJ9wDYjbDeGIUBhB/y1i4icwcHbfYNR58VjCZHcBmZ0h/neKu0szYXY8XQFDOm30tDQ8G0eo5IdSsLsVAB+M6yCprlMOQysQBbY6c5EYHNpUHjdZC5mN+cPa/AilJc7nvcoK24CiG77XlfM55qF5X80u8vtEru3Pkgx+ccY0zkiA5FMYd++sxkhJsf7Bcuz9xodWFLgJMz0Fv/Vu5jUa/tjy/BNtTFcjymz1d2aZyieskSyre+9p/c+hNDp/94mY2H32ewAv6Lbh3x4mYc2dYEt8F+zILqEfw4CTLQNMrTwim3fcU+uiDtp4oml26S5jv8yuHa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNHZ6QE2kz0rzJDxJ8agwRI+miR67gp6zQFzF2f2+Cc=;
 b=WY4ytmOxhekLYodxRZYqmMBlWYQYGIBwFwPHvpqH4pVXsNzGknP82Wp7fdpPouCf9P+uQUxpcaon4CY13GR4vI6D2z3SOnHMXAhuy2IoErLe96wPyRm6Z3UL4kFmzDOlQM8jQQ2o+Vlkf6tGwieSt6xFUBkM7mGMtkG7K7lTet8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 by BY5PR12MB4919.namprd12.prod.outlook.com (2603:10b6:a03:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 09:00:37 +0000
Received: from BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d]) by BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d%7]) with mapi id 15.20.3499.019; Wed, 28 Oct 2020
 09:00:37 +0000
From:   Sandeep Singh <Sandeep.Singh@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jic23@kernel.org, Nehal-bakulchandra.Shah@amd.com
Cc:     mail@richard-neumann.de, Shyam-sundar.S-k@amd.com,
        lipheng@hanmail.net, Sandeep Singh <sandeep.singh@amd.com>
Subject: [PATCH v3] AMD_SFH: Fix for incorrect Sensor index
Date:   Wed, 28 Oct 2020 14:30:10 +0530
Message-Id: <20201028090010.2689060-1-Sandeep.Singh@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To BY5PR12MB4098.namprd12.prod.outlook.com
 (2603:10b6:a03:205::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR01CA0123.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:35::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 09:00:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6baa59d-58d0-4d6e-b256-08d87b1fefe2
X-MS-TrafficTypeDiagnostic: BY5PR12MB4919:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB491989B09588EADC76F391E6E0170@BY5PR12MB4919.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEixEBbk0IyXzwPEuIyvMPf0AS+W+qbOsp21bR6Lmk5Gymp+687WrSnKwLsZU/Xy8RWNpF8YyKuCvBcDbxWWYw5c2SvATv2CPRvy3q/Gkk5UojIS1zXLvFV1xsKhSwYGDHCI0LK1EWKQ5aI+kGtxY1Tio2m4IBpsmsIhLcSiZEP3u9lutyGLRAq4XQCGUYNMHv/W+iI+CTpsbPhOHjH6tcatzAcCrSPSrNHM/10dyCgzTlBUxlamu7h+8vN7yBNcUItoDokwSnhqnKlLibEFRmF7dV30sxi6Xrwug7h7n0D9r/qOaxuyWCjOLkKoWYZMYzvuN2lHD5WD4M4GjYLXChl88itnuzC5xczHubPcdxaDR6WulUR66U5KJCVkG3kOAgtajvl8PXLG2Qh4L390sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(8676002)(36756003)(6666004)(66946007)(2906002)(66556008)(66476007)(8936002)(316002)(6636002)(478600001)(2616005)(83380400001)(86362001)(186003)(16526019)(6486002)(5660300002)(4326008)(26005)(52116002)(7696005)(956004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hUBr5nyyy+c1jmJJBjlnYgAX1gAnFa5Y5whrfzBfGn+h2tfDWrEVw98l3sfSCvhrGiKnR9XxYEFLu2BQ8/hfnIhHu1IipCGCV3AmzMaAJw6oVy65d27aJgEx/N1WcvXIZ1MK8ukJEXo5SmbwoscbM2G36hnAZg6Wq2Ydqz73pcZ4VoKUXxwBpIqiXt1ZxUXcpwRcqmPbVxShydmOwwsDH2xwWFIfKR2+Fb3DVJazWznW6N8+44uxkGldqyOIHgAFVvm3BryOZRyWShxW6KbzHyYUwogGwtfcOS9yBOsoG6Jis1o1I4bUJR0xbrF+Xc3SiZtQFSlNpROu04REhg+1POlGJCaGsdm3b9irfxvH3/5EGiQkb7/KDXlD1ffDC0TCx1RRBEPOqL4N/mSUaCFYDdT7QLKrZLGRGC8ngh/DgI/wMemwOf2miLE7XRBmvMekXfMvc23hUIBKEDWZFFw85ds4nrRgaBhV2njbmjWCMkb3YC4ngDRmZMyv1aEdUEWN+4+xQ/bs5W1FKXUHzWy9+T2XyRa7AWA34Z/EKGGUfmj77OZ0oWEj8e8uJqTEWnCcPkR9n5I8VXtaARh1wliHfe3owaP80X0eDuah7SamqrdZ3sNaLG5TuzBRqdNA+LD6+cZyV22RMaXXtnwThSXX7g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6baa59d-58d0-4d6e-b256-08d87b1fefe2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 09:00:37.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcYbUFP80AS/pZPZOHG/5NqisiYB3JwvttocIp/ZKhHiiKq7XdnrqGafWdliVjYL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4919
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sandeep Singh <sandeep.singh@amd.com>

It appears like the accelerometer/magnetometer and gyroscope
indices were interchanged in the patch series which got into
for-5.11/amd-sfh-hid until Mandoli/Richard reported to us.
Ideally sensor indices should be 0,1,2 for the accelerometer,
Gyroscope, Magnetometer respectively, but this interchanged
possibly could be because i was using a test MP2 firmware
on my machine.

This patch fixes the earlier commit with the right sensor
indices and also removing unused structures
_hid_report_descriptor,
_hid_device_descriptor as reported by Richard.

Reported-by: Mandoli <lipheng@hanmail.net>
Reported-by: Richard Neumann <mail@richard-neumann.de>
Signed-off-by: Sandeep Singh <sandeep.singh@amd.com>
Fixes: SFH: PCIe driver to add support of AMD sensor fusion hub (4f567b9f8141)
---

Changes since v1:(https://lkml.org/lkml/2020/10/23/172)
	-> Add Reported by : Richard Neumann

Changes since v2:(https://lkml.org/lkml/2020/10/24/22)
	-> Modified commit message 

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

