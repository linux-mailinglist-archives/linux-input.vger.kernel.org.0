Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68326E9C97
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 14:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfJ3Nql (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 09:46:41 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:52862 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726137AbfJ3Nql (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 09:46:41 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9UDhZwm017996;
        Wed, 30 Oct 2019 09:46:29 -0400
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2053.outbound.protection.outlook.com [104.47.40.53])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vxwgw9scx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 30 Oct 2019 09:46:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOLU7uS+QPZGUDKFxffNm0SQNOhQz6NuwhzE1TcSZPLWA9M+tWibjn+9fzzrX5hk59FCQIwPf8RvzghiuKb8fbi8osmNJQYooFELpr4gdYZEXyZQd4VmAiBzuhTajAzPasVN1SlgCAx+md22bQmpKmLKqNNT1r2tNtyWvHXccv3JapWROOoXGrl5emVJiOfFRnKZ0LQIGIfJnA16beW+7s2ZCdQiY2NgY3JpKJykbOxirrB6hpTsKTxhTF+ZUkNnp0XEPzfq6JrzZ+xjjTqY9qctZAoDj0DZspGUSMm4SH0idsKnBGT50E2Pg1+szndTpzKyOAtetjddSQi60UGziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxBQx/wForZ98xrH4GyG+iuSbGglyDWHYWvNUUd4OSw=;
 b=DmUEPkUmya/FEQqtKBMJj1q6Up2FjQ/PKQ22C/SXrn6Yto55Tm5VbTqXeaCi8w3s6WHCwMuPsfeZO3mTA6u33G+enZqTTZGM/p5I9tn7tTrgddP62uH+oA0+R+EA+D7D1fa70Lgd6wDZ4GG847XGyPYhKPtjdHjmr/QxYHSYiyImgOfSf3aXMquo7Z9VcwYtxy8VfSFHK+/9RUBnDDXS5QOEGZHxof6zJyJh42TY3Ywo8mNuOdySCM2uXrC0ROvZr6oxZMjhOVrrNPOVujxWBWLMXQSekdnM5NhYnD2s5poK2KEMwXqdrT9RgSJS59/LoLjfrMrieo0TROcTnTu6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxBQx/wForZ98xrH4GyG+iuSbGglyDWHYWvNUUd4OSw=;
 b=P6fHjCcwWLFeOC5MLFJplUJHqMln/R/q6iPCOxVeaKExu0/mz/wmQzjjh8dP1x/HSxyd90ucKUddCwMHPQdMy7vZH0sp0tGr7V/YMaIkWHa7K7mRSINx8hyG0jC/2UOfUheu1HjuwkPw04gXPu21AtvroAejFE3GxC3dDcc6c5w=
Received: from BN6PR03CA0073.namprd03.prod.outlook.com (2603:10b6:405:6f::11)
 by SN6PR03MB4192.namprd03.prod.outlook.com (2603:10b6:805:c5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22; Wed, 30 Oct
 2019 13:46:21 +0000
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by BN6PR03CA0073.outlook.office365.com
 (2603:10b6:405:6f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Wed, 30 Oct 2019 13:46:21 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Wed, 30 Oct 2019 13:46:21 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9UDkDhe020867
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 30 Oct 2019 06:46:13 -0700
Received: from saturn.ad.analog.com (10.48.65.116) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Wed, 30 Oct 2019 09:46:20 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 2/2] input: adp5589: Add basic devicetree support
Date:   Wed, 30 Oct 2019 15:46:14 +0200
Message-ID: <20191030134614.20520-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030134614.20520-1-alexandru.ardelean@analog.com>
References: <20191030134614.20520-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(346002)(396003)(376002)(189003)(199004)(86362001)(2870700001)(476003)(51416003)(76176011)(1076003)(14444005)(356004)(26005)(6666004)(305945005)(336012)(486006)(7636002)(2906002)(11346002)(186003)(446003)(107886003)(2616005)(70586007)(50226002)(36756003)(246002)(126002)(426003)(48376002)(54906003)(7696005)(4326008)(8676002)(70206006)(47776003)(8936002)(110136005)(5660300002)(478600001)(316002)(50466002)(44832011)(106002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR03MB4192;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148e55d4-b330-4cc5-f6cf-08d75d3f8c20
X-MS-TrafficTypeDiagnostic: SN6PR03MB4192:
X-Microsoft-Antispam-PRVS: <SN6PR03MB419229F535C1CF2CE4CEA63AF9600@SN6PR03MB4192.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7wSloWcisO08+UglwQFwNSghbs8JzBKshX5JjfZPh0QG3sstFo+xFPFYZKu9+WnOT81Qn+S4Wnk2XjGY53VzQzDoV61TM+iBcC7RO4QghBtQSsSJPoHB9NdIQMovgyARez/YVy4OnwEmm9Fcx5ZQjSNF75e6o+baN+rdUuZxkQAKEcUKPFSnFCm+Va1oY2r09qxZGmYJhnWValwZzp0LmSzIFgQExd9M5Ye35rHJXx3RdwcP2A1uIy6ieql08KeOnVtT48av+25U4ACzoTxK7ZJMlvOGyAlUM/muYJhxlPw0VunrR+suAeaT05Ut+yfWBvX2p1sd0vb9iiu6oggpCEqMUcYV37JNRidaPfTxETu7S0vLjHA5w7GQ9dVovbt6efhbJyvqkgxNV4qRVYUoGQsV3pRwxh0Pw+oS1g5CviDi//yrxAU7nnQeXuKA6Bu
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 13:46:21.0196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 148e55d4-b330-4cc5-f6cf-08d75d3f8c20
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4192
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-30_06:2019-10-30,2019-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910300133
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
index c6a801bcdf90..e281b827995e 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -1008,6 +1008,25 @@ static void adp5589_keypad_remove(struct adp5589_kpad *kpad)
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
 static int adp5589_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -1029,7 +1048,11 @@ static int adp5589_probe(struct i2c_client *client,
 
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
@@ -1129,6 +1152,13 @@ static int adp5589_resume(struct device *dev)
 
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
@@ -1142,6 +1172,7 @@ static struct i2c_driver adp5589_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &adp5589_dev_pm_ops,
+		.of_match_table = adp5589_of_match,
 	},
 	.probe = adp5589_probe,
 	.remove = adp5589_remove,
-- 
2.20.1

