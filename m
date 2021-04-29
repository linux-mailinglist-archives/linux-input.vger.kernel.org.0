Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41F936EFBF
	for <lists+linux-input@lfdr.de>; Thu, 29 Apr 2021 20:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbhD2Sv6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 14:51:58 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:49816 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241434AbhD2Svx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 14:51:53 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TIohum016066;
        Thu, 29 Apr 2021 18:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=6WL3UehjKjLvokjQ71PRkHVn0xAi2FYu3gjgUD+xzsw=;
 b=yOb4L89nACWZsbgVaPXoyWC8gAhcNX/X0eCTtVp8S+wjNFE8/6SGWDhUoQHJRYJ+6lOz
 qebyy7w/rS70YJsXSXkrk6+KRI/rAetP109XxQpj3DIzOKmJUq2ytr0OFNGNHpMaNUdh
 IvgHnNhigv3WNlAAI9uH6ETrRQ9ZHHVj6j3jxkzl7LwNKJ7izsFBJDPrldta2jWDVA8y
 SLmfGAlVrT484IR0pdKOxePls39F+y+DMiYjMLCHfJT9J7YY4WJnbDzRdoUsKfj2rEC5
 cOrYTU/aozISb3pn3CzM3EP9fO8KdNG/GrA36WxU7A8znBQRJAeCiTFf4kVnp9y6HcGh 0g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 385aft5e8a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 18:51:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TIktLi022195;
        Thu, 29 Apr 2021 18:51:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 3848f1grqv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 18:51:02 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13TIp2ir041420;
        Thu, 29 Apr 2021 18:51:02 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.147.25.63])
        by userp3030.oracle.com with ESMTP id 3848f1grqc-1;
        Thu, 29 Apr 2021 18:51:02 +0000
From:   Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Cc:     saeed.mirzamohammadi@oracle.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH  1/1] HID: quirks: Add quirk for Lenovo optical mouse
Date:   Thu, 29 Apr 2021 11:50:39 -0700
Message-Id: <20210429185040.46249-1-saeed.mirzamohammadi@oracle.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cwHqY566YxCjjfXVwr3HCcFMPJeMcS3A
X-Proofpoint-ORIG-GUID: cwHqY566YxCjjfXVwr3HCcFMPJeMcS3A
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9969 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290119
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Lenovo optical mouse with vendor id of 0x17ef and product id of
0x600e experiences disconnecting issues every 55 seconds:

[38565.706242] usb 1-1.4: Product: Lenovo Optical Mouse
[38565.728603] input: Lenovo Optical Mouse as /devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4/1-1.4:1.0/0003:17EF:600E.029A/input/input665
[38565.755949] hid-generic 0003:17EF:600E.029A: input,hidraw1: USB HID v1.11 Mouse [Lenovo Optical Mouse] on usb-0000:01:00.0-1.4/input0
[38619.360692] usb 1-1.4: USB disconnect, device number 48
[38620.864990] usb 1-1.4: new low-speed USB device number 49 using xhci_hcd
[38620.984011] usb 1-1.4: New USB device found, idVendor=17ef,idProduct=600e, bcdDevice= 1.00
[38620.998117] usb 1-1.4: New USB device strings: Mfr=0, Product=2,SerialNumber=0

This adds HID_QUIRK_ALWAYS_POLL for this device in order to work properly.

Reference:
https://github.com/sriemer/fix-linux-mouse

Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d004f5645b30..98a8c2e9cf03 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -740,6 +740,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
+#define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E	0x600e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E	0x602e
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index f35d919c4eba..680406305a7c 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_M912), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E), HID_QUIRK_ALWAYS_POLL },
-- 
2.27.0

