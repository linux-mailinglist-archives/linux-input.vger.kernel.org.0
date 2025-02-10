Return-Path: <linux-input+bounces-9903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8EA2F143
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 507DC7A1CFB
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0251022DFAD;
	Mon, 10 Feb 2025 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QowDvl//"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A91F8BAA;
	Mon, 10 Feb 2025 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200682; cv=none; b=JmU4ZA7gnpGQfF9x45qP5UrKd3qoBiLl5avVxp1pokM1YSA9Vdw34Lfmjudzk+fv/5Cm6F6V1QFLxuOTiOdd4/4aYCRbGKYDMXDuR/21peSkP9AW1WinyQF9opQPhzZKrChy2Nsn1Vqkf5LGPU+qzoQrSNTh/ifOBzk6O/6o+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200682; c=relaxed/simple;
	bh=VKQ13PpfvKyrYMu/CZCbOYm0uGPTAzN+SwDqnR6VyyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zc8UEg6hb+6hiuqVk65oBOnRK8GEhHzA0gxnn2A0NrkRotVEG4XEJ6W86XTn6cijouxDVfsVadhqGgs1Hswrf7nCl9eMJnaW8zo3AHvvtm6z6ryafoymVklFCSYAOveSD0S0VEvRbdgXq5+sIWE8wQoL6QjwHpo7bIfQ0m8/1Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QowDvl//; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307e4ac2eb5so3162131fa.2;
        Mon, 10 Feb 2025 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200679; x=1739805479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0E5X9gNXdVQvqDhdAuldkgKAN/pUQg0JmojRQtWxHlw=;
        b=QowDvl//Tbr8hr5H8womh1fead4F8Cgnu4XsN6MizXvS5aZdIOKbw7K8Vb6hfj4gP5
         ONmAKZOZIl3tpSe8hMwcnQsBi3nNyG7E/08zKvDGVaM07mVpd+uyfxgBhAV8VhH0oyzE
         kKKdPzsTd+81b3CkV5WWyX8vwtzlRgPb38trrAuIdJE+XCnQn+Ab7NVKIIWFVq+bhz6s
         2pgghCw9vfVZiXA5tEFITycdrn5gUfwpNDsshR4pc/qYYhwKk2/+qou1qZviobQzMwMJ
         UpWFdOteL9KUDWuBfTi8oZk8Ft/V95yTzVpvz5n4K0fmGlDg/alYeI0srXm8VQchSvHx
         Md/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200679; x=1739805479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0E5X9gNXdVQvqDhdAuldkgKAN/pUQg0JmojRQtWxHlw=;
        b=rpwrMAb72D62IzTOTAkuyp/rUJm4FpwjpA/FMt94X4zKUsND5rhseYnRWmrPqwo4t7
         feld3DapG6Lz+sQrb2JT5LqYdyBgJzV6T/zs2RKmkcO+dKBOfglicZZ0pXsPZlX0NWPt
         8gxQ+xy2VYL/uIV+7bxeCdVHqFHmERwr6v3q3J9vui+MHsgSYOS28c09srU26yKc6XAL
         9yoKnIb100zaNna0CR5tyf+yL/U9NNgQznUvoeD/V5lK51z7KCfRu1G+Ie+rLRj7ngzT
         eYfSyXab+HeL85hIHvHiov+/qMV4wMRI+jElwxzqAOBGOasUYqZJMHd9WDCIcvUPWBes
         001g==
X-Forwarded-Encrypted: i=1; AJvYcCUiH0lCC5+RA6ODVZCEcH/VI4GUpYoh8zkY4lDr9nQXdgOQOOKn8V7UfM4aej45a/hnz4/UXKHqlONa@vger.kernel.org, AJvYcCUjmuzwdWk37M9iAklP+s9EzLFvctnQw82VcDF9IRnvvV6Jcd03oUxigbIAk+RcZ2PSV4bghNOCuPIAkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc7XtmwPyw/DoE2d3jY66hs6wdVmbShJW7xDoltAfVN3dNE8WI
	kzFOQEE0uislQc+tmau5Axpr3BuJuSW4kpr0PMNm3bx5sYEPmZIF
X-Gm-Gg: ASbGncvWxGo18j01wTZsvM7DKQ0irBdP3AMxYy9mFuz5s+UI1JC8OmO8Mr0m6oYrm/4
	Hb/vVCpLrz8XuS3Plp9c6Re5AhplIJiCx89sCXHIwCWx9TlKVB9IDbykxFUaSymcPAPQ7h8mMkj
	QoR7MkoA+4/mJqSwHG56Mz0tPBU13iu6GdVd0FpYZIyDU1sY7Bz5iMThV1ng+L6f8q+kX+phR4a
	G5PedWWw9Sclm9H+0m0Bcl59KDNipCFL8DxPLm25c0T8ivt5oiBird8kyays5vr3nqOUv2oAr2X
	+vDGpFWIGl105AwysOIZCiJoZp1Q1ToCHI8K3vL8H65C1tCOeUmPNf7ow96TcA==
X-Google-Smtp-Source: AGHT+IFF4vwJpM7zBXI1C0Nh0BGrZ3fHzDZgbgo1zI3CCTLufUy7EiQWcvj9I22OPEUZUeJuBF3qlA==
X-Received: by 2002:a05:651c:1a0a:b0:308:ec50:e828 with SMTP id 38308e7fff4ca-308ee9831e2mr5268371fa.0.1739200678918;
        Mon, 10 Feb 2025 07:17:58 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:17:58 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/6] HID: pidff: Compatibility update and new devices
Date: Mon, 10 Feb 2025 16:17:48 +0100
Message-ID: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a small series based on top of hid.git#for-6.15/pidff.
Add Oleg Makarenko as hid-universal-pidff co-maintainer as he fixed
his email server and will be able to respond to LKML inquiries.

Small compatibility patch for situations, where POOL report haven't
been properly initiated and adding Asetek vendor and 4 of their
wheelbases.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

---
Changes in v2:
- Updated comments and code to conform with Linux style guide
- Define 0 duration as FF_INFINITE (PID_INFINITE analog)
- Support device error response from PID_BLOCK_LOAD
- Remove redundant call to pidff_find_special_keys

---
Tomasz Pakuła (6):
  MAINTAINERS: Update hid-universal-pidff entry
  HID: pidff: Make sure to fetch pool before checking SIMULTANEOUS_MAX
  HID: hid-universal-pidff: Add Asetek wheelbases support
  HID: pidff: Comment and code style update
  HID: pidff: Support device error response from PID_BLOCK_LOAD
  HID: pidff: Remove redundant call to pidff_find_special_keys

 MAINTAINERS                       |  3 +-
 drivers/hid/hid-ids.h             |  6 ++
 drivers/hid/hid-universal-pidff.c |  6 +-
 drivers/hid/usbhid/hid-pidff.c    | 98 ++++++++++++++-----------------
 4 files changed, 58 insertions(+), 55 deletions(-)


base-commit: 5d98079b2d0186e1f586301a9c00144a669416a8
-- 
2.48.1


