Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53853E9C95
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2019 14:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfJ3Nqg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 09:46:36 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:46372 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726137AbfJ3Nqg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 09:46:36 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9UDhJ2p015506;
        Wed, 30 Oct 2019 09:46:21 -0400
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2050.outbound.protection.outlook.com [104.47.40.50])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vxwgw9scj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 30 Oct 2019 09:46:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q14DDldip/TgDFytx7gohnS5DolopIziLkyA/AbpMS7toQTPnzaEx1L1KEVE2NP1y1xJKI2JM1hMmG2NRORgBsfw62DkRNmUjt1RHqhbA1K7VVjE8qen0928pYBbJp+23zxZ4b88XMc+yNPo9kznuZmNalI+HIesSFuKg3/pvLcBXLEUFh4Dn21JcE5oCzFoDih3ptPszZbhqnGSqjsda9aySEIG/tWAIEMo06bju/cJYKfPBUpHTwA+cn+F8RRPOA09u+o/DbwLcTCv6A42uOly1VJNjgaXSIfwMrrZHQBim5ikLuUuMgkrUQ7vh1fLjpCbjTY7b5GwQRTvKUDUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK4ForIJ1dV2pKgg8AjaiYW2ekNkVeIx+41/TD4JaBA=;
 b=KfNyXT/0NvpONg64OasyQlum8PX5FFKz1zRtz2sVtBIht0IjnEPXPOh7YEg/bzt6/hLfBzGnnfZ+Qz+L4QorbPKG6E3fU3i3VQr9yfB+3k6opeQvH8GATtE34oNAZnfo5HpSq61Z0XxDIvfrdUPsjDdNCIXVb8+idp2qYO7ScN7rhBay8xGiZsPu150ju6rI3MbOfF1tGhdGlMK2D7jpjeXM5tGS0S6j9vteV5FoAFVhRXtbMNIkMX4qsHe0L/Dlae8G+8sId5kErcYAUSCxW5X5Joo73F/f9L/NSz8TnTrQlZnNWMsbIzzkZ/VAkzYdeI5j9lHAlC6i+CpXy/dGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hK4ForIJ1dV2pKgg8AjaiYW2ekNkVeIx+41/TD4JaBA=;
 b=0s41Nr9ls4/lIvuXH0gYj3v96y8dZ1sB3gWszk3/HMYkuP+8KkBVIJE3Dq11WSzxXfX4pDdmwkGsdexrhGqB/Deak8kd3zOJCzYq5jKObL4dwRniF6SBmTBEccq6XritSCFP0K4Mp0BWBkV6Lyxv0ITcwD5C3gO+z2fizsai/EA=
Received: from BN6PR03CA0057.namprd03.prod.outlook.com (2603:10b6:404:4c::19)
 by MWHPR03MB2623.namprd03.prod.outlook.com (2603:10b6:300:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22; Wed, 30 Oct
 2019 13:46:19 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::208) by BN6PR03CA0057.outlook.office365.com
 (2603:10b6:404:4c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Wed, 30 Oct 2019 13:46:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Wed, 30 Oct 2019 13:46:19 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9UDkBcK020832
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Wed, 30 Oct 2019 06:46:11 -0700
Received: from saturn.ad.analog.com (10.48.65.116) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Wed, 30 Oct 2019 09:46:18 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2 1/2] input: adp5589: Add default platform data
Date:   Wed, 30 Oct 2019 15:46:13 +0200
Message-ID: <20191030134614.20520-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(199004)(189003)(54534003)(5660300002)(246002)(336012)(54906003)(486006)(44832011)(110136005)(426003)(356004)(2906002)(6666004)(476003)(126002)(2616005)(106002)(36756003)(1076003)(186003)(305945005)(70586007)(70206006)(7636002)(4326008)(26005)(47776003)(2870700001)(8936002)(51416003)(50226002)(7696005)(8676002)(478600001)(48376002)(86362001)(107886003)(50466002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR03MB2623;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f8bfe33-cf40-4423-4af0-08d75d3f8b02
X-MS-TrafficTypeDiagnostic: MWHPR03MB2623:
X-Microsoft-Antispam-PRVS: <MWHPR03MB26234AFD43132883914F8347F9600@MWHPR03MB2623.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02065A9E77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QYkJDzm6aKHEiK3Qw0mDAe6o1Eel3+2P4017ID00UvqkEOK2lziRDt5pq/3A452e+AypGT8Gt3bP+I5xXSJb/kAs7de0Rj3ebZ+GcMt9wo4AK8MLpmTMMGJjwVwwaeUpJjLtfGXGxWOkb0LS1it/Ex6NHgP4yGRk0LM6JnGFho+ApFtPBGlX6GOyQiaUWmu1Rfsfc+/8+CWlgMG9QV6E1B/ViU1meEZZnS/WMFx/toU9qKWieExWkH0CNdqmwrnfL8V/XEnc8xSISkKmz3lMNV56Qrclz/mJpXacsZzal6yccgfTcsjLVkAFh/2JY7Gvq7v+KjO93hGmKzKVfhwQBI+ekui3VFpEeOrrZtgAINUorvHuJ4ntbjrqREQ0Gkw8ZDzaxIvXHE42QyCtk4k0QEC4NM0IldfMyXF4xtmK73YZ/khzQra/qJTYb0zybh66
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2019 13:46:19.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8bfe33-cf40-4423-4af0-08d75d3f8b02
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2623
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

If no platform data is supplied use a dummy platform data that configures
the device in GPIO only mode. This change adds a adp5589_kpad_pdata_get()
helper that returns the default platform-data. This can be later extended
to load configuration from device-trees or ACPI.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---

Changelog v1 -> v2:
* adjusted patch `input: adp5589: Add default platform data` by
  introducting a `adp5589_kpad_pdata_get()` helper, which returns the
  platform-data; the previos patch was based on an older version of the
  kernel from the ADI kernel-tree; the driver was sync-ed with the upstream
  version

 drivers/input/keyboard/adp5589-keys.c | 36 +++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e7d58e7f0257..c6a801bcdf90 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -369,6 +369,25 @@ static const struct adp_constants const_adp5585 = {
 	.reg			= adp5585_reg,
 };
 
+static const struct adp5589_gpio_platform_data adp5589_default_gpio_pdata = {
+	.gpio_start = -1,
+};
+
+static const struct adp5589_kpad_platform_data adp5589_default_pdata = {
+	.gpio_data = &adp5589_default_gpio_pdata,
+};
+
+static const struct adp5589_kpad_platform_data *adp5589_kpad_pdata_get(
+	struct device *dev)
+{
+	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
+
+	if (!pdata)
+		pdata = &adp5589_default_pdata;
+
+	return pdata;
+}
+
 static int adp5589_read(struct i2c_client *client, u8 reg)
 {
 	int ret = i2c_smbus_read_byte_data(client, reg);
@@ -498,7 +517,8 @@ static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
 static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
+	const struct adp5589_kpad_platform_data *pdata =
+		adp5589_kpad_pdata_get(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	int i, error;
 
@@ -553,7 +573,8 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 static void adp5589_gpio_remove(struct adp5589_kpad *kpad)
 {
 	struct device *dev = &kpad->client->dev;
-	const struct adp5589_kpad_platform_data *pdata = dev_get_platdata(dev);
+	const struct adp5589_kpad_platform_data *pdata =
+		adp5589_kpad_pdata_get(dev);
 	const struct adp5589_gpio_platform_data *gpio_data = pdata->gpio_data;
 	int error;
 
@@ -656,7 +677,7 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
 {
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	u8 (*reg) (u8) = kpad->var->reg;
 	unsigned char evt_mode1 = 0, evt_mode2 = 0, evt_mode3 = 0;
 	unsigned char pull_mask = 0;
@@ -861,7 +882,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 {
 	struct i2c_client *client = kpad->client;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	struct input_dev *input;
 	unsigned int i;
 	int error;
@@ -992,7 +1013,7 @@ static int adp5589_probe(struct i2c_client *client,
 {
 	struct adp5589_kpad *kpad;
 	const struct adp5589_kpad_platform_data *pdata =
-		dev_get_platdata(&client->dev);
+		adp5589_kpad_pdata_get(&client->dev);
 	unsigned int revid;
 	int error, ret;
 
@@ -1002,11 +1023,6 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
-
 	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
 		return -ENOMEM;
-- 
2.20.1

