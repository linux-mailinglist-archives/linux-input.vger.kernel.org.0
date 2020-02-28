Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18AB117358A
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 11:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgB1KpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Feb 2020 05:45:18 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:55090 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726063AbgB1KpR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Feb 2020 05:45:17 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01SAjGF2012430;
        Fri, 28 Feb 2020 05:45:16 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2yepv0srw8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Feb 2020 05:45:16 -0500
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 01SAjFVm045684
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Fri, 28 Feb 2020 05:45:15 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 28 Feb
 2020 05:45:14 -0500
Received: from zeus.spd.analog.com (10.64.82.11) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 28 Feb 2020 05:45:14 -0500
Received: from analog.ad.analog.com ([10.48.65.180])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 01SAjB7x020958;
        Fri, 28 Feb 2020 05:45:11 -0500
From:   Sergiu Cuciurean <sergiu.cuciurean@analog.com>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>, <michael.hennerich@analog.com>
CC:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Subject: [PATCH v2] input: touchscreen: ad7877: Use new structure for SPI transfer delays
Date:   Fri, 28 Feb 2020 12:45:08 +0200
Message-ID: <20200228104508.15564-1-sergiu.cuciurean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227130619.28142-1-sergiu.cuciurean@analog.com>
References: <20200227130619.28142-1-sergiu.cuciurean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-28_03:2020-02-26,2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002280090
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

Changelog v1->v2:
*Restore initial name of wrongfully modfied struct member

 drivers/input/touchscreen/ad7877.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ad7877.c b/drivers/input/touchscreen/ad7877.c
index 9b652f61837f..08f5372f0bfd 100644
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
-- 
2.17.1

