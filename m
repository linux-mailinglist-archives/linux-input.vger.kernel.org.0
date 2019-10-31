Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C11FEAC17
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 10:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfJaJDD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Oct 2019 05:03:03 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:27624 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726864AbfJaJDD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Oct 2019 05:03:03 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9V92Yvp007880;
        Thu, 31 Oct 2019 05:02:50 -0400
Received: from nam05-co1-obe.outbound.protection.outlook.com (mail-co1nam05lp2056.outbound.protection.outlook.com [104.47.48.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 2vxwhjmkdu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 31 Oct 2019 05:02:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5RPme6Lw45GEGGdMTM51PzWHKq6BHfrNLuFRlQ68uyIgersugfl6W60XgssQJLMzmNcjqV0h7T7r9NJrQyRpHKML4EOh/qSdTentDP9IFBFEimRLqQFyF9/Na59TRbn8Bc2YnLj6yKHQuk977jpL0ZXE+7njFmfCHyNT9/BkbH/SvID3OgMbgPUd8BRujuEIOQJTAyJ07iGHcAEv42c9YIYqhQvEcotbsY5YBHGeaNEdpvvEhyNPqaOhe8bokoZGsv3Z0T4HMIxcdklKH+1ZJmQK8kY0E0Vsad0o/rbFK28MVKN2tPst9gODV0Nfoi3E2d4L7j7t5hSNIC3omdXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+b9MC3wjmqiK2LtU5cdYMvRlwLtMCifyjGmv/1NSyY=;
 b=OF0TrfDOREIp1oIxMTlg2vdVu1RYAh/u2LXlVamEcqmHPYsyqYpSSZ427obMa+IeJVcwsGE8KYrBzulqwY6Dw+gEhcREpuC6Mq8bGzHmNmYJ+cGjuYjEmTcV/z4UCC4difQcMFkWEfYJ0TqblQi6HGvHSzm140tJpjvPCZstrKC/l/qIkQccJPUoqaRfSUj2J99Ir7uXJbXqIib9vWyAJvcQUwKPEEB2e00tOeFUscUR5c7Twx0MmmIArdwl/CLDUAelVD+nnSzyBqMkIBUIMSwJ2ettMI74o712MK79D9YKR+Ts1e7jApgQpEkSwPG6rcohCGy9bZ4Sjl0WMXkpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+b9MC3wjmqiK2LtU5cdYMvRlwLtMCifyjGmv/1NSyY=;
 b=8zKhE0QMsVWebifFp7syaqfP7p4lBCieY8GJkEnGMxSKftKvfQUe4H/MkpFDnAfEWEeRxk+PvsI7CRQdjl0KWbHFX2fs8b0kIS38BQbw55TTd0khpFY6HCAZEn2qu+VVRTntPcduZ73YO/uOSvJrpp9Wjzq56MFeHPLekJMm8So=
Received: from BN6PR03CA0102.namprd03.prod.outlook.com (2603:10b6:404:10::16)
 by BN8PR03MB4756.namprd03.prod.outlook.com (2603:10b6:408:9a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24; Thu, 31 Oct
 2019 09:02:42 +0000
Received: from SN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by BN6PR03CA0102.outlook.office365.com
 (2603:10b6:404:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via Frontend
 Transport; Thu, 31 Oct 2019 09:02:42 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT043.mail.protection.outlook.com (10.152.72.184) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2387.20
 via Frontend Transport; Thu, 31 Oct 2019 09:02:42 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9V92Y0P003410
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 31 Oct 2019 02:02:34 -0700
Received: from saturn.ad.analog.com (10.48.65.117) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Thu, 31 Oct 2019 05:02:41 -0400
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <lars@metafoo.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3 2/2] input: adp5589: Add basic devicetree support
Date:   Thu, 31 Oct 2019 11:03:12 +0200
Message-ID: <20191031090312.17205-2-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031090312.17205-1-alexandru.ardelean@analog.com>
References: <20191031090312.17205-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(189003)(199004)(54534003)(70206006)(426003)(486006)(305945005)(11346002)(70586007)(44832011)(126002)(446003)(7636002)(2616005)(476003)(336012)(5660300002)(316002)(110136005)(54906003)(106002)(478600001)(356004)(8676002)(50466002)(86362001)(6666004)(8936002)(50226002)(107886003)(48376002)(1076003)(7696005)(36756003)(246002)(51416003)(76176011)(14444005)(47776003)(26005)(186003)(4326008)(2906002)(2870700001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR03MB4756;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0ff67cb-000c-48d2-7c6d-08d75de11699
X-MS-TrafficTypeDiagnostic: BN8PR03MB4756:
X-Microsoft-Antispam-PRVS: <BN8PR03MB4756970F40CE788911B45E9AF9630@BN8PR03MB4756.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFl0cy0PnMarQiVNGxGs0ofgUqb56go+1fM7xUXjhVkZuoNAkqFnB2F5yR1kPPBlq7n73kn97wmFdnZ27Vx1f4i3jwPlJ8YW891qLfqqH62ESZNfKG+YGRX3fmxg4oeFt9PKcgAxLNh1tcwAMfroWG+O+9ZtxvcZKeM9UwasMWmWp/mhg60O/i4HTMUC+oLW8qSFV6pw9Sk1StEzSY1ze3LkzRQ2+53hyLHDuI3nGz07ob8ih+vb+FP88VFpbJDdW12siUKcZ5ILHh2285iSE9GxcBWxsSCga2o6ssk84VxfuoMHz4ZcIs+uzu2JqwN0nZyEe0YF3vPBZJB5jx5drAF1/w22eBZ+NzdLDzELtp21oNjOY7WYsySHPN5QNIsNqDBMTTIgl/4ibe36zZ3RhmArbZp0wMOVMiEERkpSKqGF7EC1lVslqXDzzC2zA3f8
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 09:02:42.3306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ff67cb-000c-48d2-7c6d-08d75de11699
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4756
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_03:2019-10-30,2019-10-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910310091
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

Changelog v2 -> v3:
* fix `-Wpointer-to-int-cast` warnings for patch `input: adp5589: Add basic
  devicetree support` ; warnings shows up on 64 bit ARCHs

Changelog v1 -> v2:
* adjusted patch `input: adp5589: Add default platform data` by
  introducting a `adp5589_kpad_pdata_get()` helper, which returns the
  platform-data; the previos patch was based on an older version of the
  kernel from the ADI kernel-tree; the driver was sync-ed with the upstream
  version

 drivers/input/keyboard/adp5589-keys.c | 33 ++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index c6a801bcdf90..56f4ff7fa9c3 100644
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
+		return (uintptr_t)match->data;
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

