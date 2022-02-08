Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153024AD8D7
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 14:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348344AbiBHNQA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 08:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345811AbiBHMVq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 07:21:46 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9088EC03FEC0
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 04:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg7F7xZwQfUFck70sbOygUIXwQLYltRpAzgGC/cJVYbL5iP9X0QEg+fYYrGbUzeFP8nhc98IE/UQXQZ6yaK8krUuJzhRGc2yWBtATDsO9IMEn0BG0WC7PyEzT4ac94L1Xyvzf9bC/wyPVh3yzE4ZWfm2PjYRdBNV/OsFFsRtHBka0IkCJZMEr2OzWitVZ7PgAyy2wFffDGKlvMHZCCBqUzsK6ZGmmdLqWWby7xDqhGv90ekwZRlWgr6NIPuAlmYjXeB0KMcolwdyhjbQPSIxqANIJ6rEzQ9iLjbgUozZqtT1JE6IrWBxGZ+LgHJeKlJzTAjsonzTZVbBQphP5PoenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+hDUczLqrXKqMdUMmJzkOLc7Vbtt3oDtUZKTUMiW+E=;
 b=YqJs7fyhiFEsKjvmB8ZdyEoAM/sv5LXacKM6VdKnUHDv+5QaMmKVBoWjF/Lnl7b1pvyoNfNItpzmV8QJTMeUEavncKWroNSu4iOVT+t8BdkVowv8bcCT/V7nHU4gg94Xs0EjpylFHeZoI8lCnkkS3Nevw5rkiPUUX1X1GtvLECkK1nRHJ8LWqgfUNp2Dszy2NmEEA8TExECz1vmZ2ol4EuectSaFVukSuNi9SXzuNhFdFGBQoSpkMKm1E9e6fqDl5N8LWBNoO44DQyM1w8X5TfVldRbzN13kchn5mhWbckMguCniXkzVsNen4lDPs2mBf7E9ojq3Sg3X1ZKYXQ6eDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+hDUczLqrXKqMdUMmJzkOLc7Vbtt3oDtUZKTUMiW+E=;
 b=LqbzUkXO1hXzQjOpdIOLhtyFKCIdWvbDwHXecrQnh2mbpxAhCfir5zhBpNtnAFR2In1iQIlfXO8CgVrfXFi/7WE3V0HnhDRh8kP8IGt+GYn/XMgMpR7Goe9oAFiqgaaQlI0ENEcY28h0UoD+L6pXSen2eBCkt+Tatk8HdyuRaMU=
Received: from MWHPR03CA0016.namprd03.prod.outlook.com (2603:10b6:300:117::26)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Tue, 8 Feb
 2022 12:21:43 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::53) by MWHPR03CA0016.outlook.office365.com
 (2603:10b6:300:117::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Tue, 8 Feb 2022 12:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 12:21:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 06:21:39 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/5] Handle amd_sfh work buffer and interrupts 
Date:   Tue, 8 Feb 2022 17:51:07 +0530
Message-ID: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7b81081-298d-46a6-b699-08d9eafd909d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4424:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB44249A0F3ABC014343921A48E62D9@MN2PR12MB4424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dgJXM6SXaVSDxVRwDxNnaJiip/b9OMiCepUMxTnL3pmAeZCHF/oULzmQL9DF6yRDEp3pSZZwdF7ihQXdV7pJUf0n6wNuflCSWIoXNrmNSr8OIPimQtJq2F/nKEofn5KTF8Zm71x/LbVdeGEyteDcgLirq5bIT9OLIY2O2ApbJv+RQEvgOfTaT+WblrtamkYkrXuBw02E5Uczlrnl3xZ41OElbr3A65RBqEtY2tGE9nNlu57S/agryjpElCgR3Ep/aSiCNjOlA+MOefUCpUFD2rYnAvvrJzXVKEDior7Vo9q5c1id6QkK7GH+ma4fOsfzU3mvFrU4Vex5trZZzjM3jN15epN/xnwJeUBbqcrao9ihAW0byUiT11oawxT7/BFErTybWv+jV4euJ0iOay/UZ1R3aQPWjSE7l3jfBVrx2mH7RnSnV93TSAHLZbnDiKoQrr8cmQTg6uOX7NVs+wLINr6bZ16jN30oCEZtesvPFyECwDBF36axO42kpcl2MpLNAPUYc4yceTVgj9FCiSeCQdxY2V0oUS7WjVl+3OLNnG+578WTGUhK9Ji2+xXQO3DQzWheGP32Nt8jHtjDyQqZ8A4eVuwjrWLtOhMCrJJyBIx9ehgRucdL+tkR8wVND0pThO/AeIIabcP7llUMHDRQCEf4en6RB4uOwuQed6/7QJ+ozc7q5Pd/p9tGYBSW059McbJKB7DTPW6dMbQhup6G/g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(26005)(2616005)(6666004)(7696005)(36860700001)(86362001)(4743002)(316002)(336012)(4744005)(2906002)(1076003)(186003)(426003)(508600001)(5660300002)(36756003)(40460700003)(82310400004)(47076005)(8676002)(70586007)(70206006)(4326008)(110136005)(6636002)(83380400001)(16526019)(8936002)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:21:42.1485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b81081-298d-46a6-b699-08d9eafd909d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes include to handle amd_sfh work buffer in PM operations, disable
interrupts for sensors commands, process and clear interrupts on 
newer AMD platforms like Renoir, Cezanne.

Basavaraj Natikar (5):
  HID: amd_sfh: Handle amd_sfh work buffer in PM ops
  HID: amd_sfh: Correct the structure field name
  HID: amd_sfh: Disable the interrupt for all command
  HID: amd_sfh: Add functionality to clear interrupts
  HID: amd_sfh: Add interrupt handler to process interrupts

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 72 +++++++++++++++++++++++++-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  4 +-
 2 files changed, 74 insertions(+), 2 deletions(-)

-- 
2.25.1

