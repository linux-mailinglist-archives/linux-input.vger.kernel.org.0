Return-Path: <linux-input+bounces-9956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D31A30E67
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1AC616746D
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B8924FBF8;
	Tue, 11 Feb 2025 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjnNXwkB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BB214A92;
	Tue, 11 Feb 2025 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284521; cv=none; b=t16up3YBAlYI0wQnCZsIp/RQ8I0Qyeu7AWNZ4gVzNmYf3yDSBeAWHLHUYnQbkvaK/6sW+O3nzfJ6M16sGSYB9YvaFg6UezGnJGbp0MtkL4xIxDX2zcn/ivSUc+0MjY6EYzzVj1ORALaKlTNfXeCWFzCfxkipQiMujnK96ZAAQpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284521; c=relaxed/simple;
	bh=xrmxB7P9Y7ibA4hW2USDjmschpAval/ACWYaGqsdxec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mJry3YBLehW3G/MD/1r7VY8LI50kwUjHT1SI7FA0ZNT4vdx/uTBVq0Ezf4S7qCg4CdMDPnycfOYxXfjRbyqDri8UfbVR2e3dYi+FTUI3Ow62j+qheGegW+ohg+8ZcgeEAP37a3+9ZlPKKJsbqoQjlO/p8TxBWaXRtCTLMQF/lXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjnNXwkB; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-308e273928aso2798591fa.0;
        Tue, 11 Feb 2025 06:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284518; x=1739889318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q7BNYOfBkP57zXVyvcS29qQiDYkBdMkIouHfDoqa48=;
        b=bjnNXwkB4XClJvJE/adDKkZHHHaLU5Q9Con8JtdQT31IF5N+YltKbK86bmlVLB5Ztn
         g+bMYhYX4i7TpzJT0JbxaAhVbWPysxQ9D83CtmoEemOzaH9MIf01WlLDG2S4ZO1vs/3q
         Of1E7cDA2vyc0GAYnS77c8vIsvxnMFwsjpFIyoKCPklIyQnEZuMTPby2tI7BCwjcduPh
         CAQlX8rAZjk3IZHfG/w264Axk1qK5Z6of5GzZCk3DuaGvYdvy0PJ4X3kSG7oN11MQzIH
         aQDcjihs72Tj89EYs9QRxyNHLrpatgSxm5uf76PSTvUJsymg0CWgQ/FXcv20rnYuuwW5
         FsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284518; x=1739889318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Q7BNYOfBkP57zXVyvcS29qQiDYkBdMkIouHfDoqa48=;
        b=kHyu66+uxFK8/XDpmozivFroMjh5kVqdb29y7dXXKTU1+XCqTnjy04mqqc0MWlSNLt
         BgvtSV07aviOOTu5ZtCZq2XX46dCyr+153mK3JQmePrfNv8wVM+Ib4cl/x4j3PwptGwi
         5tH+f88V3gtEwU4mVOTituUnZ9kMpmByeul6olVPxyDtRZA9khO+/kvAWADDlyXNnRJl
         2B9kuAjlEAGfzxAB1s5lgeGnhsAXC6yhIFfgldjvS26sUETgci6GPZ+lvNdyp3oNweZY
         Sv+t1UU0FcM0uC3L06REDbm2F14gnyyOEr95f4XwbAzrndYOdYd+MgN/t9iBrp/Ql/KB
         Vxqg==
X-Forwarded-Encrypted: i=1; AJvYcCWIXUZewfyBcmd1U4KZJkhRwFZG4bJQ7LaD9fm4ZtX+0/elamr0Q7sBL4zzuypXGlK5MXEbpuMBpvOt@vger.kernel.org, AJvYcCWjMV9BM+A/1HWAeDySvMWgmtZ37iaXiqkAtOqsBBRiiHskaoEEEncfhuzaxT19/cc74mWLBQgC9TtkJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y4u8Cmh3iSHT/xkv6kOGVm8jnjJ0SlggH9t9e+x2bMrZ75Ha
	eF/1xj0Mc+6OVoxBhdqgeGFJfec123BhtwWx3XsIhc3auyg0UtgM2SdOayXg
X-Gm-Gg: ASbGncv5ZH46aI1Nn6BP3SYpNVKiZ7UBZjq+CKMeVfoOaPrUMN4AT4kIHcSRfGRYXrq
	oEzjZ1nhatX45jZoZXtYawHNnUnAIPmUiQxFSVG5IHh4KAA3x7yyd928likq/vRxAAy5dkZWBXt
	iyhlVAngzo3qyzx+4M/Cxi8DirXWOSGo7KxitFlfZnj9fqpP24tIMNgGifgabtTm88CeM33jkfX
	ytx0CxiEaH/kCv8Gjd85JL2Jrpr0AlzPW6Ik4to+CBVjuUNIyfgDss02qP/Pr2akhkPd7X3son7
	ChhtCojjsCeFX6AzAw5oqfaxUAEWneRvTLXoog65xzoxjermusfZEsep4f/Oow==
X-Google-Smtp-Source: AGHT+IF5kwvbzW21ogzsIiyQUpKpdNy6mK2nYD43GBjkz3H+IzLiQHVEcgIBx6jUZS+QlhpoATVLNA==
X-Received: by 2002:a2e:be86:0:b0:307:2aea:559a with SMTP id 38308e7fff4ca-308fbee70e6mr3018331fa.9.1739284517570;
        Tue, 11 Feb 2025 06:35:17 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:17 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 0/6] HID: pidff: Compatibility update and new devices
Date: Tue, 11 Feb 2025 15:35:06 +0100
Message-ID: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
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
Changes in v4:
- Fix Oleg's email address

Changes in v3:
- Change Oleg's name order on request

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
 drivers/hid/hid-universal-pidff.c | 10 +++-
 drivers/hid/usbhid/hid-pidff.c    | 98 ++++++++++++++-----------------
 4 files changed, 60 insertions(+), 57 deletions(-)


base-commit: 5d98079b2d0186e1f586301a9c00144a669416a8
-- 
2.48.1


