Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1FC251FE40
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbiEINZO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235748AbiEINZI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:08 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C41A26110
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXkp9TMHwpOHiMvOleQw6fo8YedAkr2SJVw2PVz03tVIk86GJlwAJR9SWVCCBWezJEinLiwNoeCilrXw3Vtmexkhl0SQS7BcrQ7WTUkhpGe5/mQVxYtx4l0OLwS7Km89ohDuPfsUFGO88XAEQFTP2motO1bRH2jVs3eHXm75Y2OYA1pWdRBb8548Xyhlb5NEi0LSlbV0y5k1m+sPsjTtZCETrScoDblmKWHxzYBjeU4re1Us55uw0eg1nBgSW4xZU2MEBNipfbcZEqOtDqRTCN/8WZY0JdGqL5g/e4gLIWMrDB6/S1ZFoT3ctWoppqCm5VsquXgWd5gaqET+3mlMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYXeDs1tf7DgODclSAABK3oZYQXmru9sjfc57hZJSDM=;
 b=Kud6lQFxozvDVVkmoVoXx92Sjb/asZeL7s98KbWDHq+3zxF/rYMgTKyOt+tur4rDkErG9jb2escD9nyOmm3qAogw5wfibjfGEhX32Ljq8E24rzOVNEGMJPHqBwWTQPJacdZgHLAV5re2jyL0YzbsJk6+MIhkGIRY2I/is8kkYOPDJgjsowKuuh0INsFOBZ7kT96Xo9/C1O2DEnvJx5agYS2czCJZw9zxN5kJPXCB7G9aOMxHT3oRpzqd8EbqmVuiNunwKO0xZXIVbniI0eT1L/C8BI7gqYIZ9oM2uYnu7L9czw7sIRprvo5yB6bX1eA35rZ+HP/ulrTMut4iGD8nVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYXeDs1tf7DgODclSAABK3oZYQXmru9sjfc57hZJSDM=;
 b=NcLzx8XLHboOVZ5Qsv8aKkIRVXzuiQTRIfzvRtfmJUE0sFu3NWZCyMe8SfUvG2blK1mWQ8poghiUyHV3Kj6mpJnhKame4yIsP9yYylc+JGbGKjUMIVXJweuUlvOyCDaJPPijN1c4UM8T4mXCdv9R3Oesj1qh/UtGRHaJlut0rDE=
Received: from MW3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:303:2b::9)
 by DM6PR12MB2779.namprd12.prod.outlook.com (2603:10b6:5:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 9 May
 2022 13:21:10 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::a) by MW3PR05CA0004.outlook.office365.com
 (2603:10b6:303:2b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Mon, 9 May 2022 13:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:07 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 4/7] HID: amd_sfh: Modify the hid name
Date:   Mon, 9 May 2022 18:50:23 +0530
Message-ID: <20220509132026.3204678-5-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 10e2b6d7-2da3-4b6d-74b8-08da31bec858
X-MS-TrafficTypeDiagnostic: DM6PR12MB2779:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB277976DDE448C2B2993CD51AE6C69@DM6PR12MB2779.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h016DHWji4qu0i66OY/wWRh4WMjb+TlcO/28p1TvT/TBAUFPsPYXMh6lH3ZLTXqxBOwLVZfflX5EboeeVXRtiUTHYnN5IlejhnmjxydUG+JM2CyHbOttWvr+kjkgzgu0xeDrHgAZSxbdulnLiLAGyzge4/1i/mlGL7O0ZiKBIM/DHeClSMZkCsZNGejhyPHhJ5QmDWNJp0w7fNEjVPDoHa2Q1tsrfWj3YeqFV+FqRUcfJC7k7D6pgw3aKFM2I4x/3Y/AOYyQuX2f98X3wh/AYCE/KFJZuzWgffEXHLNEPFUR24c1/ll5IPCs2q4UKJcUEF2SpK8n96jfAbSmLMUJogrZXZK3vrtn6x4yj+47LU8Hk3/oeLEE0epune1rGfH+kj/iwNfKMdW1rRPPSzG7S1Hf/9j9WTGNBSvKOJOzBvlnUZ/10vSoaTiM1f7mYp2ZzXXqxxTV3p896aipVxhAZRAtomQfP6WdzVAc8Pppy77xspYY3iTSFMcgNfg886PNIGVT/yj66g9ZTOWzBu59kVYrYZiVreWRL+ZJBfJ9A4EwdQlJY9fd37k8f0s483LvLI+uHVSdGVxGPCl/e10yYsKIB+iGEbdcAWrOQwidcJ4p2LMDgMdQJdyMnnnhBgBSnUSyhNxhKk4vja2/LcOg54iUju3/LLSyvgMRrQWB3omb4Zf7mfAglZPI5dm8Q8Aa9XMlOmfIA+0je1rVjUFAew==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(81166007)(1076003)(26005)(83380400001)(36860700001)(5660300002)(4744005)(36756003)(2906002)(82310400005)(8936002)(70586007)(356005)(86362001)(8676002)(4326008)(70206006)(6666004)(7696005)(40460700003)(16526019)(336012)(186003)(426003)(47076005)(110136005)(54906003)(508600001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:09.9259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e2b6d7-2da3-4b6d-74b8-08da31bec858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2779
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Modifying the amd-sfh hid name to meaningful name.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index 6e487e41f4dd..e2a9679e32be 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -144,7 +144,7 @@ int amdtp_hid_probe(u32 cur_hid_dev, struct amdtp_cl_data *cli_data)
 	hid->bus = BUS_AMD_SFH;
 	hid->vendor = AMD_SFH_HID_VENDOR;
 	hid->product = AMD_SFH_HID_PRODUCT;
-	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "hid-amdtp",
+	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "hid-amdsfh",
 		 hid->vendor, hid->product);
 
 	rc = hid_add_device(hid);
-- 
2.25.1

