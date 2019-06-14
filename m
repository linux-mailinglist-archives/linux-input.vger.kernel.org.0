Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4FB45B3B
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 13:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfFNLNl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 07:13:41 -0400
Received: from mail-eopbgr800084.outbound.protection.outlook.com ([40.107.80.84]:11424
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727164AbfFNLNk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 07:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZJkVlXui/1S3tsD7MQ2zSneZLFZt/d5IBaHZE+6o8w=;
 b=Rpg61nNt9YhOm7S5KzFaeke4of89SNlyTkxE/XOqsGPkLRg6MBJchDE8SalqTjU3yWhC20tNTyGRAFn0WOGgsdFxMdrzNRJVY3Su1rOBETD+ofKWAotab4/xWYE45HQT9rDHN9sMM5jQbk0+/S3ok+MG2TkLwkMMgVEqHz6EOZk=
Received: from BY5PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:1e0::36)
 by BLUPR03MB549.namprd03.prod.outlook.com (2a01:111:e400:880::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.13; Fri, 14 Jun
 2019 11:13:38 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::207) by BY5PR03CA0026.outlook.office365.com
 (2603:10b6:a03:1e0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17 via Frontend
 Transport; Fri, 14 Jun 2019 11:13:37 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1987.11
 via Frontend Transport; Fri, 14 Jun 2019 11:13:37 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x5EBDao2006260
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 14 Jun 2019 04:13:36 -0700
Received: from saturn.ad.analog.com (10.48.65.129) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 14 Jun 2019 07:13:35 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>
CC:     Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] input: adp5589: Initialize GPIO controller parent device
Date:   Fri, 14 Jun 2019 14:13:32 +0300
Message-ID: <20190614111332.15041-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(199004)(189003)(50466002)(48376002)(5660300002)(36756003)(4744005)(4326008)(70586007)(106002)(478600001)(426003)(336012)(70206006)(356004)(6666004)(2351001)(86362001)(54906003)(186003)(2616005)(107886003)(8936002)(2906002)(476003)(7636002)(6916009)(50226002)(2870700001)(8676002)(47776003)(486006)(246002)(44832011)(305945005)(1076003)(7696005)(77096007)(26005)(51416003)(126002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BLUPR03MB549;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a739775-918a-4631-1b6b-08d6f0b95918
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BLUPR03MB549;
X-MS-TrafficTypeDiagnostic: BLUPR03MB549:
X-Microsoft-Antispam-PRVS: <BLUPR03MB549C4F0DE2027313791110CF9EE0@BLUPR03MB549.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0068C7E410
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b1Ti36miRh6fZQgvL6iCk8+zNIea9ESAqLd+bn1y0qbHVYmquCfVYM2UhlSR/whu0eVy2oEzydD7xtYYGm8P+M9cFB1C9PtAk3KA8VPZTkBjyJEXZMuWB72D3Od/1bcC8miomUUqrwUNcY1wxvw4Ork7hbUk9mjPfGQ98fGs+W5HETHAPwkqxMacqSgFGGd/mpHQr30hHdBwplyYSdsDx8IT6/SXAI9lGFRO/0XbxX1Yd4jlG3dPOUhhLsQaSaK75tyC4wTQei0D5Oj3ZgKBcONG3z4M0oa25pgOzWbfyo/Od1Ea3Jvv/QScq2klV+mKBeLvcVO6kJH9nWqTl1V2Z4J/Crldf98pmMPf8feP0cW/3hYsC05/q9Mwy2KjoXwhqWSvgfjL72yzgdH1IePq5vqX8X67mQUaCF+EBT7qjus=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2019 11:13:37.1580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a739775-918a-4631-1b6b-08d6f0b95918
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB549
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
 drivers/input/keyboard/adp5589-keys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 2835fba71c33..bc6acc5cfaa7 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -505,6 +505,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	if (!gpio_data)
 		return 0;
 
+	kpad->gc.dev = dev;
 	kpad->gc.ngpio = adp5589_build_gpiomap(kpad, pdata);
 	if (kpad->gc.ngpio == 0) {
 		dev_info(dev, "No unused gpios left to export\n");
-- 
2.20.1

