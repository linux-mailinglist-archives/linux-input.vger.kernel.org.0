Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CE045D39
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 14:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfFNM57 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 08:57:59 -0400
Received: from mail-eopbgr680077.outbound.protection.outlook.com ([40.107.68.77]:2677
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727922AbfFNM56 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 08:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5a6cQxf2erbtzUGwphIUdRwfmPv/9NQ5XZNJotoQMg=;
 b=y+RrIiuLAPzA/BAnpL1NX3CYwUePBz1YIdD9mfYBPFp6wt5U0sLdjIUk81oJ26ypavt1Ua95FXeQ8F9mYsYNxIKRAv6vzzBSpVQZBTrS72uw/rEBaPPqfa9JRUf/actzbCZETElkvMim5KVdSgRLAL3C8h1AWS5kIYVtbpIdV+k=
Received: from BN3PR03CA0111.namprd03.prod.outlook.com (2603:10b6:400:4::29)
 by DM2PR03MB557.namprd03.prod.outlook.com (2a01:111:e400:241b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.12; Fri, 14 Jun
 2019 12:57:55 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by BN3PR03CA0111.outlook.office365.com
 (2603:10b6:400:4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.15 via Frontend
 Transport; Fri, 14 Jun 2019 12:57:55 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
 via Frontend Transport; Fri, 14 Jun 2019 12:57:54 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x5ECvs2H030041
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 14 Jun 2019 05:57:54 -0700
Received: from saturn.ad.analog.com (10.48.65.129) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 14 Jun 2019 08:57:54 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>
CC:     Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH][V2] input: adp5589: Initialize GPIO controller parent device
Date:   Fri, 14 Jun 2019 15:57:51 +0300
Message-ID: <20190614125751.3553-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614111332.15041-1-alexandru.ardelean@analog.com>
References: <20190614111332.15041-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(136003)(39860400002)(396003)(2980300002)(189003)(54534003)(199004)(50226002)(246002)(336012)(36756003)(8676002)(446003)(47776003)(11346002)(77096007)(2616005)(186003)(5660300002)(70206006)(8936002)(70586007)(4326008)(107886003)(51416003)(44832011)(478600001)(426003)(1076003)(2906002)(486006)(26005)(316002)(7696005)(2351001)(48376002)(54906003)(2870700001)(6916009)(86362001)(50466002)(356004)(7636002)(106002)(305945005)(6666004)(126002)(76176011)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM2PR03MB557;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8aee74-7430-437e-070d-08d6f0c7eae6
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:DM2PR03MB557;
X-MS-TrafficTypeDiagnostic: DM2PR03MB557:
X-Microsoft-Antispam-PRVS: <DM2PR03MB557F4DCBFE33E9D6967AA25F9EE0@DM2PR03MB557.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0068C7E410
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +nvvfmaBtmjocdblXZ7aH1fHist6bGMZQf/8rSd1MbdQJcYsqwKJlsInl/Du1tMrddvgnO4gAfjJ9Vkziu2sBfFY2UieUdW28kZmSFFAmv7Rf+6IOHQRORC+shDuY/v3qqfdJYG2IucqwoHGbtnx4Sb0qqfh0fnATF+HdT9kSoUnI6mAC25nKx2Att5AU98qHEzNlyTgIqHCDIgp+lBbac0hXghCw4oWIdeLW3CxuIedtN9337Lc1Vki+I9kgpd1ytukTOiSO0qDESqelW3yfxy6H4qurJunfesIEyc7cbBBdf3OBuuEC1DXvDa2eIYeVbVXOVYMzVGsBAbAtHgoYH902zv9Bvmp4Z7WH+gd9PDUPAKjYxwr0LCq/x444eo2xQwsO9/wwPz/AcZbqfub0dz6ntdw00Ua149uwZeLDtI=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2019 12:57:54.8624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8aee74-7430-437e-070d-08d6f0c7eae6
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB557
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

While not strictly required for normal operation setting the GPIO parent
device allows the GPIO framework to generate more verbose debug output for
the GPIO chip.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---

Changelog v1 -> v2:
* `kpad->gc.dev = dev` -> `kpad->gc.parent = dev` - V1 was referenced from
  an older base initially

 drivers/input/keyboard/adp5589-keys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 2835fba71c33..974daf55ecb7 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -505,6 +505,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	if (!gpio_data)
 		return 0;
 
+	kpad->gc.parent = dev;
 	kpad->gc.ngpio = adp5589_build_gpiomap(kpad, pdata);
 	if (kpad->gc.ngpio == 0) {
 		dev_info(dev, "No unused gpios left to export\n");
-- 
2.20.1

