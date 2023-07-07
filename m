Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB78C74AB75
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 08:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjGGG6i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 02:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbjGGG6h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 02:58:37 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF525172B
        for <linux-input@vger.kernel.org>; Thu,  6 Jul 2023 23:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE+4u528dNTbQYP/O7gBD7iN0AHyMlu2REbRVTrlPQaBCvJ88gt3WgiNyEltqc8qth4SdYo2FfEUbQRCy1PY7yup2TJkOnlXATF0/Ld8zDJDHJGyg2MtShizpw8Xql9ajEUP/HadOSQXYy86VqE+Zdjzd299QmBdvHG6Cj67OeD5WnaYWm+J/hjJd1bGYc4QKaO0Xo8dv82w9ZUQCYxX+/dWKuKL2BtHLcIZ5SYE5d6XeGq0jbgb0dhHOwLMhV1TsTtcv9BmLOCTX0/dJwo/X9o4nyDP6z8ugkIufTG/YPnstHkPOaHxcix+FDh0qvHfVGyodbvMwI9A154vMNkOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Xuo/CoY55RQen63Llcmzl+JbjVkpDs8DSRmovn3c/Q=;
 b=jUPiQ83OX9EMakKd9DyQupAdOVXc8dF3j1OobrI1Fn5cgKqRY8uDg8Q8tfS9Nzh6LgaXwmUxJqXlw/IFIAMA2Y25aF8RF2RGjeO8tbypt/GqNo77nm72movdF1QAVDXyD+jXnZbXjJXHnRCJB8nSTBB2xIJRHIH4WZZ9YaNCJxKyI0/+xd0kBnuL/1Ar7+juG8cwAbqHVY+8pu7rIjXS+1SBkAb402Nya9LpEdrq91UC914UboH0wUgkxLWj7uKXHIiSx/E/8VmsR1x+nrzRJA8CBXAmow4Da7gABrZSYMd9P6KGcKXDudMR9eXBoTpBSLgf46421fuZpl3deW6+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xuo/CoY55RQen63Llcmzl+JbjVkpDs8DSRmovn3c/Q=;
 b=M+4QmcVoab92PVS19GlBjld18NIWzZ5i64eybz0hmUu+/DAzACo9uHwT/8++4Rp3wpzmN9ijqbO0GEy1wGx5zwf1P9pSbd1hSRn6lfkS6s2bXi38sHe2ORTEVhE0zCvPzDIsyW/UCuswnRo+aLdgn3sDMIL1oolptLVcIUDP56A=
Received: from DS7PR06CA0052.namprd06.prod.outlook.com (2603:10b6:8:54::30) by
 CH2PR12MB5017.namprd12.prod.outlook.com (2603:10b6:610:36::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25; Fri, 7 Jul 2023 06:58:33 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::5c) by DS7PR06CA0052.outlook.office365.com
 (2603:10b6:8:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Fri, 7 Jul 2023 06:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 06:58:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 01:58:30 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <akshata.mukundshetty@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Updates to amd_sfh
Date:   Fri, 7 Jul 2023 12:27:20 +0530
Message-ID: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|CH2PR12MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fcca57-0f24-4c55-63ef-08db7eb7944b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SJNtsIjUIBVEDt7Xoi8GZBS3duqP1a1G3mhYzSVxbUkf/pZrUB/q/netscn1C1U5ergeYOFdDFrBo/3hBOGLbZt71IQ0U8zFUC7pCKJRfVE04TSlzwV9hFOcwQjiJjivcrNeyqkI8ZJVtkt2VDyk1JRJ+/NipAPBYWyG+ggaAZ8/22aeOz6BGTXh/deCFrXDJ2H0BLPB+Qe7jDQh2JTgvBIqQOoj9zkkFt3bqwleENdjcyDGmkupOhBQClB81Yxw0v1vnu5xlcxSixYPgfiZymcFuQokj54VsnKpCzk8teoN//Lc8mT76MLu4G5XzPbhiydW5mAzPW7pV3bicIt9a4BgtmsoE8o+jd+IC9mld0rymvUGlgktSwCRFpCN30QTXs7DXk2N42ylqRZtXq0/BY9g2dwlP52wLG4XUYyL9RML0Pw6BFN0sCx/l6NEivZ4Xt9Gn99zBOmaGL4EgfeXXWcu803sIwL9cc0GiSDzOTZXSmqbITqtXoZnPObeI1HU53Oxa8bKB9D1QoyGWWrNetK95rQHcC59fkKC1pY4LZyqo6GwM/sxnpx0M6bNXZXub4DvsG/FpEVvkGtVaykFkYVrHcvCQz3JVWS77a0x04PYo56Qmp03Pp6wqALG7fC3MQPjvxNknqN9CDVK1ktrA5mxGJvxe8xlVh+QllWVz2sNmaViVUTFCdiIuBJRIK3/allvxKKM2hPCUhMDmh95KYFC8bQi1RHqZiHKYus0fJN+UHFNi8WQgkXCkZLz9s0PeJBZVV+k+OF3hW4UADFdhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(41300700001)(5660300002)(4744005)(110136005)(40480700001)(7696005)(6666004)(8936002)(8676002)(316002)(2906002)(70206006)(70586007)(4326008)(6636002)(40460700003)(426003)(336012)(82740400003)(36756003)(478600001)(82310400005)(186003)(86362001)(2616005)(81166007)(356005)(47076005)(16526019)(83380400001)(26005)(1076003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:58:33.3578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fcca57-0f24-4c55-63ef-08db7eb7944b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5017
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series include changes for renaming the float32 variable
including the fix for shift-out-of-bounds issue.

Basavaraj Natikar (2):
  HID: amd_sfh: Rename the float32 variable
  HID: amd_sfh: Fix for shift-out-of-bounds

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 30 ++++++++++++++-----
 1 file changed, 23 insertions(+), 7 deletions(-)

-- 
2.25.1

