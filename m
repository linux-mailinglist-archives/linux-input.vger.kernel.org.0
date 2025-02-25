Return-Path: <linux-input+bounces-10368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6849A45028
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 23:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686A0188B05F
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F32216397;
	Tue, 25 Feb 2025 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjFm2CCQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5952116FA;
	Tue, 25 Feb 2025 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522611; cv=none; b=RbCfQkNQz2go5eLhJaO+pg08y3J7BX00uGADTWCBDReDxQWMr0Pz82zAD5JgPydvVGtcOVUiTEI6E8ZBtMhiYKztcd10LV9grOjz5JyEqjQOhp065mP+VnyWmYV1CwmP7wo5PqSQlyISX2fkvt+grFmOpLUy2opwOLdZgQ7mBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522611; c=relaxed/simple;
	bh=722hjD550GNGFN4xL17Pcz4JUTbSO2SQl0ctkNrJ6fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=awQqodcgFd2ifCVAnjyfJfMM9tS/nXNAOn5uv1uUE1T9h0CyvVCl0gKbcFDPztS/nvh4zlBO7/FJgmnLfCkVQORI3CJQgoMpYoJE+PRaL2y79WBPn8n4EWRlxXY7j/k9VEVi4MlOQgO6Ri/Se0bDUN7hPfW9igff44nsE3+WvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjFm2CCQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7e08f56a0so110147666b.1;
        Tue, 25 Feb 2025 14:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740522608; x=1741127408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnSSdh34ulukAqioavRhhiwTDx3QR1Tp4Jr/zRsVKLI=;
        b=NjFm2CCQcOJAwkb8IgsrdqDbU/2WCfrY33KdRUYcUGaNV0uPQTSEumH15gTad/9SVX
         MmnQb1crvNJVa+4Cb/gCJQfIICPX9tHhbTcbFOxhFVD+J3MD0IaVXhUxplIJa2JYLSfd
         Kc3EXXnxnYkclW5LYfqkMr0arv86sZoefAZhQ5qonQo8o07vRrjITNBXmjTRddFcwMSF
         qCqH2xY7flGjOjvUBzMFupyfDCtpkrsJVvgZoJU95XgGYAfrjdOWVoQeCuUOzTIiCxNU
         Kc6DgcDJpjEmI/oiiExi4VuegU4immyFdP4407jy2Y6WH33cq/+qLr19W5TihsrSXYnC
         8kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522608; x=1741127408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnSSdh34ulukAqioavRhhiwTDx3QR1Tp4Jr/zRsVKLI=;
        b=azlDDi52BicwzPjn4m7pweIcM45pUa3DP/LffJSEraXIww2ZjwAD7LFXrVsUFa2YlW
         Ot0Kh8LEhIRyFcdd1IdorxwaLGiYtyMqXh1YsWqrqs8YEn48c3EKVs/FvlU2I4SjEkIk
         XR6ofe3uRTMxLfSvBYPYd2fxDu842a30YSyHDU8FDfdTroOMFpYLo2sYlza9HIfAk+e6
         RECDe3iSfZAzMULXEujYnvVKVrzS/a3SsQE2jeX9IOd1dGLBO8PiR9vacZCQixX6bUTy
         1Q11wetN+mB+bG/nyyzXEbfASiYBgf38yP80qxlu31XdooVQ8Xl0ihKApHUZQEc37pBU
         g+vw==
X-Forwarded-Encrypted: i=1; AJvYcCUmV2yO1145aAxzWdNBtRY33o3nnpS+TPDOGxSWZnOdh4CCGhQ9xbRWQpOGKL1fwDydqdxGx3EnA/ev@vger.kernel.org, AJvYcCWHhgRWORqKqrXzmStpeBpjvJG8wNMVTqXQHpVMTP1piXzQ+kSzHqCAwxtNUqI928Ev+lwUjjySE9BCSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGoGlIZxXS9IjI7CH44eIrhbx/TLxs+31fsRxnYhfBoahQIT8
	bR+olvE/g0AEsbwAnxeeEY5hrfPiXhwPK9yU7D0VvIoymPmDWn22
X-Gm-Gg: ASbGnct92dTHVZRuCgbq8ZMbTmArpgvFiGeItOwK+syPJyfeJQRycytQCaxqLvupaY+
	1w0yvxRI1lON2D2SK8rExGSC0ZxqdiPeqnN493KYBEVtZyU+TZeCPg6c4Begj8b9IyyCSv3faOD
	e7Vcdl0EBVzhvNgodaFTUAJoginoiFfRL7aSBJm0BjDb1JWYzh4z9v9O8WP31KPFAedhMeier/2
	fYg88UDyKIb6kZSD17g2pTJ0t92GD/kau3PfKydGmW6DMZWkVezWmFR6k3XDt8Z6B0uEiiSA6u/
	9wjt/ms5WzHBoUPd0Fb/9fszNR5R40HlSHlcBGXEJfpwtjKXV9t+vbH2WgMAnsZ66Nhn0sJc
X-Google-Smtp-Source: AGHT+IEviS6kopADKENwNpA8dzJVeZZ0RxXa+Dpfaq03LmLsl9WjbLZX5hVJM1RGq2i2g414rwcjww==
X-Received: by 2002:a17:907:980a:b0:ab6:ed8a:1593 with SMTP id a640c23a62f3a-abc09a9cf88mr623748966b.7.1740522607565;
        Tue, 25 Feb 2025 14:30:07 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2010f74sm209122566b.121.2025.02.25.14.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:30:07 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/5] hid-pidff fixes and PID compliance improvement
Date: Tue, 25 Feb 2025 23:29:59 +0100
Message-ID: <20250225223004.415965-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on top of current hid.git#for-6.15/pidff

Another batch of updated to the generic USB PID driver. Apart from
realigning two function names with the rest of the driver, clamping
LOOP_COUNT value to the logical max to fix some errors.

Infinite values were previously hardcoded to 0xffff but the standard
actually calls for the max possible value for the presented field size.
If the duration is not 16 bit, but 32 bit 0xffff won't work as infinite.

Setting infinite value works now by computing this value from report
size. We still need to look out for 0xffff as that's the max possible
value we can get from the ff API. 0 was never actually defined in the
Linux kernel as explicitly INFINITE but it seems like it has become a
de-facto standard.

After pidff, I'll (at least try) working on extending and updating
the ff API as it lacks some features and could be considered incomplete.
The biggest issue is that there's currently no way of obtaining effect
status or sending device control commands.

---
Changes in v2:
- Fix the direction name in the fixed direction comment
- Fix set_device_control() and implelemt missing device control commands

Tomasz Pakuła (5):
  HID: pidff: Rename two functions to align them with naming convention
  HID: pidff: Clamp effect playback LOOP_COUNT value
  HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff
  HID: pidff: Fix 90 degrees direction name North -> East
  HID: pidff: Fix set_device_control()

 drivers/hid/usbhid/hid-pidff.c | 42 ++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 15 deletions(-)


base-commit: b9c340b67b33cd37e543195b157c73a7bb0c8d4a
-- 
2.48.1


