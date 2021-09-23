Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FB7415E66
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240874AbhIWMb5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:31:57 -0400
Received: from mail-bn8nam11on2066.outbound.protection.outlook.com ([40.107.236.66]:35616
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240828AbhIWMb4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:31:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGkRSfacpBDjuzB/DnKu5xyDwHJ51Znxd5W51fU3AtDmaoP4RUmZEx9P8HRDLvumnwOlS+jZyBgN/WF32rre2Yy/RXbrL5oTREHLBS48n0ePM/ZnnLOMev7lZyA5+/idW4RRjxe2dRu8ysgVS+zFScShW0zUHmAesFkQSrVCNqXZUCrVjlxPkIlxA34X1AhsMNDqmuW2Qt9HLeZU4KohDH0Hjrr8cszvPu68ZtLN93QscePTmmiMG/FeROHSq7snHpmF46BrHqH/N+lzx0xGVFxgUKJilgHTNi4WfUYl2Qv1d1js51J/mv7moj3YuDclVBaUqUbMUIsJ1hS9YBAWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GY4mQ6p32EsWmUtk8noeNmF9d84Mu36Bkmlkmit/qK0=;
 b=NjjJlMU+N09WimwMUu9FZ+5ibKHZzZr4LmlDjtUH4hugbwamNa6Ar2dGLJNAPGY9va5U5YYPSpVz3EnuNeU5QqazXdDF0eDS/s2Ks291iGUjPn0bFc/k1TxMdKbPO8KGmVLKxvStxEp9A9Rd52s/pUlKCf4RZH0EFMFgB2TDIRjVC8BH2JXziudYHq/zY5nPI8HW5FvGkNvMWR+NI7dmUB4TA/FHovR9fgiVFRAN+J0OGrpBJG1TGySG05BEX+15s9EIDMsv/34vuahd9W+NmEiHPxeIpnQkT37qCnZVOxVlyNwB4d9yTIQMa6eYgpliNX09xLOZTLjnRRPLe9Iv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY4mQ6p32EsWmUtk8noeNmF9d84Mu36Bkmlkmit/qK0=;
 b=fX9W17oa/NXJYKD/6t6VdoJI4akMwEeef+MxQBjLplR1RqxZtxi32yWp9EjT6+jczJ6UdM6jf9IZFsQfv8UoGB0W8roCW0A7g2NRtyWhpUUu1nn7YDcqBHdBFaBgA4dm2zcXeAwiaFeqvI7W+Rnv7UOwQhGWJNXt4y9yzXuCdpw=
Received: from DM6PR14CA0051.namprd14.prod.outlook.com (2603:10b6:5:18f::28)
 by BYAPR12MB2982.namprd12.prod.outlook.com (2603:10b6:a03:a8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:30:23 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::90) by DM6PR14CA0051.outlook.office365.com
 (2603:10b6:5:18f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:30:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:30:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 07:30:20 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/4] amd_sfh: switch from 'pci_' to 'dev_' API
Date:   Thu, 23 Sep 2021 17:59:29 +0530
Message-ID: <20210923122930.3873914-4-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0a6e6537-af12-44f4-3a09-08d97e8de9fa
X-MS-TrafficTypeDiagnostic: BYAPR12MB2982:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2982F340CDF200194FF1C791E6A39@BYAPR12MB2982.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lceYgFQ1ovM1wkhrJ78ZXCDvvrfGUE3PhZOOpV4rH4O8B94plkEXzafdS51ZMRj/1xsAqyblpU1HmwkVnFTp/OCyNJ3ye7EsdIstmOUYvtxndnvn3VgJstBUZ6UVq0oBpbwi5861CdvDS2tLiUPsIAlpdf2BCOmq3sT0c57KR36V//JY04H+iQEach6LBAcVAIHHJ99q8Go1P3kpYIHx5yDfojl10VvYqYFhNUqoDtT8q1Uy+Opdpp3LEs8r8zYmCcCcch3xO7XPQ9Q+73zKOkPZyy6WyZ+iRCQa1tGiRqV/QNRhsxjGipIzWok5JTLnC3ZBC6a6DPcflvi/QOsHscr7J5K/5ZAK6zXBvrDMF4B22K9MMp5OvDPlyx2GZOCG0rq9Jw6cq5JXcRK6M4ECOY1+wC1AiCCk2hfnUJaCdb+lVneA2ZE6OyJEH+JBxpQ2Zi/aA20RFI+0XKZfs+dufPivwUXwYm8K/kNNxsbbQLIkzGyS/9JD1YLikjAWvz4QtStPn0FauDc8kdaCxEYhVKi5qh4dRyt878q2E/aip6JQlXEreG+g9TJW+ELl/uFW8Uy0oq2QJRFfT8woCBLnGHbylHJCQHLys4r9aGzBiQUUmNf+4D8t46lOlv93jIdX57nqFBh2Xi6GLmx03iWa2ebNrzky0MInQvKvyhKnSOHHIs/Gocen33DJ1satZL7OC1TjuVugKdKXt39MTnyvgytVw8CGd31C3Jz/0Dhqa9s=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(356005)(81166007)(1076003)(508600001)(7696005)(26005)(2906002)(336012)(426003)(186003)(8936002)(5660300002)(86362001)(2616005)(47076005)(36756003)(83380400001)(70586007)(36860700001)(82310400003)(16526019)(110136005)(70206006)(316002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:30:22.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6e6537-af12-44f4-3a09-08d97e8de9fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2982
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The wrappers pci_set_drvdata or pci_get_drvdata changed to
dev_set_drvdata or dev_get_drvdata.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index ebe396a4570d..b5c5ec52a3af 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -234,7 +234,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		return -ENOMEM;
 
 	privdata->pdev = pdev;
-	pci_set_drvdata(pdev, privdata);
+	dev_set_drvdata(&pdev->dev, privdata);
 	rc = pcim_enable_device(pdev);
 	if (rc)
 		return rc;
@@ -269,8 +269,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
+	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
 	struct amdtp_cl_data *cl_data = mp2->cl_data;
 	struct amd_mp2_sensor_info info;
 	int i, status;
@@ -295,8 +294,7 @@ static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 
 static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
+	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
 	struct amdtp_cl_data *cl_data = mp2->cl_data;
 	int i, status;
 
-- 
2.25.1

