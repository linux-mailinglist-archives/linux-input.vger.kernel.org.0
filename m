Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658182C4ACC
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387450AbgKYWZP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729679AbgKYWZP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:25:15 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEACC0617A7
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:25:15 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id j19so3660816pgg.5
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B1GdS1gE00j/GezkjpfmvahGYfAV1n+eAx+UhJCalak=;
        b=lL2Z4A2BLMAlBED8STAM8FM7KjQf962q7Lfkotzwnolx1E4BE7fHdNNZzjKS166e9e
         wwxPTMYBY4+wvwyTHiVH6aN4L31V/57o/AFRe+QuoRRKk82vQCyFGAQOIGaZs74MonN/
         xUVq/xoDZpY8qlpYNz1fyMfzCtMvYJyZcUEkVqvWddrR7OflUmlEeLUY2zvM6RQ0XO0s
         c8BVKTHXlbZlaeLUpAKFJmwCK3Y6btwHMwLFJXY3BdVQ1F1ZjqrweMXFdGME9qLDLHcQ
         P513Pd1WABUC1f2Jl6sSPzGYhQKN/kb3JifKNAfLVqr7eJ9Xg/2jX7CcpzOPTcK8+XOV
         7ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B1GdS1gE00j/GezkjpfmvahGYfAV1n+eAx+UhJCalak=;
        b=cm1qQ42eqektkJQ/zn3m09+3/4SUz/glF4dEypX5fvgO15tB9cVC2a+Up7/ozePmNM
         BcXucMpp5H9dhEBeo6YxPF+5VhqJiLC4rau/tH7DgULOqJdIh+VURTnBPZufC+2pElwH
         KJN1fUFb+RZD/VVYT7cvogAyIt/SlpplIfkosg9SrH2ZiO6klqCNxdP+zfw/9uXttOjw
         Ql4Jqg3UEfH+LphsAu3usGx8ygX7eMCH+1zMTrWIhh0Zy+HCZmtnQKdFOpzJ+YlVXfya
         KcGPmXdp4M3QHeIecrXhIkZ0mhL0zug96D79j6yJFQK3kGU3xEXUFWjg/ELJ9MMORsn2
         5xKg==
X-Gm-Message-State: AOAM5333kMPoQs+UuXTp0VaVo6TUDPyt3v43fmNVMrodeEkTH1y1ikec
        hVF3eJeP7ctiABMAasa824/f/GZH3tCWjSBl
X-Google-Smtp-Source: ABdhPJwnSnLPfWAgsuCsbfq1Yd0jsr+SNTljcTT0VyhX4oTxem9E9LQ5lr3JxMqV3B2I3EBwWCgoQg==
X-Received: by 2002:a63:906:: with SMTP id 6mr7950pgj.445.1606343114669;
        Wed, 25 Nov 2020 14:25:14 -0800 (PST)
Received: from localhost.localdomain (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.googlemail.com with ESMTPSA id 17sm2955879pfu.180.2020.11.25.14.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 14:25:14 -0800 (PST)
From:   Dean Camera <dean@fourwalledcubicle.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     Dean Camera <dean@fourwalledcubicle.com>
Subject: [V2 PATCH] Add additional HIDRAW ioctl() handling for setting and getting input/output reports. Update documentation.
Date:   Thu, 26 Nov 2020 09:24:54 +1100
Message-Id: <20201125222454.4812-1-dean@fourwalledcubicle.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

