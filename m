Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75052C4ADC
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730337AbgKYWkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbgKYWkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:40:04 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B433DC0617A7
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:40:04 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v21so114902plo.12
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb8oBkFPu2mgGTeBvZ9ACVTGC6gNBO164jtkkbc1yD4=;
        b=0UrkxP3EaV+t6F/tdHjrL89AFSQL/e8wf9XlZWUSYXwU3pLudEItbEJCIzW5Y8AX1c
         Yp6mx2Dkpe4FpPZBAaOiOQ1LIZs9RgP/VqLWsK8J4kPdvAxgMfxL9xkT5MuKOA9evKUF
         ZB+RdWnNd9G30AboqqjsrU1OQ9nHliPetzfhP2CR8jSYbrWeDtQYzBpUZgYyN7S6/iow
         yoHE4i+aNNdVnOZe+lG03ZxUtNTO5F5amDDepjPS+YshE8HqNETj2t3+uIiLC3MJAaof
         8IxhC1zwLgfnVizZ6JXESyiDvMz6SreZq7tVktoWRDzIc9sfo1dsMqw5wd+No/kGdiMo
         p8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nb8oBkFPu2mgGTeBvZ9ACVTGC6gNBO164jtkkbc1yD4=;
        b=BSfQ7U4oyXEGi+YD+Zkvn4Pe/ll8W9/v9QUsOjXauSPeagkvl+gSLvySZIBR824yGy
         ILBiPnwnhf/Lp9EThGsVvGpJEXwaAedch7ETvUyvQvngm296nQ37g04BJBjrUjDChCFA
         4/kGqEVz+Vc4/9BD8XCG0AEKOaWP1epn03GsgsT9wMpRTAhEVJQ9DH0So9dR+bkoiv0Z
         +6v8T7QN1eNDkb0l8hYQ1i4rkWeIpyb6RojOg48+ZXjBKZIwKQ/w2aikJH83xZHGTLSU
         4w3ccWonXRvdUpO64N/sWbToMBAYbEMntteROPGcoMYUMlD0pQNWPx5VPgFymqMOfK6H
         PaPQ==
X-Gm-Message-State: AOAM530NpZohIVokRrNbYsubxAtKnhUT7iAi51x205431DBL6wzQUfap
        ZMTRRJHnIW7crfd1gTyQhq22e6sqpAJKAi/h
X-Google-Smtp-Source: ABdhPJwLngOl1KoqOfkQCAXBINlePhtSY543aDPvFHxzq9PMQfw/iKFTQXfTm6gRI1dY6U0Muq7M1g==
X-Received: by 2002:a17:902:8305:b029:da:1339:89b with SMTP id bd5-20020a1709028305b02900da1339089bmr100902plb.43.1606344003888;
        Wed, 25 Nov 2020 14:40:03 -0800 (PST)
Received: from localhost.localdomain (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.googlemail.com with ESMTPSA id u6sm3822991pjn.56.2020.11.25.14.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 14:40:03 -0800 (PST)
From:   Dean Camera <dean@fourwalledcubicle.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Dean Camera <dean@fourwalledcubicle.com>
Subject: [V3, PATCH] Add additional hidraw input/output report ioctls.
Date:   Thu, 26 Nov 2020 09:39:57 +1100
Message-Id: <20201125223957.5921-1-dean@fourwalledcubicle.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently the hidraw module can only read and write feature HID
reports on demand, via dedicated ioctls. Input reports are read
from the device through the read() interface, while output reports
are written through the write interface().

This is insufficient; it is desirable in many situations to be
able to read and write input and output reports through the
control interface to cover additional scenarios:
  - Reading an input report by its report ID, to get initial state
  - Writing an input report, to set initial input state in the device
  - Reading an output report by its report ID, to obtain current state
  - Writing an output report by its report ID, out of band

This patch adds these missing ioctl requests to read and write
the remaining HID report types. Note that not all HID backends will
neccesarily support this (e.g. while the USB link layer supports
setting Input reports, others may not).

Also included are documentation and example updates. The current
hidraw documentation states that feature reports read from the
device does *not* include the report ID, however this is not the
case and the returned report will have its report ID prepended
by conforming HID devices, as the report data sent from the device
over the control endpoint must be indentical in format to those
sent over the regular transport.

Signed-off-by: Dean Camera <dean@fourwalledcubicle.com>
---
 Documentation/hid/hidraw.rst | 45 ++++++++++++++++++++++++++++++++++--
 drivers/hid/hidraw.c         | 24 ++++++++++++++++++-
 include/uapi/linux/hidraw.h  |  6 +++++
 samples/hidraw/hid-example.c |  2 +-
 4 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/Documentation/hid/hidraw.rst b/Documentation/hid/hidraw.rst
index 4a4a0ba1f362..f41c1f0f6252 100644
--- a/Documentation/hid/hidraw.rst
+++ b/Documentation/hid/hidraw.rst
@@ -123,8 +123,49 @@ HIDIOCGFEATURE(len):
 This ioctl will request a feature report from the device using the control
 endpoint.  The first byte of the supplied buffer should be set to the report
 number of the requested report.  For devices which do not use numbered
-reports, set the first byte to 0.  The report will be returned starting at
-the first byte of the buffer (ie: the report number is not returned).
+reports, set the first byte to 0.  The returned report buffer will contain the
+report number in the first byte, followed by the report data read from the
+device.  For devices which do not use numbered reports, the report data will
+begin at the first byte of the returned buffer.
+
+HIDIOCSINPUT(len):
+	Send an Input Report
+
+This ioctl will send an input report to the device, using the control endpoint.
+In most cases, setting an input HID report on a device is meaningless and has
+no effect, but some devices may choose to use this to set or reset an initial
+state of a report.  The format of the buffer issued with this report is identical
+to that of HIDIOCSFEATURE.
+
+HIDIOCGINPUT(len):
+	Get an Input Report
+
+This ioctl will request an input report from the device using the control
+endpoint.  This is slower on most devices where a dedicated In endpoint exists
+for regular input reports, but allows the host to request the value of a
+specific report number.  Typically, this is used to request the initial states of
+an input report of a device, before an application listens for normal reports via
+the regular device read() interface.  The format of the buffer issued with this report
+is identical to that of HIDIOCGFEATURE.
+
+HIDIOCSOUTPUT(len):
+	Send an Output Report
+
+This ioctl will send an output report to the device, using the control endpoint.
+This is slower on most devices where a dedicated Out endpoint exists for regular
+output reports, but is added for completeness.  Typically, this is used to set
+the initial states of an output report of a device, before an application sends
+updates via the regular device write() interface. The format of the buffer issued
+with this report is identical to that of HIDIOCSFEATURE.
+
+HIDIOCGOUTPUT(len):
+	Get an Output Report
+
+This ioctl will request an output report from the device using the control
+endpoint.  Typically, this is used to retrive the initial state of
+an output report of a device, before an application updates it as necessary either
+via a HIDIOCSOUTPUT request, or the regular device write() interface.  The format
+of the buffer issued with this report is identical to that of HIDIOCGFEATURE.
 
 Example
 -------
diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 2eee5e31c2b7..79faac87a06f 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -170,7 +170,7 @@ static ssize_t hidraw_write(struct file *file, const char __user *buffer, size_t
 /*
  * This function performs a Get_Report transfer over the control endpoint
  * per section 7.2.1 of the HID specification, version 1.1.  The first byte
- * of buffer is the report number to request, or 0x0 if the defice does not
+ * of buffer is the report number to request, or 0x0 if the device does not
  * use numbered reports. The report_type parameter can be HID_FEATURE_REPORT
  * or HID_INPUT_REPORT.
  */
@@ -428,6 +428,28 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 					break;
 				}
 
+				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSINPUT(0))) {
+					int len = _IOC_SIZE(cmd);
+					ret = hidraw_send_report(file, user_arg, len, HID_INPUT_REPORT);
+					break;
+				}
+				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGINPUT(0))) {
+					int len = _IOC_SIZE(cmd);
+					ret = hidraw_get_report(file, user_arg, len, HID_INPUT_REPORT);
+					break;
+				}
+
+				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCSOUTPUT(0))) {
+					int len = _IOC_SIZE(cmd);
+					ret = hidraw_send_report(file, user_arg, len, HID_OUTPUT_REPORT);
+					break;
+				}
+				if (_IOC_NR(cmd) == _IOC_NR(HIDIOCGOUTPUT(0))) {
+					int len = _IOC_SIZE(cmd);
+					ret = hidraw_get_report(file, user_arg, len, HID_OUTPUT_REPORT);
+					break;
+				}
+
 				/* Begin Read-only ioctls. */
 				if (_IOC_DIR(cmd) != _IOC_READ) {
 					ret = -EINVAL;
diff --git a/include/uapi/linux/hidraw.h b/include/uapi/linux/hidraw.h
index 4913539e5bcc..33ebad81720a 100644
--- a/include/uapi/linux/hidraw.h
+++ b/include/uapi/linux/hidraw.h
@@ -40,6 +40,12 @@ struct hidraw_devinfo {
 #define HIDIOCSFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x06, len)
 #define HIDIOCGFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x07, len)
 #define HIDIOCGRAWUNIQ(len)     _IOC(_IOC_READ, 'H', 0x08, len)
+/* The first byte of SINPUT and GINPUT is the report number */
+#define HIDIOCSINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x09, len)
+#define HIDIOCGINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0A, len)
+/* The first byte of SOUTPUT and GOUTPUT is the report number */
+#define HIDIOCSOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0B, len)
+#define HIDIOCGOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0C, len)
 
 #define HIDRAW_FIRST_MINOR 0
 #define HIDRAW_MAX_DEVICES 64
diff --git a/samples/hidraw/hid-example.c b/samples/hidraw/hid-example.c
index 37a0ffcb4d63..0f73ace3c6c3 100644
--- a/samples/hidraw/hid-example.c
+++ b/samples/hidraw/hid-example.c
@@ -128,7 +128,7 @@ int main(int argc, char **argv)
 		perror("HIDIOCGFEATURE");
 	} else {
 		printf("ioctl HIDIOCGFEATURE returned: %d\n", res);
-		printf("Report data (not containing the report number):\n\t");
+		printf("Report data:\n\t");
 		for (i = 0; i < res; i++)
 			printf("%hhx ", buf[i]);
 		puts("\n");
-- 
2.25.1

