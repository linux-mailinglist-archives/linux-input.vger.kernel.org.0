Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D0624F65E
	for <lists+linux-input@lfdr.de>; Mon, 24 Aug 2020 10:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730408AbgHXI7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Aug 2020 04:59:05 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51148 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730725AbgHXI56 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Aug 2020 04:57:58 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07O8tULY092460;
        Mon, 24 Aug 2020 08:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=X3DAykUVn3cBni5mmT6BElwNQ4x1lMO6Npp2yRLlpV4=;
 b=LDc1UPXac3uJKxCNI8StZLNxGMHxFSUOGoKukFVF71GDJT61yrVIGUAom6DFOmn+HYgp
 ueKRys103jantFgV0cqvy6HnGhg3JNcCKi/tfzoV4l5xz+70UaAm5Iz5oAU/QrWjvUfg
 GO3RSBEa5ZcEUI/yZ6maL/NZ7h1W8waFa+g0ECgFpeBFOKdmFOTzVUq5TTiRva635t35
 TKnDGAe98eCdqIIFfEVIenj6qIIBrdNufBUNIG2tn2HOoz68DEBVa+8sSexQcjNvkJAd
 89LZV6AQ1WnfAtuPQsndeN4ThIoU/uVQBChkQF2q8Yfn1M71k5sLAjap+2J/jRyjn60z AQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 333w6thvmt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Aug 2020 08:57:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07O8pDRa107785;
        Mon, 24 Aug 2020 08:57:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 333r9gwkg1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Aug 2020 08:57:43 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07O8vgt2005803;
        Mon, 24 Aug 2020 08:57:42 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 24 Aug 2020 01:57:42 -0700
Date:   Mon, 24 Aug 2020 11:57:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stefan Achatz <erazor_de@users.sourceforge.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] HID: roccat: add bounds checking in
 kone_sysfs_write_settings()
Message-ID: <20200824085735.GA208317@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597819984.4101.16.camel@web.de>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9722 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008240067
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This code doesn't check if "settings->startup_profile" is within bounds
and that could result in an out of bounds array access.  What the code
does do is it checks if the settings can be written to the firmware, so
it's possible that the firmware has a bounds check?  It's safer and
easier to verify when the bounds checking is done in the kernel.

Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  In the v1 patch I added a check against settings->size but that's
potentially too strict so it was removed.

 drivers/hid/hid-roccat-kone.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 2ff4c8e366ff..1ca64481145e 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -294,31 +294,40 @@ static ssize_t kone_sysfs_write_settings(struct file *fp, struct kobject *kobj,
 	struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
 	int retval = 0, difference, old_profile;
+	struct kone_settings *settings = (struct kone_settings *)buf;
 
 	/* I need to get my data in one piece */
 	if (off != 0 || count != sizeof(struct kone_settings))
 		return -EINVAL;
 
 	mutex_lock(&kone->kone_lock);
-	difference = memcmp(buf, &kone->settings, sizeof(struct kone_settings));
+	difference = memcmp(settings, &kone->settings,
+			    sizeof(struct kone_settings));
 	if (difference) {
-		retval = kone_set_settings(usb_dev,
-				(struct kone_settings const *)buf);
-		if (retval) {
-			mutex_unlock(&kone->kone_lock);
-			return retval;
+		if (settings->startup_profile < 1 ||
+		    settings->startup_profile > 5) {
+			retval = -EINVAL;
+			goto unlock;
 		}
 
+		retval = kone_set_settings(usb_dev, settings);
+		if (retval)
+			goto unlock;
+
 		old_profile = kone->settings.startup_profile;
-		memcpy(&kone->settings, buf, sizeof(struct kone_settings));
+		memcpy(&kone->settings, settings, sizeof(struct kone_settings));
 
 		kone_profile_activated(kone, kone->settings.startup_profile);
 
 		if (kone->settings.startup_profile != old_profile)
 			kone_profile_report(kone, kone->settings.startup_profile);
 	}
+unlock:
 	mutex_unlock(&kone->kone_lock);
 
+	if (retval)
+		return retval;
+
 	return sizeof(struct kone_settings);
 }
 static BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
-- 
2.28.0

