Return-Path: <linux-input+bounces-16276-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90454C79338
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 14:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3690A4EDBEB
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 13:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C253446BD;
	Fri, 21 Nov 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYRuqCtX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUtc+pIc"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BFC27B358
	for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763730967; cv=none; b=lI2uIa3d2Sw2kWakPxBkRb9iYzvPD/CDZk/t08No88fBNNZSe/Q/spnzXvnNzQFKIPOITMk4JjR924RVTwoRFurCTLCROhgKc2zhNxYnFq1D9cX3LuXyiJS8BYCEsGfrF0WzjJjiS/PiPrd8dzVgy2N4JjP/fv0NSiit1e0SUbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763730967; c=relaxed/simple;
	bh=/BkkE594fUsCyhqJeALSYkKt+a5AF64RFZhX/SXHyvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3LiBI2bsKFdgjQt8NNopvbBf8ypq9WezVOSm0Kdajo1/gr/zF1GmfzC4GUgATRA/mNEHLHGQPtUVGtnONGCN0vUHPlTIbujR/75weNmU+WfbVITjgIhbbfL9BeYRdMGn6i+cdfKN65hyZ5CG0p7XM31hNFblzCZeiBMVTJuREE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYRuqCtX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUtc+pIc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763730964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NoV13vPmiMrtALSrh3dg+PL4CWMVhykeafbLwPzqoD0=;
	b=hYRuqCtXizqG+8HwmXfjYDJo3M6lnBJB9QGU0sXfxoHIeuKOau+s1x8x8y2cNUvSiBJI1m
	8v6I/8dJQ1G50nmC9NKodguyJA5mjFFl/N7PxTqK5WpXw1+gZ1hSPoyB+KhcxM1bmUoO9Q
	dznZfyXYd+1SsND/pNIe+wbR43+or0I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-kBEQROYdMDGfbRKcaek64Q-1; Fri, 21 Nov 2025 08:16:03 -0500
X-MC-Unique: kBEQROYdMDGfbRKcaek64Q-1
X-Mimecast-MFC-AGG-ID: kBEQROYdMDGfbRKcaek64Q_1763730962
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47106720618so18883165e9.1
        for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 05:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763730961; x=1764335761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoV13vPmiMrtALSrh3dg+PL4CWMVhykeafbLwPzqoD0=;
        b=aUtc+pIcA0AuETAKeGRz2ebFkgGweztCMKL3DUVaKbmfmsrO3kK6V+RRQdtqoxGAN4
         6YjAn+nrG96+JNreU+gJPgzVyIn6DFyIlTcZuCSQPj9r4g1AjUu43Y6lXBYqtoMFFFZw
         SdLn6c1p1kZCuKcygimew4pb8zo7qIDcmkLK90ov1sNA3nCbKKsH2jaklokkfLJy7acJ
         xK4stUMlKU/0UU8xPv8KM7BocAfuaIqa1P/WzUJCptIDP6aqUvYY1h8IfpwCKG1VLnin
         oP/EYTMi767yi0m4gtp254R0pVx56BwLwYwCKoPd57PZWFuhd17kssh6Msdk5b7GvAtM
         iJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763730961; x=1764335761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoV13vPmiMrtALSrh3dg+PL4CWMVhykeafbLwPzqoD0=;
        b=uWrJkgYrCDhzVQIsic2TjzmKP7LH91o1/5PfE2ePYlqqMEZq2ApSVr7BTHajxkFpD3
         7+ECOwK7CwnY7QOUipQhWPWKqpCIWzAri6ITVQRsCBBq6AFwvLoyD1EHHB3NW8UQmroj
         VemrGjKPnvotWQRw60ItzUksC2oF7KISeOhSpzSrRg1xWaOpzTQnFp8tRxJsMGJCsmlb
         pvS6thd9XmKdzNj5JC070kvBRS4w9+50fCx1CHNcwZSiNFVg98k88I0BglMCNFIiYHbj
         8PqcCmsqsp++NFRLODxmI6itVpgx625f3R9sagN8eQVD5KDeuSk/Jpn8nbny5ogxgGV6
         WIpg==
X-Gm-Message-State: AOJu0YxJsnSkr/eR5XzTD6bwJD2LZkXsXXccQkfGwLoU87+u/trpIqbv
	ZVy/GosmA6f8paAJM0gIpJwQWEVYOARaxZFJEx3tFKpORmGSblFW6VXeCML4xXrsZJl5PxRm4dz
	3Yn7y7Kq8Naa3oaKJNxbVwYhTuNDLBX/q6hKijLxIY0BD9i0QyITtIn8i9KfBYDLMh4aJI6U+A2
	T/vP1yJ/AfHUJHs1P8eeGl7eLsW4V5kBiofZDfSEJwvq/qQgA1
X-Gm-Gg: ASbGncv5Z0GGb/YDlNpjKit4L9hfdmxyxTApbhEGyKWjsFpOsvrOziqkyY9SGLuZeLh
	bAHyjZsJz4sSUKqjnmQRtx8gLuPlhoSEr0HlAowOPQpiNrX0pB8Uz9RZr8Rt4Q/6UOGp3wd7ZWh
	eFtzzV332vC71eimAM3c70w53w2uWdDSonafrtjcA5e4fdt0ueuP5oEqVyyVhBmpJlM2OZNkqsq
	YmSjRI8uF0a+XClEC0OSQFlfBZCQWwK/CYkttsoE3DzoWyg/oLQQ9qDC3KPpsDasozFCmdX2LL7
	v34E8Q3V3OFzJCTPoS2b+ohs+p7KvKdFBGKDGBjdAj/yflpUtrVoV/Z/pBdWB5F38A8BmRpHVnb
	1oE3xgRjyPl1xsuZsRH0Raz89+TivcGLx90YkJdcV8AKMq09PiFSKZ/iv2kLqN83FSDuZWV4GO0
	Jc7y4OLJk=
X-Received: by 2002:a05:600c:524d:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-477c01d44b4mr23367175e9.19.1763730961380;
        Fri, 21 Nov 2025 05:16:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH38SwZ2eHrnA/qn6RywfYYxZgssOuXSgUXr55RXUG+E7Ys6uTWIB70tz3uWlfOu0NYvDj5qA==
X-Received: by 2002:a05:600c:524d:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-477c01d44b4mr23365825e9.19.1763730959338;
        Fri, 21 Nov 2025 05:15:59 -0800 (PST)
Received: from sissix.redhat.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3ba1b4sm43077435e9.15.2025.11.21.05.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:15:59 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 0/2] HID: Add support for multiple batteries per device
Date: Fri, 21 Nov 2025 13:15:52 +0000
Message-ID: <20251121131556.601130-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for HID devices with multiple batteries.

Currently, the HID battery reporting subsystem only supports one battery per
device. There are several devices with multiple batteries that would benefit
from this support:
- Gaming headsets with batteries in both the headset and charging dock
- Wireless earbuds with per-earbud batteries plus charging case
- Split keyboards with per-side batteries

## Proposed Solution

This series introduces struct hid_battery to encapsulate individual battery
state, replaces the old battery fields with a list-based approach, and adds
support for multiple batteries tracked within struct hid_device. Batteries
are identified by report ID and named as hid-{uniq}-battery-{id}. The
implementation is fully backwards compatible with single-battery devices
through a helper function. The series first converts the battery code to
devm_* as preparatory cleanup, which simplifies the subsequent refactoring
and reduces risk of memory management bugs.

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

Lucas Zampieri (2):
  HID: input: Convert battery code to devm_*
  HID: Refactor battery code to use struct hid_battery and add
    multi-battery support

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>

Changes in v5:
- Split the monolithic v4 patch into two logical patches as suggested by
  Benjamin, devm_* conversion, then struct refactor and multi-battery support
  combined

Changes in v4:
- Added missing hidinput_update_battery() stub in #else block for
  CONFIG_HID_BATTERY_STRENGTH=n builds
- Reported-by: kernel test robot <lkp@intel.com>
- Closes: https://lore.kernel.org/oe-kbuild-all/202511201624.yUv4VtBv-lkp@intel.com/

Changes in v3:
- Squashed the three v2 patches into a single patch as suggested by
  Benjamin
- Removed all legacy dev->battery_* fields, using list-based storage only
- Changed battery naming to include report ID: hid-{uniq}-battery-{report_id}
- Converted battery memory management to devm_* for automatic cleanup
- Updated hidinput_update_battery() to take struct hid_battery directly
- Added hid_get_first_battery() helper for external driver compatibility
- Updated hid-apple.c and hid-magicmouse.c to use new battery API
- Simplified cover letter based on feedback

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

 drivers/hid/hid-apple.c      |  10 +-
 drivers/hid/hid-core.c       |   4 +
 drivers/hid/hid-input-test.c |  39 ++++---
 drivers/hid/hid-input.c      | 196 ++++++++++++++++++-----------------
 drivers/hid/hid-magicmouse.c |  10 +-
 include/linux/hid.h          |  54 +++++++---
 6 files changed, 180 insertions(+), 133 deletions(-)


base-commit: 8b690556d8fe0ee15151cc37ec49c5bbfe41d5b1
--
2.51.1


