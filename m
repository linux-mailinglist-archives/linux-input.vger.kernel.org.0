Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4286B24A90
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 10:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfEUIj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 04:39:57 -0400
Received: from mail-eopbgr770040.outbound.protection.outlook.com ([40.107.77.40]:56533
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725790AbfEUIj5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 04:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giQx8NMjVMgEy7h9MWpHT9I1KNINNjmRNltR9xDVccU=;
 b=T3hSkmI+fF+QMtMOboJoz7A6A0QGFlE1SvGONgR2kuz3XmpQKH9o0w07XLL1fyS0iJ1O7Q3XpZCxWSEj8q4b7wIpBUf7PayH/1xt3Zw+E4+vBTthPPURGW6wrzHJQo3ds7i09X5Z1OpUcZPkmUiOkWNNqZDbQ4mgK5aKngKMxqk=
Received: from BN8PR03CA0029.namprd03.prod.outlook.com (2603:10b6:408:94::42)
 by BLUPR03MB550.namprd03.prod.outlook.com (2a01:111:e400:880::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.19; Tue, 21 May
 2019 08:39:54 +0000
Received: from BL2NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::201) by BN8PR03CA0029.outlook.office365.com
 (2603:10b6:408:94::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Tue, 21 May 2019 08:39:54 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT003.mail.protection.outlook.com (10.152.76.204) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1900.16
 via Frontend Transport; Tue, 21 May 2019 08:39:54 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x4L8ds3D027406
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 21 May 2019 01:39:54 -0700
Received: from btogorean-pc.analog.com (10.50.1.212) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 21 May 2019 04:39:52 -0400
From:   Bogdan Togorean <bogdan.togorean@analog.com>
To:     <linux-input@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <gustavo@embeddedor.com>,
        <linux-kernel@vger.kernel.org>, <Michael.Hennerich@analog.com>,
        Bogdan Togorean <bogdan.togorean@analog.com>
Subject: [PATCH RESEND] input: adp5589: Add gpio_set_multiple interface
Date:   Tue, 21 May 2019 11:38:22 +0300
Message-ID: <20190521083821.26540-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190415122525.2576-1-bogdan.togorean@analog.com>
References: <20190415122525.2576-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(199004)(189003)(2870700001)(1076003)(316002)(50226002)(54906003)(2906002)(5660300002)(70206006)(70586007)(6666004)(356004)(14444005)(2616005)(11346002)(476003)(72206003)(305945005)(47776003)(446003)(126002)(426003)(86362001)(336012)(7636002)(7696005)(486006)(51416003)(478600001)(4326008)(44832011)(76176011)(6916009)(53416004)(36756003)(106002)(186003)(77096007)(50466002)(26005)(2351001)(48376002)(246002)(8936002)(107886003)(8676002)(16060500001);DIR:OUT;SFP:1101;SCL:1;SRVR:BLUPR03MB550;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1d69496-4c58-4920-3565-08d6ddc7e5f4
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);SRVR:BLUPR03MB550;
X-MS-TrafficTypeDiagnostic: BLUPR03MB550:
X-Microsoft-Antispam-PRVS: <BLUPR03MB550AAEE6611E0B08FC844869B070@BLUPR03MB550.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0044C17179
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1Lji/C1D4qDkgqscbzjrTgpo60N6ORgEC4KJSNjT/XuWDpAq8i0yWYYl7Bck2fU3AlFGRqfFZNkXefEeLrTnI77RQK2O8Yjqc4jFSp7Z+HID3msTPZmKiHeOzZlhj7hIvTg7YNUpBoNh/7MJcHI4hwD+yMOVPEs7T2HP1qdgvMVSH91NS5UH0kI/8RXps7Z4Zx8hiHEVw1iSrrBLYbY3cNZsZa+/U0t1bnsmd2R508rIi8IZmFXpUXLVGTlJjGgExk7igrM41/Ji2wRrUoUlg73lkI53AkOluG6dYDb0ymLtKuexuNQKtoMp8l6mjjNOn60XSlHSXSW8y+cxlHtmVjwIpJDgg7OXEp/kQf1mZp1urigGPt6iqxTnlJmfQSo+iolLVLVIgLw+67t6MhBnMlEhL8J5UtIlrzmxLtfF/74=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2019 08:39:54.4790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d69496-4c58-4920-3565-08d6ddc7e5f4
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB550
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch implements the gpio_set_multiple interface for ADP558x chip.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 2835fba71c33..143871bd60ef 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -416,6 +416,30 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	mutex_unlock(&kpad->gpio_lock);
 }
 
+static void adp5589_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask, unsigned long *bits)
+{
+	struct adp5589_kpad *kpad = container_of(chip, struct adp5589_kpad, gc);
+	u8 bank, reg_mask, reg_bits;
+
+	mutex_lock(&kpad->gpio_lock);
+
+	for (bank = 0; bank <= kpad->var->bank(kpad->var->maxgpio); bank++) {
+		if (bank > kpad->var->bank(get_bitmask_order(*mask) - 1))
+			break;
+		reg_mask = mask[bank / sizeof(*mask)] >>
+			   ((bank % sizeof(*mask)) * BITS_PER_BYTE);
+		reg_bits = bits[bank / sizeof(*bits)] >>
+			   ((bank % sizeof(*bits)) * BITS_PER_BYTE);
+		kpad->dat_out[bank] &= ~reg_mask;
+		kpad->dat_out[bank] |= reg_bits & reg_mask;
+		adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			      kpad->dat_out[bank]);
+	}
+
+	mutex_unlock(&kpad->gpio_lock);
+}
+
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
@@ -517,6 +541,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
 	kpad->gc.set = adp5589_gpio_set_value;
+	kpad->gc.set_multiple = adp5589_gpio_set_multiple;
 	kpad->gc.can_sleep = 1;
 
 	kpad->gc.base = gpio_data->gpio_start;
-- 
2.21.0

