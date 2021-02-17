Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7677631D54A
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 07:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhBQGLV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 01:11:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56058 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhBQGLU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 01:11:20 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H5xF8o156818;
        Wed, 17 Feb 2021 06:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=vgy0GNxkRxaEgv8Y0pHIpFvkBEdF/BICto+PmglPrSc=;
 b=Pqh1D/IyWPxBbWai+bAiBuVdljY7N3vMu66cdXv3SAz8HMwNh90zy3gMJUVqFzsvz9ON
 +rstLgV9yPks7clsrBW3IQKlJjGaUMJvOGSNNTbnsJrk9YL1maGxFLklJYMbtGOJemjF
 MIEs3+6xEFHW0IeXndzpj1qBWMoxndOCT2JFB6BSe2lMnvkZjhcqr5ql+vWBtya5Bk2J
 8DW2gx/I7rAn/tA0Y7Xy45CNDf6TbyaEIrlm38sA0WS8DaQDwDYg4gbftHCtu3/qoSrk
 hHhwCvju6ciKhYTsoW+ZEhGNl0D1ibZJ3Tbbl1TLmosVWYUQDQ3AwlyjgAZ7/NOQKHiU EQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 36p66r15xq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 06:10:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11H60CxE177068;
        Wed, 17 Feb 2021 06:10:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 36prnyuc6n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 06:10:27 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11H6AOrV018381;
        Wed, 17 Feb 2021 06:10:24 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Feb 2021 22:10:23 -0800
Date:   Wed, 17 Feb 2021 09:10:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stephen Kitt <steve@sk2.org>
Cc:     linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: joydev - prevent potential read overflow in ioctl
Message-ID: <YCyzR8WvFRw4HWw6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170046
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9897 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170046
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The problem here is that "len" might be less than "joydev->nabs" so the
loops which verfy abspam[i] and keypam[] might read beyond the buffer.

Fixes: 999b874f4aa3 ("Input: joydev - validate axis/button maps before clobbering current ones")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/joydev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
index a2b5fbba2d3b..750f4513fe20 100644
--- a/drivers/input/joydev.c
+++ b/drivers/input/joydev.c
@@ -456,7 +456,7 @@ static int joydev_handle_JSIOCSAXMAP(struct joydev *joydev,
 	if (IS_ERR(abspam))
 		return PTR_ERR(abspam);
 
-	for (i = 0; i < joydev->nabs; i++) {
+	for (i = 0; i < len && i < joydev->nabs; i++) {
 		if (abspam[i] > ABS_MAX) {
 			retval = -EINVAL;
 			goto out;
@@ -487,7 +487,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct joydev *joydev,
 	if (IS_ERR(keypam))
 		return PTR_ERR(keypam);
 
-	for (i = 0; i < joydev->nkey; i++) {
+	for (i = 0; i < (len / 2) && i < joydev->nkey; i++) {
 		if (keypam[i] > KEY_MAX || keypam[i] < BTN_MISC) {
 			retval = -EINVAL;
 			goto out;
-- 
2.30.0

