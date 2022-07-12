Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A8A57225B
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232790AbiGLSTT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233368AbiGLSTR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:17 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED6EA2E79
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABgZ93drVOhzhVzwMQt8Jw7oELbjIvyPCxGn2Xm7f79HuAvqwDK6p2ivC89BkZ6Ffqo9nPxsz8ryYJP/ybfLamg7DluK1ybopt7QUDaI3UC3Zn06tM8PS3EY+YMgaLzPt4GmmUANHraiL9b8z5Rkm3BKEZMQ1ea7TkAQ26pTc9D4kIPV98AIVIg9Ga+IQdsmtGeZZ4DNSf7nEXE7un6cAuMgAdEwUUTJHhdOU6YVGBIax/jooUEBY5qzi70tMRAjdIt8Xkke1u7b+8N1WFDKstCSmfE9zKjXhT7rPp3gOK1WZ3HixE4c1VQwxVIjxJcOWrmdAHpxU8ZevgzkYJYrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hj4iwjIhpnyPGk2wFKhYxIl/5/iCSGC5XWvMqPpx3TA=;
 b=ZCD1sm0q3qObcWMY14cvhmc8SMKQiJP/P0gX+s763yBD94FYAuepyvsZxpwlgl9siQJlYTaqodlZ/KR9ROU9BLVrHWP9aXv41Zct0nza+cCh218c7WOS2R5H2uithrkGWzo4G9x3Aunc6ppmoaZzT26oCk177IST0FIvoDHamcnrJoaalnCPxZAetFD6AS9AIvvY2HhV59VhS8z210CcubrRpaYEQCwwY3O0rPiffBpff/RcZilNeNLek/mwroo7/yOD0/rjWSKft1ia0Z1tkQ5DKUvAnPUtaBD8i1tfzMS478glo7vZb6NllSasfgrDjc/BGu5TbTfRp5zxJOa5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hj4iwjIhpnyPGk2wFKhYxIl/5/iCSGC5XWvMqPpx3TA=;
 b=rrfICNeC0xSJG5RYlNwBKhQGaGY6uFGq1IfT15DoEcesVQT3wSLw0Yzxvyp561RUzbIEBbsSBfP1GxdfjMnkW1Aqv2yngKHW5cWwf1NkCBUGLQZwmgX9d6E9kGa5Qgh3xPC/RuNvKLGUVJsQANMLnubb4LKnbtScUP8ISnGQt9M=
Received: from DM6PR02CA0051.namprd02.prod.outlook.com (2603:10b6:5:177::28)
 by PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 18:19:13 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::53) by DM6PR02CA0051.outlook.office365.com
 (2603:10b6:5:177::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:10 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 01/11] HID: amd_sfh: Add NULL check for hid device
Date:   Tue, 12 Jul 2022 23:48:26 +0530
Message-ID: <20220712181836.3488343-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
References: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51af9925-50bf-4ae1-12b1-08da643305b6
X-MS-TrafficTypeDiagnostic: PH7PR12MB5903:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlSjhll8eCWV7X77daatOHNZzOoNEEo7xO8u8eNy3ok3ePVJ1XxFnILIcYoF25dr0NC9Sy+DYsag6fQXumab9JmSazb6vknZtLy4EFDtbvsx8l9erStAXrbKHvGXeIjK3DiT7vZFyqNUJd5j+McvtJrNNbdTSFByes01+Se0dHpGEHyK6A8P4vW4mzweDjragHMpVekSvhRiazXem85Dz6HxlE0wxT4MVQtddGYoK88P66CNVu17nBPirWLPHqBb/7hz9bOT0gt7td36l6O0ch59X1j09O/qsKHUQa1LeJjMQH50uBx5LR+ilsJSb3lG8DyW5j3qZhNRFdLD/uB1dwnAg6hBTR4SGCicqpXR2oor2zXyrQpZMtLTGyIn6Ymxnl7QHeXfkh9AA1hv6N9uBvxASMbqNNHRf5eXGfUfSYqAtMJPpGCGLvdfAQrlJdhREfUZ5hGbT3ciLBidDKxfO6V2wz3oIDT3tUNfqGbNXSAl7Xxdh1oMyQU7UePj7x9kCAzcQKyJ2upxHP0awaj9/d+jRRZx6LKU62jdEqxu4iGrJ84CGDkw7wqQ2WlNz+Q1kzDcKYHPFveq0X+Im/KC7cOKI0aQO7a4fiVmj5ChyakfzB+2+q5LPK5XfRBXAcpN+ZWaACCKSwuxrls8/4HVrPR8agJzyckQF+EwrqzRpirAEIv0CnIknAACWymWPh906E3Kdjlu3RbJzv0L348x2yp0JPSuPl9qbSWTeHqWgGtc7NGY6Ly94XsauaRUni93kmK5/+Is8MGWGMMhjjWsO98GTreRUJspRGN0/pd3g/MOirlm/YIWInzw+pMB3o2ClP67pE/EAH9Xru4rvZ9mznlni1e/Y2UIufeSnYm65Z0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(40470700004)(40480700001)(83380400001)(426003)(1076003)(336012)(47076005)(70586007)(4326008)(186003)(2616005)(8676002)(86362001)(82740400003)(70206006)(16526019)(8936002)(36860700001)(26005)(82310400005)(7696005)(5660300002)(40460700003)(356005)(81166007)(2906002)(110136005)(41300700001)(478600001)(6666004)(36756003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:12.7180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51af9925-50bf-4ae1-12b1-08da643305b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On removal of hid device during SFH set report may cause NULL pointer
exception. Hence add NULL check for hid device before accessing.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index 1089134030b0..1b18291fc5af 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -101,11 +101,15 @@ static int amdtp_wait_for_response(struct hid_device *hid)
 
 void amdtp_hid_wakeup(struct hid_device *hid)
 {
-	struct amdtp_hid_data *hid_data = hid->driver_data;
-	struct amdtp_cl_data *cli_data = hid_data->cli_data;
+	struct amdtp_hid_data *hid_data;
+	struct amdtp_cl_data *cli_data;
 
-	cli_data->request_done[cli_data->cur_hid_dev] = true;
-	wake_up_interruptible(&hid_data->hid_wait);
+	if (hid) {
+		hid_data = hid->driver_data;
+		cli_data = hid_data->cli_data;
+		cli_data->request_done[cli_data->cur_hid_dev] = true;
+		wake_up_interruptible(&hid_data->hid_wait);
+	}
 }
 
 static struct hid_ll_driver amdtp_hid_ll_driver = {
-- 
2.25.1

