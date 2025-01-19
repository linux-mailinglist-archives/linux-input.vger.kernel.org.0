Return-Path: <linux-input+bounces-9382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95257A161EB
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39333A1A6E
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162CD1DE8A3;
	Sun, 19 Jan 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIK+2Xz+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487BE2AE8B;
	Sun, 19 Jan 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292444; cv=none; b=u6KNvtmEVGQx7f+2j38g1P7zToVtv8HSoyYDKs7S0TsqcUWS/xN0DG5AZgS7BA8tn//5XablORowGwfKz2G8q8dSwJjX7xHcQzST9iefNAMgI57yRgBbOL99rOmev3HEiX8jVUC4Hz59BDg+gcvhrM8x40F5qXZWWdlAZ4gggEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292444; c=relaxed/simple;
	bh=/0sanPax6D8fmC6Urc4LaajWqV3AZ86MO3erqhfTd0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lyYxvdAM47cG4qIJgLJuEq6a6xA80A2MJ4G9aqA37HewpEr5FP6J17CGSKkS1TyGMS4Fvl/OuY3uoKYHCPpht1SJXiBIGXbaODqv0hxKdvgbD5jkNl+2YLk6RzHgBAQSwWzYGx5BJusJ/n6Y2ZXRmoCtmyFufGsaFS/hieuTYCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIK+2Xz+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d9838496efso543477a12.1;
        Sun, 19 Jan 2025 05:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292440; x=1737897240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgazUt4RieoeezpLUrrmXaBuZIJXIT2N26A7Bji9FZs=;
        b=mIK+2Xz+DFSxY/8TOdYL/t/sjr9gx7VAubuwnhluccbRrwTFOYldCjBt8vYxBFkOOw
         tOGYlEWieUlDiOBLGlkKxjfbfyjJUJN2yqXtqTAQM/l6UwwmX5vuOZe8nrpHkV7xyrfm
         59lVsV7bC9ekrI4MOn9LTtfLeg6Ao0eRzDg/1EvWToNpT2phNIGnKlJafhxq4uglJvuO
         4ARioY2YxYb1p1Qs4GkdgTKjGvtIYbd9PLVorpAgOygO4UsOlw4ICsG9GSu+0QKZSuNa
         4hr4XthjD4qJaBj0fk+TWOenn8KqLD8LyrDULGNn1hy2Irn4BFVjjMUhbuWWZEpNsMS6
         j05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292440; x=1737897240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgazUt4RieoeezpLUrrmXaBuZIJXIT2N26A7Bji9FZs=;
        b=noiBZ2PtGyETURWyRQObggdusq0wJZiWgXtPVhGsE4ZktGOS+rllpeHtQAfQWjPaQI
         8KTLsXotEd1TKEucAlu7jzh8xTPE7mx60Gx4IAkwgjKx7BxBSZLxGudlxVecX/23dCw5
         tEnLYSYdXFjCltZRPjdo59Mhkmuc7JyySLgiK/fJm5bLqjofQ9Kg8CiG1zxrDuTJND43
         mNe76zEVHLtYA0yd4DRV1ZKBOvn7x15Xw7jDSTh1axtVcSkRFMDh8ynEEuILIjciLtXl
         7/veF5qKzHXXHELy7isMghhmLJ2NadtK4MnwrIuxqRzhvRxQETxGFUc21sCRGejAtmkv
         Aa2g==
X-Forwarded-Encrypted: i=1; AJvYcCW2c7XHUQHyaCLtAugsich9gRi5RJxKEoLtSb4dVrhQnEzdqZ6c4kR/3VgD5J0pXtjjg4o06y1QrpX5@vger.kernel.org, AJvYcCXnKDP7xBWoGKOV3rxQIWYs8lidZkUOhNrW/gIMqziGuVqhE+vlgxB8Ge3yJhoy7Vlvr1K+C0sgVEi90w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnVjicldcr0Zhm5DSAmd5Oa0UqwzAKZssipRRJhyqOeo/kB97
	tbTJQEXpZ1mwSqmy3j7zzLRjnoaTAOOXIDIx7DknEFncGxrPvlYq
X-Gm-Gg: ASbGncuz3v7PF9Jd8FAzsU2mKrXs8QlKKCArIUwTOPIijN0y/1BOEnLatdfaOq0T0Sa
	tCvir25St28ShrCKZmlyTIrZLplgbAtm1fB/WEVXD/DJ6u6JHO2bOP6LfsSBqBjVI6An7hyM7pz
	k3vPEEW3w4QUAY/u3pOECeSzfeMaUK43JTpC3S506jpcBxGgbAYVdAPmPfZCG1esEmCF20l2SyV
	HXwOVU4/JlqPV47uBnbI1xRHth/IcYfe0J9vJdb+gw/zi8g067428XAXArlSyrr3kbBZ+Tizmui
	t0nQAdEgWOMJR5KfLk072GBc7NZX7xHBpTDs58Eib/awsu1mPqk=
X-Google-Smtp-Source: AGHT+IEX5t9frkSAXjlXdAq1ZS5vFQafPbggFjlSO2zVFZMmfnozjE5UINNnPUMOyKunhBGv7arN7A==
X-Received: by 2002:a17:907:3f14:b0:aa6:a5cc:ed6b with SMTP id a640c23a62f3a-ab38b1e604cmr327945166b.2.1737292440052;
        Sun, 19 Jan 2025 05:14:00 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:13:59 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 00/12] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Sun, 19 Jan 2025 14:12:51 +0100
Message-ID: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is focused on improving the compatibility and usability of the
hid-pidff force feedback driver. Last patch introduces a new, universal driver
for PID devices that need some special handling like report fixups, remapping the
button range, managing new pidff quirks and setting desirable fuzz/flat values.

This work has been done in the span of the past months with the help of the great
Linux simracing community, with a little input from sim flight fans from FFBeast.

No changes interfere with compliant and currently working PID devices.

I'm not married to the name. It's what we used previously, but if "universal" is
confusing (pidff is already the generic driver), we can come up with something
better like "hid-quirky-pidff" :)

---
Changes in v2:
- Fix typo in a comment
- Fix a possible null pointer dereference when calling hid_pidff_init_with_quirks
  especially when compiling with HID_PID=n
- Fix axis identifier when updating fuzz/flat for FFBeast Joystick
---
Changes in v3:
- Fixed a missed incompatible pointer type while assigning hid_pidff_init_with_quirks
  to init_function pointer (void -> int)
- Improved Kconfig entry name to adhere to the alphabetical order of special
  HID drivers
- Extended cover letter
---
Changes in v4:
- Added PXN devices and their hid ids
- Added hid-universal-pidff entry in the MAINTAINERS file
---
Changes in v5:
- Added PERIODIC_SINE_ONLY quirk

Tomasz Pakuła (12):
  HID: pidff: Convert infinite length from Linux API to PID standard
  HID: pidff: Do not send effect envelope if it's empty
  HID: pidff: Clamp PERIODIC effect period to device's logical range
  HID: pidff: Add MISSING_DELAY quirk and its detection
  HID: pidff: Add MISSING_PBO quirk and its detection
  HID: pidff: Add MISSING_DEVICE_CONTROL quirk
  HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
  HID: pidff: Add FIX_WHEEL_DIRECTION quirk
  HID: pidff: Stop all effects before enabling actuators
  HID: Add hid-universal-pidff driver and supported device ids
  MAINTAINERS: Add entry for hid-universal-pidff driver
  HID: pidff: Add PERIODIC_SINE_ONLY quirk

 MAINTAINERS                       |   6 +
 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  29 +++++
 drivers/hid/hid-universal-pidff.c | 191 ++++++++++++++++++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 203 ++++++++++++++++++++++--------
 include/linux/hid.h               |   9 ++
 7 files changed, 404 insertions(+), 49 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c

-- 
2.48.1


