Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9E6F6FBFC8
	for <lists+linux-input@lfdr.de>; Tue,  9 May 2023 09:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbjEIHAA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 May 2023 03:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235144AbjEIG7n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 May 2023 02:59:43 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F932114
        for <linux-input@vger.kernel.org>; Mon,  8 May 2023 23:59:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2weda5QCa8xsX1M7LAxzUAKaIjsKKxAVGdaQ5vIwFVDUPl31hvmXhbEj44lk5GxebWN+nlw2gu/Me56hJDWjcS47lQQ84gNEdptdnu2SLLLkZhnFHPkN1zhM5GxsJW0kbl0rMaYD/ES91VmtoVInFvby7bGYmyoebjVCgNGOEB8JdFMQJNAxZwwC2f55P5DOxR7HVuA+4xhmvkHASGLR6f0UBZu9NYLca266SeraD+tpm+DAthVL3RnFoOx0uyYgXssLerongzxhkWYKUWfOv1uZY6jYYqhG52COaJY+c2Pc9lKpxT+E/bBwtAmbUrIy0qxYnpbhlYx4HiB8TOqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFiWmXP1vZKqkjM3sGLaf3fJTnFrl3kJHULoi246cvA=;
 b=oD0dc3hhYjp0xKK9QTviEB8Dwnew4rENcejH0A+2c+NHGBcP7DW52nENeZqGJoqT26krsF1dg9+sJ81RRR8XpDu7L2QUlie7/Q2KJulT5BcmPxAIFflea59vJnjlLQjRJNDDkulTsICt/0PpgDQYU/YaHvxq/UCs2jlV1lc7Z5MgLZr9E8fo+pDUAKBVJsUN5F77z5k3u6kB3Qsd+rPHAL3GL84dSI71Pg36FLGAGp/Jpza8VVUHe1CrP/kfuLY/mUUZIkHBNMlqlC9iGcMnPoq1S4oNuOYL4+luVGVh9I+qpElTE8hbOmgJ+zPRwDvoqRocskgF8Z+vF3ShDqceZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFiWmXP1vZKqkjM3sGLaf3fJTnFrl3kJHULoi246cvA=;
 b=uundcn9f39qj3Xz0hOTO1AACncIo0bU8QMLOsyT+eHC4RJEiG4qEsfnhFh649SQ+oJdfdoJekZdIAXHp0Wrq46Nbum/XiI2/v+jjuv29LDwCOGH3xewRuv+MVI5o8u/K/JUhYytfaLEPLoNxN4g1dOK/dUoH55XbGKRdNJ7HLG4=
Received: from MW4PR03CA0031.namprd03.prod.outlook.com (2603:10b6:303:8e::6)
 by DS0PR12MB7971.namprd12.prod.outlook.com (2603:10b6:8:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:59:40 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::c9) by MW4PR03CA0031.outlook.office365.com
 (2603:10b6:303:8e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.29 via Frontend
 Transport; Tue, 9 May 2023 06:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 06:59:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 01:59:35 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 4/5] HID: amd_sfh: Remove duplicate cleanup for SFH1.1
Date:   Tue, 9 May 2023 12:28:56 +0530
Message-ID: <20230509065857.4170013-5-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
References: <20230509065857.4170013-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT008:EE_|DS0PR12MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baf5221-de4a-4cda-a241-08db505af58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ZD72HtQR8A0vGjpfJC9emSepA4whyWQRGeqSzpHzTs4hzkfA+1y2uCrH5WXryEZvBqHtwW2jIcJDX9VEqaP8+CZ7AE6jBbLL4xhyjJl97mgGU84//gcE7R2YVx1JjXmYgShz+llzrA+0XHemRqd5E+fTNpWepCvox8aKbMnaeRKtw3BWdCtM/JtQjHlzO6skcRIA57X2sNfwNl6VgoDbWRD82wKQ8mpioZy8Fun5gb0d5Ita62RncK2bloVaciFHVAFp4qEqEt9L1aTPQPk50AnU6WsxvnRKKWMqy+ilITqtjv9rQmTDp2MNQuxZSCIpOYCFSuMyEcUQ2dhPnZbtSyh4toD2eQQ1ZjzifH3AyQhKp8xMMnFZ6LbfY6/L4K9FGtRbzLtfGBbwSOmKBqdV/7uXbJeP9IYyoTujQGAnda1Cm3MF3gxsw8sD2yFCtwZxJSMYkjRC29U0TDzq7gZ+RbPUbNbIMVWuNWGXB7LpKMnpFjHBrGLzt02VzwnUxJgD5gqcOD0xMFDkK6E5lo03TS8GGt+DgRpgN+9BQZiEbIUmmFbLP8GqtXpYJd/E0cLJ+zEdjeo6bmnjcB9ktkN9I8phV2J9WzCt31H+0X9/uMko/nvTGVVIXLIp1K1SHjpl5alkbFuW7t5KK5XpRDpKmS3ZAaV5ficAOy4mQyJoGLOhEfQP8Velx3OEjJ3pYSoIKZ+ZSGN7DTPVP8Gt0pY41XeXHHvMhWE0oCc23nCul8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(81166007)(110136005)(47076005)(316002)(356005)(83380400001)(82740400003)(1076003)(41300700001)(26005)(40480700001)(36860700001)(5660300002)(86362001)(8936002)(82310400005)(8676002)(4326008)(70586007)(70206006)(336012)(426003)(186003)(16526019)(478600001)(36756003)(2616005)(40460700003)(2906002)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 06:59:39.8629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baf5221-de4a-4cda-a241-08db505af58d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7971
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

A duplicate cleanup is performed that is not necessary. As a result,
remove duplicate cleanup and use common cleanup.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index bb8bd7892b67..2102d53bd51f 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -174,20 +174,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			cl_data->is_any_sensor_enabled = true;
 			cl_data->sensor_sts[i] = SENSOR_ENABLED;
 			rc = amdtp_hid_probe(i, cl_data);
-			if (rc) {
-				mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
-				status = amd_sfh_wait_for_response
-					(privdata, cl_data->sensor_idx[i], DISABLE_SENSOR);
-				if (status == 0)
-					status = SENSOR_DISABLED;
-				if (status != SENSOR_ENABLED)
-					cl_data->sensor_sts[i] = SENSOR_DISABLED;
-				dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
-					cl_data->sensor_idx[i],
-					get_sensor_name(cl_data->sensor_idx[i]),
-					cl_data->sensor_sts[i]);
+			if (rc)
 				goto cleanup;
-			}
 		} else {
 			cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		}
-- 
2.25.1

