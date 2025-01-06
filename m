Return-Path: <linux-input+bounces-8962-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0613DA03213
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74EBA3A4E01
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 21:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060A11E04A0;
	Mon,  6 Jan 2025 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeSv8hDU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D421DF27D;
	Mon,  6 Jan 2025 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736199346; cv=none; b=V2f+nJa458ebcwppmoRBxvgAYBaxQp+aafmEJ2uF3Rn4LHRN6CYD000HQQza0W5sEo+PqFhyImgDFaebQR4MtOF4UOWmLyTo6Wykqh6w2YI9g01QKBUERbnblXmlyO724wroTKFKF55UwJZtqMIqDtzYzdA1IodBFStjZeWRry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736199346; c=relaxed/simple;
	bh=COnXpKwm8gRNhCS+oEmyq0/H8C/RH1K+zfJoBYwC8FE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lFD7U/7RhpU6uW1zALen/2ZUSimTCO1E2tX5tsoYHHFgfpRN5IsiH7W06W5E+QZ86Ud6opvXr484ivE8u91VBN25btSLfIK2s+r4LFzormMhi3iLcUQbumY/p+jwTRk8WA0li0BbHlehiUFtE0lI7faYJLCIKvuWgxy61WjOcNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeSv8hDU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d44550adb7so3606022a12.2;
        Mon, 06 Jan 2025 13:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736199343; x=1736804143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ym3/ae1LeYdfyOKSmXEyarv9vMQ9kQfCgENzmyhlyfc=;
        b=UeSv8hDUG9Uip7ddE7Pw5Tr71yVjHmOmtqUPaP/Vo95mOyLxOIMxvofdoNeLSAN6g2
         TZHEKYeCznqPXPBsIP8OXCMLOphPt68xTAojivXMBvqH4acyULT0T7fCBXsGi+vH6Y04
         UlDHHKRNyAl33EViQ3Lq1oE7D/K0AcB+Ia7okMkJUoU9ymC/5VnFpPIyfziKwHQQXNNR
         scTF3nCuTUAGoA4moqqwMoQ8P5izPdz5iBD3PGXvKybbbbjrdymgPNGwPFsUVurned7r
         0Na2Q5gYDkOJoDFkppP+kM4Z43sFd/wXs4miTcQi1m4KpAfy520paPUmx05tRDtuK23D
         XWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736199343; x=1736804143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ym3/ae1LeYdfyOKSmXEyarv9vMQ9kQfCgENzmyhlyfc=;
        b=ZfNDgZ/KWpm0ZGgBY1HV38d4KjC3Qz3dFGWPzeh/axmpAbfV6s8vasfoJ7BJcb8WE9
         L5nEeMCVEFgslWhAmHBR/KFG53912IJxg/VHBULcKrhUFXVYWFXwkNbm5+XhpKu6mPsT
         rQnp5zUs8F/KZizi4SQvG+dIWcCMGfjI04Kuxt5GI28NtsG6wxnFHvf8eVsHt5Onmh2l
         sq/+CNcjl4r0b3cU4MYJPAvSkVx/fUgeOpNvnuWs+sD730TL2no/JvOcZ7TUKQV0II4I
         KNY0Yc3q0pMRU8zPy+WkZnzVCHYdty4dZXgmNhIEqFu9ksx4ps1kw3I+RHOu5LMAF3kp
         3kew==
X-Forwarded-Encrypted: i=1; AJvYcCXV4RrVWPw0O2ejY6PsEMBTKiiL8PV9f1TyVFvHM1bUqrUaI2ra9507WeWLjikgiu0V8P6YTnSqt2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzC7c1WwM6Dqvbpyq5ZsE9L0Qzv9FMVBHnR3DbgvAu1ctUBunr
	7ppaaE+/dTjpHl08DdDW7D9Jlhkih4FPJGFypg1fTUm7oH0QuXehhFpwUbbO
X-Gm-Gg: ASbGnctSvWsyiVJSPpkPYd3Vi9noNQB57X5DMJgz4ssnOBZUskyu3GCdnLJq8olr6zB
	FHiJUbARpwDwx9vZWRoENJL+72G2jrXKbKpDQ0o4+W+xLoFUNcDqpNatb0azKCFVcvOzUIxIJ9v
	oKRumPwet+mOJ9E3hbb/BFmBWigVltWXZgpCf2vZk4gJq3Le8kTb6xWtzbbUB+zJ+Rem3FM5UeN
	SiKfvCEBauYxNrL1zRNSehTL4n4vYIQ+Z8oFAXoZZzQacvGG7mqBFFWVSRjm1enPbJcrSCTEu/1
	UhSoy1QE6Oswg/vn9zNK8uVbjc0=
X-Google-Smtp-Source: AGHT+IFk9xhMbDj1qEGqONtEgbCe5nZXUgDuX803qZE1cNUoM2IpWywwRhHVQi60dUMHHGrjMHpZyg==
X-Received: by 2002:a05:6402:2695:b0:5d0:eb6b:1a31 with SMTP id 4fb4d7f45d1cf-5d81ddacfa5mr18599491a12.5.1736199343254;
        Mon, 06 Jan 2025 13:35:43 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm23375991a12.31.2025.01.06.13.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 13:35:42 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 00/10] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Mon,  6 Jan 2025 22:35:29 +0100
Message-ID: <20250106213539.77709-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
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

I'd love to hear some input on the name, as that's just what we've been using
previously. Maybe something like hid-quirky-pidff or hid-special-pidff would
be better? hid-pidff is already a generic "universal" driver so I don't want to
create any kind of confusion there.

Of course, I could maintain said driver (and help with hid-pidff) but didn't want
to overstep so If I should add MAINTAINERS entry for this driver, let me know.

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

Tomasz Pakuła (10):
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

 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  24 ++++
 drivers/hid/hid-universal-pidff.c | 185 +++++++++++++++++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 200 ++++++++++++++++++++++--------
 include/linux/hid.h               |   8 ++
 6 files changed, 383 insertions(+), 49 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c

-- 
2.47.1


