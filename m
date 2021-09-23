Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32AF415E63
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240939AbhIWMbt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:31:49 -0400
Received: from mail-bn8nam12on2043.outbound.protection.outlook.com ([40.107.237.43]:8458
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232201AbhIWMbs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:31:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N28UeFr+po2RynEOn+s/CpzwK57W915PNfCcf+mhsG//YCMgPutKlvRLyQlTHxVzjoxCpV9NAZBUKeeOl0nmjzg3uX2Vubg4df+lLR2d3F9wd7pYN78zA5MsszqqyUy5iaR/ZWIcX83KgnFCj1Ct7cj04hpEU4TRSPo+SQ49ytreFEIEYXRf1k8Uaa/0WEHQ41qsGruy+Yqktv9cPgpnEhIT593BxQGi9aHyRDzocq/dQi8wbxQzQyEpAvrY8+iZrFAbZrnk2Dw7gzCgZeXiC6cm6cT3EXWopgpSWqXtODPulcgppbj6gfM4qnIWABhyP+BEsS6Vm0oVxfEl/0hX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bC047ewc8PnJ6TZrcEXP0TIUtkc+soQedCsWlmhLGf4=;
 b=CdY8Ssu2KaZq+LTEE4YuZDdHER4ZVircw6tmJlsSAmg9z/6V+ae/pS/dU6Aq7dyedPAqtatQN+fhdZcyiDhpeRM3vISp3iuYJleUObtTuIAKHYNe2anjrz6Ygb6Vaqg4OQDLttcDKm7JFQ4y8BAvqreLA/U2moBwJotEz3SW3gwNlROVElAGVofQlxnaQJTyTgbrfc/B0kmbKtlBCytoCu11aRzaVcuWHBZBULEKBeUsZzJGn3tdnZRyD8rzy6riQhafHS2Syj2VW1hilpreu+XCkhl9qI63Y0+rC9prVQ4ET9xu3Y4QXo1AC90pUfGrBKF+6aNzZNX8IcvDiQ1OrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC047ewc8PnJ6TZrcEXP0TIUtkc+soQedCsWlmhLGf4=;
 b=JUvL8/52wA+4CoCEduGTlvM2SeglRadzFYgcMPlMGZK/BvldqOs/PA7QvQt9SB7A5o8MYBFNXZbtm/4Y/0KIgmdKhU2oZsQqVBeMuCmfLpFPjLgVPxfk9ahWTaElPGoTHpCCV49WsjiTtHFDTpRd3PaaB1fbYamfthpGwIFwbyo=
Received: from DM5PR22CA0008.namprd22.prod.outlook.com (2603:10b6:3:101::18)
 by MWHPR12MB1568.namprd12.prod.outlook.com (2603:10b6:301:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 23 Sep
 2021 12:30:13 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::ba) by DM5PR22CA0008.outlook.office365.com
 (2603:10b6:3:101::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:30:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:30:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 23 Sep
 2021 07:30:11 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/4] Fixes and updates to amd-sfh driver
Date:   Thu, 23 Sep 2021 17:59:26 +0530
Message-ID: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d35f99-adb4-468c-1a9e-08d97e8de45b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1568:
X-Microsoft-Antispam-PRVS: <MWHPR12MB156834B83CC8AF7E3CCAAB34E6A39@MWHPR12MB1568.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwebpCJewKBR1tWYtZML96Ua3xyss8Ojm6km/zpGuLMHcGwEG1LgE38dxpnbBpcqFSv6isyf8wqaoVZlaVFfgQiaYsFRsCqw6fNMfF5DyFC/NNgqhvkVtUMLhq9umNpsc0ui/RNjHEM5IDLtaotkjKBfMj7VuTj2vkR3C3y+XkbEzATamwGz2wXC3am99fgopspU/IVvIOig0faiXGtV0LjttDbzPzofitDeakahF6fytEyzb8ItuSnUvb0oimaKP36Ne+yExhKqQDZiBAyxwuprFnoGbqANbTA0heKo/vg82lwYGeadL6NYN1sAUVN7X1TJCRcvQYLGstX400pDtAmhCcGfh63ulYc5utUy3ZfZXU4lL4x/MEVPUYkBCADIKoWXRX+5eXLlp5q8Qx7jLRCVC+0xvziy1XjqGRg57Zld3n4NV4//MjtVp2k18tDSrti+WJVTII8gjZJbQr+ZsR+DbVmXEb5Fxip6GZixs+oaI5AwuMqpKD4XFdxZBsIs9o1GWl28oGqXueQyHGeOR7jISo1LXiwZigiU0V55zTmHI2UrSHoPSil5CjHwBq08rWxN1Czu9KIBJ/LunPP7j88k8Lg0nbjS54/uooDw52bTPMSiZW7O7O0ayoxHxSG4veS+Xsc8T6BHLyU4kXeDHcG0UjGyWGHxF9+c9lE0Sf+jjSNx+5AecpKBIDD70Zs9BoC0/zFKRSwLVXHtUQqDSho4P1T1QpgxX/vwD9CShn8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(82310400003)(70206006)(316002)(70586007)(83380400001)(2616005)(8676002)(6666004)(15650500001)(5660300002)(1076003)(336012)(7696005)(426003)(186003)(2906002)(26005)(86362001)(110136005)(16526019)(508600001)(81166007)(36860700001)(356005)(4326008)(4744005)(36756003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:30:13.5520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d35f99-adb4-468c-1a9e-08d97e8de45b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1568
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes include fix to NULL pointer dereference, remove pci_ wrappers,
use dma_set_mask_and_coherent and copyright updates.

Basavaraj Natikar (4):
  amd_sfh: Fix potential NULL pointer dereference
  amd_sfh: Use dma_set_mask_and_coherent()
  amd_sfh: switch from 'pci_' to 'dev_' API
  amd_sfh: Update Copyright details

 drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  3 +-
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c         |  2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  2 ++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 33 +++++++++----------
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  3 +-
 .../hid_descriptor/amd_sfh_hid_desc.c         |  3 +-
 .../hid_descriptor/amd_sfh_hid_desc.h         |  3 +-
 .../hid_descriptor/amd_sfh_hid_report_desc.h  |  3 +-
 8 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.25.1

