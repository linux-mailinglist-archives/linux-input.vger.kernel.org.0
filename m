Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636EC17738D
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 11:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgCCKLz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 05:11:55 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:35278 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgCCKLz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 05:11:55 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023ABhL8160075;
        Tue, 3 Mar 2020 10:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=I7lQUOIBl7w23iq71Y854jGz1gvnq8xxPdpo02mIV4o=;
 b=Bp/x1W24h0306Cs9S9LPLIq2/CBQzgNWI9QFVJE5R0l4ygrnp4hmuUCHonvnYka3sqp4
 PNh0V2si6IehwWcBqRl0T9CbDlYmWYmFwoaYJmR/1q7py7/HkqS5BDPG7Or23+UpEztD
 eu16owp7izA39Yk+E7TEj4lJoJBV8HVYiHMc52FlmtLKgWX+MS5XmqrSia6z/z4bHz46
 3jfQlNcNUTYSheevZjV+QnDKQbbwNl/zLNXi0EHYMUS08XtOd9zicF62HprlyDlieaXz
 4mn4cNcUXX5BSL9oerSL7nFUp6S6sAD7/1y0uGfuY4F9LWl+gcJ6VrECEYLEJxmJOV2t 1g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2yghn31vs1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 10:11:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023A2SCW151356;
        Tue, 3 Mar 2020 10:11:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2yg1p41dp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 10:11:49 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023ABmIt016225;
        Tue, 3 Mar 2020 10:11:48 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Mar 2020 02:11:47 -0800
Date:   Tue, 3 Mar 2020 13:11:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Herrmann <dh.herrmann@googlemail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: clean up wiimote_cmd_map_mp() return type
Message-ID: <20200303101140.gmx5u4limxsfvard@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=859 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=912 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030076
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

No one checks the error code, but the static checkers complain:

    drivers/hid/hid-wiimote-core.c:506 wiimote_cmd_map_mp()
    warn: signedness bug returning '(-512)'

We're returning negative error codes or zero on success so the type
should be int.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/hid-wiimote-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..eaa2fa565047 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -484,7 +484,7 @@ static int wiimote_cmd_init_mp(struct wiimote_data *wdata)
 }
 
 /* requires the cmd-mutex to be held */
-static bool wiimote_cmd_map_mp(struct wiimote_data *wdata, __u8 exttype)
+static int wiimote_cmd_map_mp(struct wiimote_data *wdata, __u8 exttype)
 {
 	__u8 wmem;
 
-- 
2.11.0

