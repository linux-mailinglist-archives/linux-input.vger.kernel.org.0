Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC5E1717BC
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 13:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgB0Mp4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 07:45:56 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:54986 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728964AbgB0Mpz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 07:45:55 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01RChLTh030151;
        Thu, 27 Feb 2020 07:45:50 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ydtrwk4ga-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Feb 2020 07:45:50 -0500
Received: from m0167089.ppops.net (m0167089.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01RCjosb031849;
        Thu, 27 Feb 2020 07:45:50 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ydtrwk4g4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Feb 2020 07:45:50 -0500
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 01RCjm49048102
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 27 Feb 2020 07:45:48 -0500
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Thu, 27 Feb
 2020 04:45:47 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 27 Feb 2020 04:45:46 -0800
Received: from analog.ad.analog.com ([10.48.65.180])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 01RCjd88032054;
        Thu, 27 Feb 2020 07:45:40 -0500
From:   Sergiu Cuciurean <sergiu.cuciurean@analog.com>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>, <nikolas@gnu.org>,
        <gregkh@linuxfoundation.org>
CC:     <ronald@innovation.ch>, <andriy.shevchenko@linux.intel.com>,
        <maowenan@huawei.com>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Subject: [PATCH] input: keyboard: applespi: Use new structure for SPI transfer delays
Date:   Thu, 27 Feb 2020 14:45:34 +0200
Message-ID: <20200227124534.23399-1-sergiu.cuciurean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-27_03:2020-02-26,2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002270102
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
 drivers/input/keyboard/applespi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index d38398526965..d6a847e5f7e4 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -545,7 +545,8 @@ static void applespi_setup_read_txfrs(struct applespi_data *applespi)
 	memset(dl_t, 0, sizeof(*dl_t));
 	memset(rd_t, 0, sizeof(*rd_t));
 
-	dl_t->delay_usecs = applespi->spi_settings.spi_cs_delay;
+	dl_t->delay.value = applespi->spi_settings.spi_cs_delay;
+	dl_t->delay.unit = SPI_DELAY_UNIT_USECS;
 
 	rd_t->rx_buf = applespi->rx_buffer;
 	rd_t->len = APPLESPI_PACKET_SIZE;
@@ -574,14 +575,17 @@ static void applespi_setup_write_txfrs(struct applespi_data *applespi)
 	 * end up with an extra unnecessary (but harmless) cs assertion and
 	 * deassertion.
 	 */
-	wt_t->delay_usecs = SPI_RW_CHG_DELAY_US;
+	wt_t->delay.value = SPI_RW_CHG_DELAY_US;
+	wt_t->delay.unit = SPI_DELAY_UNIT_USECS;
 	wt_t->cs_change = 1;
 
-	dl_t->delay_usecs = applespi->spi_settings.spi_cs_delay;
+	dl_t->delay.value = applespi->spi_settings.spi_cs_delay;
+	dl_t->delay.unit = SPI_DELAY_UNIT_USECS;
 
 	wr_t->tx_buf = applespi->tx_buffer;
 	wr_t->len = APPLESPI_PACKET_SIZE;
-	wr_t->delay_usecs = SPI_RW_CHG_DELAY_US;
+	wr_t->delay.value = SPI_RW_CHG_DELAY_US;
+	wr_t->delay.unit = SPI_DELAY_UNIT_USECS;
 
 	st_t->rx_buf = applespi->tx_status;
 	st_t->len = APPLESPI_STATUS_SIZE;
-- 
2.17.1

