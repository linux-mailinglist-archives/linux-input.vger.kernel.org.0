Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3FB6FBFC7
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 09:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbjEIG77 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 02:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbjEIG7l (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 02:59:41 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36872114
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 23:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYcC26T2DX653ZM23ZWBrjLgoiuze8w5DOos9wB0VqKzaRHRfP6giu4TxneAUNABj40MMixGE+jEDOx1bCQtdy4kGlxmr66aOSyVazN9k3+dO0ZjH+LfDczsrodfU5COMHTowIFEbuvxl5KFEQE250Qt04Z+uP3RsWuVJ5RIfNZB4Q3p7fTXh9ZgaO4cyPq38jDJe0CpSZF2DYg0THJQ7Y0m+5L8Eodojm6Fl6Idd9U22q42syjD/LDrG5aQ0AnHUx+40n1X0SIS/+HDW+m4mz/jBEP63gcEJS3moCB+Q9Sed9WIZX0jz6/IHgwSfsTWEdjuPHLEA98ZZCVor9u0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5dK+8bdhgBX3Qw6OjU4gRuoNt4LPmGtxCm4bYXqbcM=;
 b=fuWK5EXUmvg+YigiJYnZHJoPtftvUTk8nE0qbjNnBi0hhq4geGH2x6f2987VkM6sq2avGx1wDiA+lJMlD2ESLP3a2IHMW5X2Q3eQNXLZji1bMrB3bEvluXhcgimj29Rwk8ZlHVLhdPj7IDLB/lk1JPPaFVXJQfyWe8Uj1VuPvnACQQgd6CPp8bNCHxDp2rU+Uh+52t/Kvyvpnb4RYLl5EmkMl+ImhsEFuVpELdYGN+jId7+GPFGIkGr61yHPLB+uRxHXNtmEyRLuEEbErVPEYRqpX2dMfRKYyXJxUeXQRQLiqysDpwEY/gsCnOf3ElNGmBAZJqPFtwDlymo7IE58eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5dK+8bdhgBX3Qw6OjU4gRuoNt4LPmGtxCm4bYXqbcM=;
 b=h0NqznH7Q91x3QwHDwSvbOCMyPbSVjm1zgqYpST3aYwCJ8giI2CGb/644nhh1Wwf6tvQIwDhhXGzCVPV/NoulDObmzQ6JPPdnljsU4eJHm084wBuTZi6F06UDK+hP0K9e+bL2TA4CWAqK7I4q8juGWJu46Uk7MgEqcgBNVlg+ys=
Received: from MW4PR03CA0234.namprd03.prod.outlook.com (2603:10b6:303:b9::29)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:59:32 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::f1) by MW4PR03CA0234.outlook.office365.com
 (2603:10b6:303:b9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33 via Frontend
 Transport; Tue, 9 May 2023 06:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.33 via Frontend Transport; Tue, 9 May 2023 06:59:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 01:59:28 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/5] cleanups to amd-sfh
Date:   Tue, 9 May 2023 12:28:52 +0530
Message-ID: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT015:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c09852f-d089-4bb6-9aca-08db505af131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oepuib2iUjISBf1f9uyXbRm7jMzMywqIfh50ehdVtSFHstVZBebCYsfWF2LIANuTX8UIBTuFfXc+OS0fwoiJFeP8JwWsQ9l+gSSTswoASkCRIXjx5LkMVrSdxTE10aP4N2pvWa+hv13xtfgRdLwaKclygOi7NxD9u4jT8r3YCm+qGUssyDQAcVM3OwQvCQruLaTcrAJ9SmLHdfulTB9KowIh1rDIJYkkH8n4Wkn/BOPdirFueXqmW2U1++4y1h9qHCuhpSQcjwRy6tXDHzak9Kub0LN9/67xriV5jo6h7xpBdWYJ0YtIZac+uhwXtdcCV+oCkXIFGi3iwozwlEC1RehEs2z3A7JdiS7HGJgUkJ7W8IjwWEgDS7lRti4ciBPw/gbasjpPR+c8BgLKn+au1dUE8jwZTOkpTX+bL8Gk0tzbcaz/YzYSUCGOmj2auVM35oQKqOuL6zL05/K7LlZcWEer4i+VdvahpX7kAKe5AhpISFe0zLF+7CQZXYNI7p4mrDxkY6aTsrcmCRzIaqBFzS+UVRWz4N7s+VPK5iZ1wh8HGtbmFKnWW5rOkQzDtei0xs19R50OrhTs2ymGecWoB3z6yZKpC/zeP953K2krJggHHCFZ5dyjsg3SNsra4H9F4/AsWmXw0IqMBKCo5GM6hm6JdelH5riNXsl/zEeFPP7i6iEvSxLwBqIawiemhxBy3rCP/OorooSTfuNRCz1Ry0nIsePcP5yVmJCFAR+QdOg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(2616005)(86362001)(4744005)(83380400001)(16526019)(186003)(4326008)(41300700001)(36756003)(70586007)(70206006)(1076003)(426003)(336012)(36860700001)(47076005)(26005)(5660300002)(40460700003)(7696005)(82310400005)(6666004)(110136005)(82740400003)(40480700001)(316002)(356005)(81166007)(8936002)(8676002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:59:32.5333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c09852f-d089-4bb6-9aca-08db505af131
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
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

Changes of code cleanup includes duplicate log removal, cleanup
sequence and spliting into multiple functional blocks.

Basavaraj Natikar (5):
  HID: amd_sfh: Remove unnecessary log
  HID: amd_sfh: Remove duplicate cleanup
  HID: amd_sfh: Split sensor and HID initialization
  HID: amd_sfh: Remove duplicate cleanup for SFH1.1
  HID: amd_sfh: Split sensor and HID initialization for SFH1.1

 drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 47 ++++++-------------
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 24 +++-------
 2 files changed, 20 insertions(+), 51 deletions(-)

-- 
2.25.1

