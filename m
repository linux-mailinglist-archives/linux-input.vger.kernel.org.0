Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B149157EC40
	for <lists+linux-input@lfdr.de>; Sat, 23 Jul 2022 08:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbiGWGLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jul 2022 02:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiGWGLQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jul 2022 02:11:16 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F982F3AC;
        Fri, 22 Jul 2022 23:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJyFrt3i2ZbF3Hb9txM2/1U2O56qBAz0z6zAighehMLQztY7cReAyQfPsvoE9tGW0FqBS6FIf79vMzfObPVimAunhyXBAsNQbfVjUlXZ5//XAD468Rp7IbyJH3O5PbNIMU7Gl52mtHZUrojP20Ojvb5FqgxYzgjvsA2TsoKAww3QaNaWErlweeKPWuWS5i3vL47j6d8BCPycxZoJSXXpTiO/s9AG5xtko8R1AIc/uDRF+v2p8KYcQxKyzxm9aZalnpbHLPhpyzd3pCyQPkd8Z/zTx1t/sdDrNUupt1/Esb03DLcjqKJf50weasYtWG0nyQBO+C3n2LI2v7d0GgSFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkzgqeI0Q7nuYuAmvRdcc0pMAB+DBy7Skcvzpwz36nw=;
 b=hS56IiYQBwxrdHUxHaHnH4emFN6qRgFT9KPKOAPiohFHQs0qktH8dWQEqTk4/B5GbZfVAAfIoyZHfem6f6WQMsF/RTSpbxpFEW0kjUXftU+KglUR4PxWfr58ykEZuCmywhKgSvLvSxCWiZ2QXziWBZGWDezVBCevAkNf9s1aNQdsgWdSBWQWCwnc0WwQT318UizIJglaiFjnBMfbvVgmc0lvxSDjmiYB2FSj96kmHjUwssf/zRHx08dlcAeft62QwRaq0IoR55Y6wNI1WERd65+STCe9g/C3TQk7sxVg8mRb9LJ7DY++AdFcz949fXrRUnI+WUMbM7w9LIHrU3l4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkzgqeI0Q7nuYuAmvRdcc0pMAB+DBy7Skcvzpwz36nw=;
 b=CyZNDkIzYDmno9GmLrYNpSYMbmaDHJdr4tPyodlKl/o4Q6Ee2l6d3MKyXf47cyzLHW2kXQ6dPTPXaL7T6P2LSlNYzqw0BByIlnGPO/3ucX2sGQRi1WFvrkGSpNsHsVEhiWCSOyhRi+zVmTfT2SM2Es41aTrbNsnT9W/S6NgQ6Bw=
Received: from MW4PR03CA0187.namprd03.prod.outlook.com (2603:10b6:303:b8::12)
 by DM6PR12MB3529.namprd12.prod.outlook.com (2603:10b6:5:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Sat, 23 Jul
 2022 06:11:11 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::45) by MW4PR03CA0187.outlook.office365.com
 (2603:10b6:303:b8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Sat, 23 Jul 2022 06:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 06:11:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 23 Jul
 2022 01:11:08 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rdunlap@infradead.org>, <linux-input@vger.kernel.org>,
        <linux-next@vger.kernel.org>
CC:     <sfr@canb.auug.org.au>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH for-next 0/2] Fixes to amd_sfh driver 
Date:   Sat, 23 Jul 2022 11:40:31 +0530
Message-ID: <20220723061033.1377061-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e0e4c33-4e2b-4274-7c35-08da6c72242a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3529:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /FTwGsi29AHzoUkDDZuSR5lrwaGwUe7o5XlOE2VbC2SrU8RblXLL1mnJZw24Lzf3WHp/MnirXbwySo16AoT3IlCdh72+2ekz1+KDfaoTFlP85U37rKItiPwHT16temB6tjJIvzEo96ZaNicKElTpMlQDlSc3d088+xSFxZy971YA6KjnRkAYmk1U10VK2ePo8cGMyp5sQG+QgLkINmWgg02DNVTynd+Ntlmvtg4XK6sTEIJjpaIZe2fSWIoiNPNeKmS4YERE9vTG9QUjQY3WWyOa2tvlgX6GaZAollOScrRWUOEd6nlSyV1RhbkqiamOObzJiXU+5stqsn1g7lH7ezBHnE2mBGddtUm0DZnOwfwY08ik4XYXPE+1qpFv2bvKb3lB6v6jycWkNYp2vZFUrU+isMbw2mqGsenXrNhjZMC4KwKE28CjeEv5Uqqv3MK61ahu5Sqcy7w0/8CKpbcm0KHONKQvsq62JBS55Z7K7yZALGj5ekaFNt0AWa9nyzhPheWpxdCUwUZ8Qc8vYJt4ZPkpK19nq0sFnv5M0+UY30CrA38SDkNGQU6/Rj3FVGbgHelCVqSl/CYHJPXJ5Wl3UdbKmKyQBZKUG69E4LIB729+c+slj2GVwTYuNeCPXQAKuwEP8JXWpVIU/mBZbWG6kMA7F2tLgBZDzOsPCUxofupzdyJQNUhGnBgYNF+UHxzeESVr14F3dUttsqQD4u+D1ow9kp/NIU54JkoV+FUv8ja4paVmW5qJP8mCyOCzrbZI6e+d/N3iniiY/YeN/NGpRsO8x0fz7DkHpneOWSKjybuQ4c/xG1FMkqzSyekAGVDmPTalKsGBxfJXb3wn7VLuj8d106nx0vK1cl8NsgkrQBoEgnNdm8OOiv2rjY/ik/RJ
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(46966006)(36840700001)(40460700003)(41300700001)(2906002)(966005)(81166007)(1076003)(8936002)(82740400003)(8676002)(86362001)(478600001)(6666004)(4743002)(110136005)(40480700001)(316002)(36756003)(70206006)(82310400005)(2616005)(47076005)(336012)(356005)(426003)(54906003)(36860700001)(5660300002)(7696005)(70586007)(4744005)(26005)(4326008)(186003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 06:11:11.3463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0e4c33-4e2b-4274-7c35-08da6c72242a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3529
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changes includes to handle "no sensors" case and fix of implicit
declaration error on i386.

Link: https://lore.kernel.org/all/92ed10f9-2c84-ad42-20d1-f8a101f78f08@infradead.org/
'''
From: Randy Dunlap <rdunlap@infradead.org>
Changes since 20220721:

on i386:

../drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: In function ‘amd_stop_sensor’:
../drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit declaration of function ‘writeq’; did you mean ‘writel’? [-Werror=implicit-function-declaration]
   48 |         writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
      |         ^~~~~~
      |         writel
'''

Basavaraj Natikar (2):
  HID: amd_sfh: Fix implicit declaration error on i386
  HID: amd_sfh: Handle condition of "no sensors"

 drivers/hid/amd-sfh-hid/amd_sfh_client.c           | 2 ++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.25.1

