Return-Path: <linux-input+bounces-16060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC7FC54E18
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 01:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE8E74E0607
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 00:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874D378F2E;
	Thu, 13 Nov 2025 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdGTDT0F";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hak9tl3H"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496FE35CBBF
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762992920; cv=none; b=cPt/C9UN71UTW+NvSAYnuUG+aDjN1jgjgS6X6LLYME02FtapJSd2zfnY9dPs4U6iOhOrl9guA1Yh1MKLMMq+4e316DAuEy3VwnXM4io44D0FPhoFTR5nc50Lj59ISjYKVMsx8g9iRkszaH2y8Cvzw/SRe+6grUT5GrF0pOxfGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762992920; c=relaxed/simple;
	bh=Y2vNdC1fdOKu3WTqJ+2BAwZop7f2ruuqCfhWlmWdCpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Np527DNcsq4yNg+bx6ldnAMy6hr+vkm4kNTejrz7aZYWQy38URrukmXKjPrCoTOvL3+I+AKeuf4oiTAHAaPtM40eRl4/Sw7B6T8wHfk5o5D9TPrcOK7jg8Fz/iALZ6K9X0zLO9CNvMy0nTkP3r2FlhDhlorrJQjAsL2DOqf1lWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdGTDT0F; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hak9tl3H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762992917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S5ZzKSnFFTV49zcwyI0NhobHlfLAH6ZslL6z8Bt9IdY=;
	b=VdGTDT0FEfb2TVpckselWA4l7oaInX4dceb3rrH0lTnFTCoEq5/eG7kHc14X8XyPIQylza
	aexhOBSTUVGmaxEyN8k6v/FBgjyUvxROPTs8i5L8ykDsbBrRTTefsSeGgTLtbJujcsFfjp
	btQY9cAhN3jL8JsB1sH8zsPFvpA+q38=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-g8hK_HvkNtC9Xu-ISz7VXg-1; Wed, 12 Nov 2025 19:15:15 -0500
X-MC-Unique: g8hK_HvkNtC9Xu-ISz7VXg-1
X-Mimecast-MFC-AGG-ID: g8hK_HvkNtC9Xu-ISz7VXg_1762992915
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47106a388cfso1291615e9.0
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 16:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762992914; x=1763597714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5ZzKSnFFTV49zcwyI0NhobHlfLAH6ZslL6z8Bt9IdY=;
        b=Hak9tl3HfVENXTxSUJJGKA9iOm0t4MxGxEr2zGL3CBYki92ZR+gXy/vTxeSsoUlRx6
         pui9VNjqvwJMNn6mXjD2ZyBiiY7GrXOtgGc0oQ3W+QXI1MsUvw1YGMy3HX9noFRPDC69
         lYtvGgWR7ND7Y54ZOXxXsYH+CBA19jdHzs5TnLgt6+8UXkMkEMTBfkTYrV086FrpFG9d
         VoAkpRkLe1YpyYbFNq1U/gNiu1P7fudKaNEQT6UYkLK2zNi4uBdPpSnHNR7d+/BKxTMe
         E7GfVYblThw+cq0jCPCtRpSwG7tOgvV1cFUjYm0ZC0WcRnPe/ePHzJKtbhSiEocx9zi7
         wtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762992914; x=1763597714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5ZzKSnFFTV49zcwyI0NhobHlfLAH6ZslL6z8Bt9IdY=;
        b=E3ePKo5AlzAxK7BvkZvP4s7pLhie7ywnrYcMlCyd0O9vBBzvMhJOkRxNTnivyNl/C2
         gJ+V3VXKS9Xmx6IbHtpoU9l/AQKw2QZlalk7yV9SOVKB8FUpdjcKY6iRvNJcq6zZlwh5
         Y12yLI3i89Gz4o0dtMvlUhcqbS4e0yxTrLjmnjS7rXOODpyrFjBPSyV2kNdnLBYDMCKt
         RkJxHMpKFAmeBcoCtT9EOBqdAPJhJRlPQfzlin2EnGwvZgv/6epDz/mzUS2BOaFPi4uT
         K0Nw9uCzUi5a82C0DI8HTdmhjacEBbAQt9Cs4RQNg63EFoBgXVvxhsQkTPvHQGhoSLPB
         Z+7A==
X-Gm-Message-State: AOJu0Yy6bjRA4dLJ9KbA7I6o7Dsr2LaEK9MdRYwCnZDISdfCb/zHkfvg
	1NjZq7bcRoxivbxn0dqy6hb/QAyvVJV7MHqoHx1TEYeX7HHUlp2anbQy9OIPPPQZongvWuMYWHP
	ENX7UAGsJ/aN77KFnHYs4KpHJBLFHaN+qnYwcc4m9HMH1bgpvdZOA7IWAmqMjiG08wKuUX5xBtW
	Z/d5KsCl6EvDO9tetiEAHZdhVc6Jm33/r+rkr5MNpu0QkKMGy0
X-Gm-Gg: ASbGncsAptbX/aAk0lLWeuE+srzt7fYXrCUzKbVPcMuCIDSlWBTXOD4iyMDa0w1tUmP
	y5oTREIM6Rl0fjpUnA7jtGllyjuYB40e6sijecTXBO+401rW+mSicqhUatbR/kwGWh8GFe5Kq7q
	VjKOvbZi9URML6dIJ7gZmKreLeX0A3wwA5QetiftlpAQH8+TEI5wRltWCHxW6elrdOXeRpBcL0T
	G9Z+bW0ZSiHWFQGS33oeNmtn0kw9OJLL7HFvLJPQ2ZBB5vs33ceWQ7NppTyU4K2PobAEZs2b/hO
	dqOMzvkPuhqblOY3mlUi38lO1Guy0RtAmT/jRdMHKNHSlM8TfGTvXbAIFfsM3r10DzuMqkkfnB9
	ucT7HuNHsfS7D2Q==
X-Received: by 2002:a05:600c:26d1:b0:477:8985:4039 with SMTP id 5b1f17b1804b1-4778a01e47amr18495765e9.17.1762992914343;
        Wed, 12 Nov 2025 16:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsg4jnVOYbGrqvgUk0lx0gs2mkXOnVysczE7+VU6Cs7eKvrQLn4nazsZcHyX8z1XVsxBjKGA==
X-Received: by 2002:a05:600c:26d1:b0:477:8985:4039 with SMTP id 5b1f17b1804b1-4778a01e47amr18495595e9.17.1762992913810;
        Wed, 12 Nov 2025 16:15:13 -0800 (PST)
Received: from sissix.lzampier.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b589sm432983f8f.23.2025.11.12.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 16:15:13 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH v2 0/3] HID: Add support for multiple batteries per device
Date: Thu, 13 Nov 2025 00:15:02 +0000
Message-ID: <20251113001508.713574-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC introduces support for multiple batteries per HID device, addressing
a long-standing architectural limitation in the HID battery reporting subsystem.

## Background

The current HID implementation explicitly prevents multiple batteries per device
through an early return in hidinput_setup_battery() that enforces a single-battery
assumption. Linux treats peripheral batteries (scope=Device) differently from system
batteries, with desktop environments often displaying them separately or ignoring
them entirely. However, this design doesn't account for modern multi-battery hardware patterns.

## Problem Statement

Multiple battery scenarios that cannot be properly reported today:

1. Gaming headsets with charging docks (e.g., SteelSeries Arctis Nova Pro
   Wireless) - headset battery reported, dock battery invisible
2. Graphics tablets with stylus batteries (Wacom) - requires driver-specific
   workarounds
3. Wireless earbuds with per-earbud batteries plus charging case
4. Multi-device receivers (Logitech Unifying) - requires proprietary HID++
   protocol parsing

This forces manufacturers to use proprietary protocols and vendor-specific
software. Community projects parse USB packets directly because standard HID
battery reporting cannot handle multi-battery scenarios.

## Why This Matters

The current limitation creates a cycle: OS lacks support, so manufacturers
implement proprietary protocols, which makes vendor software necessary, which
reduces pressure to fix the OS limitation. Improving HID core support for
multiple batteries would enable standardized reporting, reduce the need for
vendor software, improve OS integration, reduce driver duplication, and provide
a foundation for future multi-battery devices.

## Proposed Solution

This series introduces struct hid_battery to encapsulate individual battery
state, refactors the code to use this structure internally, and adds support
for multiple batteries tracked in a list within struct hid_device. Batteries
are identified by report ID. The implementation maintains full backwards
compatibility with existing single-battery code.

## Testing

Tested with split keyboard hardware (Dactyl 5x6) using custom ZMK firmware
that implements per-side HID battery reporting. Each battery (left and right
keyboard halves) reports independently through the power supply interface with
distinct report IDs (0x05 and 0x06).

Test firmware available on my personal fork at:
https://github.com/zampierilucas/zmk/tree/feat/individual-hid-battery-reporting
If this series gets merged, these changes will be proposed to upstream ZMK.

HID descriptor and recording captured with hid-recorder:

D: 0
R: 162 05 01 09 06 a1 01 85 01 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81 02 05 07 75 08 95 01 81 03 05 07 15 00 25 01 19 00 29 67 75 01 95 68 81 02 c0 05 0c 09 01 a1 01 85 02 05 0c 15 00 26 ff 0f 19 00 2a ff 0f 75 10 95 06 81 00 c0 05 84 09 05 a1 01 05 85 85 05 09 44 15 00 25 01 35 00 45 01 75 08 95 01 81 02 09 65 15 00 25 64 35 00 45 64 75 08 95 01 81 02 c0 05 84 09 05 a1 01 05 85 85 06 09 44 15 00 25 01 35 00 45 01 75 08 95 01 81 02 09 65 15 00 25 64 35 00 45 64 75 08 95 01 81 02 c0
N: ZMK Project Dactyl 5x6
P: usb-0000:2d:00.3-4.2/input2
I: 3 1d50 615e
D: 0
E: 0.000000 3 05 00 56
E: 0.000977 3 05 00 56
E: 1.490974 3 06 00 52
E: 1.491958 3 06 00 52
E: 6.492979 3 06 00 53
E: 6.493962 3 06 00 53

The recording shows both batteries reporting with different charge levels
(Report ID 05: 86%, Report ID 06: 82%-83%), demonstrating the multi-battery
functionality. This can be used to verify UPower compatibility.

## Future Work: Userspace Integration

As suggested by Bastien, semantic battery differentiation (e.g., "left
earbud" vs "right earbud") requires userspace coordination, as HID
reports typically lack role metadata.

This will require:
1. systemd/hwdb entries for device-specific battery role mappings
2. UPower updates to enumerate and group multi-battery devices
3. Desktop environment changes to display batteries with meaningful labels

This kernel infrastructure is a prerequisite for that userspace work.

## Request for Comments

Is list-based storage appropriate or would another structure work better?
Should we support usage-based identification in addition to report ID for
devices using the same report ID? Is sequential naming (battery-N) sufficient
or should batteries have semantic role identifiers like "main", "stylus", "dock"?

To HID maintainers (Jiri Kosina, Benjamin Tissoires): Does this belong in
hid-input.c or should it be separate? Any concerns about the backwards
compatibility approach? Meaning, should I have removed the whole
dev->bat legacy mapping and use the new struct?

To power supply maintainers (Sebastian Reichel): Any issues with multiple
power_supply devices from a single HID device?

Related commits:
- c6838eeef2fb: HID: hid-input: occasionally report stylus battery
- a608dc1c0639: HID: input: map battery system charging
- fd2a9b29dc9c: HID: wacom: Remove AES power_supply after inactivity

Community projects demonstrating the need:
- HeadsetControl: https://github.com/Sapd/HeadsetControl
- Solaar: https://github.com/pwr-Solaar/Solaar
- OpenRazer: https://github.com/openrazer/openrazer

Lucas Zampieri (3):
  HID: input: Introduce struct hid_battery
  HID: input: Refactor battery code to use struct hid_battery
  HID: input: Add support for multiple batteries per device

Changes in v2:
- Split the monolithic v1 patch into three logical patches for easier review:
  1. Introduce struct hid_battery (pure structure addition)
  2. Refactor existing code to use the new structure (internal changes)
  3. Add multi-battery support (new functionality)
- Added detailed testing section with hardware specifics
- Added hid-recorder output (dactyl-hid-recording.txt) demonstrating two-battery
  HID descriptor for UPower validation
- Added "Future Work: Userspace Integration" section addressing Bastien's feedback
  about semantic battery differentiation
- Added hardware examples with product links to commit messages (per Bastien's
  suggestion)
- No functional changes from v1, only improved patch organization and documentation

 drivers/hid/hid-core.c  |   4 +
 drivers/hid/hid-input.c | 196 +++++++++++++++++++++++++++-------------
 include/linux/hid.h     |  42 ++++++++-
 3 files changed, 179 insertions(+), 63 deletions(-)

--
2.51.1


