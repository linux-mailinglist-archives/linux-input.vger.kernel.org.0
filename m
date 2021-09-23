Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB57415E64
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhIWMbv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:31:51 -0400
Received: from mail-mw2nam12on2063.outbound.protection.outlook.com ([40.107.244.63]:12545
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240959AbhIWMbu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:31:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv38aU59bH81BJm4vnJI32FjQ9oR2J8/RcSbJXqpMGzYoDpVbLiWjM+Idhi1ULhTA0yMy3tiITyTPXQSKsGvf1iZEyuQT9P19gajt2bsTcbQ3G3fzr73zAaz3Z3bkgnBdUKsRgKdXDTNz1jiCKfbXh5D82OgolQKvUGwd89Tlg59Hp2EsnO5AzmcJutLRo6BqDsxPJAI2gZPNkdG+T4EeimTEbJ82v97CcPPHFdbP64v3ypd9F/rTuhTcAkKpZpMHupo7auvvrcPkSZZKSv82klHT2VIy4rnrNde7ZPO2DbbJo0kXPAQAERRtx+tfxydBBJJv85XV5oD9Ys5feurfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1FrfiljlobF7JvoZH3/VR8WcO2bXWjpufC+VPL5e3F4=;
 b=BkA9DGeNjh2coK9owV6qruBRYZB8WMgcofVQchU83BDf5x3+9Zbxul9g5P+QWi9VDN5E6tm3YNBwJ7gvJl22+d6A9HoAmGxWRRolCeyDEDlJPXr0JXVo6WGIIWRsB6BScAV2ODl8uaMYktmhZ89UXq2O2x3Ns5hzaVBmWx6TQLxantnwJrpfF9vZDYyMy0HeFTZxMa+sZ6PCIkzMeNkuZ6PDV2kfgsRuoYr5MPz3JDR1bu0jt5tX1ecA3twvD/0WS5a6Y6qZNhri9Tp4AEz5V8UBcxpgcJyULoOL8NN++QB1ETDWev4yH8ssJlff08tI5s+AGN6IQmkmopIO7u5zsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FrfiljlobF7JvoZH3/VR8WcO2bXWjpufC+VPL5e3F4=;
 b=WhnXQ60F4OqhfMOBN8Rgh7v9kC1Bp22SRB+EPiLPjjiPywm3JdLEXv9ryjONN8LupngQFXZkLPsT3hKjYdSt/GjPJkeJ6+2KfO3gwLx7vhlgnlpxlfIIEJgUXqfmnL4T3kaPy8H4Mq/pKdrYTC9q7XsDrGdxAVCbWBlKIjm5xRo=
Received: from DM6PR14CA0064.namprd14.prod.outlook.com (2603:10b6:5:18f::41)
 by SN6PR12MB2815.namprd12.prod.outlook.com (2603:10b6:805:78::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:30:17 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::7b) by DM6PR14CA0064.outlook.office365.com
 (2603:10b6:5:18f::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:30:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 07:30:15 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/4] amd_sfh: Fix potential NULL pointer dereference
Date:   Thu, 23 Sep 2021 17:59:27 +0530
Message-ID: <20210923122930.3873914-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
References: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a361c02-4dae-442a-dfee-08d97e8de6c6
X-MS-TrafficTypeDiagnostic: SN6PR12MB2815:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2815BD2C58092C2E65148F38E6A39@SN6PR12MB2815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t2ql9sfmYJ3U5B0Yz7guGtuqb94/uxkft03xIIcHpHj9HNVw5PsEA4SUVuotCXw4wZF6Vyn2oU+F/9VPjVxkbej/HPp/NDc+7Lv81mKJPPj6cS04TREps4Y+1+DS8gZW27I7BvNbkoC+xgZGZ8BXj1IxVjm4MZpJzdv2WS9tRVjts2z7Y0RFdE6RmayfDfT2O6FdVbb1jhr2zd/Zor0rvmrgKfMHP8WZtLcuQFsHso6Pw3NB1RZby4NlVeCmns1Men8YkUUj1U0st8ZU268hGsRiNJMAuKTQDfeFQIWYcUq9lE/Nd9zi3NlJwEKTr7G3y4bGkjaQJGkVDRJHqrPH0itxYANhmHiLQuaEtmIoHBNLR6VoVnSc7wCXplxaucVHdLLE2DSdt29CVs1dGon/1u8rNnAwe3seC3MdJ35Q75eQthVnQtwSqa/9D9FfYXJ9HLM0dCSJAIkkhBp7Cb+Ngq7D5rmRH6YNYtMftpWsmVpYgZCWfKNu7pJEscTrnjY8EGofP2ZyKGKpZcCJcFpt+jsr1ra2dKVuvX76VRdasMks80v+Cg9z7KWEkGOeKKMfe485GadXWr/g9dTZO7SGfvVj5bcNJahmGjpbMapQV0cpfV7fe0YXh0msh+2BuUeMgFVVGLTMwVu0d9ijWvr5+e/EXmh42HDdq6P7obwRqMDCr6mXoO8/1agfQwWOImXmrVMTqoAh2AuvL34l0KJKkMxT39bNqwJxjmF73fR/ozQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(1076003)(7696005)(8936002)(47076005)(26005)(36860700001)(81166007)(356005)(110136005)(336012)(86362001)(316002)(70206006)(426003)(70586007)(36756003)(83380400001)(4326008)(8676002)(186003)(508600001)(5660300002)(6666004)(82310400003)(2906002)(16526019)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:30:17.6177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a361c02-4dae-442a-dfee-08d97e8de6c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2815
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The cl_data field of a privdata must be allocated and updated before
using in amd_sfh_hid_client_init() function.

Hence handling NULL pointer cl_data accordingly.

Fixes: d46ef750ed58 ("HID: amd_sfh: Fix potential NULL pointer dereference")
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 076b46251c91..f5e580f598cd 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -251,21 +251,17 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		return rc;
 	}
 
-	rc = amd_sfh_hid_client_init(privdata);
-	if (rc)
-		return rc;
-
 	privdata->cl_data = devm_kzalloc(&pdev->dev, sizeof(struct amdtp_cl_data), GFP_KERNEL);
 	if (!privdata->cl_data)
 		return -ENOMEM;
 
-	rc = devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
+	mp2_select_ops(privdata);
+
+	rc = amd_sfh_hid_client_init(privdata);
 	if (rc)
 		return rc;
 
-	mp2_select_ops(privdata);
-
-	return 0;
+	return devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
 }
 
 static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
-- 
2.25.1

