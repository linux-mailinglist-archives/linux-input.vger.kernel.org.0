Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305A013CB59
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 18:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgAORs4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jan 2020 12:48:56 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:49894 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729012AbgAORsz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jan 2020 12:48:55 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHmKXS053853;
        Wed, 15 Jan 2020 17:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=YbWh9/KT2LGMmOyRVkj1TC9eOP8jW/x+M/Q9ZVfRcSs=;
 b=it64FJ854+XG7LbFSU0DKjYvxWgHHeDmSUJBpOyRfNgPJ4pf7crNKOjcBek0ht/izJWK
 HcCw0TN5WcPt6RqlG2GFiMiUk/OdoNwh7gqaHw2fFE1SNjTR77jrEdShDtDW6Q3KOEmM
 UCweRx/LN7But1MoV+eCZdPw78SMmotzz8+sCgeaRMzNPFk+BxP69xn3z5tH2AqTnm5V
 2soYlORAmIWnwMpgMBbpfh/qnEOQf5oEgyw89k05Vg23EeyLocN4hbgeCEZIQlO1fbIN
 fSODo/tD9JmjWEPmwniL7LJamcHIkjipq2R9U9cYXx3/Gh94zgqWe5PbNn1YaxJNeBtb KA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2xf73twkr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 17:48:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHd2Oh019577;
        Wed, 15 Jan 2020 17:46:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xhy21t33w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 17:46:39 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00FHkbhc016060;
        Wed, 15 Jan 2020 17:46:37 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 Jan 2020 09:46:37 -0800
Date:   Wed, 15 Jan 2020 20:46:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: hiddev: Fix race in in hiddev_disconnect()
Message-ID: <20200115174628.zxpxbpa6bwspjajg@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001141100290.1593-100000@iolanthe.rowland.org>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=978
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1034
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150136
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Syzbot reports that "hiddev" is used after it's free in hiddev_disconnect().
The hiddev_disconnect() function sets "hiddev->exist = 0;" so
hiddev_release() can free it as soon as we drop the "existancelock"
lock.  This patch moves the mutex_unlock(&hiddev->existancelock) until
after we have finished using it.

Reported-by: syzbot+784ccb935f9900cc7c9e@syzkaller.appspotmail.com
Fixes: 7f77897ef2b6 ("HID: hiddev: fix potential use-after-free")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/usbhid/hiddev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index a970b809d778..4140dea693e9 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -932,9 +932,9 @@ void hiddev_disconnect(struct hid_device *hid)
 	hiddev->exist = 0;
 
 	if (hiddev->open) {
-		mutex_unlock(&hiddev->existancelock);
 		hid_hw_close(hiddev->hid);
 		wake_up_interruptible(&hiddev->wait);
+		mutex_unlock(&hiddev->existancelock);
 	} else {
 		mutex_unlock(&hiddev->existancelock);
 		kfree(hiddev);
-- 
2.11.0

