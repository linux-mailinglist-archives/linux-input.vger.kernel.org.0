Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A34E6DE0C0
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjDKQOT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbjDKQOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:14:03 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24373527A
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lfz1OXN0GgvCSxcRB9dJqnrha1mYdS3JiFryWZz6Z2IQxgEwFcjcI0X23y6WLHWy/NmkObofxV/sTOGJ5AGhcHMbxGmxpBtWiDLdFsDQosuiPxhKyXMrG2yWBg4NByrcjaDHq2PdIpLSE4YSkCCcFo6OlLQyMRTUBEd7L8RUXCWOQXcYVTOfS0qcuqZfzmvgZjZbLn3+UGZr7TsGmYhLRXgtyChNTR63eBHN1rdlg1EdnvMWDhkEINgWpjxAe/dGnJPzo/xwrjm1p7TFGspynp4SvXlY5zQHmixO3ywO6fONtEtxrH9QZ5Mez8QWXqZ4EZBePiXfz/3c6IBPwD+Rew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6XQQq0SqGB+kg7CavL2oqoJa8uZaKecevfhRovLhlc=;
 b=MvHitiDFMmHYaK7ei1YDXRh/6Tn3A630a/PVe6GW0LEw7TXE4tHcjyOnRMh5UN4APdVqSro+p4NxaUHCC5WH/3/xQMNb0QwgGhPhZcixXqgdTUhzn7BPqLFBtyCoTGS26Z/oTH6FkukbUjKvBFW2X47xhfibAMI0FJCBcADq4V+0h11XsnUmm/m87yleNn+BBr6VpglKjtj06voc2dBExsXCcyjKPtjhsqg4T3n82ron/vN/TCIAiPfFwYQpUhAAPPAChBRZiJZtCNQCph3UItqK4i3nwBDOA+UaxNiW/EGE4UumPi9rT7Yp+0BitCOFMWMre6VAz72AQ6kpcLpLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6XQQq0SqGB+kg7CavL2oqoJa8uZaKecevfhRovLhlc=;
 b=hGV1f1GlMbyxiQa17m2T4Mk2m84DS3Kmbxu1t1zirPQ/8/Y8PBNEnDR11H8EqAoM6zpOyZSjAnzRGNJ6io8M3JJqIhlxKFRnKNdP7x3YfeiRrR9beknnQSOPZcebP/KBEllqBgtWwOH6CxWSqZ8tBTA7TYg8+6S1V92fzDnfFe4=
Received: from DS7PR03CA0115.namprd03.prod.outlook.com (2603:10b6:5:3b7::30)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:20b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Tue, 11 Apr
 2023 16:11:22 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::58) by DS7PR03CA0115.outlook.office365.com
 (2603:10b6:5:3b7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 16:11:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:19 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/7] HID: amd_sfh: Correct the structure fields
Date:   Tue, 11 Apr 2023 21:40:24 +0530
Message-ID: <20230411161030.909350-2-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 774a7620-8613-4270-a621-08db3aa76457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nW60jo3CCx0h+edhf2YcaBiGS5YUB/aOFPgTRcsIYVGY9nJPNRhA7qmcbsPXDACL34FsxPxzDAFamaUo/FDa0VuNSvgslmZ0VwRzyUP7Mk0wUneNFz70AM7WoetVrWhbM9CZfe1dUGNU0U3/0I2sj58Yz5Vo1O8RC9sa22MblhpG9gEOOizCykJqNVEUXN8TEqNZfHRSdGKIx5ah3G+JQo0qFFzY6q2uTuYkeFScc/s0+22McVrpEaOo3YhNLfrSoJThjUmgNk5HUflg4lSvadZJS1JYEK3N+rDml8Sp4hRjEoz4wx6V2NUnO/UqD37TJl0S9fjHPgiPYE/e97xxyOLsvuxi+2tBw+0imk1UieEWp1hVpjgrqrIHqvF01cGt1RRG3yI5+p4sFay2XCP03fZ8tvH2Y28GGgjVtCXGNuWd12KMJk0zwqtvme61tS4HA0+wN73bY3lvclp/HRblr0qngz3cHUnyVAazxSxpj+ZG3PUlqpgm+gHcpIlb6SHFiZneKU0hHAclQGrMR/isDO98/WwD8tB7APrG9e3pg5q26kirxy+zQVzbdEnn/2ZLTQ+6lpzUYY6RFHFZ0A6+jO9yaB4XkN49C7VcAGeSiitgYdE5lmxnseZjD9fR9guLvt3YN9OCRtjWvhoFtTZ3pNZn7DydF1NH4wE9+ri7m6r1pbg98Rgqle7EGJr7//nsx8NCTDV5lyV0w2CdoLZmCvUZiSSz9TaUDcsg29S1IzU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(426003)(336012)(186003)(2616005)(86362001)(16526019)(70586007)(478600001)(70206006)(4326008)(83380400001)(8676002)(356005)(2906002)(5660300002)(1076003)(82740400003)(26005)(36860700001)(81166007)(6666004)(41300700001)(40480700001)(316002)(4744005)(110136005)(36756003)(7696005)(40460700003)(82310400005)(8936002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:21.9691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774a7620-8613-4270-a621-08db3aa76457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Misinterpreted sfh_cmd_base structure member fields. Therefore, adjust
the structure member fields accordingly to reflect functionality.

Fixes: 93ce5e0231d7 ("HID: amd_sfh: Implement SFH1.1 functionality")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index ae47a369dc05..a3e0ec289e3f 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -33,9 +33,9 @@ struct sfh_cmd_base {
 		struct {
 			u32 sensor_id		: 4;
 			u32 cmd_id		: 4;
-			u32 sub_cmd_id		: 6;
-			u32 length		: 12;
-			u32 rsvd		: 5;
+			u32 sub_cmd_id		: 8;
+			u32 sub_cmd_value	: 12;
+			u32 rsvd		: 3;
 			u32 intr_disable	: 1;
 		} cmd;
 	};
-- 
2.25.1

