Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A114F922F
	for <lists+linux-input@lfdr.de>; Fri,  8 Apr 2022 11:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbiDHJty (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 05:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiDHJtx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 05:49:53 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF1AB7C2
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 02:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhJNaEVxqHZL3M+WD0jlD7aSpyEoq4tfX7zD+obG2GjiqnsOm+B3HtqmbHDGiPcxBDofZnPQVG9w+J2TXWNbT0/A/PZxJ6VHi4Je3pW4OUB4dAKCmjErUt00kVektHtE4E780+X1eWOV0A+3FRI7DaRl03yrIV+WJZhNphjQwEw63cMiMcwgAhuZfog3grx0vnPMuFfWV+qj0gSDTLA/7kTaYrg6/wp8Gbj3Lx4BqaSsI1+DQUB1MyNtLgLJbg+V+FJbkXliokHPgunpUAtspUgtz8hFUzslHRwdvJNXhJ6aRpGS90YXkusqfBmpJI8YZBGHX2DMl70yekJpS3sv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=699z3IzoMBAqQ0bRTjM0cOmMzAgkAyhqnSCgMWXZ7Ps=;
 b=lNzm2la8E1/7x8+RDbZeJQmvW1XTTG4lYSRqXMjy4VmJk+UB9zZbJjOZGsTICLiV6xgEUugJAGU0fXUfoYNJ/Xoqi1UfromQwiZ8Edj8t4qa/uztWDTq8ERo1q6mjj8nNUV+MXuDDcyWqQRr+5V3MCtm+llBzsFGI01aGbS9fNRH23Rjfqr3UvaJNEl/2Z3+kyUiwh1DZ2sqJKQpSltJehkSDR/6sJfGYRdKP3z3hZE23SV9jOkHuhE84+6TIVr+5QbFZkLyf3IhPXIOLjXqRtglMA3J+mglWSrah0MD8JnEx+WMvO/MyCcAiF3plFjrYlkVPgGoDynrxUjXMHi4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=699z3IzoMBAqQ0bRTjM0cOmMzAgkAyhqnSCgMWXZ7Ps=;
 b=xNTNqr81q0tpMp1z52LMIecer0pgrec8aYY7L54CO0I2D7UqmZozASsNqMYrtRzgwY3t+tNu8sHjpcyFR97uyQ4tRX7gUBtp2n9Y0U+tRrp3l52no+bAaRkfcIhHijbVD5ikWkc4EU49kgWRGbid8kmaHpVPF2u6FciqAtNcSVM=
Received: from MW4PR04CA0179.namprd04.prod.outlook.com (2603:10b6:303:85::34)
 by BN8PR12MB3601.namprd12.prod.outlook.com (2603:10b6:408:46::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 09:47:48 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::d3) by MW4PR04CA0179.outlook.office365.com
 (2603:10b6:303:85::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.23 via Frontend
 Transport; Fri, 8 Apr 2022 09:47:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Fri, 8 Apr 2022 09:47:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 8 Apr
 2022 04:47:37 -0500
From:   Nehal-bakulchandra Shah <Nehal-bakulchandra.Shah@amd.com>
To:     <benjamin.tissoires@redhat.com>, <jikos@kernel.org>,
        <Basavaraj.Natikar@amd.com>
CC:     <Shyam-sundar.S-k@amd.com>, <linux-input@vger.kernel.org>,
        "Nehal Bakulchandra Shah" <Nehal-Bakulchandra.shah@amd.com>
Subject: [PATCH] amd_sfh: Remove name  from maintainers list
Date:   Fri, 8 Apr 2022 15:17:17 +0530
Message-ID: <20220408094717.847209-1-Nehal-bakulchandra.Shah@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df605f0e-e620-44bc-71e4-08da1944d68a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3601:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB360117AF62797B67E5A0FA1CA0E99@BN8PR12MB3601.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uOOka5R+2pwV3eah5mLeabj4rm3aNemvOxCrTIu37O7I0Tz0J6Z6WB+eiOFO0br9mzl9nTptpKN7VUDHepFKIjVCwL156yxnvMs5hX6r5meGozX0Fn9Qt7ksR785Vm9O27JQz5Pn9h5FZ2LzNYeVIIQUa/uL+2f3bD4l3HC/DzXZD6J3Y+56Y7XYgv1cqgeDgZoujM5mE65Il/4BbHU6vzgG/fIxWHqyT8FBu+UBVtGhZ+IcIwZyCbqeR9ZAxNmH2CBq9iUWlOBEi849xL5VqZ1bEkQJIURMkVdYehxiZracd1usenjUTzhUElv6IY7WWwee49dMQdcYnlh8xLM/jnwtPSmoW0rN4em6GXV8XD/TloxLMCeQV3rQMYGP8ARFKbRoldZo+CYu6rWfu560CSZuuUMFVfjxeSFD55qYP9+ujCQnBTRZAwVsQ1/+520lniM+2ggKWF558Lwx5yp+jRtM/dXax2sjd6xnryPCgpdAh0c985+UOmFNyyaO4lBZn8IFonzi9kwijIPcsJcpURWfhWHCmAaGTkiWm7GolVowtQPpMVNH3vnuMCONr+/tjn2806UuqnNm9t+BH7Tq3UAMWN7Ur+WwxRAOzxQ1KCf6Af9cjdG745FuyrMqsqdiOuLhN7Q4aOifPC6CVW5xZoaQif0t1gQ/+UUTOhv0zSQfGjZJvapCcQszJiXppHa/yqjh5lz0/b0A2gRavvly5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(86362001)(508600001)(8676002)(5660300002)(2616005)(70586007)(70206006)(6636002)(426003)(4744005)(54906003)(4326008)(40460700003)(81166007)(316002)(356005)(110136005)(1076003)(186003)(82310400005)(16526019)(36860700001)(7696005)(336012)(47076005)(2906002)(36756003)(6666004)(8936002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 09:47:47.2339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df605f0e-e620-44bc-71e4-08da1944d68a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3601
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

Remove my name from maintainer-ship of AMD SENSOR FUSION HUB DRIVER

Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..864d26404711 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1043,7 +1043,6 @@ F:	arch/arm64/boot/dts/amd/amd-seattle-xgbe*.dtsi
 F:	drivers/net/ethernet/amd/xgbe/
 
 AMD SENSOR FUSION HUB DRIVER
-M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
 M:	Basavaraj Natikar <basavaraj.natikar@amd.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-- 
2.25.1

