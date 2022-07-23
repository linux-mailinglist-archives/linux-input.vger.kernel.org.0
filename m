Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC1057EC43
	for <lists+linux-input@lfdr.de>; Sat, 23 Jul 2022 08:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiGWGLW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jul 2022 02:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbiGWGLV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jul 2022 02:11:21 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2054.outbound.protection.outlook.com [40.107.212.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEE53B961;
        Fri, 22 Jul 2022 23:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxNr3kJ/mNc4JVjeuAnj3y1uoBUpqmSfzauP2kqyuGEuYXYwnH+vKpCiEn+ciAriImPHxAumwNqilrlALkugKb7yAcinXaeSzEnbJ/bT1xgc5hAZiP3wxlpevEtIrLc2gq6VZXtL9Zb6mTFvuUN1NDvd/gCaZWtO+Jaf8J5jrlSQ2BrrXYselq4S2q5FSs91GLIfajYF3mT6eg5lGL4hDhNAoefdmMhs9o0sfvBDdMHBZljdzFdl5V2sCcXdquTPLsbfCNxikyvra0xG+4VWbvV3Ov8lNJTOaGCcIEuA/RNtjgZc60HiEyzu9cPr77pX+06dbr9vGtB9jgk9inmxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg0CWlX/OgTf0pmZVOziiWcjFWrIleA9qrvlinhckBc=;
 b=NAVggXICu4lOpY4OXOA9fw8av2WMilIFqmFWKf6JN4N5vT1l300LpVNYQnUW/rbR/7LfuttOtTrJSMo7sdlZT/+u2EJnCWS06mouLqJHs85vH/rDajVLBcg6pzsbTSCAvNjFqJjaFNQTTz3L9NBZiXS6MoMx/gAp1AgFenfJnkSFKDNOzNRedj1nDWSW5XgChJpL33m96I2j+emXIlgzHZ6jCdzJNZOkwzKstyGb2b8zSiRjgg6LZmREFXBQ/M12dwZBF2wlBI7cvFTwbfFi2wXNq91EC8OVTMbdU+nWBmMcL/J44z18pbIZXHveb1WZAi+q+48WKWD6WwKqIY+GQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg0CWlX/OgTf0pmZVOziiWcjFWrIleA9qrvlinhckBc=;
 b=kf+tG1DJYNzBsivpqX5Zn+cDmRzSzV2+NofgOySrzmcHX/0locQc2CMK9w0p4/cXiOc33XPmDHSefWYi44c+TdeEu1cAe2Z4XPYcBEOzvpot2hU+gy8u9sYSXMNmXl+TA16fXQq06XoRfYLWOCdhdInnlDtYp+Dbbo3N8hjvmIk=
Received: from MW4PR03CA0103.namprd03.prod.outlook.com (2603:10b6:303:b7::18)
 by BY5PR12MB3748.namprd12.prod.outlook.com (2603:10b6:a03:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Sat, 23 Jul
 2022 06:11:15 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::ca) by MW4PR03CA0103.outlook.office365.com
 (2603:10b6:303:b7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Sat, 23 Jul 2022 06:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 06:11:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 23 Jul
 2022 01:11:11 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rdunlap@infradead.org>, <linux-input@vger.kernel.org>,
        <linux-next@vger.kernel.org>
CC:     <sfr@canb.auug.org.au>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH for-next 1/2] HID: amd_sfh: Fix implicit declaration error on i386
Date:   Sat, 23 Jul 2022 11:40:32 +0530
Message-ID: <20220723061033.1377061-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
References: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667c789b-da58-48b0-6ce3-08da6c722677
X-MS-TrafficTypeDiagnostic: BY5PR12MB3748:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smjK/qn1FWyAQxQapQIQkjZSR5GU/ap9mRn9c234VakAfuPocmS7+B5Xi5EZOy8tnEd5CvFswe/AeJQ266kcJGIn/COfbHugGX3GlIrqhZkH7t/erMEGWMf2TCHkS1L4PvHwyBjU7ZOVscdyUINzUHbV3IOHRCiMQAAs3CIm6CXEnmM7PBh1+aQghBAvGAKAryZWhZA6kRPMZyk4ri7vESESXaVr9JDAsOvf+EZnKDCy/UH716CVtJ00iedwR7ml7adKbjIA0YTv5KsIB6JLsudlpd2KeMqkEG5nz0FTN2p/o2un/bR6fNaBQtphNzuC7Tct+FVpfSGbsSGBXFVEzLqn1StDbTPN6N685vbkD4fi1IwYU5bY0eR1lGZg8RUNkiDT9cQhwgy2AguQbDPIl8hl90CGSbD8jrl2/2yY4SqD5eD9cetAHhALnqMv+8IuCuNBDfhEp0GAxRy1z0hw5qvTpr3Mha0oDOPXm/8PTeSSxwxAB9DwmC8YDuPriSoPyYlR255ytAiTjreR3hfH/IfTi4Av5CL+bjBqP1uLoOMRPON/vv19GpWZr5kuKYXjEAsVc2TBHOAibGcHssh6LmKEQBiYWY3nmBAo/QcPf7uzv7kq1+cL/23VW2lAkoRHm7eOvpbJnj4Kh2l5fkOk+p5j62F+u58Sy4tdz84mhNiB9SsMxpcky/xkSS+gytMDCWzeqJyyl/bArlLBC/SN0FpMVcXhCQLmrjfW5Ni3UsjW/M2UFCQWKMTmafKpU5tnx5H/0YG9SV1Fm0hOsRDhcb+/rr39kX+qS8Mxeql/7kRojC8fzz/eIn5V6GlJRA2qoc8SNeMMBshBgYNXFEZ2BA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(36840700001)(46966006)(40470700004)(478600001)(5660300002)(86362001)(2616005)(54906003)(8936002)(47076005)(426003)(2906002)(6666004)(336012)(40480700001)(41300700001)(26005)(4744005)(1076003)(7696005)(16526019)(40460700003)(186003)(82310400005)(36756003)(356005)(70586007)(70206006)(82740400003)(36860700001)(316002)(81166007)(8676002)(110136005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 06:11:15.1904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667c789b-da58-48b0-6ce3-08da6c722677
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3748
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add depended header file to fix error on i386 due to implicit
declaration of function ‘writeq’.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 14a1578055b6..c6df959ec725 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -7,7 +7,9 @@
  *
  * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
+
 #include "amd_sfh_interface.h"
 
 static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
-- 
2.25.1

