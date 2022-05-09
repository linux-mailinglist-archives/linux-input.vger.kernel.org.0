Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D04251FE16
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235738AbiEINZa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235747AbiEINZO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:14 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8032528E
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNlJLu7+uKqvdb7IpvEMkAMmXqGzjK1FxDHyu4iJAlDI+41G8CJY6f2ncpn71demKac0rCer5BXX4QsYr6ub/PZWahXzF5n65rjSfv11PTd2eHm+GbMlGXgYs42DL+1u/eQYW0XvpTxWFh+erJODbSG/Ti8vkV22BWgWFoSYwVRq5VkyeY527ZV3Sl808ZwZDY1Mv+AyictEyUYZP4WIQPIEqcrnSIsT7RdwCdz6WqV9HGyoR7UaNI1JglLjxMU292TfRqFG3LVACSwHcWtw9jbcm95OZlyW57XgHxJ7j7owGbMwLwp7L2W0eqBlRuq7UFT+mAHT5BzLJrtp7eQ2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/9AwMlTHlvZuHme8DWKXDtsU3EPDj5BcnpyR+K8ESw=;
 b=OXxtfCKE4mMnSWwyZrptGK+dLUZjBBXPh08s4vzz1FmTednUOtPf/cu8AiyNwg3WO9zwofK3PxqDwqPIE8yyQP+BVrqAXE1HT/HFAsJJBsT7LCZ0nnJASe/U40EFF+sbKxyDNhpjhTenXGMpZ3QjjOJzbqcRFI+wkgsFRHBJocPIQ7R9LbpkKsD2kimFLdDmWbhXMdZW46x550F8l3lP1ocAJNdGcpoYb3p9QQk1Iw/PrgPjTG4Psic8mFpibeBI6Hnw7pzFcrcX6Am0ClQMcjaCH7ARdKfazGpSihD3r+0ZBCnAloZ+OylHZiR+IpU7CswTH0nihCc09oRC99fFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/9AwMlTHlvZuHme8DWKXDtsU3EPDj5BcnpyR+K8ESw=;
 b=JkH7YQh3l1A6i8Ike+hyDFAtPURwUbL9BHIIWcBbw7Z8vu/E8kgpTZ74Ap567xm4AMmXXe8woZdeshYXpjrIh7T6Mi/ToJxYSYmhuQbz6kEM13OD7xk3Vnm063nnpxdPICnetjSIBo0d8dr790DQ1cTam0q0TZs8uEdTGj3uOaY=
Received: from MW4PR03CA0108.namprd03.prod.outlook.com (2603:10b6:303:b7::23)
 by DM5PR12MB2503.namprd12.prod.outlook.com (2603:10b6:4:b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 13:21:17 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::22) by MW4PR03CA0108.outlook.office365.com
 (2603:10b6:303:b7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 13:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:13 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 7/7] HID: core: Display "SENSOR HUB" for sensor hub bus string in hid_info
Date:   Mon, 9 May 2022 18:50:26 +0530
Message-ID: <20220509132026.3204678-8-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
References: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fefa674b-959a-4c32-ac22-08da31becc3b
X-MS-TrafficTypeDiagnostic: DM5PR12MB2503:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB2503F607ED945505F52CE850E6C69@DM5PR12MB2503.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KmlS+3cBucN425t2DiA1o88ALf85C6m7z7Wf8mkRHgxrPKD9eF3xovBLZvL5xRliB6SOxG1IpamN0Sv3Kk55mkGqA6z3jaucpumiJkdW9fhmd+a/RFqPIOzeR9gwy35URM0bFP8y5OdXIrZkQ6SAQRdHA6TvEEA+wn+Bce55xpfp+C0B5QVV9Yy7w3HvfQztVIij2ASIuiYquqBp9citUNM6+fbJ9o1H4a6aKoJyshw3Aqq52FPIm+7kEzvzAiuCsbCMGi24xNz9LCVeebXfmpSym0td/bR3b7Ff62y3z0GDXJx6aqWQ2fjWFi7IRxcYyx6jouI8Pv2SgtdqRY50Ha5+gKwQBA/leN6bdejcAvvU6SJHm7kCUaybxWClnSVoNYJv1bAXHGuW+SzvyMZcmVXXkXJEO1/4J+vmxtNnVpD6nZY2Q/vPjpN9t2QFt0WYstVrmK8tb4beqvnl5iZRn9p6fXm85sIvUZg3BI5Ewqw1ymr5x3PbGaBx0In42a1JHyjjkWlv38lJXU1q/u0fIYyxKHxNiYrVcCKLYFnio5mW+lRlrV6k6XsPZ03PoNEuR0FiAkFtskj/YlJ+pdT4BmW+TopDu+aAYq4RLNwn6EAGbMcY3nweTs3/Cd5uXt74bmJYra/qakPTZi9LuX5VxMGWmqdbPmW1We7QTwvWWouT+Wn88Mn6BtuP0du/FoAq7DT8fO4TyUNuRsWlr5ALqw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(6666004)(7696005)(26005)(4744005)(16526019)(81166007)(36756003)(5660300002)(1076003)(2616005)(186003)(82310400005)(47076005)(2906002)(336012)(426003)(508600001)(8936002)(316002)(356005)(8676002)(70586007)(70206006)(4326008)(86362001)(36860700001)(110136005)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:16.4481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefa674b-959a-4c32-ac22-08da31becc3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2503
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently sensor hub shows "<UNKNOWN>", but this is a pretty common
type available in many notebooks. Hence using the string "SENSOR HUB".

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/hid-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index db925794fbe6..00154a1cd2d8 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2222,6 +2222,10 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_VIRTUAL:
 		bus = "VIRTUAL";
 		break;
+	case BUS_INTEL_ISHTP:
+	case BUS_AMD_SFH:
+		bus = "SENSOR HUB";
+		break;
 	default:
 		bus = "<UNKNOWN>";
 	}
-- 
2.25.1

