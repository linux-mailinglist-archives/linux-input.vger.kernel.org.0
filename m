Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B521B298762
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 08:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769467AbgJZH2j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 03:28:39 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44674 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1421714AbgJZH2i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 03:28:38 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q7OQDR013233;
        Mon, 26 Oct 2020 07:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=aXbZhbBvnAzOKd4dv84Kx2dqXks99Vlg3xAUfBDtjgs=;
 b=frwRqI4qCPAhr+8D7nESseLj61IsTlmN29KaXhsfum2Odj72pN63YwIRQQjOqaDgivKm
 2mq+kaeYjv/FEM8fIUZi6Zw0m/19xeI/0PXmSOJC43u6oxYlL8rE8usKdb5wg/fBKWvL
 qjNEYZsPKKvRW+J+CyEPeXNGmCWrqoROUtBl55LEaP/zhGNF2VfsxK2eikqf7mV1GWmv
 YmnSYj4ziGc59q14XrNawo+1wDKo5/E66Uf5hTBHRMgeUg4n2hhaN47oy9JGa4GmePNq
 K5xGpYcPYFcJNZacfKFomRi2D/ChUyuqsr5nwFsmvl5+ZzrNRpW9Yw/Izk0pzcd9XERd 5A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 34dgm3rusw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Oct 2020 07:28:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q7PEJY168648;
        Mon, 26 Oct 2020 07:28:33 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 34cx6uh8qk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Oct 2020 07:28:33 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09Q7SUwd029493;
        Mon, 26 Oct 2020 07:28:31 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 26 Oct 2020 00:28:30 -0700
Date:   Mon, 26 Oct 2020 10:28:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Hennerich <michael.hennerich@analog.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
Message-ID: <20201026072824.GA1620546@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260052
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The "revid" is used to store negative error codes so it should be an int
type.

Fixes: e27c729219ad ("Input: add driver for ADXL345/346 Digital Accelerometers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/misc/adxl34x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index 5fe92d4ba3f0..4cc4e8ff42b3 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -696,7 +696,7 @@ struct adxl34x *adxl34x_probe(struct device *dev, int irq,
 	struct input_dev *input_dev;
 	const struct adxl34x_platform_data *pdata;
 	int err, range, i;
-	unsigned char revid;
+	int revid;
 
 	if (!irq) {
 		dev_err(dev, "no IRQ?\n");
-- 
2.28.0

