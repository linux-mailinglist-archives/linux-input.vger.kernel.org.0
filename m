Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF0717182C
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 14:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgB0NDz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 08:03:55 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:56146 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729025AbgB0NDz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 08:03:55 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01RD3ROT004946;
        Thu, 27 Feb 2020 08:03:49 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 2ydtrwk660-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Feb 2020 08:03:49 -0500
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 01RD3lqI051001
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Thu, 27 Feb 2020 08:03:48 -0500
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 27 Feb 2020 05:03:47 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Thu, 27 Feb 2020 05:03:46 -0800
Received: from analog.ad.analog.com ([10.48.65.180])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 01RD3i3N025198;
        Thu, 27 Feb 2020 08:03:44 -0500
From:   Sergiu Cuciurean <sergiu.cuciurean@analog.com>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>, <gregkh@linuxfoundation.org>,
        <kstewart@linuxfoundation.org>
CC:     <allison@lohutok.net>, <info@metux.net>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Subject: [PATCH] input: rmi4: rmi_spi: Use new structure for SPI transfer delays
Date:   Thu, 27 Feb 2020 15:03:36 +0200
Message-ID: <20200227130336.27042-1-sergiu.cuciurean@analog.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-27_03:2020-02-26,2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=865
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
 drivers/input/rmi4/rmi_spi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
index 27b68dc79b18..c82edda66b23 100644
--- a/drivers/input/rmi4/rmi_spi.c
+++ b/drivers/input/rmi4/rmi_spi.c
@@ -188,7 +188,8 @@ static int rmi_spi_xfer(struct rmi_spi_xport *rmi_spi,
 			memset(xfer, 0,	sizeof(struct spi_transfer));
 			xfer->tx_buf = &rmi_spi->tx_buf[i];
 			xfer->len = 1;
-			xfer->delay_usecs = spi_data->write_delay_us;
+			xfer->delay.value = spi_data->write_delay_us;
+			xfer->delay.unit = SPI_DELAY_UNIT_USECS;
 			spi_message_add_tail(xfer, &msg);
 		}
 	} else {
@@ -210,7 +211,8 @@ static int rmi_spi_xfer(struct rmi_spi_xport *rmi_spi,
 				memset(xfer, 0, sizeof(struct spi_transfer));
 				xfer->rx_buf = &rmi_spi->rx_buf[i];
 				xfer->len = 1;
-				xfer->delay_usecs = spi_data->read_delay_us;
+				xfer->delay.value = spi_data->read_delay_us;
+				xfer->delay.unit = SPI_DELAY_UNIT_USECS;
 				spi_message_add_tail(xfer, &msg);
 			}
 		} else {
-- 
2.17.1

