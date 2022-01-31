Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D674A4CFC
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 18:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380832AbiAaRTB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 12:19:01 -0500
Received: from mail-dm3nam07on2079.outbound.protection.outlook.com ([40.107.95.79]:37728
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241643AbiAaRTA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 12:19:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXLHkqeAkJYx34IEtPwPs2i+/iOgkQK6eyrNvoOuVfQVDCg4HA1chyTgoO9Itap8675IY+GVZlDBKunReUKcC7ts4GVTAx+uefrzbfxD0L1jSX+7PfbZRynfCelDOF/LxRYkmDOjoQLdqnAOEnRvgAOJst6OiPfVx/i/Of4HQDLq4W2Pm7rVajprlihfoiG/lkLcyX3lsOqcZI5DoPgdk+h5PgG6RQpIc0nEhskgzAUwIZ/wOtO9Sh6djSYeVZ6AFmJKgC3tHeeYPqZC1vN5DXOkzTaxJzXpeFwRNGPGJzdadFnq0VSCXCf9OVe6gF2IUEtjouRfkkkW4nuFlcOEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq7xmRm4Gz3Ovd3MB+ZcWDw+CObYkefa7wK2UqLxIlw=;
 b=ZSOevEhovg1Sz+RPKC9BXquGbVsZCTmWq7alWZOBBkCeCDpXDAghegJpDhYTln/V+uN7xL5lIwI3QkV0orS2rOnK9SwwJEXbXrz2y/YRpOx2scTaFt1+6gCQqfceCPnzN7Q4TbdJ7LpG1Ab5xp3Ymk719kx24ooGu44zfUsYzRCjEugq+J/yHmFwbQidZLgTCyuy3zchU39nN8wr1kKqevVyxKUgehB1wB0HUuyEaN6Wm0Nv3DE9+beTMNKOT7wP79SqY4+aQvkoFLiwpPg8FK8CydVcAlLmcqBovzEJftf26cMQca4lk5If5u+kdI8lQEufnruaLSB7epW3UtJ0+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lq7xmRm4Gz3Ovd3MB+ZcWDw+CObYkefa7wK2UqLxIlw=;
 b=XABEYBPDKHGmweb1b43+1u6Ei71/bn6F2tzHs+Nl3xQ6ITTQboe+LmivQha9N6jZPXw54Rbrj/OjpbtnKNFBZ5TgWh3Yn+UU91dMaOyamnrkolJ4P2O6AG0gawm7kHHzu24CFTqjf6EUj7s70XNU3ZdjS7cF21Gdsi1DnwXbCXM=
Received: from BN8PR04CA0006.namprd04.prod.outlook.com (2603:10b6:408:70::19)
 by BN8PR12MB3345.namprd12.prod.outlook.com (2603:10b6:408:64::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 17:18:58 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::18) by BN8PR04CA0006.outlook.office365.com
 (2603:10b6:408:70::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Mon, 31 Jan 2022 17:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 17:18:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 11:18:53 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] amd_sfh: Increase sensor command timeout
Date:   Mon, 31 Jan 2022 22:48:32 +0530
Message-ID: <20220131171833.3998492-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
References: <20220131171833.3998492-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f20fe3e3-e621-4b17-1b20-08d9e4ddc4b3
X-MS-TrafficTypeDiagnostic: BN8PR12MB3345:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3345F1ABD35957951481E720E6259@BN8PR12MB3345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:203;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zuyiOqw5xRILdRNvkvqkYyoN2B9DzwXwO0zugBrD/4qcNbGcS0musHzzvuFYOHan75DfGCxDmJPdCCo3XG6ioyWzlitjHqDRhMjYrKao+eDEKj5X1wUdHfsidT27PPlR4WFwLL6ctaewMNuLMUHFEtPja+0Jj7WZoQfrHRIvSPgt+RdKN/KNR3eWQAgBS86zgYiMwbJvQU0CpjaZ6yiflbV7SLs2jTCk9EiACIOdpKM+4GvwaVd9rbv/Vb+RafU9Mis5+HzfKAkcZFdIi68qk6etcUmPMt7DwESiuZ0iND2TWWVjYQnUf3ufDAsQ1JzV7JgkuEfJlDIbSwhZpQD4g/A9lRBqKfbnPz6Rg28tfnjsfvdB3j8NkwePEZhEqqnys+cDbFqDfDJOW2nXbz2/1dolP4TTVVQ5cnT+QBk3FJqz89coYAdkzAyRtAEgjA5VRSmU47UGdNbD8RBgH/pCg2eVLMGr+KvWpVPMpU/ncuMwOZ4UZJ7wNw7Xoh/8ohk2tqBwpx+v8nkEGtdyxSbTL1AG1LAQyHX2gRQxSSKFw7lJ4O1ZMl8vBHWkc2sYoOCZ1dxcgXVv4Euf5lxoN5HppZTlv/YCEEgUYpQAw9JcZSsSGHpDNq5OYO+/Jkeqswr81R+sa2Ps/iqbE6hfYcSRuVIWDxwSmkkU6fBRMU5UXRjkVN/hWDlvUoqX+hKmnXG94meFsPXu7echZc3vRmwXvQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(40460700003)(81166007)(16526019)(82310400004)(356005)(70206006)(8676002)(4326008)(8936002)(36756003)(86362001)(508600001)(6666004)(110136005)(6636002)(70586007)(1076003)(2906002)(26005)(36860700001)(186003)(7696005)(426003)(336012)(47076005)(5660300002)(83380400001)(2616005)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 17:18:58.7832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f20fe3e3-e621-4b17-1b20-08d9e4ddc4b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3345
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HPD sensors take more time to initialize. Hence increasing sensor
command timeout to get response with status within a max timeout.

Fixes: 173709f50e98 ("HID: amd_sfh: Add command response to check command status")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 2503be0253d3..d3f32ffe299a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -37,11 +37,11 @@ static int amd_sfh_wait_response_v2(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_
 {
 	union cmd_response cmd_resp;
 
-	/* Get response with status within a max of 800 ms timeout */
+	/* Get response with status within a max of 1600 ms timeout */
 	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
 				(cmd_resp.response_v2.response == sensor_sts &&
 				cmd_resp.response_v2.status == 0 && (sid == 0xff ||
-				cmd_resp.response_v2.sensor_id == sid)), 500, 800000))
+				cmd_resp.response_v2.sensor_id == sid)), 500, 1600000))
 		return cmd_resp.response_v2.response;
 
 	return SENSOR_DISABLED;
-- 
2.25.1

