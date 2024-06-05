Return-Path: <linux-input+bounces-4146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E397A8FDB18
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 02:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D2362882D9
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 00:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC65910E9;
	Thu,  6 Jun 2024 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="epOS53Gb"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF927E6;
	Thu,  6 Jun 2024 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717632042; cv=none; b=aq2eTt8QQOZVoTOGd4+fE2ivCRuedf2japwB/Jyu9HU45bMQrzCJ12NUX+8gq4vukp1tDAVdha4Xx7mH0+iRdTBCnjznVIjYD6TJEPK+SwnaTQGAoCD+FhRR2Enyp2hGe/8vfHf4N0RHV50HVS6rjhYhT2WtOwC/fOTvplDhMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717632042; c=relaxed/simple;
	bh=3KQ324a+aNFxbZCXFok2y2weO4PJIGknu/daWhVhMsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YwSWau/82bQw3frVY+P46lPqWOfKyGaOZwjGTok6IHFD8GI0lD5QTVkeMArJzeISMe6Pox+QRXGlO4qQMxcqLRFwYtiVGiFnyY3LCH/tpm9bdxnrbrAcnRHy9MLe80HKIjWKNmU1DeAbWqQOdnGEuwPit2UcEhlUzXVKFNWBBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=epOS53Gb; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341555.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455MCwgr016418;
	Wed, 5 Jun 2024 23:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=bLKrX
	vKovutwmShMXcjlyb9MfMXa88poPhCWGdD55zs=; b=epOS53GbklWyAbK6INZfD
	xANzm7YNgHoyUO4YHPH9L+rTpKarFwJqcHzoBOF3/DFumcIRI2GdkBFUIc2zX/zC
	8/SvYp+okHxdK+ipHbaDdTp1Toj1RfuKH0I059in8IMWXNSxf8Q73946FosZiGiY
	AY1loae7rk+/OfFSjQWxMR0LTZF4EaduTI5S2bgdIAT1yx5mBVamn4pmRScdhxp8
	x3bUKdu7tBDyh0bhaLBzQr+RF9RaB1u+Ft7M9hVLKzRFteIF+hOUi2ioYRKvgeIW
	27ukj7m3YsYc4wYgVtFImzG1MZ8Cqr71bMuiaAY3PaB3Ns/I1hlcEzxLXAnlf7OW
	g==
Received: from gcc-mail-mx-001.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 3yjyu387kk-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 23:17:50 +0000 (GMT)
Received: from gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) by
 gcc-mail-mx-001.na.plexus.com (10.255.51.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 5 Jun 2024 23:17:48 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-004.Na.Plexus.com (10.255.51.224) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 5 Jun 2024 23:17:48 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 5 Jun 2024 18:12:45 -0500
Subject: [PATCH v11 2/4] HID: usbhid: Share USB device firmware node with
 child HID device
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240605-cp2112-dt-v11-2-d55f0f945a62@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
In-Reply-To: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Danny Kaehn <danny.kaehn@plexus.com>
CC: Jiri Kosina <jikos@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy
	<ethan.twardy@plexus.com>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717629180; l=1293;
 i=danny.kaehn@plexus.com; s=20240605; h=from:subject:message-id;
 bh=3KQ324a+aNFxbZCXFok2y2weO4PJIGknu/daWhVhMsU=;
 b=QKgUhwHbZIeSw9lDNLuu430rukdCxcluVwJCNsqFHRNwfb0xiIRhT08qtRtZeQD0H3bpe0Rl+
 w8mlnAubQytCIKz8+V09nTn4sAkaiMBO9vO+NqBQ//+IIQt9ZntD6dL
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=+a/HbfS1U7uuw+5dRHN5PsUDyPWbx4dXDnblK41GI2s=
X-Proofpoint-GUID: owUuMiyDXE05DgzQ6ijn3gO0OGJq_NmE
X-Proofpoint-ORIG-GUID: owUuMiyDXE05DgzQ6ijn3gO0OGJq_NmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050175

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


