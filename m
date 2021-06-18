Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E3F3AC5D6
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 10:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232163AbhFRIVP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 04:21:15 -0400
Received: from mail-mw2nam12on2083.outbound.protection.outlook.com ([40.107.244.83]:57537
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232120AbhFRIVO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 04:21:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBi6JHCMWmo488RPU4Gcm4Nn/T3wM/g4l73PWEkV2wI9p1NK/rawjlHwNqV1izgCdgbwEpxO1wsSa3YPTKIPMPpxfrcV+9qeHt05Nie9IL8RRzeYMhP47S71M0fYISuJuAiMkabKgG/SWjp5kam8jGXkLNplGhttAS8g4LfAcmjs/yQk20rmhEe/QWyOx/rUtrFrM8rxuDj6raWpNc5wpIExIfmLAAIMyFL99OCZN5uwnzcnFxs4AZuBKXldkxti7J+vWi987i2pV8EvMjJodDIvTpWTjtstDuURRnPfcL36W7dUmK8DuM1bZrNcFIFdUls45U9zvKrhKBqkaFbtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VqzpeFOwDt4k4fVXuVYZj5leJ04YFwafDi9HsOE/bU=;
 b=PG/4O+33esPm4t6MCDfcPyiQOY2xMkNknbdicjeQJa04wyxWQVVYh/F8EjMMhkQzqXYAPD0W1Lx5KWgF3X2Xdxp/99p7n0elWlhMGu9VasKzL0I2u7roUQG7Y1W2yvp4YuTDFc49sVu/MRICJmfCUG0x3g9bRDqOdSoD/JIqm3kRfXdoZ5kSZw4W9xqxTMSfD9fioh32ZgXyvFfZmynmH5uTVZLY9p/LzTvo8csf2IBASW6AntACRQbBSI1yGeSXeSRmQBJsTvj5K52fJhXeaLxR140GdnQ61lXdhNsSpbqpne31KDjSIwzPLIvbhPABAa6LxOvETtqi6+wNxmAPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VqzpeFOwDt4k4fVXuVYZj5leJ04YFwafDi9HsOE/bU=;
 b=iNdUR1FgxtZB/A9Ctrh6Uqu+Mye+SoKvzmLSNU7FzlZDfn0pe/ns+phLzR2GAUw48VwgwL2LhD4IHGZs9eGWTvJ1TtmDjYxO4Hi0YGvN3fthlradDZCJ/YEQxNCsy3f8C6GFc30zc7HzYwNaoC0UCtzDOXEEwE7ZP0RDOTG1Kqk=
Received: from MW4PR04CA0311.namprd04.prod.outlook.com (2603:10b6:303:82::16)
 by DM6PR12MB3081.namprd12.prod.outlook.com (2603:10b6:5:38::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 08:19:04 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::eb) by MW4PR04CA0311.outlook.office365.com
 (2603:10b6:303:82::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Fri, 18 Jun 2021 08:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 08:19:03 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 03:19:01 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/3] Add SFH sensor support for newer AMD platforms
Date:   Fri, 18 Jun 2021 13:48:35 +0530
Message-ID: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38251fa1-7793-457f-b371-08d93231bbfb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3081:
X-Microsoft-Antispam-PRVS: <DM6PR12MB308199A3886197B768DE2426E60D9@DM6PR12MB3081.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzJQTlVvpBbyIqGBVPFFxFjU6gTHnWTcOEpE2Lcx2tFiFGyeyxvcC7ETlfM+AeC4Ii8DfoX19rRYUA67vIB4J9qGYEUFrYaTfgLwPWfjUQt1l7RpctwudYVvfdiJo+70CkixtD+ekF7Vj5NxAz9Hweac1MyIF/WJ9CdhiW5UAdP3/GayIPLCePb49ckqu3+fA4hrgTpzfV8iKXPEPxhg2xu0qa3TwCtDO3wp1noQuzZE9MyRJIcFv7Oq2Q9mbsCw0KUGv9NKABeMOYyEKsW+Wg4I0uImnhXhPz/R13Pe/blk0e3d5GWGv0mR/9VdkvD50b23rYULR3SqoNEH76qDSLWRZt67LxiOV6xeVTqlMWSBdfSKNTovvnJhIWZTtnyaFdIsQXsJqM+m9VBgtbXbAKSR9QYUCOMzuyneiZvwDGpYrB4GUE28yhfXiKJrUmcFIOFKPEi/K3Liey0iRvKrxWqSIoZnyCip2Ei8jdpX3lSkV0G6SQA1ExFym7YVRUUifRAdT1VZFkvZA+Plfdgz7Z5HMeIPpgzlcGg13ngJgDPYluIYcafiHzvMijwUV0e1aTkeE0rz1rwzAAjrM+Pox81sHX/cw3jOGdvx+LXP3ZAdrG/Ra1GukQvltsA7F59nqsKnfscfpELPocpbYGA/dPe74oNWFFVT+NnnchGzdEA9pU+Zvz1ki23/Lh/ThGCt
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(6666004)(316002)(4326008)(36756003)(110136005)(54906003)(70586007)(47076005)(70206006)(83380400001)(82310400003)(2616005)(26005)(2906002)(186003)(81166007)(478600001)(336012)(426003)(5660300002)(8936002)(16526019)(36860700001)(82740400003)(356005)(8676002)(86362001)(1076003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:19:03.6737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38251fa1-7793-457f-b371-08d93231bbfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3081
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

AMD SFH firmware (MP2) has evolved since the time the last driver update
has been pushed. The way in which the MP2 FW and the driver communicates
have also changed with changing silicon versions. Hence there is an
update to the data structure and the things around it.

With this in-place, the AMD next generation SoC's like Renoir, Cezanne
are added here along with the support for Ambient Light Sensor (ALS).

Finally, bringing in initial support for Human Presence Detection (HPD)
sensor on supported generations.

Basavaraj Natikar (3):
  amd_sfh: Extend driver capabilities for multi-generation support
  amd_sfh: Extend ALS support for newer AMD platform
  amd_sfh: Add initial support for HPD sensor

 drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  43 ++++---
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  12 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  89 +++++++++++++-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  43 +++++++
 .../hid_descriptor/amd_sfh_hid_desc.c         |  48 +++++++-
 .../hid_descriptor/amd_sfh_hid_desc.h         |  11 +-
 .../hid_descriptor/amd_sfh_hid_report_desc.h  | 112 ++++++++++++++++++
 7 files changed, 324 insertions(+), 34 deletions(-)

-- 
2.25.1

