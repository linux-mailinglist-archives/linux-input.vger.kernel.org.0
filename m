Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64DF6415E65
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240960AbhIWMbx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:31:53 -0400
Received: from mail-mw2nam10on2079.outbound.protection.outlook.com ([40.107.94.79]:62593
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240959AbhIWMbx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:31:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8hX5OoGlW1LDjqAp8rf8NNwGAjgwBFG9rgqMTKwlxHD63dt2pE0vS2xOoYHuctTqqqGHrzVzYkt+6AHFRhPrCKGEcRpd4vHzEHMksBDHaPn19uabswwO57DDS4ZLKP30dDd3LNSUbvNCc4qLH/uZKXRhsyxzS0nLoHXC7xwPLfjN/u1TS2JszqbxOKPVvhgBaMlP7quUdP+LxXQATINoNETFyhAGRpB7WFa8yeerj21KS83smDceIyJJ9bYO8mmdAlWtzQEHGPYWcdvZuF4JI/rhpTBJaa4Pmft3+eWCPl3vg9D217+mkrwXteIobI4gAh1oYAJeq91nPHwbbIPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5QGNuAYeO8bFY+3xk3aJP/QLO1CRZAK86fRkf8Yx2YM=;
 b=bIgnJy+aOoRF1e5qR6tMogWTwUZUAjOOGbtjuHhXYQIk6BqdnPNhMlYJq8Xh0ZRs/YZc9Rcdrd+jwKZpNvgVwW+8A70vLD0eAG9JRxlmWore08qwPc+2SW3Bp/HjN0LgEAyhQ7gr8o3A5Pyw2LpdsGi3ZzMyb/tIW+Zpt9lzoQTrToq0rMONR51W/16hIqYoecL1ZADFz89V6WoF/3N+OKE548npXr+lSbMBq0Dvxlip3V3GGI3kApCikXkTSciNWk2dqAY8kh6QhWBW42IOP5YY0eLcskBojVG6S0upfOFK2iaq4zNw1E/kSJ8NlDuu5D7iLs9E4bybuq/4dJatFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QGNuAYeO8bFY+3xk3aJP/QLO1CRZAK86fRkf8Yx2YM=;
 b=q8fhuiBI9oxFrbhD2PuZfXIeywoBj882QOSPoNbQrRN71SwVWw3UI/BwoNHaLyeTg99Xnks4ZwN1hWARp66sZajypVaNrz1dbEXqJQzsG6yEbBxYZ6EMXKi6JEYrD5XS+nQOT4dR8Let0agOo7KGu3jW8FcQmwC7yXTJSZnayWs=
Received: from DM5PR21CA0004.namprd21.prod.outlook.com (2603:10b6:3:ac::14) by
 MW3PR12MB4585.namprd12.prod.outlook.com (2603:10b6:303:54::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Thu, 23 Sep 2021 12:30:20 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::19) by DM5PR21CA0004.outlook.office365.com
 (2603:10b6:3:ac::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.6 via Frontend
 Transport; Thu, 23 Sep 2021 12:30:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:30:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 07:30:17 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/4] amd_sfh: Use dma_set_mask_and_coherent()
Date:   Thu, 23 Sep 2021 17:59:28 +0530
Message-ID: <20210923122930.3873914-3-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: fef4f12c-0b54-4310-2d75-08d97e8de849
X-MS-TrafficTypeDiagnostic: MW3PR12MB4585:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4585C1F61FA63A2EBC49D213E6A39@MW3PR12MB4585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6P1JbDqU48Qfbw7opSAnvVIDKF4OR3WnJP/vSfRfGdVh80q2kxY1b6IIYl1sOgHE9aDdiChsBjhJ8wGYcOYezDkMCpc353aNoYnGj52EGYV5XrVy2zgv20THLcWM+VInFdjLqTCzl/BHgSBJi4t5Sef35qfI5HXMfPFOk0hdLbgjnLFQZ1o9aczl/xNBiteHMKRzzs62iiRag8k2jtuF172KcWpEvwnMu+5KW1vY9xdjtROXI4Eql02dM8zZZhP4nzj6nPU3FxDyVP6HCj0Jmo1ZiwP9Xpbv0RykeI3YRlxVkMu333HcerZnhycQPa5WZXA4/FaRytQbaT5TVJKHOVzqz48XRyokt8aEpvsfFGixXjbCNKOOkoDBrIRl56y2aq1bkYkT5Rg69Jl+FfKPfuDVZp20tr2PbT0QXcAGXCfFTfEQCeYyF5leVl+5cKo2siRc+Sp4AjMCvvPgaRW6ApZHXUrb0LhFluZlN3b7u6Ma8vTjPIcnj8q9vFdyFwWTb4lTUvmjOIymn3Pc57MWp+ENNkLZ99e0nebVRPiev6FgNlSHMnKUZxBJj4mrKyKdqQXmJRq7Mp/tSPrYrJRfjgzYjxH1MiyKhWjeGyN+xYdwCmgVBC57a/bdbMiXFn5bmXEzhQ9KuMITo3x/kGdOoj3H5kTilCK3SE+beRFpDcXiI5pHa+/Xx3pS0eR5P/9VduH0pwaWIUZF+GBmg4D8NHKeF1FUcvASLFBXueG4oc=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(8936002)(36756003)(8676002)(83380400001)(4326008)(508600001)(7696005)(5660300002)(36860700001)(70206006)(86362001)(186003)(16526019)(1076003)(82310400003)(47076005)(426003)(81166007)(316002)(6666004)(110136005)(2616005)(2906002)(26005)(356005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:30:20.1434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef4f12c-0b54-4310-2d75-08d97e8de849
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4585
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use dma_set_mask_and_coherent() to set both the streaming and
coherent masks.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index f5e580f598cd..ebe396a4570d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -245,10 +245,13 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->mmio = pcim_iomap_table(pdev)[2];
 	pci_set_master(pdev);
-	rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (rc) {
-		rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
-		return rc;
+		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (rc) {
+			dev_err(&pdev->dev, "failed to set DMA mask\n");
+			return rc;
+		}
 	}
 
 	privdata->cl_data = devm_kzalloc(&pdev->dev, sizeof(struct amdtp_cl_data), GFP_KERNEL);
-- 
2.25.1

