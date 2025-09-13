Return-Path: <linux-input+bounces-14679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B83B55FEA
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 11:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31581C85C57
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 09:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6572E8B7B;
	Sat, 13 Sep 2025 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="QeKv04cO"
X-Original-To: linux-input@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22B42D5946;
	Sat, 13 Sep 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757755681; cv=none; b=QycCDrcyrx9VY+foF5PiIGd1Lv9kE9FmW9Blz3Lj4DmReYxJyNsaYQ9sIrnYxP5VhoZLQEkFIeYAt7qbfMANcejl71CSKGZZlFkmhTKUy3eikJlASyLQIQyQ+Ekwq8AFJn2lAfulqSMuDpzS/Ly3iGlqY9kaTnFhHIYxdkptUF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757755681; c=relaxed/simple;
	bh=awvsvpXqRlkZ99qbX4b278mAef9+7B1wvnHRlagBzLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtvrXjCjwyEQH137hWhx2fk14CQKAZN95cKKp8MUrJg+agL8D4BsyD0wdQk8GdiMXrKUdetjnSBbi+25zAdyId6AulfRZroqWoeRIQ/ownFRpQFYxjqpwYBRbjn5ZeWxfyKoUdd11dfEfNPBnfEebYbrKq0QJjNpx5CFhPhkRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=QeKv04cO; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wz1Nlepo1I7EPbDFYbA1uUSymAbIx41UYBcLNwJ+PYc=; b=QeKv04cO6mDZSLvW3OACnmxb7i
	K0Jlp9Ouyy6BecJDom2lxOwncLPnXGR5YSOBMqmAhfH2NL0+cbKvUHD3fnPEelCSJUHGPWJk3YMIf
	KlJytgg32HZXnQlt2ymr4KnTe+NCA+Dv2BnJFGN8xXw07D+4c2r66JCPwwjDQihsRVFFH3MjRgifY
	5GNa4nbQ5ooHLnY/kFEnEJNd4+k37ahpZlqRBP7geBejojRf766mY7MzyOLyOiMmle0EDceaPGSU9
	NOWvGmr4VHgPcWNW85TdGfS/s9l7NjumbkJoeM2CgE6JJprDynTM3KnlBUQ8TdQ1fjjT4416YEXL2
	LxiTj66g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1uxM2e-00AMpN-B5; Sat, 13 Sep 2025 08:55:32 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 6F5D9BE2DE0; Sat, 13 Sep 2025 10:55:31 +0200 (CEST)
Date: Sat, 13 Sep 2025 10:55:31 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Staffan Melin <staffan.melin@oscillator.se>
Cc: zhangheng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
Message-ID: <aMUxg6FLqDetwiGu@eldamar.lan>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="SSq+zSyke7FBHmjg"
Content-Disposition: inline
In-Reply-To: <aMUxHZF-7p7--1qS@eldamar.lan>
X-Debian-User: carnil


--SSq+zSyke7FBHmjg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Staffan,

chiming in hopefully it is of help.

Now really with the patch ...

On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
> Thank you,
> 
> I tried to apply this patch to 6.12.39, the first problematic kernel, as
> well as 6.12.41, the first bad I tried, and on both I got an error message:
> 
> Applying: HID: quirks: Add device descriptor for 4c4a:4155
> error: patch failed: drivers/hid/hid-quirks.c:1068
> error: drivers/hid/hid-quirks.c: patch does not apply
> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155
> 
> To which kernel version should I apply the patch?

As the deveopment goes from mainline then down to stable series, the
fix needs to be developed first for mainline. So the patch is targeted
there.

But please find attached an updated patch which hopefully should work
which resolved the context changes on top of 6.12.47.

But ideally you can provide a Tested-by on zhangheng's mainline patch
to get things rolling as needed.

Regards,
Salvatore

--SSq+zSyke7FBHmjg
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"

From 16b03e802a858ebf3eafcfdb22e3025e1a840afd Mon Sep 17 00:00:00 2001
From: Zhang Heng <zhangheng@kylinos.cn>
Date: Fri, 12 Sep 2025 20:38:18 +0800
Subject: [PATCH] HID: quirks: Add device descriptor for 4c4a:4155

Two USB devices use the same ID. To avoid affecting functionality,
device descriptors are added to distinguish between them

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---
 drivers/hid/hid-quirks.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 64f9728018b8..cbb658c2c60d 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -898,6 +898,17 @@ static const struct hid_device_id hid_ignore_list[] = {
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
+	{ }
+};
+/*
+ * hid_ignore_mic - Microphone devices do not require HID core processing
+ *
+ * Now there are two USB devices using the same ID, one is the microphone and the other
+ * is the touch screen. The touch screen requires hid core processing, but the
+ * microphone does not. The two have different bcdIDs, which will be used to
+ * distinguish them in the future
+ */
+static const struct hid_device_id hid_ignore_mic[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SMARTLINKTECHNOLOGY, USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155) },
 	{ }
 };
@@ -1061,6 +1072,9 @@ bool hid_ignore(struct hid_device *hdev)
 	    hid_match_id(hdev, hid_mouse_ignore_list))
 		return true;
 
+	if(hid_match_id(hdev, hid_ignore_mic) && (hdev->version > 1.1))
+		return true;
+
 	return !!hid_match_id(hdev, hid_ignore_list);
 }
 EXPORT_SYMBOL_GPL(hid_ignore);
@@ -1259,7 +1273,8 @@ static unsigned long hid_gets_squirk(const struct hid_device *hdev)
 	const struct hid_device_id *bl_entry;
 	unsigned long quirks = hdev->initial_quirks;
 
-	if (hid_match_id(hdev, hid_ignore_list))
+	if (hid_match_id(hdev, hid_ignore_list) ||
+	   (hid_match_id(hdev, hid_ignore_mic) && (hdev->version > 1.1)))
 		quirks |= HID_QUIRK_IGNORE;
 
 	if (hid_match_id(hdev, hid_have_special_driver))
-- 
2.51.0


--SSq+zSyke7FBHmjg--

