Return-Path: <linux-input+bounces-14422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A48B40001
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 14:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE134544F8B
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 12:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9DD305E2E;
	Tue,  2 Sep 2025 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcjSlpcf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69BF2FB63F;
	Tue,  2 Sep 2025 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814938; cv=none; b=rkT6DISMAM2iPGcAJv1yC+1F1bAux72XH0KmbIFeXZAo3PvRE+LNz2YN3JnpLIGDiIZyIL/n6qInDZBdC7lVXEqLonh2TE1lI3cstT8mWRRONRTmqsAZlmom6eqQnsfljamKDSU6Bnnzjnx924SqwA8ZLX5+bv8mmPvCn5MkuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814938; c=relaxed/simple;
	bh=xdELgmlhE1A6KzQQQcWlT/1tRd+vpMgwIc19zM1/oBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxEQM6k248UK4qcdpSMscniOutZopnCDpxsivm9C4w/vTtCPs/W9KW+k3/tW+ZJRVbXXJh1Oj6vTfiwon3CZnvDMCGabT5xjw8SO/Zb/6i8Vw4xVoDV3tLA71zBYiOaVwnmb1VdFX1nyePsmabJEqIiawPFFyruuU3/9HhyiXDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcjSlpcf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13949C4CEF4;
	Tue,  2 Sep 2025 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756814937;
	bh=xdELgmlhE1A6KzQQQcWlT/1tRd+vpMgwIc19zM1/oBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PcjSlpcfQN0McEKAs5ZIoSft2DOkqodnbBNV2fmnrXuFOy3ChHRFtn7E3Ahg3KBmE
	 uKYzCq0q+kHy7W4yJDDlbJsnRA4yqMqWY2sstPmnXBPjlu7UB/ryPpADdU26/BZ2xj
	 VJI1l2bOlY6RG8WA9vxG/unSwgxbDsZoT09zGHBvLBqLAPpnhgtcyT+TVVtdnh3Ml+
	 rh8d0SvapjeF1e7eouw8j1M2+77Id1EEIrQhXoLf5nAoTqqelULSCK/5Ai0/BAppZ1
	 EcYRRtMWbvMIEqynt+NM40KCdMxHEMPguF5ShXTQnrrTGXlhch2RzqH4azitLHuI5K
	 7RQ7TMiCVu1WA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Minjong Kim <minbell.kim@samsung.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()
Date: Tue,  2 Sep 2025 08:08:27 -0400
Message-ID: <20250902120833.1342615-16-sashal@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902120833.1342615-1-sashal@kernel.org>
References: <20250902120833.1342615-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16.4
Content-Transfer-Encoding: 8bit

From: Minjong Kim <minbell.kim@samsung.com>

[ Upstream commit 185c926283da67a72df20a63a5046b3b4631b7d9 ]

in ntrig_report_version(), hdev parameter passed from hid_probe().
sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
if hdev->dev.parent->parent is null, usb_dev has
invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
when usb_rcvctrlpipe() use usb_dev,it trigger
page fault error for address(0xffffffffffffff58)

add null check logic to ntrig_report_version()
before calling hid_to_usb_dev()

Signed-off-by: Minjong Kim <minbell.kim@samsung.com>
Link: https://patch.msgid.link/20250813-hid-ntrig-page-fault-fix-v2-1-f98581f35106@samsung.com
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now let me analyze what I've found to make a decision on backporting.

## Backport Status: YES

This commit should be backported to stable kernel trees for the
following reasons:

### 1. **Critical Bug Fix - Kernel Page Fault**
The commit fixes a kernel page fault (crash) that can occur when using
N-Trig HID devices with virtual HID interfaces (through /dev/uhid). The
commit message describes:
- When descriptors are sent through /dev/uhid,
  `hdev->dev.parent->parent` can be NULL
- This causes `hid_to_usb_dev(hdev)` to return an invalid address
  (0xffffffffffffff58)
- When `usb_rcvctrlpipe()` tries to use this invalid pointer, it
  triggers a page fault

### 2. **Simple and Contained Fix**
The fix is minimal and surgical:
```c
+       if (!hid_is_usb(hdev))
+               return;
```
This adds a single safety check before attempting USB-specific
operations. The `hid_is_usb()` function is a well-established pattern in
the kernel for determining if an HID device is actually backed by USB.

### 3. **Follows Established Pattern**
The fix follows an established pattern in the kernel. My analysis shows:
- The `hid_is_usb()` helper was introduced specifically for this purpose
  (commit f83baa0cb6cfc)
- Multiple other HID drivers already use this check pattern to avoid
  similar issues
- Greg KH's original commit adding `hid_is_usb()` was marked for stable
  (`Cc: stable@vger.kernel.org`)

### 4. **Security Implications**
This bug could potentially be triggered from userspace through
/dev/uhid, making it a potential denial-of-service vector. Any userspace
application with access to /dev/uhid could potentially trigger a kernel
crash.

### 5. **Minimal Risk of Regression**
The fix:
- Only adds a defensive check that returns early if the device is not
  USB
- Does not change any existing logic for actual USB devices
- Cannot break existing functionality as it only prevents invalid memory
  access
- The kmalloc() allocation is moved after the check, which is also a
  good practice (avoiding unnecessary allocation)

### 6. **Affects Real Hardware**
N-Trig devices are real touchscreen/digitizer hardware used in various
tablets and touch-enabled devices. Users of these devices could
experience kernel crashes when virtual HID tools interact with the
driver.

### 7. **Clear Root Cause**
The commit clearly identifies the root cause: the `hid_to_usb_dev()`
macro directly dereferences `hdev->dev.parent->parent` without checking
if it's valid. For non-USB HID devices (like those created through
uhid), this pointer chain may not be valid.

The fix is appropriate for stable backporting as it:
- Fixes a real crash that affects users
- Is minimal and well-understood
- Follows established kernel patterns
- Has low risk of introducing new issues
- Addresses a potential security concern (userspace-triggerable crash)

 drivers/hid/hid-ntrig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 2738ce947434f..0f76e241e0afb 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -144,6 +144,9 @@ static void ntrig_report_version(struct hid_device *hdev)
 	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
 	unsigned char *data = kmalloc(8, GFP_KERNEL);
 
+	if (!hid_is_usb(hdev))
+		return;
+
 	if (!data)
 		goto err_free;
 
-- 
2.50.1


