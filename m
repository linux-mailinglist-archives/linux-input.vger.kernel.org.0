Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE9D6375A
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2019 15:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfGIN6D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 09:58:03 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:57048 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726060AbfGIN6D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Jul 2019 09:58:03 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x69DrJiE008687;
        Tue, 9 Jul 2019 09:57:41 -0400
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
        by mx0a-00128a01.pphosted.com with ESMTP id 2tjng77kf9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 09 Jul 2019 09:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFm39I3b5pA1sI7MLkI9h0PL/An/mP+A0A7Tb9yaL5k=;
 b=5lJjq8hMegPzfpEjbvFxC7buSejtt/lyJGzASm2Z5srMWjZ13HIzUbPjy/H0+tg8vqnhPDVILDXLe6xh/zXNj7FkV6/6guGqi6IG3r5b7mmdjl+lHYuofifX9wXznMCP/0gCkwZ7jdsR7wOzteZlJJaRZnFst6fzmZyC03ALXUY=
Received: from DM6PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:40::34) by
 BN7PR03MB3827.namprd03.prod.outlook.com (2603:10b6:408:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 13:56:06 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::206) by DM6PR03CA0021.outlook.office365.com
 (2603:10b6:5:40::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Tue, 9 Jul 2019 13:56:05 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
 via Frontend Transport; Tue, 9 Jul 2019 13:56:05 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x69Du31r006067
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 9 Jul 2019 06:56:03 -0700
Received: from saturn.ad.analog.com (10.48.65.145) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 9 Jul 2019 09:56:04 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>
CC:     Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH][V2][RESEND] input: adp5589: Initialize GPIO controller parent device
Date:   Tue, 9 Jul 2019 16:55:58 +0300
Message-ID: <20190709135558.4542-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614125751.3553-1-alexandru.ardelean@analog.com>
References: <20190614125751.3553-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(346002)(396003)(376002)(136003)(2980300002)(189003)(199004)(2616005)(186003)(44832011)(4326008)(107886003)(446003)(6916009)(7696005)(11346002)(50226002)(486006)(48376002)(70586007)(86362001)(36756003)(126002)(51416003)(70206006)(2870700001)(476003)(26005)(4744005)(7636002)(336012)(2351001)(6666004)(356004)(1076003)(305945005)(8676002)(8936002)(5660300002)(246002)(77096007)(316002)(2906002)(76176011)(426003)(106002)(50466002)(47776003)(54906003)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR03MB3827;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b7a2ce3-9c60-4164-34fe-08d704752fc8
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);SRVR:BN7PR03MB3827;
X-MS-TrafficTypeDiagnostic: BN7PR03MB3827:
X-Microsoft-Antispam-PRVS: <BN7PR03MB3827BC1980F2A3EC12C604B7F9F10@BN7PR03MB3827.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0093C80C01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 2CQKEUm6oomagN7LUx9/mMGg11QPLU5M5OHFyniM8m03Ee/1yE0u6IwORftMNPmhWZduhjObsPFNqYy4tcRmtr8ikiohozr6NXK1PyMzjeBeFs/rMXJ/jX6slcIEK4iRcDR1lCqAhR1xXVMnTfQVQ1KxJ1ZIQtu5Li47AQ6cPZ7bf8Sd1gLZuLEayqUxaZeWVkXy9b7QdB7intDNkbmb6wgKrzEOOjru3i0yS+FrfikxgCWw6MIw/1tRqC8ITZwY5oaFVA842kgVgOztUlSk7k7K9PQ69zSbSGW8laP8PdyWjkhiHAxFvxn+eNZg+0fF5F4sSZDy7wTp1x+ZA4LQ7ShkFV+vMyXqhleY8E5aKN35H0B25OFZ6OfS+pQWr0q7Xw3VRzEIbuzOzqHd3KVB/esY66BsrEe9R8UsEG5bkRE=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2019 13:56:05.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7a2ce3-9c60-4164-34fe-08d704752fc8
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3827
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-09_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090165
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
index 4c05c70a8cf3..4f96a4a99e5b 100644
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

