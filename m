Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD053118A7F
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 15:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfLJOL2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 09:11:28 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:32240 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727145AbfLJOL2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 09:11:28 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBAE0dAH013029;
        Tue, 10 Dec 2019 09:11:12 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        by mx0a-00128a01.pphosted.com with ESMTP id 2wraq3h2gd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Dec 2019 09:11:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fII2uZkmkmyCfBpjHdxwNwjnfugQaem9joE4tGuOuUICixzGVc7Os8sAaGSk8RSn4uhiCcDThXUf7jG6o4k36xL/x4M0S2cIcjxBdNGwj4Ka/i1KNbXcod+wpRm2Fo9zfk1Lr+l8M7I6dVyc0cZF5s0k2IkgI6cix/7VRC3GSW2F158twjUgUvj3oYWJ5Qh1eKPLSI2IgjcHoXBkGsSF0fJdL+oL+xIZLt5WzdcL29wWhsbV8rSIH5H9qVU7J7BCBJMYp8SalLg7OD2oZXzg32YG972q67LRzr3fHwRMuXgKbzmJvCoZkcHzcKqQaNrvTvG7bX1hiwtfXCVcJgOWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWWK5rKPuY2v1fSDcpuzUN4e4ZK64CY6kcAI4YYNRDc=;
 b=Kjx00ooUT0MfMGoBSklc6oBFv6ALoTvWlG0cPeeqDxOrmIj8ZbQBv4Z3v2qSJqCK2fYuEzcFBA93vNWLjQ+eDY9XALm8UDS0hFTP1l2Sy5XcBrcYU0kQ2hTLcuEhmYld/UWKMUMqB29kmrILhOGU8uWpRUHx6G+U5uaet/RxlB4TuipQE4tUNb/c0dHWecHe2Y7wm5NMGpzhYLe5HFK4B1jIODiRgzA3BIAQsbYk7TZJdKzoNXwjwa7x2kxrtAHr21hiFitssWEC7OTuuX8IGBGUdfhsT7mMn2gZXiOAFFXiAJ4ZiQkS+7igUxXn+n8SROqCGTtELxTPhoefdHBI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWWK5rKPuY2v1fSDcpuzUN4e4ZK64CY6kcAI4YYNRDc=;
 b=NHNem7yj18Pplmxz9AgTI4MO403Dc4kXhAiZAfoJTIw+PZosQICzwpEmrfhLaL3U7zWWI7YiR/KA0lgNPWWVo0MW+CCBagr4OONCyosZajXvGjwm7FDb1YitYdUsS22wTE3YMvRBu9AaiYr10nZ1PoQtKgiwmcs2ims3lFifLUw=
Received: from BN8PR03CA0019.namprd03.prod.outlook.com (2603:10b6:408:94::32)
 by MN2PR03MB5278.namprd03.prod.outlook.com (2603:10b6:208:1eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Tue, 10 Dec
 2019 14:11:10 +0000
Received: from BL2NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::200) by BN8PR03CA0019.outlook.office365.com
 (2603:10b6:408:94::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Tue, 10 Dec 2019 14:11:10 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 BL2NAM02FT024.mail.protection.outlook.com (10.152.77.62) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2495.26
 via Frontend Transport; Tue, 10 Dec 2019 14:11:10 +0000
Received: from ASHBMBX8.ad.analog.com (ashbmbx8.ad.analog.com [10.64.17.5])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id xBAEB9kE026165
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
        Tue, 10 Dec 2019 06:11:09 -0800
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 10 Dec
 2019 09:11:08 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 10 Dec 2019 09:11:08 -0500
Received: from saturn.ad.analog.com ([10.48.65.121])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id xBAEB4Wa010212;
        Tue, 10 Dec 2019 09:11:05 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <dmitry.torokhov@gmail.com>, <info@metux.net>,
        <tglx@linutronix.de>, <m.felsch@pengutronix.de>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH] Input: ads7846: use new `delay` structure for SPI transfer delays
Date:   Tue, 10 Dec 2019 16:11:03 +0200
Message-ID: <20191210141103.15910-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(199004)(189003)(478600001)(7636002)(2616005)(70206006)(246002)(8936002)(336012)(186003)(86362001)(26005)(8676002)(426003)(5660300002)(316002)(36756003)(2906002)(44832011)(7696005)(1076003)(356004)(70586007)(110136005)(107886003)(54906003)(4326008)(81973001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5278;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3165ce8d-3454-49f6-ea42-08d77d7acea5
X-MS-TrafficTypeDiagnostic: MN2PR03MB5278:
X-Microsoft-Antispam-PRVS: <MN2PR03MB527877A836897C64B65EBE92F95B0@MN2PR03MB5278.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWlCN34nroZekYSJvqQvzq8dRVyd/9oSJkXD076RPraRQKdwT8vSdpk7H71MBzIOfC2dv+QuQP7Q5wjIWQsUAnWZMQu3eWZaFH+qvehXrTv562VP0KP6GuXI0MrcXEddqMry0joTqKnijXvYv2UApNxAFY57OIytxgz8MgwXihKg32zwjVYNuJD3SdgzWhKwhlMYXAPTzN8M7lLzrrJKkgOmHKEzFQ0hY3TAOc+JlKS+uIEidNls4X4Dqs0tOJ3yfY/jnrieqZRX5stMfYvb3XkJQPL5iwUZipVIW+9SFtYHxiKQFP+Z5x643REFeevMaw+v7IF4Q8lu/n82AH0HOyW5SJf6sc9T265W85hOIdwxNpdFAUnFNPmaafce6fN28jglvG0gekuDgA+gzpqWzGJstCrM4stAJbDHv/u2tSf3dBGH3Z4UHDalRF2bC4phudfMGtrqzqL9j5cCV37PmxvO9lBcyDr5c3lx9wli5qk=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 14:11:10.1265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3165ce8d-3454-49f6-ea42-08d77d7acea5
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5278
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_03:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100122
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In a recent change to the SPI subsystem [1], a new `delay` struct was added
to replace the `delay_usecs`. This change replaces the current `delay_usecs`
with `delay` for this driver.

The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
that both `delay_usecs` & `delay` are used (in this order to preserve
backwards compatibility).

[1] commit bebcfd272df6485 ("spi: introduce `delay` field for
`spi_transfer` + spi_transfer_delay_exec()")

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/input/touchscreen/ads7846.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 51ddb204ca1b..8fd7fc39c4fd 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -333,7 +333,8 @@ static int ads7846_read12_ser(struct device *dev, unsigned command)
 		req->xfer[1].len = 2;
 
 		/* for 1uF, settle for 800 usec; no cap, 100 usec.  */
-		req->xfer[1].delay_usecs = ts->vref_delay_usecs;
+		req->xfer[1].delay.value = ts->vref_delay_usecs;
+		req->xfer[1].delay.unit = SPI_DELAY_UNIT_USECS;
 		spi_message_add_tail(&req->xfer[1], &req->msg);
 
 		/* Enable reference voltage */
@@ -1018,7 +1019,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
 	 * have had enough time to stabilize.
 	 */
 	if (pdata->settle_delay_usecs) {
-		x->delay_usecs = pdata->settle_delay_usecs;
+		x->delay.value = pdata->settle_delay_usecs;
+		x->delay.unit = SPI_DELAY_UNIT_USECS;
 
 		x++;
 		x->tx_buf = &packet->read_y;
@@ -1061,7 +1063,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
 
 	/* ... maybe discard first sample ... */
 	if (pdata->settle_delay_usecs) {
-		x->delay_usecs = pdata->settle_delay_usecs;
+		x->delay.value = pdata->settle_delay_usecs;
+		x->delay.unit = SPI_DELAY_UNIT_USECS;
 
 		x++;
 		x->tx_buf = &packet->read_x;
@@ -1094,7 +1097,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
 
 		/* ... maybe discard first sample ... */
 		if (pdata->settle_delay_usecs) {
-			x->delay_usecs = pdata->settle_delay_usecs;
+			x->delay.value = pdata->settle_delay_usecs;
+			x->delay.unit = SPI_DELAY_UNIT_USECS;
 
 			x++;
 			x->tx_buf = &packet->read_z1;
@@ -1125,7 +1129,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
 
 		/* ... maybe discard first sample ... */
 		if (pdata->settle_delay_usecs) {
-			x->delay_usecs = pdata->settle_delay_usecs;
+			x->delay.value = pdata->settle_delay_usecs;
+			x->delay.unit = SPI_DELAY_UNIT_USECS;
 
 			x++;
 			x->tx_buf = &packet->read_z2;
-- 
2.20.1

