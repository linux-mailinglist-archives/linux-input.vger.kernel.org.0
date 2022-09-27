Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA275EBFB7
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 12:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiI0K17 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 06:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbiI0K1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 06:27:54 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B324310038C
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 03:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT31BkwQT7ef9BJe7h1cbvWaFbo5apnZUXd2bRooEYLGX/nsDMIIrEcs9x7l+NENC9yHNG+cfKJKI8HcJ9E0qkHobHIvjp0rKKL+1KExchnsFfS/x4RhGCXNlIB7kLw4SrCbISpqZemqw8OU1fTj6Tmxv6Y90KRzmiCv/tynR+RJWZ82+dT5oUEDpRegBsgxndYB83aDDWeOFwDJnn9DdLs711D2aUOe3qGcOUmW0rwz5SkGCS0mh9WhEw0ZdCJ1kff59t8TmXgHF8BCyNble09rmzK7srTje5ucDIgnz0sp288A4uVSBjZKTmh0qBM/YmnwMPhGp22yR8lbzoluRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1TJwbnZo2/OnJXgP23eydrNLkAKoV7ksFDZ+uyD6Jw=;
 b=FzpLcJhHoKOtQqtckzhpl+GCqep8991QP77NUE21Cn8Br1ENdNmxDZdFvF5lIwTKtZkMC/EwaTcwELkolpZGFGKhvpjM/zVZ2az+nb9oyMEQMC0qpFpLQI5QThNo3KUFdOjnRT/ENmEDyjADV2NZ9+PGQWM6KYp3cvtu/S7FqkrzlTxVh1+KVRadRRwBhSdURpQ1IFp8YaAFQRsM4heVKLuEAC2NezGLDq6fN/N88+11SBzcsiFfp6YA8mkCtYEaqaQ7VhuWFVD943J9gJAegFL7y7yBRjnf9yEZPeHECuyrI0V3Ao31r7cBbzHEjrS09BRYe8QvQPObyVD7EEPiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1TJwbnZo2/OnJXgP23eydrNLkAKoV7ksFDZ+uyD6Jw=;
 b=Xc78Ng92758/2zxx1WHQRZItTdTHMEnqhBdDf4SNFJjH/opku4X1TVdWlfiW+kFWofBarxRDGijJBp5Jlp/l+xzTUv5vnFn6kL7WjOuUCVt+9ljr6oUuOwW1NLsIi/xLJs8qudG+BGMLXPoNE7dFp171W+E0jaiDJ1cw+2OY0Vg=
Received: from DM6PR01CA0024.prod.exchangelabs.com (2603:10b6:5:296::29) by
 DM6PR12MB4500.namprd12.prod.outlook.com (2603:10b6:5:28f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.25; Tue, 27 Sep 2022 10:27:43 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::c5) by DM6PR01CA0024.outlook.office365.com
 (2603:10b6:5:296::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 10:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:27:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 05:27:41 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 0/2] Updates to amd_sfh driver
Date:   Tue, 27 Sep 2022 15:57:24 +0530
Message-ID: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT040:EE_|DM6PR12MB4500:EE_
X-MS-Office365-Filtering-Correlation-Id: e91b748e-3c51-4492-5211-08daa072e98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzJs6CcvNMkdIKKkdkhGlpzINDd1jDnHosjrlxpYOkp9dcDOv4ZbRnlPH9EqzrFdSUhxrkK5CTJ2eBHQwyE2dUa9LG3TxfBXbAIrOkLmqfUbgCldOTUupBBQWy1C2BKlfwTuRG3F0u9m4cJOKRrfc12uLE7aNurG3A9K7IkrX6sitF7Q0pc98WCoX9pmrzXhKd0A94oOvXF/gB3G4L5l1G+HgpzG2ILQcHoy0q6ZApMaVYMBcM42MGp/WhYoFIoaKGKZ/UIuX2LNrNdK8OYfN26dIm6WoRoxHSoDEkxvagAU0yKFTHflep+EuPO3IysF3Xe2NpQ8BiaRAbKjub5C0XkGj9bflQymPbFp+kJ9EZIFlhWh9kxQwfnBv/Svd9wjPp/4SonnoRDz5UnT0orT6GjXgMEz1yLCVknramjuIs66LqdrP833usZxXRXmKgCyIMnW2OrYaFIApdZNuJQT4f7fWKGPwXfE45lR7MJvlqIBvLC1ujcvhArcIbNEnxQzxjRmAAlvePpmtsxziBojLWkDFtybpMAoVkTp8zJgiHP25vv6P/AVvnPqww6RATS6aIPXFM5+fnxaR/K6c9xXLs8oIVU1nGhFEckGOgrKPC9z8pAk0jNM0QPUgx+zdegncx0GIC5FjA3WQ2nCRRUT8HBa1KI4dGYiZazkFpSkwbh/aByCMatmMCYXa9E3iiHY8rjEixBAqpXF4fvPWRyifYvCbK2F7mmu//PXqGp9Cj+oY4e91eAgV2HI8OeorVIm5Gikb7rO7CSED+CYkBw6fHpfWGGQB54yfZRbbHKGp9k=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(110136005)(70586007)(86362001)(316002)(478600001)(4326008)(8676002)(70206006)(6666004)(82740400003)(36860700001)(41300700001)(83380400001)(40460700003)(8936002)(4744005)(5660300002)(26005)(7696005)(356005)(426003)(81166007)(16526019)(336012)(47076005)(2906002)(1076003)(82310400005)(186003)(2616005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:27:42.9409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91b748e-3c51-4492-5211-08daa072e98b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4500
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

v2:
        - Add more verbose changelog 

Basavaraj Natikar (2):
  HID: amd_sfh: Change dev_err to dev_dbg for additional debug info
  HID: amd_sfh: Handle condition of "no sensors" for SFH1.1

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1

