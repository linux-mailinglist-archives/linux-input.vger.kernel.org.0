Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D2225E791
	for <lists+linux-input@lfdr.de>; Sat,  5 Sep 2020 14:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgIEMuD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Sep 2020 08:50:03 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36782 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEMuC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Sep 2020 08:50:02 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 085CinPR029792;
        Sat, 5 Sep 2020 12:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=J//7oqhzlnDBqx5sX7/wIJk0ZSYIJqBRX3XGHsdreb4=;
 b=bmG8Npcp4snf6tZC1txDc7GaID4uvLK6WdjTJBRuebb0KA7hP7raw+M5li9bBSaxDtnE
 FisYBQ6hxZ3scAWoI+DZdvwO9YrbkXB/Ti9hQYXkoGBoODKeq3wN5Rl7z3F7qq4/aMWJ
 8UphnTAq/kgsqJkQC2BgFfPgN3fFjyA+vVuioFCpu5X3Y22h9qD2Gg3VodMvO2sRe5rr
 usB+0OKXIVBDsSHnrDkg+m17PmUqozpVkDhwjt+B1WiW6iUSTGVR0PahnWJIVdtCfIpX
 Ox43t12fyfAU8HlkxzQPhZVbolWsEsy4sgCqHFjU4cUbsWIiZG7UeSMtp/W0SRqE58XT 3A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33c2mkh57q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 05 Sep 2020 12:49:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 085CjNRf167809;
        Sat, 5 Sep 2020 12:49:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 33c0q919kb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Sep 2020 12:49:50 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 085CnnQo000918;
        Sat, 5 Sep 2020 12:49:49 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 05 Sep 2020 05:49:48 -0700
Date:   Sat, 5 Sep 2020 15:49:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: imx6ul_tsc - clean up some errors in
 imx6ul_tsc_resume()
Message-ID: <20200905124942.GC183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9734 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009050122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9734 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009050122
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If imx6ul_tsc_init() fails then we need to clean up the clocks.

I reversed the "if (input_dev->users) {" condition to make the code a
bit simpler.

Fixes: 6cc527b05847 ("Input: imx6ul_tsc - propagate the errors")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/touchscreen/imx6ul_tsc.c | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 9ed258854349..5e6ba5c4eca2 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -530,20 +530,25 @@ static int __maybe_unused imx6ul_tsc_resume(struct device *dev)
 
 	mutex_lock(&input_dev->mutex);
 
-	if (input_dev->users) {
-		retval = clk_prepare_enable(tsc->adc_clk);
-		if (retval)
-			goto out;
-
-		retval = clk_prepare_enable(tsc->tsc_clk);
-		if (retval) {
-			clk_disable_unprepare(tsc->adc_clk);
-			goto out;
-		}
+	if (!input_dev->users)
+		goto out;
 
-		retval = imx6ul_tsc_init(tsc);
+	retval = clk_prepare_enable(tsc->adc_clk);
+	if (retval)
+		goto out;
+
+	retval = clk_prepare_enable(tsc->tsc_clk);
+	if (retval) {
+		clk_disable_unprepare(tsc->adc_clk);
+		goto out;
 	}
 
+	retval = imx6ul_tsc_init(tsc);
+	if (retval) {
+		clk_disable_unprepare(tsc->tsc_clk);
+		clk_disable_unprepare(tsc->adc_clk);
+		goto out;
+	}
 out:
 	mutex_unlock(&input_dev->mutex);
 	return retval;
-- 
2.28.0

