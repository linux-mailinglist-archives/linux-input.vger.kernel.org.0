Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A2D6DE0BF
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 18:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjDKQON (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 12:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjDKQNx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 12:13:53 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF8D7D88
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 09:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1M7iVyBtIIc1CQ1+TnFiPct5owT6pdvyvgHuH9tleN/GcsZ69dsf04Oo2KgBrCb8Wp5QTHwC7UdIHsBoaJPWPK1acMBU2B+qeur1xg/Ny60zK4sNPcgAXFnkNjFRXRZ+07tj9f1+QRL3t0cP9SaSYd801MSDJfWRDGC46uekCzFqscI/pJg9BnUI++RA22YoJN3mTJHqzuxLErxaiVvlpupW2Ozs6jI4/v/7kbEYYcxhsJl/u55VccWaVM4sM48TvnyX2BfpbmuZ9fA2RGEarDGgT/afFMHYPgbo8LasUUZvVsceQsfRKwEFhR/rm5BkQG0aZsMUpnieh32ZsUoqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhEDjNGpSf2WmBeqJyaGaWoIz8+/oBAKbhSQriirL5c=;
 b=kvOnvrCqLzvS/i+yl7yqfjgVf5u47G3GFKJinwilcrzqTbYGM9W2ZeypnTw3J/hbD/2gO0oWA2p7WjsJSuduchDsPy/VaMUn3dKjmTS+mVQOkdYO+CfzJn1ZwFoU84s2VNt4uG48693iDws71ZEd1oA6c3131QIfnvuqKjKL+rOOBhQSLK+Bv4rEqAUuz6WRU+SkaRA+BqClpHZa38Tnh/sAnXMv1bwTaXc8DNAYL0/ZLltquuUVKNCRjXixi5Ch8dJbL7XgMX/CFAkk7QX5rNrDPfXU/yZ1ZaBcIyw+vzSzmOy1XrVUpVxGohq/So+CVkMFZggRtVDXoC570KWImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhEDjNGpSf2WmBeqJyaGaWoIz8+/oBAKbhSQriirL5c=;
 b=ATYkCpEUJbulCOR9jXzaudgni6NZsqk8+gpLwy9IfyefDgZRwUxbcKaTX2Cu7UbpcSl033bZNErA923TmIKCqDAmmeyRo7u0N/mok6b8Z+mO/5kU9kMfNY6zbQxMCpFhIDxvI639w27NY3Tego/ygxAmf+IVuN6V9IYLSsAJTmA=
Received: from DM6PR05CA0051.namprd05.prod.outlook.com (2603:10b6:5:335::20)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 11 Apr
 2023 16:11:20 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::11) by DM6PR05CA0051.outlook.office365.com
 (2603:10b6:5:335::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.21 via Frontend
 Transport; Tue, 11 Apr 2023 16:11:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 16:11:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 11:11:18 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/7] Fixes to amd_sfh 
Date:   Tue, 11 Apr 2023 21:40:23 +0530
Message-ID: <20230411161030.909350-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: a05c89a1-d53e-4afb-b4ab-08db3aa76328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7K6ant2ILYldBOQjI4XGYLwJnx0ezzFeC0n29BWQf5pEAcDD0NknIDPPNQq9J8OCP30oNHfuM3c7qTrJHlr+5qdIR1VdevnZjMSiBDE3opusXY/NTojwTmj2cqKsG8xWNJzCPLZZeLeGeNPNgbjk2xUtlCn5ARvTlPUHEpL9Wo/j4p27BHuII5HY0hRatqmkrzCEvGlQFHstaXHdzI9BX9sqU0I9gvvSMpl6qkjRBOyFAl2aN5iMbVZS2R/OmIFgOYsmggWuklGk0vu1k10jIPfRW1JYeMgVMtin4uo6sG8T51sSERB657nAgRqVjkbI4DSuxYRxFqWTSVtVHa58ToX7AKTs+vQNC4TEp70vdicm0q1xHu+DmtEmNPQ8KZMrsK65/vfhfMhxalxpyDzyk3IeeKA4RxrBjP+HAiYeXUkMM1gicse4P08mQFZAYj1LlVTYoQ0B2am6JT268CycR/vToT3XY3enhqgAyFxEIk3+h5K5DwnttMvIXD9Qs6++TT61RiWVAZPvXjhPznO8CIN98auW4lCjQro3idWebiUkFB6uflFU/dqK3FTu/tID7Euy7I61QiZB3+jQy5h1OBqP83rzJ1/nkSOjN0vgJa3INQIpsvIJp8JxJSK9gjcEX6pgMs8pKxeQh2AgXQLtZpS3tPKUClFNp5XLxkdicRORHNn7u1Nu5GPrTgZ+QSjSttgmgc7Bm+fV89v4G20dT5ec9+puHSwQsIvcVMpjJlk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(36860700001)(426003)(336012)(47076005)(83380400001)(2616005)(478600001)(7696005)(6666004)(16526019)(4743002)(186003)(316002)(110136005)(26005)(1076003)(2906002)(4744005)(36756003)(5660300002)(40460700003)(81166007)(356005)(70206006)(4326008)(70586007)(82740400003)(41300700001)(82310400005)(8676002)(8936002)(86362001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:11:19.9837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a05c89a1-d53e-4afb-b4ab-08db3aa76328
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes include correcting structure fields, illuminance values,
shutdown PM operations, stop all command, increasing sensor
command timeout and no sensor condition.

Basavaraj Natikar (7):
  HID: amd_sfh: Correct the structure fields
  HID: amd_sfh: Correct the sensor enable and disable command
  HID: amd_sfh: Fix illuminance value
  HID: amd_sfh: Add support for shutdown operation
  HID: amd_sfh: Correct the stop all command
  HID: amd_sfh: Increase sensor command timeout for SFH1.1
  HID: amd_sfh: Handle "no sensors" enabled for SFH1.1

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |  9 +++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c      |  2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c      | 11 +++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 10 +++++++---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h |  8 ++++----
 5 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.25.1

