Return-Path: <linux-input+bounces-16391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B1C92053
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 13:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CC5D347A9B
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 12:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5264B1DFF0;
	Fri, 28 Nov 2025 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="Rs5EJZLj"
X-Original-To: linux-input@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB71C68F
	for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764333993; cv=none; b=ggQEtsveIEREs7PLk3Zc+24oB3qiukx0Mz5Q47orHrFRRBHePxyEAYg462vQV8XAYrgstRAGtUB9mUeFz509mFc25b/rSIqBE5VPXVwdZ7oVjtQ9wtYT0lcqnRMOuvIUuouIBSVyGibz3bmIRvUOuDJ2hHqUMIQJWaTAQjyLIIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764333993; c=relaxed/simple;
	bh=Ze0593pjT6yvmE2xc/xacXsV8zb/lgZwzqxGH6fc3Lk=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=eGE59lDIN892TrpzCfbuIiwOVtgdc1A52XI0NmKJd1DCfa4QqgT3DDMfav3Sqi+2neKavN3IY6caPS45cFw2vnxl7eMGKPyzpKZu1Ud6+Zpstf/sckpwVpZ/M3JZPqZTRFftSGjVe8e+WN2YNf+evJ/wWu560XJ3B0JjEANgh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=Rs5EJZLj; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=H6gNOU9POYjgx4wR5+cXvv1rlFWdWRRTxbxwar23ihc=; b=R
	s5EJZLjlu9YkCZ6jxfu+8zU2Yty1cBBLASsHksksAPMB3JvjqmgC//cX9bfaacaqzbYGiYQ+pgYak
	eBDLsMWevJsF+BLHqaeam+SGfIXVjt7cLO6vsjTkaEOm/mLFkt9pYpH5Lt36N3R2YQQRvS1IF5WN6
	JDqLn0uujRfOU5btL7rdAZWUmTpS4oLR1Usv6N88L4b9+O4oxbd9S1NltmjpFIP4U8CqhEA1x3FcE
	FtJ4k3eif3jpIuJ0D8seZmNf9QY5KVaBLEskwcvy3LTPt9JBopCiN84sIUZRMrCckwd8yviRXIvBi
	TGqnoup0rgLhOhBXSpZPphJMlT6IszeNw==;
Date: Fri, 28 Nov 2025 13:46:41 +0100 (CET)
Message-Id: <20251128.134641.2239011056142092631.rene@exactco.de>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH] HID: quirks: work around VID/PID conflict for appledisplay
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

For years I wondered why the Apple Cinema Display driver would not
just work for me. Turns out the hidraw driver instantly takes it
over. Fix by adding appledisplay VID/PIDs to hid_have_special_driver.

Fixes: 069e8a65cd79 ("Driver for Apple Cinema Display")
Signed-off-by: René Rebe <rene@exactco.de>
---
Tested since 2024-05-15 in T2/Linux.
---
 drivers/hid/hid-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c0..6a8a7ca3d804 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -232,6 +232,15 @@ static const struct hid_device_id hid_quirks[] = {
  * used as a driver. See hid_scan_report().
  */
 static const struct hid_device_id hid_have_special_driver[] = {
+#if IS_ENABLED(CONFIG_APPLEDISPLAY)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9218) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9219) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x921c) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x921d) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9222) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9226) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, 0x9236) },
+#endif
 #if IS_ENABLED(CONFIG_HID_A4TECH)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_WCP32PU) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_A4TECH, USB_DEVICE_ID_A4TECH_X5_005D) },
-- 
2.46.0


-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

