Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F98951FE36
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235657AbiEINZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbiEINZB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:01 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B384A237D5
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cg06UJVb29A0IESGhL6Gg6MBQb9t/TpATJCrGPiL1tw7CgDYZBxIZWAWh7wGUknP00YntQCOOtiq0/ZdcNEmCW9jQ62vh504AZbQxgrTbMQV2rJxnMulgs35U+yXP6LN10y61pqKguIhOtD+o1mwlneomoiZk/idXtxaIjsGoqF/szeJxAKVgX16PDlkIWqhqkCbOX+5K5VY7MsFrUdAHipddiWLCVKCTP0+heJ3AQczFrJx2BxvYSi/qfgUX5ApPAO+U3qMgglln0kekCq9BmJUkIG1leHSyUIn/k9q/aiTOLeN0RsYmt43RSBkW5Lk8pkkv3Inph90O/I5sAFmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foyQaivpqrbMuvya+0g3DtLO4+bPkbJXNXVEB0DNcGc=;
 b=Zle+t70J0ml7BU1TOGwNgpKtrB9gw1UEkutAFUAOdDkqL3bauHc6pRWfNcXIojTjI5jR5v0Em5NetdJc/If/PhDQt+KlSjy/HIS4bXTGO2EXdjCouL/UMM7Nq6fHSRAXP2xmunimjDnCh1iIP4t4QyaK+W6w4KbaR0S0OnzvSkVuEKyqDZZ5quguGwX4mVQivZCRIlKiyW889tlFI51BDsVPs9u16Y8JFRFvorjbUOqaBsJTddgZ9P49kfRlAJbd/2TOZAYcASGzS0yPymg7Nd3mRP6pcylhFqp2n4M53a7Vx3uBCTLQ9wzwF+Qq5/C3qwYhZHmd9ltGC55ml7vmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foyQaivpqrbMuvya+0g3DtLO4+bPkbJXNXVEB0DNcGc=;
 b=4kFRxYdfJbuUuMV6xcV2N4YwdBZ0NlpDDxAU88HPZ/bTYVA8iyRx0UZxf9QxvQmoWglZhJ/eyglZSIj6Ofihagdvz0eRzlQcu4Ydz7wceHMUinQAmFQgZSt1SroU8LnnpS340xY9F4kg1uywPL8Lw8Hjdc8H/K3SeJ44InStZsc=
Received: from MW4PR03CA0328.namprd03.prod.outlook.com (2603:10b6:303:dd::33)
 by MWHPR1201MB0048.namprd12.prod.outlook.com (2603:10b6:301:59::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:21:01 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::26) by MW4PR03CA0328.outlook.office365.com
 (2603:10b6:303:dd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22 via Frontend
 Transport; Mon, 9 May 2022 13:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:20:58 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/7] Enhancements and fixes to AMD SFH driver 
Date:   Mon, 9 May 2022 18:50:19 +0530
Message-ID: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49b5b808-eeed-4cc7-2339-08da31bec321
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0048:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB004806A2B61C8A706BA5FCECE6C69@MWHPR1201MB0048.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZxtbH6tyO79LdlnO8XdlpDrSamq2+9mIsqivmBawE6lvdp/ZkEIqzXevnSQeY+1Y4NfCnFtS1MUdL9pEfVp8XYOYQYvmBd/0EWyTrjrF6gg6gMEJssyCY40KV8ytZZs7ZHwjqm+5LD9+PhXtYocyBfWE2CdMbY9kAJw5EMJ9GK28I9oHDHHxFgllyy+5dl7GBELhnQFgYFv/DsJhMAERMvGWWXqVLEspsvZsHfpoXJNAm8/AJWHlnsO1yYl5sQjWMkfvYe942oOLwgjI65A0GIN72kawdpV/H/bphKRqVZtvP+8SBaHp7LU/qrwsGD4pay21GEsXpA8DHhKW+khOjd9dq57VkoVTI5m1CL5VjC9PQ+/vhUbsJtdWkr1H//1BCG+ayFrOMVsu0fJptt1APvjDKG1p1xKWHR1SlsZQT/Jqdn2Yru1wiYe9pYjiNec1uguOTmKhP3yRsqcPHhOFkTzpg+Joa2cJVjrZlkaF5kqCWI6fzM9KphN3G8CNj+wdDsEGu0vx0UT9qPTti0DTmqP0gFtTGMiMVlCC/a9yvlVGp2ftkSXp6Fm3E5EP0UT94oQqoP2SVja/GniY7zMUZv/Hd1cKx1NdBBfv1X49+cIOZJsgKSOnR8fkMu6Mx217mfdQwEjRFno4NH52vduTf9SZEUb3MZa0r9nRpf3bspOpkr/jX+Z3kHNwNbgoJZ9sYXkFvg9jOhcWJWDJBfpFQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(336012)(426003)(508600001)(47076005)(36860700001)(26005)(4743002)(316002)(16526019)(186003)(6666004)(1076003)(7696005)(86362001)(2906002)(5660300002)(36756003)(83380400001)(356005)(81166007)(82310400005)(70586007)(54906003)(70206006)(8676002)(4326008)(8936002)(110136005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:01.1747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b5b808-eeed-4cc7-2339-08da31bec321
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes includes to support sensor discovery, add sensor name by index
for debug info, clean up string generated for the HID device to make it
more obvious.

Before:
hid-generic 0020:1022:0001.0003: hidraw2: <UNKNOWN> HID v0.00
Device [hid-amdtp 1022:0001] on

After:
hid-generic 0020:1022:0001.0003: hidraw2: SENSOR HUB HID v0.00
Device [hid-amdsfh 1022:0001] on pcie_mp2_amd

Basavaraj Natikar (7):
  HID: amd_sfh: Add support for sensor discovery
  HID: amd_sfh: Add sensor name by index for debug info
  HID: amd_sfh: Modify the bus name
  HID: amd_sfh: Modify the hid name
  HID: amd_sfh: Add physical location to HID device
  HID: amd_sfh: Move bus declaration outside of amd-sfh
  HID: core: Display "SENSOR HUB" for sensor hub bus string in hid_info

 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 45 ++++++++++++++++++++----
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c    |  9 +++--
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h    |  1 -
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 17 ++++++---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  5 +++
 drivers/hid/hid-core.c                   |  4 +++
 include/uapi/linux/input.h               |  1 +
 7 files changed, 69 insertions(+), 13 deletions(-)

-- 
2.25.1

