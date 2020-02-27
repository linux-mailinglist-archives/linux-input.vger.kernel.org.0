Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 845F6171834
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 14:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgB0NGb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 08:06:31 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:54690 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729032AbgB0NGb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 08:06:31 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01RD3ROn004946;
        Thu, 27 Feb 2020 08:06:30 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ydtrwk6h0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Feb 2020 08:06:29 -0500
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 01RD6SOu051997
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 27 Feb 2020 08:06:28 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 27 Feb
 2020 08:06:27 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 27 Feb 2020 08:06:27 -0500
Received: from analog.ad.analog.com ([10.48.65.180])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 01RD6Pbg025622;
        Thu, 27 Feb 2020 08:06:25 -0500
From:   Sergiu Cuciurean <sergiu.cuciurean@analog.com>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>, <michael.hennerich@analog.com>
CC:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Subject: [PATCH] input: touchscreen: ad7877: Use new structure for SPI transfer delays
Date:   Thu, 27 Feb 2020 15:06:19 +0200
Message-ID: <20200227130619.28142-1-sergiu.cuciurean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-27_03:2020-02-26,2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270103
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In a recent change to the SPI subsystem [1], a new `delay` struct was added
to replace the `delay_usecs`. This change replaces the current
`delay_usecs` with `delay` for this driver.

The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
that both `delay_usecs` & `delay` are used (in this order to preserve
backwards compatibility).

[1] commit bebcfd272df6 ("spi: introduce `delay` field for
`spi_transfer` + spi_transfer_delay_exec()")

Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
---
 drivers/input/touchscreen/ad7877.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index 9b652f61837f..0007aaf5cbd7 100644
--- a/drivers/input/touchscreen/ad7877.c
+++ b/drivers/input/touchscreen/ad7877.c
@@ -281,12 +281,14 @@ static int ad7877_read_adc(struct spi_device *spi, unsigned command)
 
 	req->xfer[1].tx_buf = &req->ref_on;
 	req->xfer[1].len = 2;
-	req->xfer[1].delay_usecs = ts->vref_delay_usecs;
+	req->xfer[1].delay.value = ts->vref_delay_usecs;
+	req->xfer[1].delay.unit = SPI_DELAY_UNIT_USECS;
 	req->xfer[1].cs_change = 1;
 
 	req->xfer[2].tx_buf = &req->command;
 	req->xfer[2].len = 2;
-	req->xfer[2].delay_usecs = ts->vref_delay_usecs;
+	req->xfer[2].delay.value = ts->vref_delay_usecs;
+	req->xfer[2].delay.unit = SPI_DELAY_UNIT_USECS;
 	req->xfer[2].cs_change = 1;
 
 	req->xfer[3].rx_buf = &req->sample;
@@ -716,7 +718,8 @@ static int ad7877_probe(struct spi_device *spi)
 	spin_lock_init(&ts->lock);
 
 	ts->model = pdata->model ? : 7877;
-	ts->vref_delay_usecs = pdata->vref_delay_usecs ? : 100;
+	ts->vref_delay.value = pdata->vref_delay_usecs ? : 100;
+	ts->vref_delay.unit = SPI_DELAY_UNIT_USECS;
 	ts->x_plate_ohms = pdata->x_plate_ohms ? : 400;
 	ts->pressure_max = pdata->pressure_max ? : ~0;
 
-- 
2.17.1

