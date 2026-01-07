Return-Path: <linux-input+bounces-16841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BACFEAD0
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65442303B1BB
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF41538B99B;
	Wed,  7 Jan 2026 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTHYxA8M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040638B993
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800556; cv=none; b=WOA3FrRGviD+ynk6vtysV5r+hCfTWzrpH2lq1Ccjw7HEqE+rwIO1J7ZRupzNaWpKiEB2yJ+8iyHieOa5npFrrO5M0nuoPyYd1c0B+flrErD5NB8P8TfIfTMM9Ccw2SZtARkNtqnqekz/0o88VUcqwfxIRL9JE+c943W3lGULsoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800556; c=relaxed/simple;
	bh=x9Hcb0Q3w9zJfuuLZgWxqP+CMVd6u+ZGPiyTAvfaIl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r6tKo+okJC2w+v/NZYakTaI+n1NUboTtuqBP0RoN3yqf52uoGqvSPlHZIPXqqCl1z+k9c3/rr830M81URnoL8JhS12XmyLdtjG3rgoUiPjvThFRFzbb7B0THXLy5v2/3mfHbG5tX941c74SLCJ0K/lUBMsQhtda6zGD6xL1GBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTHYxA8M; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430fbb6012bso1731111f8f.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800553; x=1768405353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU/Yg5TAYVvtXfFxHaN/ydqPCL5J5MgG0h7mnX2Sing=;
        b=CTHYxA8M1XKD6CqCGRiZng4bwdzW6ZVWEPQqHeTgPwhnlYL0pGp6ING+J3K3XMSYHK
         bdSKFlmbczvcmCXDDaVqzNzdwVmXc914IYGHAvTbhyY5a4Iky73vb/sOGz57/7mFJlu4
         /OrOPPb6yQ3UJpcEU3GrrcwKUMR/vVdSP8rdB8G5z7rYWvDrCCoDBmmMqfM/FAxm09Fj
         jN7zdgx3d5QnC9cOzJkJQ5RXc1MTa2oHDbzTSfQ3P/qBcoaIBz+qlCvbb5a+eqmwYD26
         sSeuaA7m6sqpNTVgMtBrHRMPnEyxCcZTxQJjhHGLNWLe0seson+ZJZF2I/EPrvjNGqZO
         8mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800553; x=1768405353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU/Yg5TAYVvtXfFxHaN/ydqPCL5J5MgG0h7mnX2Sing=;
        b=Y0XYujfaGlb8LGDC1m/0sEISfXj9s1wSOtotvE1KyKNbK1BKWw1T3fpjBBNmcGEIh3
         uytrMRT47o7TNZ7TnbHLSkLbeDsopKOB541mt2cXvKILpLE1g27uIz1u2bBk4EBddU2/
         Zu1qbNzPjyKvCfRBQ6xwuCu+5y2Yo9kEREP3IF/czMm3a88QQa/TrHdBqX/4AK08gwEb
         PcifEpnRKgcKxwTdsMwdTj3VwBvo9IlxX5bo6/jlfC0eBt0ejY3eAQwCCGjM10PhYBcj
         bJfOPySEQk7rZXl8++uOlhc/CyHePSMO1EOIf3PZs9ZmmlMgXgT6lTAqxlyzKb3cvtW6
         aJxA==
X-Forwarded-Encrypted: i=1; AJvYcCUexiN2BSC9MK8QsaQAh4kM2dTAamdNwRubgtNRt9UeDHKAxxv+ocFKOMlUWQZuRti0xrg1lZ2i7bt00w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNqgNjQSPxkUj7jNilMf+VjifcV5OndhrAKToYGi3QGgDSbKtc
	5D3dt7/MhKTmblnohjxE0jR27iKAbl91H5yGHMJMlnppbVIddD86CJAL
X-Gm-Gg: AY/fxX6a25cKI7PQjXHGlCT58o2dzHJPUlHCT1QbOVSLezJDIRJCgv6GxFDbkB8MPV6
	0QkhiflpDaJlPA/Y5UZDWPCLU4/hDe4fVHfxhZfg2DenUB63arahXqKJrOMMmpN+DlE8RUcOiB/
	/bOGZ/bGnq87Gzs8s4PEnHKbTWZH2Xs0JzbUh2S52lED/tf2CLUyzo8s+SecsXm/EPkTSVrGE9T
	Tu/zqzHVab8Gr+tBYEpd4wWTH1M6vz0fzKiM6eQAvkcriUn4VBaPbKOkjdFzM+W6JfMj9UV93vD
	4TiahyZTSviB8ZLYDK54PWSUaG9J+kw8sLDXq3Eo1xddrNrPKsf8cCzqsk5I91lm60VtrXnR4+7
	tX/L7okiBOg0zDw79omufeuGqbrlcdZf16WVU2EXzmHTsnYi0ES7U8enysdtGazwZ+EHCY5982R
	IZl8JTdNUIMifrdsQi+fzeRPYO5g69/EumUWPp2O4=
X-Google-Smtp-Source: AGHT+IGNw/PN8GgWUXM0bOrKRqopXBAaWOKCxwLh4cnYpAU9VEZZ5PH53ncCUkfhOrRCsKUd4TTmWg==
X-Received: by 2002:a05:6000:2384:b0:42b:4185:e58a with SMTP id ffacd0b85a97d-432c37758c0mr3571565f8f.14.1767800553135;
        Wed, 07 Jan 2026 07:42:33 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm10897704f8f.31.2026.01.07.07.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:42:31 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v5 0/4] HID: asus: Add Fn+F5 fan control key support for ROG laptops
Date: Wed,  7 Jan 2026 17:42:16 +0200
Message-ID: <20260107154219.164514-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

This series adds support for the Fn+F5 fan control key on Asus ROG
laptops and addresses spurious HID vendor codes that cause kernel log
spam on these devices.

The series introduces:
1. Code cleanup by replacing a magic number with an existing constant
2. Filtering of spurious HID vendor usage codes on ROG laptops
3. Infrastructure for HID-to-WMI communication
4. Fn+F5 fan control key handler with userspace fallback support

The Fn+F5 key handler attempts to forward events to asus-wmi when
available. If asus-wmi is unavailable or fails, the event is passed
to userspace via evdev, allowing userspace fan control implementations.

Tested on Asus ROG series laptops.

Changes in v5:
- Removed IS_REACHABLE(CONFIG_ASUS_WMI) guards from patch 3 as
  asus_wmi_evaluate_method() already returns -ENODEV when asus-wmi
  is not available, and the warning is helpful for users (Mario's feedback)
- Updated commit message for patch 3 to reflect the removal of
  conditional compilation guards

Changes in v4:
- Added Reviewed-by tag from Mario Limonciello (AMD) to all patches

Changes in v3:
- Added IS_REACHABLE(CONFIG_ASUS_WMI) conditional compilation guards
  to prevent build failures when asus-wmi is not compiled (patch 3)
- Modified Fn+F5 handler to pass events to userspace when asus-wmi is
  unavailable or fails, enabling userspace fan control (patch 4)
- Updated comments and commit message to reflect that spurious codes
  affect all ROG laptops, not just G14/G15, and occur during normal
  operation, not just on keypresses (patch 2)
- Simplified commit message for WMI infrastructure patch (patch 3)
- Added Reviewed-by tag from Denis Benato
- Removed Change-Id tags

Changes in v2:
- Split the original patch into a logical series of 4 patches
- Improved code organization and commit messages

Ionut Nechita (4):
  HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
  HID: asus: Filter spurious HID vendor codes on ROG laptops
  HID: asus: Add WMI communication infrastructure
  HID: asus: Implement Fn+F5 fan control key handler

 drivers/hid/hid-asus.c                     | 73 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 73 insertions(+), 1 deletion(-)

--
2.52.0


