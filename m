Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B576DE0C2
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjDKQOW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjDKQOH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:07 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436CC7AB4
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lONImwlpe2z7r8FEOsg+adRn9Bp/LWdSZEz9/1Yq9DX7a0A+5JVlVNHlRLZxWbV2ov5V4ma2QtVLQiL7ZaNsyLECqTnUhQZXXwcwBHDZF3Cj4XTNvSTG+LBIi5uu5gzWZ9JzY929W1xAR8oFBEv8Yp4ByH6ywTHes0r6AGmeb3WAqUEAqTxJOrTYaVQyW3c0wvT4a5JEtoohgu6dpwSIUqpnMJuEXLMlcBVTBpAnaCQ5DTxzX7SfdmURMLHWzq1hx+SZUraZZVjVtd2o06HkzfwY4Tgz27zVi4lJm57mofcPWSe1+h5LCRpKZBqoOXpYOH8Xep2ff+xXiN/dnH8gzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL+ndif0kN67B0HrjoztR6H68GGhwCO6AZ3WC9QudM4=;
 b=LqeVyHcu/grRBw7TWaHGHHsuRqlpSM93HcR+k0s29xixqIHZ0b3ki31KzRCFGDhUsa3JEPEgUqXt9E++GeFEl/cNFxPMjTtwmq716ouaCPmHvwdQ0LpFQhgdxKWlR0Pwobs8mbP7rKJ73LHo4gj6m1yQvIGsAA+7EpSNNB/aQb8qvrrTBpJXXCJ8e18PW48H+uZgDvTn3/KyEYUZok2Yq+oZxaGGx/0sdXj1lh8mMlULqEnB5AKTxFpDrKLF3Unv1F6/4GpQD0eE5y3RkwSNsxkGhsT/U2lOLgUB4xpEob5iW8RcefwTBVLtfqnY5B9gdaneQAsTSruL6yVuwmNDQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL+ndif0kN67B0HrjoztR6H68GGhwCO6AZ3WC9QudM4=;
 b=lL0vGe4I1ics67wBDJwJRe2YeLiCYrqiAq0CbFVKHfD0XkSSxkX0xq94p4BVJUFGanCqQqIyhzkVNPJF4zqY/8qoOGl4st245M/OHNd/ucyWsCEhm3LYEb6Kv5Z3Z8zKL5aJhESA/AQvgtSVRvLFrYkg+g5qNPUbTxsOcRwL4JM=
Received: from DS7PR05CA0062.namprd05.prod.outlook.com (2603:10b6:8:57::8) by
 SJ0PR12MB5633.namprd12.prod.outlook.com (2603:10b6:a03:428::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.38; Tue, 11 Apr 2023 16:11:25 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::d3) by DS7PR05CA0062.outlook.office365.com
 (2603:10b6:8:57::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 16:11:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:23 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/7] HID: amd_sfh: Fix illuminance value
Date:   Tue, 11 Apr 2023 21:40:26 +0530
Message-ID: <20230411161030.909350-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
References: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT024:EE_|SJ0PR12MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fa3b6e-7943-4f43-f9c0-08db3aa7662b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QfBvdMGslrGGmmwHeZLAVGXN+XtrBEDv6KtgMQ3BBH3gMr5ukL7XvcR2aVC1M1BdvHSjRq5LPB36LHYcyEEACrNfwa1WKD78iWfvWPIIrgn2YCKXXt2TBlg5nxcpJX8CyqYnkCnT9i7vcbxYvo3gBMr6ekuj7QS53rIAJqBz6RLyTGb7imqWPvvsTll5Zoof+pdn6BGKC0jBqvQVks1YWiq5VA0goW/U4XXQCJbqDaJW0Ulv4Qb5F1JU0Gn7RpMSWC7VoB+HQx6kjuSlSKi90Y15exeelECLNhOqlDnPX1FzXSlXA1bUp9abM9DIeylgfYycYhZmFLTlPMZim3hj65aLTFuR+xnT4kivGMyMNQcfZpzkQ+7SHw2KrOCMDtUwi0yngMN4P17Fa1UAfNmFwPLLn96ykEotMOrXmsmaZJ12JhesPZKOfOnC7pKfRodi4i54QE9pQz3zCLS/DKgyMD0c4A3uC/jrpXRkvD7jOY2leBKnqSolY/pRvs542MhnuuJEwah5rtfl7zhPuswFfRjH8MQtI20En7dLooxX3amy4E/GsUKVnkh8QmIyqHS69w966Ec4s7xmVRHlsJzxja217Jmd073obA1yG03C7zpkBjnVC+13tSIaHnye1ED9d/fHfVdxqUfKhHSNi+XHqiblRnEDkZFsqRI7IV09ot7nvp9T3pFMeI/7In7DmHi9R+aJwzVd0YT+PPK0E0iLfNtkE2G5P1R4h7C08Pl7nLU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(110136005)(82740400003)(81166007)(356005)(36860700001)(70206006)(8676002)(70586007)(86362001)(478600001)(4326008)(336012)(47076005)(426003)(2616005)(186003)(26005)(16526019)(316002)(41300700001)(36756003)(2906002)(1076003)(83380400001)(7696005)(40460700003)(40480700001)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:25.0383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fa3b6e-7943-4f43-f9c0-08db3aa7662b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5633
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Illuminance value is actually 32 bits, but is incorrectly trancated to
16 bits. Hence convert to integer illuminace accordingly to reflect
correct values.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c      | 2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 0609fea581c9..6f0d332ccf51 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -218,7 +218,7 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
 		get_common_inputs(&als_input.common_property, report_id);
-		als_input.illuminance_value = als_data.lux;
+		als_input.illuminance_value = float_to_int(als_data.lux);
 		report_size = sizeof(als_input);
 		memcpy(input_report, &als_input, sizeof(als_input));
 		break;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index a3e0ec289e3f..9d31d5b510eb 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -133,7 +133,7 @@ struct sfh_mag_data {
 
 struct sfh_als_data {
 	struct sfh_common_data commondata;
-	u16 lux;
+	u32 lux;
 };
 
 struct hpd_status {
-- 
2.25.1

