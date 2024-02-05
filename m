Return-Path: <linux-input+bounces-1673-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5884A10E
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 18:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB16F1F22F9D
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 17:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AB544C9C;
	Mon,  5 Feb 2024 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="V8lTk763"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B114744C6F;
	Mon,  5 Feb 2024 17:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707154765; cv=none; b=B5w2hXgZYY7R/avCFe+Yd45ChpEXXTL5YdCOCuZ2XC/XgAe+I+vAJOS1o2xAjRSaHMU46uIr+GJ6Vn6gFgAvDhEUfFAVuMRNnKV+ZXiOH7kjXkOsj31RVwJaJ0hBB2yvWR7EgWMh9VXTuZngzpDlsEXQZXO0lH40GQtaM5JKDmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707154765; c=relaxed/simple;
	bh=9hnHJza8r17vlHiz+/+rfMi1Okx1FH3zmz1ePcy2oMI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JEgFi1ZhgOcM1d5wxgbd2Vc4zyqzlQknZHeHZm0T5HGHXpDwa5po9wTzgE83zWVo9UG/OYxAsI0kuTE8cNEAPmujD8PfQdotT3qDz1AjjTYYBu8XO/ID9DspqwgwUOmeuM3tG3r9g9MyprSBgnwVpiMiLCWHR+UaEoYv3/71BNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=V8lTk763; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415942dC006589;
	Mon, 5 Feb 2024 11:10:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=pps1;
	 bh=XE1cfQFn2B6AQ3LZuS/xKlC2tETv/cyVV6jAnXHLFH0=; b=V8lTk763xwzo
	xLiRZMbwjqZKBrZMGb9gliJNHV0cfaharlpIKdmrUYw234VTz7QhQHVeX14LKEel
	df2QT8DdOsdlEtb3oHEjp4eLGAd2sZfRZP440iaJAQ8LESLnwxuRuBXYckZpuH/f
	DETqoxkg9lxfJDy4EFU8QhP0BvNXBz3ZhP8umzLhdDH3mcy54SbymyAr+k+broeh
	Iqg1DqHyzSv8AhCvZ16EUQ8DMLKqDorO0aoX9bnGmGk2T+aBz3rQT64IeBs8RpV0
	m1zJsSPyYVESBHnFKFLFdsrWNkYmpaOIHdr+EWVBk3TlSC8vtdfUzGH9RebL8OAn
	f4+ucHtAMw==
Received: from dcc-mail-mx-002.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3w2vqg148j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 05 Feb 2024 11:10:32 -0600 (CST)
Received: from dcc-mail-mx-001.na.plexus.com (10.249.48.15) by
 Dcc-mail-mx-002.na.plexus.com (10.249.48.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 17:10:30 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 17:10:30 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <andriy.shevchenko@linux.intel.com>, <bentiss@kernel.org>
CC: <jikos@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <niyas.sait@linaro.org>, <dmitry.torokhov@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <ethan.twardy@plexus.com>, Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v10 2/3] HID: usbhid: Share USB device firmware node with child HID device
Date: Mon, 5 Feb 2024 11:09:21 -0600
Message-ID: <20240205170920.93499-3-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240205170920.93499-1-danny.kaehn@plexus.com>
References: <20240205170920.93499-1-danny.kaehn@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cCN9Yr8dK6i_3jSWPCEggFwB22-tkPM_
X-Proofpoint-ORIG-GUID: cCN9Yr8dK6i_3jSWPCEggFwB22-tkPM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_11,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050130

USB HID core now shares its fwnode with its child HID device.
Since there can only be one HID device on a USB interface, it is redundant
to specify a hid node under the USB device. This allows usb HID device
drivers to be described in firmware and make use of device properties.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/usbhid/hid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index a90ed2ceae84..cb687ea7325c 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -19,6 +19,7 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 #include <asm/unaligned.h>
 #include <asm/byteorder.h>
@@ -1374,6 +1375,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	hid->hiddev_report_event = hiddev_report_event;
 #endif
 	hid->dev.parent = &intf->dev;
+	device_set_node(&hid->dev, dev_fwnode(&intf->dev));
 	hid->bus = BUS_USB;
 	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
 	hid->product = le16_to_cpu(dev->descriptor.idProduct);
-- 
2.25.1


