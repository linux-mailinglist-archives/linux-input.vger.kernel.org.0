Return-Path: <linux-input+bounces-5636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CBF9562BE
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86EF31F2196B
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26256142E77;
	Mon, 19 Aug 2024 04:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eax/+ahA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975921870;
	Mon, 19 Aug 2024 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043508; cv=none; b=a9fl3Ukg0EtJFN6zm1gWQih6IC4TSVUUNNhCIFfjsTJOPFimi34ZEsBa/IxNeVM9ebEVc9sLgGE2AGmqpVY7rCgIWbrmI7DGEm0CosWxsof9CsHt6aBIXAEiKmwoDPoqzr9iavEy9421vWU64BpCokWfObtM38e9fd6AZA4oyIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043508; c=relaxed/simple;
	bh=VIPdrCoWFZNXgUdWs/O2j16FTn1XlPZYBS3HkHce7FU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wbn/0gETdhwnKdDDrxbnBMme/XpfgbwxZj7grOhpTPUcUAMyQEaUmM5HXKYmvokdMoS1wvdNiFqsP/L78BKPHsrp7HxjaDLBug5ogpOprHZiqiO2sahgXwnZzoGZrTvz7q2+SkhK358yHj6icpAYzVOhqqLexCLazwrTWhbIelU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eax/+ahA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-201fbd0d7c2so22032155ad.0;
        Sun, 18 Aug 2024 21:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043506; x=1724648306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOVoXvcj4Cn0QgTVrC2uIwTrsjwD3Uvd4WFAriAkPBY=;
        b=eax/+ahAGDOObKDTuEQBXriD197FF9tGmOhAt3KsdFeuRkm67MBPVrMw2fm8QYExvI
         ZMqlDt5S7dwgE0xVu4TLOWyEuG2Pc+asU0MUUDF6LMH5C2sovng5uuhFcvzl/rbDPMW3
         cFabnMj9moKhlN+e/hGG7ybsrxS/sF2Dikf3mbIwtcJ0QaFIYJD7Lw6Mp+vF1PB3ncOL
         hXOD/FNanoVJyEWsPx4qV/JKe/75VedbAOSh2oOy7fWlBhZqPi/D0p0cts1c3c4z3oRd
         LSRUAh2WomaKqmCduHqAsaDJdUSobPbCDTqyE/bumqVn/Sqn/Q5H9qUHFUZLNidY1eNX
         Stbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043506; x=1724648306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOVoXvcj4Cn0QgTVrC2uIwTrsjwD3Uvd4WFAriAkPBY=;
        b=jWNccE3e8uUgq/wTVpfeTTREzeGRvI2C/yx9ffhgtdwyd3ka59z1EoOo0UvUDQXD8L
         klYKM/RgRUCT+HP/eOejLiMVP0M4r+FDYaD6XxM2NQrHwQCxbZE7a7lI4IEMtf9jlMwt
         +DxJsmtd300HdePPKz1nWH6GAWgMJ4UhvvVHtPjvRKtzSJb2Qd1VHh2+wVXYel0mbamA
         HADLAVrBv57261pBPb0+tshXWMqEZxNq0yjLJZ1JTn9mma70pr+ixyIWiqYFM9PoNCcC
         tAC3eVoFTgeDpLu6R6q85cGzbNo6tu/owFZt/I/FRax7n4IEFWBNwrAWPYHZms/XfsCU
         j26g==
X-Forwarded-Encrypted: i=1; AJvYcCVsLnIXFpv4MF9fxyonmeWnHY6FdvftoyKatazOwPHNoLcyMBCr/fGi2iuP7MG8VVddOUcpLJP4JJIKlcq621vsp7FBt22kcDv4sL5C1/I78WQ5aQlEMPgJ8Ts9NxbJpMlSnKCW+S/mIdkkLaKF8f3h2zxS1kkxHpUNg+3P5q7RR6uIcwo2DObrIp7F
X-Gm-Message-State: AOJu0YxuO/yqlft+Blkb3eEh0fBUqIeSgys+KDBnHhFQlWfE4+sdBR9j
	cAjTjYdra9YfQFHT4HiT+zVfO2BIFIY/K91en+oJE2TZW9z/g2TE
X-Google-Smtp-Source: AGHT+IEJGn5PVasUJVsx/uK8VLnavHd3PelxJImB1HsqxNz46WkgjVgZaV6xLgHVa8kdhAa3cLHWxw==
X-Received: by 2002:a17:903:192:b0:202:301f:36fd with SMTP id d9443c01a7336-202301f38f5mr23768775ad.18.1724043505296;
        Sun, 18 Aug 2024 21:58:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 00/14] Remove support for platform data from samsung keypad
Date: Sun, 18 Aug 2024 21:57:57 -0700
Message-ID: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series attempts to rework samsumg=keypad driver to stop using
platform data and instead rely on generic device properties only.

The first 8 patches are general cleanup/facelift patches.

The 9th patch introduces alternative binding that is more compact that
the original one, which makes it more suitable for use in legacy (non
DT) boards with static device properties. Note that the "new" binding is
the standard binding for matrix keypads.

Patch #10 implements the new binding in the driver, #11 converts the
only user of platform data in the mainline tree to the static device
properties, and #12 drops support for platform data from the driver.

Patches #13 and #14 are "bonus" converting the rest of crag6410 to use
software nodes/properties to describe GPIO keys, LEDs and other
peripherals. Note that I believe they fix and issue with recent
conversion to GPIO lookup tables - the names of gpiochip structures I
think are "GP<N>" ("GPK", "GPL", etc) and not "GPIO<N>".

Mark, you said you are using this board, it would be great if you could
give this a spin.

Thanks!

Dmitry Torokhov (14):
  Input: samsung-keypad - switch to using devm_clk_get_prepared()
  Input: samsung-keypad - do not set input device's parent explicitly
  Input: samsung-keypad - do not combine memory allocation checks
  Input: samsung-keypad - use struct_size() helper
  Input: samsung-keypad - use devm to disable runtime PM
  Input: samsung-keypad - use guard notation to acquire mutex
  Input: samsung-keypad - use per-chip parameters
  Input: samsung-keypad - use BIT() and GENMASK() where appropriate
  dt-bindings: input: samsung,s3c6410-keypad: introduce compact binding
  Input: samsung-keypad - handle compact binding
  ARM: s3c: crag6410: switch keypad device to software properties
  Input: samsung-keypad - remove support for platform data
  ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys
  ARM: s3c: crag6410 - convert GPIO lookup tables to property entries

 .../input/samsung,s3c6410-keypad.yaml         |  57 +++-
 arch/arm/mach-s3c/Kconfig                     |   5 -
 arch/arm/mach-s3c/Kconfig.s3c64xx             |   1 -
 arch/arm/mach-s3c/Makefile.s3c64xx            |   1 -
 arch/arm/mach-s3c/devs.c                      |  62 ----
 arch/arm/mach-s3c/devs.h                      |   2 -
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h      |   5 +
 arch/arm/mach-s3c/gpio-samsung.c              |  35 ++
 arch/arm/mach-s3c/keypad.h                    |  27 --
 arch/arm/mach-s3c/mach-crag6410.c             | 242 ++++++++-----
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c      |  20 --
 drivers/input/keyboard/samsung-keypad.c       | 318 ++++++++----------
 include/linux/input/samsung-keypad.h          |  39 ---
 13 files changed, 398 insertions(+), 416 deletions(-)
 delete mode 100644 arch/arm/mach-s3c/keypad.h
 delete mode 100644 arch/arm/mach-s3c/setup-keypad-s3c64xx.c
 delete mode 100644 include/linux/input/samsung-keypad.h

-- 
Dmitry

