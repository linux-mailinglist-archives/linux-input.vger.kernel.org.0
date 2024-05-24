Return-Path: <linux-input+bounces-3818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2B8CE500
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28D8282491
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 12:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35AF84FAF;
	Fri, 24 May 2024 12:01:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C0839FC;
	Fri, 24 May 2024 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716552090; cv=none; b=FG4sea7d5qSC3tyXj+j+Rue+6dy3h0IdyqoKpSM0dm9x9ihi3TQEf0TymFlNGkgwX/XtIRTKsiN0VLYBalairtu1vuhEQRRxSy18rPPc0/3xzIArVkKKHfp0aTMvt488STYmFXC+QAS/q9uspJJmvllRobHhe6DERwwV3mDYwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716552090; c=relaxed/simple;
	bh=sjXQpdVuxVaMrcZZhjQ9Ud+3LbVMqNdFY3q2eDxl45I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nVtixYKWRX03A6nojuOnGzu0sVjwEKG6zCuqzo9rX+gOUUHfNF38Li632B0lhH8EzwKqMAzrVUuuBw1eWGW8agpYywGYi5gqDlV/2qNSma7VDvC75HrutJYk53ORij3wbDeeCss+LULG/W5oyvXA6SoUxWYo3hqYuN8sIbUejPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 24 May
 2024 15:01:20 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 24 May
 2024 15:01:20 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Kees Cook
	<keescook@chromium.org>, <linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>,
	<linux-kernel@vger.kernel.org>,
	<syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
Subject: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in usbhid_parse()
Date: Fri, 24 May 2024 05:01:12 -0700
Message-ID: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Syzbot reports [1] a reemerging out-of-bounds bug regarding hid
descriptors possibly having incorrect bNumDescriptors values in
usbhid_parse().

Build on the previous fix in "HID: usbhid: fix out-of-bounds bug"
and run a sanity-check ensuring that number of descriptors doesn't
exceed the size of desc[] in struct hid_descriptor.

[1] Syzbot report:
Link: https://syzkaller.appspot.com/bug?extid=c52569baf0c843f35495

UBSAN: array-index-out-of-bounds in drivers/hid/usbhid/hid-core.c:1024:7
index 1 is out of range for type 'struct hid_class_descriptor[1]'
CPU: 0 PID: 8 Comm: kworker/0:1 Not tainted 6.9.0-rc6-syzkaller-00290-gb9158815de52 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
 usbhid_parse+0x5a7/0xc80 drivers/hid/usbhid/hid-core.c:1024
 hid_add_device+0x132/0x520 drivers/hid/hid-core.c:2790
 usbhid_probe+0xb38/0xea0 drivers/hid/usbhid/hid-core.c:1429
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294

Reported-and-tested-by: syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com
Fixes: f043bfc98c19 ("HID: usbhid: fix out-of-bounds bug")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/hid/usbhid/hid-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index a90ed2ceae84..f38a4bd3a20e 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1020,6 +1020,9 @@ static int usbhid_parse(struct hid_device *hid)
 	num_descriptors = min_t(int, hdesc->bNumDescriptors,
 	       (hdesc->bLength - offset) / sizeof(struct hid_class_descriptor));
 
+	if (num_descriptors > ARRAY_SIZE(hdesc->desc))
+		num_descriptors = ARRAY_SIZE(hdesc->desc);
+
 	for (n = 0; n < num_descriptors; n++)
 		if (hdesc->desc[n].bDescriptorType == HID_DT_REPORT)
 			rsize = le16_to_cpu(hdesc->desc[n].wDescriptorLength);

