Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B126E86F8
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 12:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732050AbfJ2L3C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 07:29:02 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:63738 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727525AbfJ2L3B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 07:29:01 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9TBSE15029205;
        Tue, 29 Oct 2019 07:28:47 -0400
Received: from nam03-dm3-obe.outbound.protection.outlook.com (mail-dm3nam03lp2051.outbound.protection.outlook.com [104.47.41.51])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vvjs67cw2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 29 Oct 2019 07:28:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dcb7AzgyXh9UcklJnQxygGbg33Z1xDSTzQ1hsPgds0BZNyWPDJf1udo3AozF6El+/MHYx5N85kpBzIiEC06u6fyKLKQ55I9p+IR3rPcv+/hW08AAVDP+ncehDZhfsViKW4e8B3uBhkDSfEPLbnvwyPuXbOnNei43hnw0VLujALEM/vRGI/ohR4UkBwecx94RYH1AXAgEwvOD1h4gGe0TQkM3+kSwK1RtLUKfRF1Kz15duDt82GTup0JLOldR22zYLJYdqgOW4/7BKkfLvdWeGbXuZDHhJlFoHK5a5in7O+by7SYwWFO0r4DsN7Inrc5w+39WYZGhB8HRvFUpdemiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOgbSYpm6Le6HnZ0aWOyTzIYP3soth8tc44fOOwJXW8=;
 b=kAPhHqHGZPN5IyvyU2KohjlkIY65eP6jN/GjKEyRwHeYndraj5gITWxX7IQ98CmCMFiy77/Xx/yj8vi/cBVviAc5Fwmbc5Xcm4PufE/9jO3l1SqSUtg6j25iAu/lgnV0epaQLLzTuu+tnubK6ehBQv+pIc9FPlB6otEA+G+S4ytiLLfDXOgKwFtbuMmwffyZDoXMoFEvOxSQqFP7hv3/RiYUoee664MKE4HM1LgzcgF14BbiMPagIddOAE9HK8yUmkE+vcAmAMGsi1IUqzayxDA+1krirN8IZorqXaEydniU3CxppSdnqrYOPYQyaVqgSy6zGobkrbRQj41FPMxbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOgbSYpm6Le6HnZ0aWOyTzIYP3soth8tc44fOOwJXW8=;
 b=fNU5WJ9KsnZoqeiEZ9Mbgb56EWC60belJbKUFMCq0jjHZVoX3o1+xONA/OCnwHckDDOrpItcHlV+WK7PfGmShKguPTPnShk5KGS8rrEDUvsGhztI2jLxinszpXU8BzojsGPLISjXy4ozETk5OXt9dfwIJxUZMnkqBEqxENUDmeE=
Received: from BN6PR03CA0102.namprd03.prod.outlook.com (2603:10b6:404:10::16)
 by BN7PR03MB3540.namprd03.prod.outlook.com (2603:10b6:406:ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23; Tue, 29 Oct
 2019 11:28:45 +0000
Received: from CY1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::203) by BN6PR03CA0102.outlook.office365.com
 (2603:10b6:404:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.22 via Frontend
 Transport; Tue, 29 Oct 2019 11:28:45 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT049.mail.protection.outlook.com (10.152.75.83) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Tue, 29 Oct 2019 11:28:44 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9TBSh2j016179
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 29 Oct 2019 04:28:43 -0700
Received: from saturn.ad.analog.com (10.48.65.116) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 29 Oct 2019 07:28:43 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 2/2] input: adp5589: Add basic devicetree support
Date:   Tue, 29 Oct 2019 13:28:36 +0200
Message-ID: <20191029112836.9188-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029112836.9188-1-alexandru.ardelean@analog.com>
References: <20191029112836.9188-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(356004)(5660300002)(6666004)(106002)(4326008)(316002)(70206006)(70586007)(336012)(26005)(36756003)(86362001)(50466002)(76176011)(486006)(54906003)(110136005)(44832011)(14444005)(186003)(107886003)(48376002)(50226002)(47776003)(478600001)(2906002)(305945005)(51416003)(7696005)(426003)(2870700001)(11346002)(1076003)(476003)(126002)(2616005)(81156014)(81166006)(8936002)(8676002)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR03MB3540;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:ErrorRetry;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e3ffa0-ca1e-4f6f-b3c7-08d75c632829
X-MS-TrafficTypeDiagnostic: BN7PR03MB3540:
X-Microsoft-Antispam-PRVS: <BN7PR03MB3540810C93CA243AD7601088F9610@BN7PR03MB3540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPeUSxEUdc2YWK9jc1QqMJN7vNptxzxVGjaVJaPS2Tu9I7oWedEpwyWEgTa3iOH/Lr4LIKOFt5AjHs5KHKtFWXorZ4wBzaaE/8eSnDZKnKyW/TNVnFW0YDQN3+6xgBuAI20XVDkUpO0s4QstsxwxIplkAomXe49DLSD7ba0Cvs9UASZh3+B1OcUEwHzoZ/kHTqJM00tSK3jrif1TWj0eOXh8XhWegOCr/RW9AV+R1febnIBCWkbwkrz6EexHYThKNGhwGEUBqN7wzJcF9Kt6Emyn5pMMa6QGA3H4rlAGOsaoKkL93mSNABvr+7RphVY0XHA56aAutEm+yZMhPGzxekDjcLfxooN/GAH/JaIglPOcCaUw0/0Yo9qlbpUDZUOdIdfTsqKSwvVxHLes1K6hL0Cq9oVSPMtlligz9eKjvHz5u13fyinumENRnTeMW5Pr
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 11:28:44.0362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e3ffa0-ca1e-4f6f-b3c7-08d75c632829
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3540
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910290118
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

Add very basic devicetree suppport to the adp5589 allowing the device to be
registered from devicetree.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 33 ++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index ed2c13bef1b7..61d1e2f748f3 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -987,6 +987,25 @@ static void adp5589_keypad_remove(struct adp5589_kpad *kpad)
 	}
 }
 
+static int adp5589_i2c_get_driver_data(struct i2c_client *i2c,
+				       const struct i2c_device_id *id)
+{
+	const struct of_device_id *match;
+
+	if (id)
+		return id->driver_data;
+
+	if (!IS_ENABLED(CONFIG_OF) || !i2c->dev.of_node)
+		return -ENODEV;
+
+	match = of_match_node(i2c->dev.driver->of_match_table,
+			      i2c->dev.of_node);
+	if (match)
+		return (int)match->data;
+
+	return -ENODEV;
+}
+
 static const struct adp5589_gpio_platform_data adp5589_default_gpio_pdata = {
 	.gpio_start = -1,
 };
@@ -1019,7 +1038,11 @@ static int adp5589_probe(struct i2c_client *client,
 
 	kpad->client = client;
 
-	switch (id->driver_data) {
+	ret = adp5589_i2c_get_driver_data(client, id);
+	if (ret < 0)
+		return ret;
+
+	switch (ret) {
 	case ADP5585_02:
 		kpad->support_row5 = true;
 		/* fall through */
@@ -1119,6 +1142,13 @@ static int adp5589_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(adp5589_dev_pm_ops, adp5589_suspend, adp5589_resume);
 
+static const struct of_device_id adp5589_of_match[] = {
+	{ .compatible = "adi,adp5585", .data = (void *)ADP5585_01 },
+	{ .compatible = "adi,adp5585-02", .data = (void *)ADP5585_02 },
+	{ .compatible = "adi,adp5589", .data = (void *)ADP5589 },
+	{}
+};
+
 static const struct i2c_device_id adp5589_id[] = {
 	{"adp5589-keys", ADP5589},
 	{"adp5585-keys", ADP5585_01},
@@ -1132,6 +1162,7 @@ static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &adp5589_dev_pm_ops,
+		.of_match_table = adp5589_of_match,
 	},
 	.probe = adp5589_probe,
 	.remove = adp5589_remove,
-- 
2.20.1

