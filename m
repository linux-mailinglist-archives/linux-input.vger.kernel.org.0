Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9176E870B
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 12:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732293AbfJ2L3C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 07:29:02 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:1620 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730038AbfJ2L3B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 07:29:01 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9TBSPp9015911;
        Tue, 29 Oct 2019 07:28:48 -0400
Received: from nam05-dm3-obe.outbound.protection.outlook.com (mail-dm3nam05lp2059.outbound.protection.outlook.com [104.47.49.59])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vvk26etb0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 29 Oct 2019 07:28:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2V/71t9LtjzDOiOia0N0S1sa0Qy2RqNuwYgPBobV3xZKcUDiFL4zWGHFfdqim+1XUY+fvRvLC1sJTKYYIJDo5BbAXBP9amJQMurJJKXWQBhIIM2oachcBJGWBbyw1tdde7UM0G60wTA53cNKwTO3qpy9+7SAB2mwKWTKgxCjNTdiLPQgdbV4mGhcq1xxEKn9/qhuynt+bgHstBL5j8JdovxW43VsHH0/Yl9kgBrxKW911ERnGued3Snq6lAPhdJLhYBIGs5bfAhHiZI3j94j00esGGhysZVN/D6g+Lvo3sVY5HIi+CBk6qrAsqDl8LsRkZBoLrbRQ/GzHJ7yilLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D74e019tZkowCsOWwX+UErlirFEYvMqCMBm2VCbbvhM=;
 b=WqMO0x+k5Ld8SzDVAx3JgRic2Si232lNBSko+rQfyiNz9ysfRGKqZwY+MKBM2bWwsJgDanX6l7PxFlQNXg6QIL68I6OnD7Js72ylU7AodFsmRQgvMX+jF1I6eDTn4sYb4VwD0qqtCjuJN2ATSkImTF63XYHLWbobWgpUVhVc/pUJGGPqkkxZuEr3HszOI987wIldP4jd5eyMRc74kOCVubW4mZdwQwn9QsYBA2e7rs+LXBI04/tQ6a3a0Om6n8mTfKd0asdDEjVGdWuv8GpQKPZPqlNlJMWYUbd8Ft67CdlIscUa2kQUojYjnWCEjbAdwGXC48fi1m4tm/uL/dCE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=none action=none header.from=analog.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D74e019tZkowCsOWwX+UErlirFEYvMqCMBm2VCbbvhM=;
 b=PV2Z9LC7JYmhte/LQ/8bd53EeWKHPSGcgzdiN4WAfWiNtib5pWVlu9aPlG9nql+AqPfEtViS52ijvpNv1nGB/u7LwCFDdbAEEOKrYvMEBs83AGrYhQObG31ihYKmFvRymaUVjch2bLelleXijYPudj3meN1yOgi70G5+RAKayAo=
Received: from BN6PR03CA0104.namprd03.prod.outlook.com (2603:10b6:404:10::18)
 by DM6PR03MB3419.namprd03.prod.outlook.com (2603:10b6:5:af::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22; Tue, 29 Oct
 2019 11:28:44 +0000
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by BN6PR03CA0104.outlook.office365.com
 (2603:10b6:404:10::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.17 via Frontend
 Transport; Tue, 29 Oct 2019 11:28:44 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of analog.com: DNS Timeout)
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Tue, 29 Oct 2019 11:28:42 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x9TBSe3I016173
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 29 Oct 2019 04:28:40 -0700
Received: from saturn.ad.analog.com (10.48.65.116) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Tue, 29 Oct 2019 07:28:39 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 1/2] input: adp5589: Add default platform data
Date:   Tue, 29 Oct 2019 13:28:35 +0200
Message-ID: <20191029112836.9188-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(486006)(54906003)(106002)(8676002)(336012)(107886003)(2906002)(2870700001)(50466002)(7636002)(8936002)(316002)(47776003)(186003)(26005)(110136005)(51416003)(7696005)(1076003)(36756003)(70206006)(356004)(86362001)(476003)(48376002)(2616005)(478600001)(50226002)(4326008)(426003)(5660300002)(63350400001)(70586007)(126002)(6666004)(44832011)(305945005)(246002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB3419;H:nwd2mta1.analog.com;FPR:;SPF:TempError;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18935be-97bd-4257-83ef-08d75c632758
X-MS-TrafficTypeDiagnostic: DM6PR03MB3419:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3419521BF7AC57212D72BABCF9610@DM6PR03MB3419.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 0205EDCD76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pE4kjgM3n0MiDJAxTRcPPpydwAdVnBNZH3nQssGooil9cbkYowumfFUim0ic+DKu+sz5MCKYdeqZK2vNGBOaWASiv9ZmHnxTujeucLB4WdAUz8X6fwvWh0hCCEXQ1xxc8BpDntNZ1tiWgSb2A6d2r2hrfwRWpjQhCP+g6h/olTqqK5PNkLqSWgLlv8ylLkgiwjomlLqgEBQQYuh/CpG9KU+aRHyDYP03IfX718GLY2oyqBggU6Tp35bYA2aNyqTbSTJWR8y32wAmKFD5SytNAD5BnHVIzsRNJJGZRpghBjrw1mzTPlyzdeD4g71zJqW++pcwdSzBiDOh+3tA6yNbc0TRKs6jJglDn03n2T8RLM2cGAMU+0hGoDsb0FyINdlOWJ5ca7p4Zo7NAg5qiPNoCiewTG7hV12KSDsAZa4Ie8IzxU1MsTR9GFmTwIBHINXA
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2019 11:28:42.6653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18935be-97bd-4257-83ef-08d75c632758
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3419
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_03:2019-10-28,2019-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910290118
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lars-Peter Clausen <lars@metafoo.de>

If no platform data is supplied use a dummy platform data that configures
the device in GPIO only mode.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/keyboard/adp5589-keys.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e7d58e7f0257..ed2c13bef1b7 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -987,6 +987,14 @@ static void adp5589_keypad_remove(struct adp5589_kpad *kpad)
 	}
 }
 
+static const struct adp5589_gpio_platform_data adp5589_default_gpio_pdata = {
+	.gpio_start = -1,
+};
+
+static const struct adp5589_kpad_platform_data adp5589_default_pdata = {
+	.gpio_data = &adp5589_default_gpio_pdata,
+};
+
 static int adp5589_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -1002,10 +1010,8 @@ static int adp5589_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	if (!pdata) {
-		dev_err(&client->dev, "no platform data?\n");
-		return -EINVAL;
-	}
+	if (!pdata)
+		pdata = &adp5589_default_pdata;
 
 	kpad = kzalloc(sizeof(*kpad), GFP_KERNEL);
 	if (!kpad)
-- 
2.20.1

