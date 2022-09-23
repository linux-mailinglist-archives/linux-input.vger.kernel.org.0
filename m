Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D824E5E73E0
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 08:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiIWGUJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 02:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiIWGUH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 02:20:07 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B159F0FD
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 23:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQxAsepxxC+8n0GAB3oPRoou1eHuq10QmYS11eVOq23H16fe+fsTU8/2Sjsrhc5jrFltBAKwC6r/S2ujW3gQBtCKKvzipNqZKRKf+JZvtqddT1wVtWiIJZ6xyrWSRLRQDKT9r97OtMslDMigPSi9II5TACL/WaTRVUQQHEF8FVGUJuI7L4L+CnZBWG+jvn97iXxFzwuSSEYfWpjdWn59JxOUZXQNcshYufKmtC2nhz/0NqABzc2r8hgHJur1NbzgoVnyyb9E0WOBL/CM4VzVj1qYTH+y6VNoS0NGW0oku5k4CNbsO1sgetNwoX5seRFxXxvb1KKjVRkVH+Hl1nmvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQKuQCsZcg9JOlX3+o7jmJw8rZcRScu1LH1CxX+0nyo=;
 b=hjkTHHViCgqVRoy/9zuFSSw5CS/hcyEswAqi5kHp4rT49LQo/eJD5DHKHlKu0tlii7xgFmg456N7JNDMp9kD17+kkMAk5aDMQb9K7BVaHlewEnfb/t1S8KWTiS0pNsHpUmQqljQEVvMLK3M6RrBDH/EezJaHWzfuWbwFS1WO8BshmS9oKRLGTOor0Nyo0Bz0AbIc5LmvPBu8hh4CAD7yBnOpfUHCYzXCStB4vK92OzhpbhxDONJRwRsZk9FfATqvJ21JYui1p+vZxFUHAV4sUWUSWy8yJEXdP/YoCjGGwrr3kfZig52vQDTpOHhkSuW7ACVtAktnqGJW8Zt8ENcapg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQKuQCsZcg9JOlX3+o7jmJw8rZcRScu1LH1CxX+0nyo=;
 b=bOWXTmM/ibrxvMYVS9VR/5Tl4Xi4/APFTCnEHnJO/56J5jMQlYQF01uKWgHkpvLGv0bt+bXB5chlkZozG/fl4Ndm62gaG+VoXMelmgR1iGF5R55eoErtvoMu9Ksc87eewN0pMgwTDsWYIOjrOphvNTrnQVyIDzSnWEnHqTgZMKA=
Received: from MW4PR03CA0243.namprd03.prod.outlook.com (2603:10b6:303:b4::8)
 by CY5PR12MB6201.namprd12.prod.outlook.com (2603:10b6:930:26::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Fri, 23 Sep
 2022 06:20:04 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::8c) by MW4PR03CA0243.outlook.office365.com
 (2603:10b6:303:b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 06:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 06:20:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 01:19:59 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Updates to amd_sfh driver
Date:   Fri, 23 Sep 2022 11:49:07 +0530
Message-ID: <20220923061909.636337-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT058:EE_|CY5PR12MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f4f8b1-dd29-4501-6681-08da9d2ba735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvbor4GvRftOJ65nISHjA+AMKiSte85Q3YACLnhDFjwGMnKQ7GshUTIrh7FcWfFva1jdQz94uy1cWbWaO1X3C19HLEb9j4QqS2Opv6fFl4KWjB4T7MJKDwoe6yDLQpeN594k+fJVzQkVB4aoJvjUwS7RzZvlFptlo+2AEVwJmlJR7rKdhfBA7Aic8uPj2odLOLa5u6AtjOCVwQ13PArqjYrFuAsWmRiiXEl9W0IyzJbpLNKwxbgji4Ib5MK63q5l6QV25oe+Q2uFkozA4EOgF4qmWxrfniDZC0BMaWwP/KNW6A5jfTLVJHQYePzSoz9lPjbHfyqkSL8FhpsZVFm6/PgA0hlXxMhDwvbuQvNK2n/5ZBcERTf82/JkFYaHpgIsjWnvIIrt0k4aWueKzrQD1sWmEh613Qldapa3Wm/x9kNAk2kmotVp/9hsTThvh4boAW84/YqNx6BtXJvSr3YOeowmbtZJP/vw0zJUfQj47r0QNajzhCiFYbUROvRYVKpevbacn1KZEe9B+S/abfxS7ti2JpjNrIQRGYdO4mYL8+UbmVukvZYUlO3iN0KgmNMF6G3JKAf/OrNOkAG16chsfbLHIDkEVp47g0XA7QfgEXba9PerMw/fc9+gQkLQpMUHZISSvRMpQUSMNyzpHAxV1wqT3MzFNnpmZliDqL2tTxGV2Doi/eS1bfNUo5unDtFm7gDEeOeLiqL6MW9B/HKCCxzaIwt4b7V9lOK41lsIX+9rIAi+UoTukP+faGVxmaxqXLlJrZiH45eWjN2WydB/psEhcuC8lU4qICzkJCNyUR8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(6666004)(316002)(2906002)(70586007)(40480700001)(86362001)(5660300002)(81166007)(8676002)(4326008)(356005)(110136005)(70206006)(4744005)(8936002)(478600001)(82310400005)(7696005)(40460700003)(426003)(26005)(336012)(41300700001)(186003)(82740400003)(1076003)(36756003)(16526019)(2616005)(83380400001)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 06:20:03.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f4f8b1-dd29-4501-6681-08da9d2ba735
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6201
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes includes to replace dev_err to dev_dbg and to handle
"no sensors" case for SFH1.1.

Basavaraj Natikar (2):
  HID: amd_sfh: Change dev_err to dev_dbg for additional debug info
  HID: amd_sfh: Handle condition of "no sensors" for SFH1.1

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1

