Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85DB3072EE
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 10:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhA1Jjn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 04:39:43 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53866 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbhA1JhX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 04:37:23 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9Dtos014307;
        Thu, 28 Jan 2021 09:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=WRx+EhMl7xKvc+v5w6MdkWa9bXc8ZKph7wbHMg4EGF8=;
 b=DdCgBsrScWk6N89rc/60e2jbU6lUCQCk436GY59MeMzDdBI0UEezxOWYFcFn2mMiBwWb
 worFan0AMK60H9YxXHz/eQR1jpuiOBqLUZ/kgp1Pj+v3csPK5QhBmzhtPKxZxODoZjEb
 R8ORzQ1a1/jda+x2emcHXpr++lXh4YiUQI+Xm9mWY+zq1gI8rviCV8LbQ4inE4vwpnuj
 ngYigFXdMmNNzMsRwRvmaVWyr9xZ5etDJYndbGTNWFsnu/czxxVUFu7vbX8kpkFKW0Ij
 tEP6D5/rlTuYB1s49i13tRHJJ30Gmt0bS62XT/ybXFYwQWmPUS5RTsU6WNqgLQhBina7 /g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 368b7r36b6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:36:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9FBR2163195;
        Thu, 28 Jan 2021 09:36:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 368wcqetpg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:36:30 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10S9aSin028113;
        Thu, 28 Jan 2021 09:36:28 GMT
Received: from mwanda (/10.175.203.176)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 Jan 2021 01:36:27 -0800
Date:   Thu, 28 Jan 2021 12:36:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Florian Echtler <floe@butterbrot.org>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: sur40 - Fix an error code in sur40_probe()
Message-ID: <YBKFkbATXa5fA3xj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If v4l2_ctrl_handler_setup() fails then probe() should return an error
code instead of returning success.

Fixes: cee1e3e2ef39 ("media: add video control handlers using V4L2 control framework")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/touchscreen/sur40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 620cdd7d214a..12f2562b0141 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -787,6 +787,7 @@ static int sur40_probe(struct usb_interface *interface,
 		dev_err(&interface->dev,
 			"Unable to register video controls.");
 		v4l2_ctrl_handler_free(&sur40->hdl);
+		error = sur40->hdl.error;
 		goto err_unreg_v4l2;
 	}
 
-- 
2.29.2

