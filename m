Return-Path: <linux-input+bounces-5514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB294E626
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 07:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486AB1F21C6B
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 05:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1309514B978;
	Mon, 12 Aug 2024 05:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="eSb/QB9T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ujlOkAA6"
X-Original-To: linux-input@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE843AA1;
	Mon, 12 Aug 2024 05:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723440483; cv=none; b=epbu3etrCTAfPm9TFXJAwnhjitjqVm2h3D9JTsmIwQtsEFBLSgtwdvnGyXW1j4N5elTdsFFaY9FLd5GbE1vahSh6WPymih3WmvxbwaR+UiEo1GQ1G9G0ze75YfNny6RZ5PyfMpbEZSMIDQEthGGXD2v6JNNmOds2dFyiMWgfImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723440483; c=relaxed/simple;
	bh=XVfGGZCipAdI6H558znfqGsdlAe8caKj9366wmxvr1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QH212NRJ2qKM1k5IaJCvVdrBtuWtTjicRemtwa0mnWy6ntftrvNmD7e0Kovk6cPSyrvwG7wwOPE+Zaw8EL9+wSZcqIsBSabAXY74YdQ7YMj693AFcpLHDpJml+fW07FxIDGgixnza0lZSzxbqTzzAf5nh1N+i0fMKcXxG+JD0ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=eSb/QB9T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ujlOkAA6; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute8.internal (compute8.nyi.internal [10.202.2.227])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7D8CF138FCA6;
	Mon, 12 Aug 2024 01:27:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute8.internal (MEProxy); Mon, 12 Aug 2024 01:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1723440479; x=1723526879; bh=wOdIOC9ipmsRSMxgNOsx5
	AH8vNjnBGvh67WnoAaqXIc=; b=eSb/QB9TtVAI28t+vEaKX250dDRwgTafsAL3Z
	ighTe9ckFq2glTnqUPQAqHE5iMD4aNcKU14jwksDYzEv8I7MdfsJCOT3W9N4mpBp
	fRLFCGimZ0NvWwlggKs7vwovq+K4O7Y6DYYJBsd2t1UUG4Nb4XD4Q+Dfq/RxmrwX
	gdrlzheFf+aQ+S8npKSMFzJz09E5NcgpmQlTBD5R2XK7xlLXo8g9TZ+T9c/UDNNm
	JIFXrmL0U1dsNaB/F3VDpxSMri52PCItTzOmdZRby+7EFqbOQZr8FU2AitgLUJDa
	AscMzXTPOE5VEhjItWTBCqEQlLJdZmi8BtIDp4zGBGfgBycuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723440479; x=1723526879; bh=wOdIOC9ipmsRSMxgNOsx5AH8vNjn
	BGvh67WnoAaqXIc=; b=ujlOkAA6Ru2HPoy9/J0lkIGT5Cec7vzlvNxZuF8I2q1J
	0GAAuWVPLpqw5yzBiqcvvG+BU3GTdYgfxTOVkRG/IEaow3wTODA/c6H2JT41g7gs
	Ci7yUNiU2O8ZIjbyuwL+cTqGXuyrBuuHkLjuVnlq6PXj+Mt9MA18k0ngTHsHLFsp
	W0ccc0AYq1OqqlOJ0ePNooj8dhVdGIY+O9BlB2sWoXe/irbKnOtg5MZbnv9nRURV
	4vOZnQZYygEuSdtS4A9Hn1wdmzAqYmqhoDEqxKnWK9BSDbcFPFslwfvzvpo445ep
	FnEFSOUrv0Qq6s9afBFy4zh17FjAkRslweoLmlF9iA==
X-ME-Sender: <xms:X525Zpz1KbEDHL7Q1VzqQimCv20DRRUx4zFVSnJrBYRi2lo-dm6E5g>
    <xme:X525ZpTXTR2bo46A5tCU4esXWTkfN-INI7oHyQVZFRp72DAoGGCDzvTuc89OuRCmg
    EjJ4q4-dBoeUjunRBY>
X-ME-Received: <xmr:X525ZjUapHUiBf8M-nrQLF8g7k4iUA0bdyjCPGWYg7ZxMK_ZbBQ4wuvdGJiQygAuDw4wrCCJDBzDTdx2bSgsAwaVfje1jyAo_opX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleelgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggujgesthdtredttddtvdenucfh
    rhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrse
    ifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpedugffhheevheelheevfeefleej
    tefgkefhvdelfffgjeejffejveeliedutedtueenucffohhmrghinhepghhithhhuhgsrd
    gtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhi
    khhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhjrghmihhnrdhtihhssh
    hoihhrvghssehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhht
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:X525ZrgyKuq24_6ok1RmuA2NDEKIlEp0mG0C-LWwcrDBlwIZobZ1IQ>
    <xmx:X525ZrCsbCsbKzxpSWunQZm8mLhVSu-JJfJPaLI0NqqegzcBEZXopg>
    <xmx:X525ZkJDknNvYj2-wFaonTYkHvjlM_OhZ1lFu2I7jYKH9FlwtCLPKA>
    <xmx:X525ZqCAKU27HRI_n4bvG5EdS90RUCmlvk-yNqwomLbGWCxtujoZaQ>
    <xmx:X525Zm-DTgX1WveJrVyQmW7CrzrbE8ZaqRn4M7Sc2xHIruzjSu16KR_1>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Aug 2024 01:27:57 -0400 (EDT)
Date: Mon, 12 Aug 2024 15:27:53 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] HID: hidraw - add HIDIOCREVOKE ioctl
Message-ID: <20240812052753.GA478917@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809100342.GA52163@quokka>

There is a need for userspace applications to open HID devices directly.
Use-cases include configuration of gaming mice or direct access to
joystick devices. The latter is currently handled by the uaccess tag in
systemd, other devices include more custom/local configurations or just
sudo.

A better approach is what we already have for evdev devices: give the
application a file descriptor and revoke it when it may no longer access
that device.

This patch is the hidraw equivalent to the EVIOCREVOKE ioctl, see
commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full details.

An MR for systemd-logind has been filed here:
https://github.com/systemd/systemd/pull/33970

hidraw_is_revoked() and hidraw_open_errno() are both defined as weak
functions to allow for a BPF program to deny access to a /dev/hidraw
device. The function returns 0 on success or a negative errno
otherwise that is returned to the caller.

As a use-case example, a gamepad-managing process could attach a BPF
program that defaults to -EACCESS for all hidraw devices except those
with ID_INPUT_JOYSTICK set by udev.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
First version of the patch:
https://patchwork.kernel.org/project/linux-input/patch/YmEAPZKDisM2HAsG@quokka/

Changes to v1:
- add the hidraw_is_revoked and hidraw_open_errno weak functions as
  suggested by Benjamin

Changes to v2:
- use __bpf_hook_start/end to silence compiler warnings  (see kernel
  test bot)

 drivers/hid/hidraw.c        | 61 ++++++++++++++++++++++++++++++++++---
 include/linux/hidraw.h      |  1 +
 include/uapi/linux/hidraw.h |  1 +
 3 files changed, 58 insertions(+), 5 deletions(-)

diff --git ./drivers/hid/hidraw.c ../drivers/hid/hidraw.c
index 2bc762d31ac7..baee5417e6e2 100644
--- ./drivers/hid/hidraw.c
+++ ../drivers/hid/hidraw.c
@@ -13,6 +13,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/btf.h>
 #include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/errno.h>
@@ -38,12 +39,35 @@ static const struct class hidraw_class = {
 static struct hidraw *hidraw_table[HIDRAW_MAX_DEVICES];
 static DECLARE_RWSEM(minors_rwsem);
 
+__bpf_hook_start();
+
+__weak noinline bool hidraw_is_revoked(struct hidraw_list *list)
+{
+	return list->revoked;
+}
+ALLOW_ERROR_INJECTION(hidraw_is_revoked, TRUE);
+
+__bpf_hook_end();
+
+__bpf_hook_start();
+
+__weak noinline int hidraw_open_errno(__u32 major, __u32 minor)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(hidraw_open_errno, ERRNO);
+
+__bpf_hook_end();
+
 static ssize_t hidraw_read(struct file *file, char __user *buffer, size_t count, loff_t *ppos)
 {
 	struct hidraw_list *list = file->private_data;
 	int ret = 0, len;
 	DECLARE_WAITQUEUE(wait, current);
 
+	if (hidraw_is_revoked(list))
+		return -ENODEV;
+
 	mutex_lock(&list->read_mutex);
 
 	while (ret == 0) {
@@ -161,9 +185,13 @@ static ssize_t hidraw_send_report(struct file *file, const char __user *buffer,
 
 static ssize_t hidraw_write(struct file *file, const char __user *buffer, size_t count, loff_t *ppos)
 {
+	struct hidraw_list *list = file->private_data;
 	ssize_t ret;
 	down_read(&minors_rwsem);
-	ret = hidraw_send_report(file, buffer, count, HID_OUTPUT_REPORT);
+	if (hidraw_is_revoked(list))
+		ret = -ENODEV;
+	else
+		ret = hidraw_send_report(file, buffer, count, HID_OUTPUT_REPORT);
 	up_read(&minors_rwsem);
 	return ret;
 }
@@ -256,7 +284,7 @@ static __poll_t hidraw_poll(struct file *file, poll_table *wait)
 	poll_wait(file, &list->hidraw->wait, wait);
 	if (list->head != list->tail)
 		mask |= EPOLLIN | EPOLLRDNORM;
-	if (!list->hidraw->exist)
+	if (!list->hidraw->exist || hidraw_is_revoked(list))
 		mask |= EPOLLERR | EPOLLHUP;
 	return mask;
 }
@@ -267,7 +295,11 @@ static int hidraw_open(struct inode *inode, struct file *file)
 	struct hidraw *dev;
 	struct hidraw_list *list;
 	unsigned long flags;
-	int err = 0;
+	int err;
+
+	err = hidraw_open_errno(hidraw_major, minor);
+	if (err < 0)
+		return err;
 
 	if (!(list = kzalloc(sizeof(struct hidraw_list), GFP_KERNEL))) {
 		err = -ENOMEM;
@@ -320,6 +352,9 @@ static int hidraw_fasync(int fd, struct file *file, int on)
 {
 	struct hidraw_list *list = file->private_data;
 
+	if (hidraw_is_revoked(list))
+		return -ENODEV;
+
 	return fasync_helper(fd, file, on, &list->fasync);
 }
 
@@ -372,6 +407,13 @@ static int hidraw_release(struct inode * inode, struct file * file)
 	return 0;
 }
 
+static int hidraw_revoke(struct hidraw_list *list)
+{
+	list->revoked = true;
+
+	return 0;
+}
+
 static long hidraw_ioctl(struct file *file, unsigned int cmd,
 							unsigned long arg)
 {
@@ -379,11 +421,12 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 	unsigned int minor = iminor(inode);
 	long ret = 0;
 	struct hidraw *dev;
+	struct hidraw_list *list = file->private_data;
 	void __user *user_arg = (void __user*) arg;
 
 	down_read(&minors_rwsem);
 	dev = hidraw_table[minor];
-	if (!dev || !dev->exist) {
+	if (!dev || !dev->exist || hidraw_is_revoked(list)) {
 		ret = -ENODEV;
 		goto out;
 	}
@@ -421,6 +464,14 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
 					ret = -EFAULT;
 				break;
 			}
+		case HIDIOCREVOKE:
+			{
+				if (user_arg)
+					ret = -EINVAL;
+				else
+					ret = hidraw_revoke(list);
+				break;
+			}
 		default:
 			{
 				struct hid_device *hid = dev->hid;
@@ -527,7 +578,7 @@ int hidraw_report_event(struct hid_device *hid, u8 *data, int len)
 	list_for_each_entry(list, &dev->list, node) {
 		int new_head = (list->head + 1) & (HIDRAW_BUFFER_SIZE - 1);
 
-		if (new_head == list->tail)
+		if (hidraw_is_revoked(list) || new_head == list->tail)
 			continue;
 
 		if (!(list->buffer[list->head].value = kmemdup(data, len, GFP_ATOMIC))) {
diff --git ./include/linux/hidraw.h ../include/linux/hidraw.h
index cd67f4ca5599..18fd30a288de 100644
--- ./include/linux/hidraw.h
+++ ../include/linux/hidraw.h
@@ -32,6 +32,7 @@ struct hidraw_list {
 	struct hidraw *hidraw;
 	struct list_head node;
 	struct mutex read_mutex;
+	bool revoked;
 };
 
 #ifdef CONFIG_HIDRAW
diff --git ./include/uapi/linux/hidraw.h ../include/uapi/linux/hidraw.h
index 33ebad81720a..d0563f251da5 100644
--- ./include/uapi/linux/hidraw.h
+++ ../include/uapi/linux/hidraw.h
@@ -46,6 +46,7 @@ struct hidraw_devinfo {
 /* The first byte of SOUTPUT and GOUTPUT is the report number */
 #define HIDIOCSOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0B, len)
 #define HIDIOCGOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0C, len)
+#define HIDIOCREVOKE	_IOW('H', 0x0D, int) /* Revoke device access */
 
 #define HIDRAW_FIRST_MINOR 0
 #define HIDRAW_MAX_DEVICES 64
-- 
2.45.2


