Return-Path: <linux-input+bounces-5467-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF35494CE3B
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 12:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62ECC281809
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 10:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504EC1922CF;
	Fri,  9 Aug 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="anFpHUMJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F2cDuWdh"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA78B1922D7;
	Fri,  9 Aug 2024 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723197832; cv=none; b=UcwWlwOReGnVpLvFw+1RNwG3iLV8tfK07b8fWcBEzEBQxg3zqLyA2NkPdzcA4QAZ8HZG2QaMDRluaM83DRfweo+RFd5VuXohSe9tcqgdpc+gn1E7YTuPVtS67/57P3jOBg+8r+0Pl62JkhxtGH7W2nt6uX1YoVjBlJx9bRkOBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723197832; c=relaxed/simple;
	bh=9GQcy1qd9NWVxlLrLF3rWsQ8GGkY667hqZKg2cR9b9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZPp5GD8W3JthRhp7x1d3fgNujinrpxK5oKhApQQUpUqJ3TGZV/154rvVWwQ1dZbY6vWsGoVDqCqX99EZYjxGAoklrjqSIROFpO0j25jfViTpVs8isczvGWRrTVS8PGRnekWNxDRVWkKfq1ymhjQEXRS2zbCnVAghxdLo/tQkfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=anFpHUMJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F2cDuWdh; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BD4781151B1D;
	Fri,  9 Aug 2024 06:03:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 09 Aug 2024 06:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1723197828; x=1723284228; bh=rN+bQCwzpuaxy9DuH7JMnY29r/U8Bdci
	iIULDINT+i0=; b=anFpHUMJoQRuiQ6DV8yOya2H/QeNct6j3vYfqVX4GUa7B1rY
	sC7Q4caUE5vsF04Uc6IHgnKFmdgHKp5o44XUwOTghkP79h/I5xLv3qB0MrYYGZGa
	rBlIhqaOZq0povLDKsC4M8vFE/XIWA82CK8Yw0fXtExfqAM0Q7sfJmfRikYp63dE
	r11LA79K4OpHcpJuLqCpCrcBg/zRqw8HzxclQpwKu1Ht0RwwQtSQbQ+JhNWoemVQ
	rAs2De4kjsojFKefNCZfv2bkinJh6kSQwEjdXCmY50aoMmr1WSCs871hzNccd0Wy
	QMtFxw481D3GgyGx4Cnaq49uvdsXb93UQhtR3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1723197828; x=1723284228; bh=rN+bQCwzpuaxy9DuH7JMnY29r/U8BdciiIU
	LDINT+i0=; b=F2cDuWdhEVTLurg3lorG/No788xqn56kC6WLeH12vp+St0WW7cj
	WGU3e9GSsyfmfsl+2WHOFmGzkH2aqSR2qm145/qXOXv9lgY3gulCAzK16O5iwe0Z
	pKB4f97+le6QjNBL0GSSurMfxqO5xZpNluAc/DguqoRpG8PSPlqsvB9QtaXC4mtS
	RRhNbCHwimr5lnuISt/XVT3RqpEEReh4Ez/rKgaFo2CDvYOAzgm0bs99fTGhXV6y
	BTt7+2U7iEQ6ADfVlaFX6gO8haF214OL/sthyjF+7KttrhSw/5PKD+bTfozP9cXT
	rmuC3hhPX6LQ8DC/YrQn4ZTb4wVhlmK1NNA==
X-ME-Sender: <xms:hOm1ZoTYAMZ4xSUEJW_J2KJPj6kV8dkUa83Irs3LxHIDVsHdf7p7Ag>
    <xme:hOm1ZlzkiGqh2G3SbOlm6Y8q9cJbz6YpyJv-IeWaNNywrNAhCxFUbATZjGsB9WpIG
    7n7CUmufLWuJ4cX5zM>
X-ME-Received: <xmr:hOm1Zl07pJ2MCIxeqZErcyxL6a7crvc5byZR-UTLJtTrU4Rp9xzvDPT2pmI05cvjlVAdGmWjdqKkk4llT0e6h5KwvGVj8mTHNDPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleeggddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhr
    ohhmpefrvghtvghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfi
    hhohdqthdrnhgvtheqnecuggftrfgrthhtvghrnhepkeejueffveetgeffieegudeitddu
    fefhhffgjeefueeuheelhfevhffghedutdefnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtpd
    hnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjihhk
    ohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnjhgrmhhinhdrthhishhsoh
    hirhgvshesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthes
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hOm1ZsBA4lB20AIkjck7yt383VScBtvwSv7icj17cZlPGJRAjW_7AQ>
    <xmx:hOm1ZhjWxSPoCdIqWUQSDuIB0Zpx34PWzIu3o7iQAPgnnix9P0RFhw>
    <xmx:hOm1ZopUnKiIpGfH5oUO90JGe2TijhGZMGwYELMLHzIojcre43Y3bg>
    <xmx:hOm1ZkiMWUxwKTcsLGofq0lrvHWdVA4FmPaUw5jUBu9azFdhIozGFQ>
    <xmx:hOm1ZhdcBck4Dor5HqJpG1Da4SI_jFUJIhx4EJ7d9XnTb5VJUNhkXxMN>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Aug 2024 06:03:46 -0400 (EDT)
Date: Fri, 9 Aug 2024 20:03:42 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: hidraw - add HIDIOCREVOKE ioctl
Message-ID: <20240809100342.GA52163@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
device. The functions return 0 on success or a negative errno
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

 drivers/hid/hidraw.c        | 52 +++++++++++++++++++++++++++++++++----
 include/linux/hidraw.h      |  1 +
 include/uapi/linux/hidraw.h |  1 +
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git ./drivers/hid/hidraw.c ../drivers/hid/hidraw.c
index 2bc762d31ac7..a9c68448cb20 100644
--- ./drivers/hid/hidraw.c
+++ ../drivers/hid/hidraw.c
@@ -38,12 +38,27 @@ static const struct class hidraw_class = {
 static struct hidraw *hidraw_table[HIDRAW_MAX_DEVICES];
 static DECLARE_RWSEM(minors_rwsem);
 
+__weak noinline bool hidraw_is_revoked(struct hidraw_list *list)
+{
+	return list->revoked;
+}
+ALLOW_ERROR_INJECTION(hidraw_is_revoked, TRUE);
+
+__weak noinline int hidraw_open_errno(__u32 major, __u32 minor)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(hidraw_open_errno, ERRNO);
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
@@ -161,9 +176,13 @@ static ssize_t hidraw_send_report(struct file *file, const char __user *buffer,
 
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
@@ -256,7 +275,7 @@ static __poll_t hidraw_poll(struct file *file, poll_table *wait)
 	poll_wait(file, &list->hidraw->wait, wait);
 	if (list->head != list->tail)
 		mask |= EPOLLIN | EPOLLRDNORM;
-	if (!list->hidraw->exist)
+	if (!list->hidraw->exist || hidraw_is_revoked(list))
 		mask |= EPOLLERR | EPOLLHUP;
 	return mask;
 }
@@ -267,7 +286,11 @@ static int hidraw_open(struct inode *inode, struct file *file)
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
@@ -320,6 +343,9 @@ static int hidraw_fasync(int fd, struct file *file, int on)
 {
 	struct hidraw_list *list = file->private_data;
 
+	if (hidraw_is_revoked(list))
+		return -ENODEV;
+
 	return fasync_helper(fd, file, on, &list->fasync);
 }
 
@@ -372,6 +398,13 @@ static int hidraw_release(struct inode * inode, struct file * file)
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
@@ -379,11 +412,12 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
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
@@ -421,6 +455,14 @@ static long hidraw_ioctl(struct file *file, unsigned int cmd,
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
@@ -527,7 +569,7 @@ int hidraw_report_event(struct hid_device *hid, u8 *data, int len)
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


