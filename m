Return-Path: <linux-input+bounces-16984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 430EED13681
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 97F263023B65
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 15:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087D62E92BA;
	Mon, 12 Jan 2026 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCEjKfVj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76632DF6F4;
	Mon, 12 Jan 2026 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229961; cv=none; b=Mb0bucN/WdrX+SypFW2WBGI4yl9SwpzbKS104r8AbVmfniAKts6+h9vteNGdhBcxv7RfWkfG31d4MrLopNiyVoVPanKon2AOuBwg2m33Kw2Im9d9XG3CZZP+p4RvUPlQoGP88/Xc7MiNdyCw5vRlPnwCTSNq4jyL0M2WRveFx3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229961; c=relaxed/simple;
	bh=BuWmwzZBgVbZzKtXVjoa4UF2cg+4GqjkbsAmVSu1kGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fcDqrf0aicvkgwul4KML/XP8+WAeZvGgDRnNDYQge3WWy/rLjB4a3V+udnZFWahHYfil+tow6B2FyKh+kOtDJKERygJZoOpECoe/G7FL9csW2oVUuvOcG08ih3jIpd9Y2ExZrPFgiwJiurR14PyzLe8U6rcqEK5s4cX5MwMWJDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCEjKfVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9B9C19425;
	Mon, 12 Jan 2026 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229961;
	bh=BuWmwzZBgVbZzKtXVjoa4UF2cg+4GqjkbsAmVSu1kGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TCEjKfVjfS/AB03JW3h1z370cHkSLJWSgo+a3iV7Cg7ph3FQy2f4iA8fR/N62afX4
	 p3ixa9AtAi5LYtCoPyfYYB6YNQaSrw3NP3Iz283s1QzV7iLPUJ6QpIxlVwrawjroLu
	 BPJHEXcWxoYYwOKp1Vmni1rLQXFg+F+UCz3KEqTzVTDsExHNDP7TDYXpGJcIHM+UBF
	 OYCNopDWZvOfIRn6t0Vd8AUDRWnFHYfSjdKC6lSVLKjQn+aCZD1DjX6KBQbLHi0v2X
	 znZgm3ThkeK18n0E9HBXGRwY6D6GX6kWudZqbIBkm52qXvJ4vkxuabnskrUhN0Ijs/
	 Hkpmm3sS6WH3g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dennis Marttinen <twelho@welho.tech>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.12] HID: logitech: add HID++ support for Logitech MX Anywhere 3S
Date: Mon, 12 Jan 2026 09:58:24 -0500
Message-ID: <20260112145840.724774-23-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112145840.724774-1-sashal@kernel.org>
References: <20260112145840.724774-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dennis Marttinen <twelho@welho.tech>

[ Upstream commit d7f6629bffdcb962d383ef8c9a30afef81e997fe ]

I've acquired a Logitech MX Anywhere 3S mouse, which supports HID++ over
Bluetooth. Adding its PID 0xb037 to the allowlist enables the additional
features, such as high-resolution scrolling. Tested working across multiple
machines, with a mix of Intel and Mediatek Bluetooth chips.

[jkosina@suse.com: standardize shortlog]
Signed-off-by: Dennis Marttinen <twelho@welho.tech>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of HID: logitech: add HID++ support for Logitech MX Anywhere
3S

### 1. COMMIT MESSAGE ANALYSIS

**Subject:** "HID: logitech: add HID++ support for Logitech MX Anywhere
3S"

The commit message explains:
- Author acquired an MX Anywhere 3S mouse that supports HID++ over
  Bluetooth
- Adding PID 0xb037 to the allowlist enables additional features (high-
  resolution scrolling)
- Tested on multiple machines with Intel and Mediatek Bluetooth chips
- Has proper sign-offs from author and maintainer (Jiri Kosina)

No `Cc: stable` or `Fixes:` tags are present, but as noted, that's
expected for commits undergoing manual review.

### 2. CODE CHANGE ANALYSIS

The actual change is minimal:

```c
+       { /* MX Anywhere 3S mouse over Bluetooth */
+         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb037) },
```

This adds exactly **2 lines** - one comment and one device ID entry to
the `hidpp_devices[]` table. Looking at the context, this table already
contains many similar Logitech Bluetooth device entries:
- MX Master (0xb012), MX Master 2S (0xb019), MX Master 3 (0xb023), MX
  Master 3S (0xb034)
- MX Anywhere 3 (0xb025), MX Anywhere 3SB (0xb038)
- M720 Triathlon (0xb015), MX Ergo (0xb01d), MX Vertical (0xb020), etc.

The new entry follows the exact same pattern as all existing entries.

### 3. CLASSIFICATION

This is a **NEW DEVICE ID** addition - one of the explicitly allowed
exception categories for stable kernels:

> "Adding PCI IDs, USB IDs, ACPI IDs, etc. to existing drivers - These
are trivial one-line additions that enable hardware support"

Key points:
- The hid-logitech-hidpp driver already exists in stable kernels
- The HID++ protocol support is fully implemented
- Only the Bluetooth device ID 0xb037 is being added
- This is not a new driver or new functionality - it's enabling an
  existing driver for new hardware

### 4. SCOPE AND RISK ASSESSMENT

**Risk: EXTREMELY LOW**

| Factor | Assessment |
|--------|------------|
| Lines changed | 2 |
| Files touched | 1 |
| Code logic changed | None |
| Complexity | Zero - pure data table entry |
| Subsystem maturity | Very mature (HID drivers) |

This cannot introduce regressions because:
- No code paths are modified
- No functions are changed
- Only users with this specific mouse over Bluetooth are affected
- If there were somehow an issue, it would only affect that specific
  hardware

### 5. USER IMPACT

**Who benefits:** Users with Logitech MX Anywhere 3S mice using
Bluetooth connection

**Without this fix:** The mouse works via basic HID, but lacks:
- High-resolution scrolling
- Battery status reporting
- Other HID++ features that premium Logitech mice support

**Impact level:** The MX Anywhere 3S is a current-generation retail
product that users are actively purchasing. Stable kernel users expect
their hardware to work properly.

### 6. STABILITY INDICATORS

- ✅ Tested by author on multiple machines with different Bluetooth chips
- ✅ Reviewed and signed off by HID maintainer Jiri Kosina
- ✅ Pattern is identical to many existing, working entries

### 7. DEPENDENCY CHECK

**Dependencies:** None

This is a pure data addition. The driver framework already exists in all
stable kernels that have the hid-logitech-hidpp driver. No other commits
are required.

---

## Summary

This commit is a **textbook example of a stable-appropriate device ID
addition**:

1. ✅ **Trivial 2-line change** - Just a device ID added to an existing
   table
2. ✅ **No code modifications** - Pure data entry
3. ✅ **Driver already exists** - hid-logitech-hidpp is well-established
   in stable
4. ✅ **Follows existing pattern** - Identical format to dozens of other
   entries
5. ✅ **Tested** - Verified on multiple hardware configurations
6. ✅ **Zero regression risk** - Only affects users with this specific
   hardware
7. ✅ **Real user benefit** - Enables proper hardware support for
   current-generation product
8. ✅ **No dependencies** - Can be cleanly cherry-picked to any stable
   kernel

The stable kernel rules explicitly allow device ID additions because
they enable hardware support with virtually zero risk. This is precisely
what the "device ID exception" exists for.

**YES**

 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index a88f2e5f791c6..9b612f62d0fba 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4661,6 +4661,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb025) },
 	{ /* MX Master 3S mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb034) },
+	{ /* MX Anywhere 3S mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb037) },
 	{ /* MX Anywhere 3SB mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb038) },
 	{}
-- 
2.51.0


