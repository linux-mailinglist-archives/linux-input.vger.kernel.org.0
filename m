Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1422DBCC0
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 09:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgLPIfo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 03:35:44 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56290 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgLPIfo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 03:35:44 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8YLvm114524;
        Wed, 16 Dec 2020 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=D2jIV72U5ybE8KfG73AK4HVjUzxW4HQrX7XFCBxm8LI=;
 b=H6sFpfHzVBYs8GGKcPmnjGvK4UflUWKyaogSE8R/qOFpPDM6F1ItF67h8VEPCkEzy3js
 Gy+dz0uEasa7xQFo6Ik2Vnj1XitSkPf/vzLKcidcCdrFdsOYfgLpCQTO9xQOip64+qC6
 Bn17B0mIqgG+CKjJ8EZ/ejcoETL/ESZyBUcF4jScny+VIZnjqZAdY3lyYLU+9kgochFN
 dhDUDK5b7MdJ15y/cjpqQjCtTMzR5fy0hUc9iGLdL+OwJnlnQ9OillW8qox4hb0ZY7+B
 nfMfQWEp3AMEyK8O6wVZkToqaf+KJ+dPl7pLOZXGzUkPXEj79JsE/k2eVoAIb4koj++R jA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 35cn9reuxm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Dec 2020 08:35:00 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8VEmb067957;
        Wed, 16 Dec 2020 08:32:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 35d7ep847m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Dec 2020 08:32:59 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BG8Wwgk015228;
        Wed, 16 Dec 2020 08:32:58 GMT
Received: from mwanda (/10.175.200.55)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 16 Dec 2020 00:32:58 -0800
Date:   Wed, 16 Dec 2020 11:32:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Roy Im <roy.im.opensource@diasemi.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: da7280 - delete a stray tab
Message-ID: <X9nGNJjFi9AaBBwX@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012160054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160055
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This line is indented one tab too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/misc/da7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 37568b00873d..fe06693579ca 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -863,7 +863,7 @@ static void da7280_parse_properties(struct device *dev,
 		gpi_str3[7] = '0' + i;
 		haptics->gpi_ctl[i].polarity = 0;
 		error = device_property_read_string(dev, gpi_str3, &str);
-			haptics->gpi_ctl[i].polarity =
+		haptics->gpi_ctl[i].polarity =
 				da7280_haptic_of_gpi_pol_str(dev, str);
 	}
 
-- 
2.29.2

