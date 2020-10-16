Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4D6290743
	for <lists+linux-input@lfdr.de>; Fri, 16 Oct 2020 16:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406507AbgJPOex (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Oct 2020 10:34:53 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:47896 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406402AbgJPOex (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Oct 2020 10:34:53 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09GEYeZp102455;
        Fri, 16 Oct 2020 14:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=/n57+e1VdtbtTbhnDHEyTLAdam04u1YUaGW6EAKirgg=;
 b=MNmd+VfCvB0YyAnbVAqA18LOfnk81ygM3f/HIyyqaQ6/lVRYiB4bxHnqPe3BC/oMbEMO
 zyiUnvMtLGS79TnOy0SW2VDd7hhvDbmuirxsK+SOhqWeEBMTrlEUD2FSGCibub2y5jfl
 E5mEAlQF2lMTU98z7oUueTW8cmUros8iI568H80AI3F8LINTrq97vfRk+88H1+/htpnb
 Qd9ED0978wv3QG/n2nW286xoTft2D9FzxXoBlTEM1kekw+OV9Njk1rZzNC/a+o0xTPkT
 Cw1Q+10dDvUZDw1+y0JOk0J/kEmRsNmD0Ql9Nn4YIe77U69M4RHugceRGFk4R6kbiO3b 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 346g8gq8ap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 16 Oct 2020 14:34:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09GEUh2I191755;
        Fri, 16 Oct 2020 14:32:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 343pw1ws6f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Oct 2020 14:32:47 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09GEWkgN031574;
        Fri, 16 Oct 2020 14:32:46 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 16 Oct 2020 07:32:46 -0700
Received: from localhost (disaster-area.hh.sledj.net [local])
        by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id dc10a74e;
        Fri, 16 Oct 2020 14:32:44 +0000 (UTC)
From:   David Edmondson <david.edmondson@oracle.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        David Edmondson <david.edmondson@oracle.com>
Subject: [PATCH] HID: multitouch: Re-enable trackpoint and buttons on Lenovo X1 Tab gen2
Date:   Fri, 16 Oct 2020 15:32:44 +0100
Message-Id: <20201016143244.1303262-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=1 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010160110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9775 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 suspectscore=1
 priorityscore=1501 phishscore=0 clxscore=1011 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010160111
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the FORCE_MULTI_INPUT class and quirk added in
commit 40d5bb87377a ("HID: multitouch: enable multi-input as a quirk
for some devices")
to enable event reporting from both the trackpad and the
trackpoint/buttons in the Lenovo X1 Tab gen2.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
It seems likely that some other devices should be treated similarly
(X1 Tab gen3, for example), but I don't have them available to test.

 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 74fc1df6e3c2..450ffb760aca 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -727,6 +727,7 @@
 #define USB_DEVICE_ID_LENOVO_TP10UBKBD	0x6062
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
+#define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e3152155c4b8..9e8251fc62b8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1965,6 +1965,12 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
 			USB_DEVICE_ID_ILITEK_MULTITOUCH) },
 
+	/* Lenovo X1 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LENOVO,
+			USB_DEVICE_ID_LENOVO_X1_TAB) },
+
 	/* LG Melfas panel */
 	{ .driver_data = MT_CLS_LG,
 		HID_USB_DEVICE(USB_VENDOR_ID_LG,
-- 
2.28.0

