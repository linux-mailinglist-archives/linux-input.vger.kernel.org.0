Return-Path: <linux-input+bounces-15725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB25C09B24
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 18:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6643B1A658B4
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 16:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A837C30C606;
	Sat, 25 Oct 2025 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnsu/SZu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC843093CD;
	Sat, 25 Oct 2025 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409766; cv=none; b=tGQ0bb6gitWQ4WenktJQB6MIlkbE9P/qtAXXV8Q1IT3FoZ5rcsWF6LRqCaD3qaxZ3yC48tc34ItL5xh/cVtnBJQQhh9VWWCzfWeROM/hMc4bHR+C5Q3p/GdGJCLj3+4TZwPpyX/pvU7UuYjLvQTb+OfH2rH+ez5txwDz8GccQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409766; c=relaxed/simple;
	bh=A21ABCdIAGfpwxlVmiDxYecNgyt6Hqg6AbRUeDD/7gI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tHE2/543Z1sisxv7893nqILFAP6Ox8n2kIuoFBQJkGB7IN1gE7GAa0gVt5EGneDgbuv8uB+7ZK7qzp/qHiz7zUM2iV/adbqXBDYUmEFDcC231NcAbJ92RdOXIJoBw9GmtvhmrAWfg/wy8F2abRX0LXPNmJA7/3eRt0u41HxLidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnsu/SZu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F45C4CEFF;
	Sat, 25 Oct 2025 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409766;
	bh=A21ABCdIAGfpwxlVmiDxYecNgyt6Hqg6AbRUeDD/7gI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mnsu/SZuW6eGW0AO4yqfXOTxG9udv/FuPjTzRYNX+HXyoiRXEO3MjCEMMD5I/z9Aj
	 8eA6tl3xVWYA7XfY2mTmeYDAL0kgeDQctjFFbANv6lC74ifuL/RLQ5oMI22H2OstOS
	 n9C5y7Yo89kaYJNPTYXTyt1/2E66ziW1QxeYQ4Gc3PFRb1PxnUgO99AsGIYBdL5cRN
	 0qLSjwt/GB3FxEvJ42Auq8uZAXvI09bb8fSgQAegRxLtZ90bhOzoeqN55ylRkXYQrW
	 DZg6juxpDlpIzJRUADsA5qAcTZZ6wKcFdokoDmVfdN9SzWVSqap9xx11Qr6Mp6JZju
	 GMvY4Unvc9kLw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	"Luke D. Jones" <luke@ljones.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.6] HID: asus: add Z13 folio to generic group for multitouch to work
Date: Sat, 25 Oct 2025 12:01:26 -0400
Message-ID: <20251025160905.3857885-455-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Antheas Kapenekakis <lkml@antheas.dev>

[ Upstream commit b595974b4afe0e171dd707da570964ff642742e3 ]

The Asus Z13 folio has a multitouch touchpad that needs to bind
to the hid-multitouch driver in order to work properly. So bind
it to the HID_GROUP_GENERIC group to release the touchpad and
move it to the bottom so that the comment applies to it.

While at it, change the generic KEYBOARD3 name to Z13_FOLIO.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis, here is my recommendation:

## Backport Status: **YES**

### Summary of Analysis

This commit fixes a hardware functionality bug where the multitouch
touchpad on the ASUS ROG Z13 folio does not work. The fix is a textbook
example of a stable tree backport candidate.

### Technical Understanding

**What Changed:**
1. **drivers/hid/hid-asus.c (lines 1387-1421)**: The device entry for
   Z13 folio (device ID 0x1a30) was moved from the middle of the device
   table to the bottom, and crucially changed from:
  ```c
  HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
  USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3)
  ```
  to:
  ```c
  HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_ASUSTEK,
  USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO)
  ```

2. **drivers/hid/hid-ids.h (line 226)**: Renamed the constant from
   `USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3` to the more descriptive
   `USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO`

**Why This Matters:**
- The Z13 folio is a composite USB device with both a keyboard and
  multitouch touchpad
- `HID_USB_DEVICE` expands to `.bus = BUS_USB` without specifying a
  group, so it matches **all HID groups**
- `HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, ...)` explicitly restricts
  binding to only `HID_GROUP_GENERIC`
- The multitouch touchpad presents itself as `HID_GROUP_MULTITOUCH` or
  `HID_GROUP_MULTITOUCH_WIN_8`
- When hid-asus binds to all groups, it prevents hid-multitouch from
  binding to the touchpad
- By restricting hid-asus to `HID_GROUP_GENERIC` (keyboard), hid-
  multitouch can properly handle the touchpad

### Evidence of Correctness

1. **Established Pattern**: This exact fix was applied to the T101HA
   keyboard in 2021 (commit a94f66aecdaa4). The commit message for that
   fix explicitly states: *"The hid-multitouch hiddev has a group of
   HID_GROUP_MULTITOUCH_WIN_8, so the same result can be achieved by
   making the hid_device_id entry for the dock in the asus_devices[]
   table only match on HID_GROUP_GENERIC"*

2. **Wide Usage**: Verified that `HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
   ...)` pattern is used extensively in:
   - hid-asus.c (T101HA at drivers/hid/hid-asus.c:1422)
   - hid-google-hammer.c (9+ instances)
   - hid-ite.c (4+ instances)
   - hid-lenovo.c (5+ instances)

3. **Device History**: The Z13 keyboard was originally added in v6.5
   (commit 74e47b2c52ed4) using HID_USB_DEVICE, which inadvertently
   prevented the touchpad from working. This commit corrects that
   oversight.

4. **Author Credibility**: Antheas Kapenekakis has 15+ kernel
   contributions focused on platform/x86 and HID subsystems, including
   other Z13 fixes. The patch was reviewed by Luke D. Jones, the
   original author of Z13 support.

5. **Comment Alignment**: The commit moves the entry below an existing
   comment (lines 1415-1418) that explicitly explains: *"Note bind to
   the HID_GROUP_GENERIC group, so that we only bind to the keyboard
   part, while letting hid-multitouch.c handle the touchpad."* This
   comment now applies to both T101HA and Z13 folio.

### Risk Analysis

**Minimal Risk:**
- **Isolated Scope**: Only affects ASUS device ID 0x1a30 (Z13 folio)
- **No Dependencies**: Standalone fix with no prerequisites
- **No Architectural Changes**: Uses existing, proven pattern
- **Verified Pattern**: Multiple similar devices use this approach since
  2021 without issues
- **Clean Rename**: Old constant name completely removed, no lingering
  references found

**Regression Potential:**
- Extremely low - the change makes a non-working touchpad work
- Users without this fix have a broken touchpad; users with it have
  working touchpad
- The keyboard functionality is unaffected (same quirks applied)

### Stable Tree Criteria Assessment

✅ **Fixes important bug**: Multitouch touchpad completely non-functional
✅ **Small and contained**: 2 files changed, device ID rename + entry
repositioning
✅ **No architectural changes**: Uses established HID group filtering
pattern
✅ **Minimal regression risk**: Proven pattern, isolated to one device
✅ **Confined to subsystem**: HID subsystem only
✅ **Applies to stable**: Any stable kernel >= 6.5 (where Z13 support
exists)

**Note**: While the commit lacks a `Cc: stable@vger.kernel.org` tag or
`Fixes:` tag, it clearly meets stable tree criteria and should be
backported to all stable kernels that contain the original Z13 support
(6.5+).

### Conclusion

This is an **unambiguous YES** for backporting. The commit:
- Fixes real hardware (touchpad doesn't work without it)
- Uses a well-tested, 4+ year old pattern
- Has minimal risk and isolated impact
- Comes from a credible contributor
- Was reviewed by the original device maintainer

This should be backported to all stable trees from 6.5 onwards where the
Z13 folio device support exists.

 drivers/hid/hid-asus.c | 6 +++---
 drivers/hid/hid-ids.h  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 8db9d4e7c3b0b..a444d41e53b6c 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1387,9 +1387,6 @@ static const struct hid_device_id asus_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
-	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
@@ -1419,6 +1416,9 @@ static const struct hid_device_id asus_devices[] = {
 	 * Note bind to the HID_GROUP_GENERIC group, so that we only bind to the keyboard
 	 * part, while letting hid-multitouch.c handle the touchpad.
 	 */
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
 	{ }
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index ded5348d190c5..5721b8414bbdf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -223,7 +223,7 @@
 #define USB_DEVICE_ID_ASUSTEK_ROG_KEYBOARD3 0x1822
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD	0x1866
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
-#define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3	0x1a30
+#define USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO		0x1a30
 #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
 #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X		0x1b4c
-- 
2.51.0


