Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0999F4F922A
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 11:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbiDHJop (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 05:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiDHJop (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 05:44:45 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE5C6621C
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 02:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T98/CX5G9kbIKKeLwKermLbjX/YQGODpcC0nuyL0oKINsn3WUj7rNQ76QTNff1h//gZVMwhqvXH0Pvqd9rlX93oncdaaa1BsKSKEpmJYpNyc8NUF6oIvtLevoK3TJEhCp2UTcEUrufPTlkgqRSky5aswG8XZ2p90Xeai9Q2iVmCuAF2ciJqdfpNAv2sv+RHclb8Pil1IAzLawLHuFo1NSplGYCn+wYAjQZYAagW+YMUOLSrPvCZcOst2or4FrRNE2ts0MpFiaTaOupW/fLaJgE0dKFR/mr6LmOf89ON1hrEz31iG3gqHiRbAprmFAFMGw2sq15to2KowbM2zO/w/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qt3iSeGhgYnISY3jZdT0L+Dq24AgurHzc99m7KsTjxA=;
 b=X5RKHbBXURQ61dX6VV/QSrqBTofzjrRouXCp6ahW1DyxWu/tSfTLRTPK/5dcRxEy8+fPF2yvKDei48nQY08i0XoLH7ojLbruGBnoVopCNItGYrRnEpJWjbdAFM6GqIw8Vpof3rxbDCVYujm8voYYhOAb8tunOPOTr1Lj7T/4FtZHJs5iLJetUxWv2nS/TYXlfE/sRapo44jZ0NVCAMQ8BNoR4qePN1I/O9CsZGvB58zlFW6dbSh8E89SK2YEevKXOW9eUSS5KUqyoB5YNGPthA3moh/rnJ+QT89y7IFtHqqiGzaat95vabw5Hdxx78UyNOiYjVJBJdEn7BX7J0DYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt3iSeGhgYnISY3jZdT0L+Dq24AgurHzc99m7KsTjxA=;
 b=i4NKSk8Ki33MYr8fnCsb1ciQAxPZ2wFCZ7clpzmREnW+0Z4ZwawXxKbb02scQ2eSSLHZeovYjNV/7+OfrQrgB3qfidoKGp2AnA6lCCp3T58f/t/it7/bJF7BphXYX3MlUjudtmPirV2p7dYVUIzfKQqQr34LwIY6YrP6J3QXUBM=
Received: from BN9PR03CA0788.namprd03.prod.outlook.com (2603:10b6:408:13f::13)
 by SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 09:42:39 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::41) by BN9PR03CA0788.outlook.office365.com
 (2603:10b6:408:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22 via Frontend
 Transport; Fri, 8 Apr 2022 09:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Fri, 8 Apr 2022 09:42:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Apr
 2022 04:42:37 -0500
From:   Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
To:     <benjamin.tissoires@redhat.com>, <jikos@kernel.org>
CC:     <Shyam-sundar.S-k@amd.com>, <linux-input@vger.kernel.org>,
        <Basavaraj.Natikar@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH] i2c: amd-mp2: Remove name from maintainers list
Date:   Fri, 8 Apr 2022 15:12:21 +0530
Message-ID: <20220408094221.846853-1-Nehal-bakulchandra.Shah@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 691c9ac2-16b9-4ad8-c96e-08da19441f01
X-MS-TrafficTypeDiagnostic: SN1PR12MB2495:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB24959D64D4423B028E1140A9A0E99@SN1PR12MB2495.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kSucdjB79bvY3fOXtGkrX6tr5DbXr5vCIoltg4DbhZ/VqnpWnZq7BxGFNEADtFsH/6ZNc7mMsmI+UC36bHW8Vd/GsBVLF2BQWgE3dw6OpqyUE9tgMYpRy10eVj7NJltzIusz1hHLCmp+mhCWFa2KGO5EC5DgmeZfjijmGXLaxLnS5YzPz/hLnvyDyKfJLsNeyu/ZqVbI8OK3D6ekOsyTVfcCDiu6fXbkhJm3ATmUKOzj7uj/VgcsfXRWAiaJt7iIvXqseckbjbT9FkglgOtbxP4VBEoWmJQbZKc4Cdoov2aLckgR1RE+E7gDJS1PzdtHt4yYf/zkxEeVhYDjN6eJmN59OMHQU/2zgxR72Vvg1ALNGWmKsAwcmo4EpCbTNadgekj0YtqBs/InJ8vQmkYAYVfVTkBTvguCbJaTl2Veis9mHV8TJIqDM/D0Xx6WAlT214Vl3ofvvcrm06puPkX+9Z4T7VlM/bItyx3GKMRzPstHPJfqhDPlqTfQoqsTzKdzSsIeHxpz3HyZ64aiyCAqwxeO09IgP0VUx6nMiGEbI5rbFC5RB63FWCe7dLolxelkDsGU9XqqE4ubrQkMyvxgIYLO4NQcq49Pq9oBEMdJl7uDpqEH/WwmVX4piOpZ4J16FvDuDiNj+bx8jwVd6PQqgzPzedEYAuZeNk61o6qsL7sLfjWscDmBEVvosrdIf16o6x8TTqV9sgSIXxr+tVCK6w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2616005)(83380400001)(426003)(26005)(336012)(110136005)(54906003)(356005)(5660300002)(47076005)(1076003)(316002)(36860700001)(508600001)(4744005)(82310400005)(40460700003)(16526019)(6666004)(186003)(86362001)(7696005)(4326008)(81166007)(8676002)(2906002)(70586007)(36756003)(8936002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:42:39.4402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 691c9ac2-16b9-4ad8-c96e-08da19441f01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2495
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>

Please remove my name from maintainers list from AMD MP2 I2C DRIVER

Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..6ca6f7abaa4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -985,7 +985,6 @@ F:	drivers/spi/spi-amd.c
 
 AMD MP2 I2C DRIVER
 M:	Elie Morisse <syniurge@gmail.com>
-M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
 M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
-- 
2.25.1

