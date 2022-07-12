Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E81572256
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbiGLSTT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiGLSTQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:16 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65D2D0865
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTsWGEQ42uJaCERujmIrv9RRg1prxsleIsi9eUvy09Gocur+OoJbavXE+pjy8L1a/4o40w4YDlFLS6BnXMLRCTpGfu9FieifLSmNIdYcN8J8PC+d7Wv2VPWHarpICoyJqWhjkhoaXVgqZwhuACj1pikmM90fJfxpgiEyIp++LRuYYn1WPVeZ6OMVTqpKqjWVCz8niu0JK8JaHHUI7geIQJg2kHPjqTB3n92vPnZC5eafdPswyepuIDYj9fm9xBGjNYdmedKhmxFrwUTUF2PjcqFy3W/2mQw5DW9dzrGSgX0yJHY3eXluAH329IX8hRvoJjyoc56Wsox2GpqfN+j5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2AdJC7EK3mEvho+7NPLizXUdR36RVHgP+jvL/7cWkk=;
 b=ZxyY20o3Lo7zNpbu1+/PKHlFdz1s2D+/iwxGS2k0j5YuLdZa7tUIPtdH1qxTkawT9hzDhHH5QlV3gt7zrxazbB3aBheuX0MAJJ5zAQfvgIyOXzgxhvuRqiYUHIYjTfhz86n9uJlkmaPoOGLZ6HFbCDuMLDp8we1kh3QOCi4PMj4/0T5LpLUrOznRsrNR7G438t0pvrXKvXq2AYbpmLFXqFZY8Y+772lPBizBrT/l0+9alfiVMLST0gjeuaWhMqxDcOJR7Y49BCq3jxQZuZg7eevOwXu7ndh1DRhXEqr4kLJtZLTm7WJ1MoWeLXUj6GWX16MVnsi+LDs8OWPqWmEGYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2AdJC7EK3mEvho+7NPLizXUdR36RVHgP+jvL/7cWkk=;
 b=ZYzuaU8dzfCeuObC4SxnSE6AiPDFuB5kDeQbthAwk+Zl8SMn90f5WJbttvA9rWhxdSMzm/UAYlhcI+U7DE2qaGoQRRDBK/1fw7rh5Hsq5A7T3OxepRrVCI5Res9PrzUzjUK+zt2Lo38esCxfA/sQGShZ2s+1ppys+MCfNuaAU04=
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 SN6PR12MB2783.namprd12.prod.outlook.com (2603:10b6:805:78::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Tue, 12 Jul 2022 18:19:11 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::c8) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:09 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 00/11] Fixes and implementation of AMD SFH 1.1 functionality
Date:   Tue, 12 Jul 2022 23:48:25 +0530
Message-ID: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd166214-bf82-4f83-2ce1-08da643304aa
X-MS-TrafficTypeDiagnostic: SN6PR12MB2783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JuUe7ZHmRrcHPwdhojCJdcv7XJ7REagpYXDKOEhCOPrwGzyFYcxsmSn3MeD5QyWBCzZr/5m1dR6N1Za81Jxy8z3iMZ14lGkjo8uEcmdDqnMms2zWRz7zjEFcjJjTYxTdWyX07ZVfdJDi7dgOiJNLmU6HZ8Kdbga43Pv94wwT421RUzjDJcKYkLd4YatwDEtBqarf2+9Zprp/E0/azygC5BUnMkX0VAZ+geofB/JukHYNwpTGQTGFTqfed1z5RA//OYe9GLscBgkJjoDdGXRhLKhdlXf9mFIaS3VI+sDf/mBguTzjWarpWPsZewbYc+310JFCDjZKxKiKingeR5Yi93/EdHR5kHcDERvDLmnTA/sXAFiAuFwB1V62kRSZ5j4ctde+xsNebqgnt3rx004c/Gclmu/n8Is8Wv60hKXgTjyIz82RvbVQATudn1IZDHOuYlZNPKL6sr8v70mGbswwtwwzoXStxOcUPitd/QQ1ZjQkBJQSADQMys7pNe0J/Hev6U0ZmQsjR/ourHNYfSsdiISZRfNWFfADu9ew+8R9S3lf7qHDrOdm2cHxcn2wawEsUZYK/NbkUIY5vUpT1ua6FywCNGCmwXVXkkFnOE4HoRB/Pqc5RZV/mxnZSJ8WeVO37vt6C9YBxDgpiuuyZRX+0br0VmoYwSHt+j6AaCX3oaEwfG2iKqQKnf+zrDbYucXdMgnvaRDTQNJ0Mi9hRDIbEOE8Ov8FKBSM+meuwjT4j+xp6p2SyKn1OqHtRUVvj44lq1UyHdPSvEugc6HYC301WqlC4flP2XUSrTn5RVIWKzA+wmuuSvECe8OEnrqINkdaBLDMS3H2wbgXaBjVwro/xX584wISg+hyO4el4rM4zZY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(40470700004)(6666004)(40460700003)(26005)(40480700001)(2906002)(5660300002)(86362001)(36756003)(82310400005)(7696005)(8936002)(70586007)(70206006)(1076003)(478600001)(110136005)(47076005)(82740400003)(356005)(81166007)(36860700001)(83380400001)(16526019)(186003)(2616005)(426003)(4326008)(8676002)(41300700001)(316002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:10.9623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd166214-bf82-4f83-2ce1-08da643304aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2783
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes includes fixes and support of new firmware (SFH 1.1) with new
PCI device ID to implement SFH1.1 functionality which is used by
newer AMD SOCs.

Basavaraj Natikar (11):
  HID: amd_sfh: Add NULL check for hid device
  HID: amd_sfh: Move common macros and structures
  HID: amd_sfh: Move request_list struct to header file
  HID: amd_sfh: Move request_list variable to client data
  HID: amd_sfh: Add descriptor operations in amd_mp2_ops
  HID: amd_sfh: Add PM operations in amd_mp2_ops
  HID: amd_sfh: Add remove operation in amd_mp2_ops
  HID: amd_sfh: Move global functions to static
  HID: amd_sfh: Move amd_sfh_work to common interface
  HID: amd_sfh: Move interrupt handling to common interface
  HID: amd_sfh: Implement SFH1.1 functionality

 drivers/hid/amd-sfh-hid/Makefile              |   3 +
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 115 +++++--
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  76 ++++
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c         |  12 +-
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         |  12 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  75 ++--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  52 +--
 .../hid_descriptor/amd_sfh_hid_desc.c         |  17 +-
 .../hid_descriptor/amd_sfh_hid_desc.h         |   3 -
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 300 ++++++++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 324 ++++++++++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h |  26 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  73 ++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 154 +++++++++
 14 files changed, 1099 insertions(+), 143 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_common.h
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h

-- 
2.25.1

