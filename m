Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA8F3B1133
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 03:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhFWBHJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 21:07:09 -0400
Received: from mx0b-000eb902.pphosted.com ([205.220.177.212]:52230 "EHLO
        mx0b-000eb902.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229751AbhFWBHJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 21:07:09 -0400
X-Greylist: delayed 3963 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 21:07:08 EDT
Received: from pps.filterd (m0220299.ppops.net [127.0.0.1])
        by mx0a-000eb902.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MNtfv9031444;
        Tue, 22 Jun 2021 18:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps1; bh=YqXlYX4cbBb+rKcTFiBhfJL/yuO5lzjI/HftG3gUD/Q=;
 b=LrN/xO1/k30vIT7okMkdBnh6CjLxAMOGJ+oYsR4vWMuWcmloQE711xTZEC0SganXaT5r
 Z0zWtzuOX6+xp8+ge0i90EF+4IaHNutIvlm1bue/tzt4PQ+fgqoZcv383uK2yZZVcSHV
 q9sI0e0xbqy9AjTcGIMEea2FyJxo9ogJqktq+JT2b9PCw69SpVem66GOZ0oiDsGpgukQ
 MaBGY08g4uq0/swdcho6HGO/X4ndfJVBjfhoGO83cr+SV1M/FMRwS0hLZuIpzseShV04
 JVD3NlHD8Bv+HVRtUmD1f9YXkMuvRW35Kl29CIZT43ouK/utIlwv4M4d/9tJWF99nVY1 Rg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
        by mx0a-000eb902.pphosted.com with ESMTP id 39at8njyt7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 18:58:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJXRh+6TaDa3fWZ+hj/IRVNSNM+Bk0y66P9eWp5FpQTwEEqSsGuBRQ/oa682VHnANCPIWNOOHQO9RYlUYCrLDmoaLCrdPHd4dnJzn5yL5/fKsZOrUGGwFWjQBa3TgWleTSj5XRIjwFkSawdGzLVI5AOaOIcwlOyW0t/BKPF6Wem96L/UzhlH/B3saWPRHzK69u4TejZRkBqRa3lWgQqMBr7WD8Qk52p3LekJYagK1n0MrBl081N9Jv9fwuSIpRA5fgwI8NBBEXXHOafOmtuptydB5Sk88EMTb39+VbqXkUbx0EVvzgurPoooSa8wtMYM135aqvqWfaXK4+e9r5KHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqXlYX4cbBb+rKcTFiBhfJL/yuO5lzjI/HftG3gUD/Q=;
 b=G0WkLsf0n36ph3MqKk9m+xgfYEZSbCH1/1Tu8ONFywM3ollB1HveQbD6v75PHMGxGEKWFrPj9ELOpiDYCIImlk3mHbv9jPpUpIaxHSNY/qrxBoK/lYp7RbNvNOXyx+vS0T9VthkQUsuhdfHKUNGHErG/7vxVkH0BtPIDDdrr3QIKOeJjTOGfAOCT17LJWykdVda1QwNlwUOWcFSTNOrrkI7dcnf4Onexsy1vvKmGOAJFk/KxDxbztXY2jq+4llbj4vzE3EFzxFXvx9Ma9x/WOz44rBSaU1NLZoGZsIt1C+FIkqapTajzYdtOLViHN+NjkwglrZ4+51k9/jxBzCeokQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqXlYX4cbBb+rKcTFiBhfJL/yuO5lzjI/HftG3gUD/Q=;
 b=Ljawmh2RG11Olej7HBv+HREcBcIrugVRBrsQcHa1Y0XuMo7r6t2iYB7u230nqmePchNTRfsuCEyN++v5nUUBiUMZKHN+wKBaB2Y6g/5IoKG8Vh92vZ22RVOg0Lg6libkFIJN49OjTHkaWTOHpoZsKKzM1xu0IxLFxROaIqDeJHACjb2AerVyKqT9ucrW+/AKAt6vH+RaeDMLyUQXhcNwb8m+JsxxZXC9zS618XHNR71xa6vx8M96oB1E3DQk8+aWch6TtJGkCoByzELgZ2oNhLXD5MLjNRYO4ZnvhyM+3vHJSl//3zTzxytKoFUpvNoOgs6DV4LdNSY/8LO2+WhRJg==
Received: from BN9PR03CA0849.namprd03.prod.outlook.com (2603:10b6:408:13d::14)
 by BYAPR04MB5045.namprd04.prod.outlook.com (2603:10b6:a03:4b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Tue, 22 Jun
 2021 23:58:25 +0000
Received: from BN7NAM10FT024.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::a7) by BN9PR03CA0849.outlook.office365.com
 (2603:10b6:408:13d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 22 Jun 2021 23:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=olawpa-edge2.garmin.com;
Received: from olawpa-edge2.garmin.com (204.77.163.244) by
 BN7NAM10FT024.mail.protection.outlook.com (10.13.156.244) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 23:58:25 +0000
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
 olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 22 Jun 2021 18:58:18 -0500
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
 OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.10; Tue, 22 Jun 2021 18:58:24 -0500
Received: from OLA-DKH2RP2.ad.garmin.com (10.5.84.15) by smtp.garmin.com
 (10.5.144.15) with Microsoft SMTP Server id 15.1.2242.10 via Frontend
 Transport; Tue, 22 Jun 2021 18:58:23 -0500
From:   Matthew Stephenson <matthew.stephenson2@garmin.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Matthew Stephenson <matthew.stephenson2@garmin.com>
Subject: [PATCH] input: Add Marine Navigation Keycodes
Date:   Tue, 22 Jun 2021 18:57:08 -0500
Message-ID: <20210622235708.8828-1-matthew.stephenson2@garmin.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89aec984-3093-4335-dc0c-08d935d99fab
X-MS-TrafficTypeDiagnostic: BYAPR04MB5045:
X-Microsoft-Antispam-PRVS: <BYAPR04MB504593588BA72219AB493BD2C2099@BYAPR04MB5045.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d6YTevGm6YknByNy9GrxLlGAY/iGP/lVPgwIG3w/z0qhOHID2tULTbuK21H0OK6esWmLdDaZupSDd2XZ41bAFO75Ehvo/HvCV0nb1lxPIlXdlwpWDX1wX4wdf3MBSgYHj3E/cM9MTiI6OQzRtSh291En8QKgvbWP1D1ujBiX9/ZaxTg/V4aEZZi1nXZru8Qy30U6m8hihasEfWO5dzYoH2IQoBDPhxrjgKn/L+/pHeBZy/5wv6jx3QHmz4H4ScHiJO7mRuSRXiYsoZTh43bhcfWbG6w2KG51aEs/gu0sNBnK59mNrPL2ZdScX7c0nO5YsCPIwIKl5UVjsVPVyG93e+jNW+Ht7JAtqpOg4s7oyOpdrxdkMsCI6dbmlAF3AczcBnZgZglwrUrEkT/iaxe6Fq/iR0wbZPnW8/qVEMaNIhZ9nhKRiLtb9hzyn8S50WYa0xTqQjBlcs0l5js7miClWNul2PvRa0J52RMacVtEZwoonuAGX1CNi+gdrH3xFMYv7py0dhhO4zsTkV/vNUV+y2QKJxyk5f2Xn/EXyELdgf+qXVWGgtkhgJAlylLb6KvZlSGzf135XrjVPwrH94NGiJ7M1msY+uuYdjmDa5J2N8oztb0KyPcVvNDb87ajCvDb4IhPv3o2d3kK5VgSTRy0UhbELrgYkJCsQu4WSi6T2WM=
X-Forefront-Antispam-Report: CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:olawpa-edge2.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(39860400002)(36840700001)(46966006)(110136005)(70586007)(70206006)(4326008)(26005)(107886003)(316002)(5660300002)(8936002)(36860700001)(356005)(7696005)(82740400003)(7636003)(186003)(8676002)(336012)(2906002)(66574015)(86362001)(426003)(47076005)(6666004)(82310400003)(1076003)(2616005)(478600001)(36756003);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 23:58:25.1612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89aec984-3093-4335-dc0c-08d935d99fab
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[olawpa-edge2.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT024.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5045
X-Proofpoint-GUID: XXa4fHU_fVZ8HkplrnusGPj_KCrk2p0-
X-Proofpoint-ORIG-GUID: XXa4fHU_fVZ8HkplrnusGPj_KCrk2p0-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_14:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 mlxlogscore=842 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220135
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add keycodes that are used by marine navigation devices

Signed-off-by: Matthew Stephenson <matthew.stephenson2@garmin.com>
---
 include/uapi/linux/input-event-codes.h | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index ee93428ced9a..4d5e5cd17a7b 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -659,6 +659,33 @@
 /* Select an area of screen to be copied */
 #define KEY_SELECTIVE_SCREENSHOT	0x27a
 
+/* Toggle the focus in or out */
+#define KEY_FOCUSE_TOGGLE		0x27b
+
+/* Move between highlightable items */
+#define KEY_NEXT_HIGHLIGHT		0x27c
+#define KEY_PREVIOUS_HIGHLIGHT		0x27d
+
+/* Toggle Autopilot enagement */
+#define KEY_AUTOPILOT_ENGAGE_TOGGLE	0x27e
+
+/* Navigate Displays */
+#define KEY_NEXT_DISPLAY		0x27f
+#define KEY_PREVIOUS_DISPLAY		0x280
+
+/* Shortcut Keys */
+#define KEY_MARK_WAYPOINT		0x281
+#define KEY_SOS			0x282
+#define KEY_NAV_CHART			0x283
+#define KEY_FISHING_CHART		0x284
+#define KEY_SINGLE_RANGE_RADAR		0x285
+#define KEY_DUAL_RANGE_RADAR		0x286
+#define KEY_RADAR_OVERLAY		0x287
+#define KEY_TRADITIONAL_SONAR		0x288
+#define KEY_CLEARVU_SONAR		0x289
+#define KEY_SIDEVU_SONAR		0x28a
+#define KEY_NAV_INFO			0x28d
+
 /*
  * Some keyboards have keys which do not have a defined meaning, these keys
  * are intended to be programmed / bound to macros by the user. For most
-- 
2.32.0

