Return-Path: <linux-input+bounces-5322-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E46947324
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 03:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5286B281126
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 01:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A591F2B9BB;
	Mon,  5 Aug 2024 01:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lj8CLBwR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315123C0D;
	Mon,  5 Aug 2024 01:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722822443; cv=none; b=rFTwjn/W3Bizx5Ye7bw/0hMjE6xIdVuHYjcxnRBmteUu5bsCFtt0+/USK5s2/6mGa4DDn4lP/GtmQvvMLFCU+x/ABiTVvfenwdCRQ6iHK1aUyfI6oa/b3PdZ1vspDWjMub+POYZ9u5escVGBIiPLpKVog6zbeldt5pExoQLzbUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722822443; c=relaxed/simple;
	bh=A2vJrFO89qv3Vl5mtbLE3v4cFAQkHEqQpYgODZSNMUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzA1ovmeBjAJinw64El+gFGGwkEoFBEuxc5TjtwITo1AE6DxC5wGz4DvWrmjiTc5+UT+bqBZ8GB/niZbzoCscHN+gSyT7m6jlxEOEyP74UWA8SiziMggZHGg727k4cXiCxAZ394DuB/qGgvi/DO34UdLCVB0NEDZA0Ku+eYvAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lj8CLBwR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd70ba6a15so73932955ad.0;
        Sun, 04 Aug 2024 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822441; x=1723427241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=go9+jMuiKPxIzbSCtVn3aSgkl1rGhZtdM8/wBVYPVDE=;
        b=Lj8CLBwR2DuRMJodsWnS8yeFBirdqLnP8eeilJuWjzNf9vcYde68k+hRjB44XPu4H2
         CGZlA6Jj5phsfozuCq9sDbaqmiCi+chx9OdN4Zfhu9+T2JNC4bX9kiiBUBV+ARewbIVa
         u+aX4psgqITBSzaLJMmfAFiETPtsjFgjoAGx7Hb0xYGQoDgP6ZOGSGq+DxnpwDDJDrZX
         G0ou9CC+iC5dSjA3SWPAZELsphp6c+0QP6wtSP+p99fcPiUnk1tw9RIILRn5nHELHJWX
         sc4rzEEWmhyw/xw/i9MLGYnmjvfF+Ds0J4iegjJMnP1DwrfQQjRgloiRpIokWgeU00hL
         L5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822441; x=1723427241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go9+jMuiKPxIzbSCtVn3aSgkl1rGhZtdM8/wBVYPVDE=;
        b=E3tvlz9LjZY7WrgEmMvyIBiaONBOoYBwg8IXt56G7P7GReaW5GPxZG1eTJAmz/CbPn
         gzAN8r8eDHkekOoJqRQdrvDqoBui2pVyrqNjvdoxwE7sh97fjLX5KztrFkD6ziBmxfHa
         23uNiSpExdJM5e1bswSvrB0JMhC5iRI5Ksc8zTycFB7YBL69d1GBb+YkLJFTaWDks5rG
         ab6vQlHYeMbqgtExfSbvlg9+BJocsFuyNaCvqE94Xuj3TseCVyaNXkTAuSGMZPVjVt2M
         rvmqQ3Kqt+aeKLRhvCqpVDcfxpY0oiCQ50XPOr3yLw4djfVnysjPvzA+0gwM0/l8h7QZ
         2jqA==
X-Forwarded-Encrypted: i=1; AJvYcCUnizHnTvgK8dUFe6G3EHG9r86r49n1iToz1pb8VfisMaZqMSS9IOt9g0fjns8OClP5eS78JhtAJYLwFFzULLuylXaHYYYntJAqjWfXlMxUKniB9r9E7OHI4EzN9vcL8b4WwfEtymk8ajA=
X-Gm-Message-State: AOJu0YxxRe/pT0TK3PNmm7txHXOSfK0s8hbxX9lFik2qVT1L7i1zCJ91
	2po+/IgtD2S68qIeqekofIC1h8C6jaWObPbfgHhmXics9rMJrU0b
X-Google-Smtp-Source: AGHT+IGrBD7d3KKyvGObAGd8ellCDk7nxxYgIs1u6U2R16dB2zAH+MXNhey9YIhZnLs1wqSsiIarUw==
X-Received: by 2002:a17:903:22c1:b0:1fc:5b41:baff with SMTP id d9443c01a7336-1ff5722e988mr106617235ad.3.1722822441341;
        Sun, 04 Aug 2024 18:47:21 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH 0/5] Remove support for platform data from matrix keypad driver
Date: Sun,  4 Aug 2024 18:47:03 -0700
Message-ID: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series attempts to remove support for platform data from
matrix_keypad driver, and have it use generic device properties only
for the keypad configuration. Spitz is the only board [left] that
uses platform data.

As part of the migration I am also dropping support for "clustered"
interrupt mode, as it was only available through platform data and there
are no users of it in the mainline kernel.

Additionally gpio-keys device used by Spitz converted to use device
properties instead of platform data.  

I would prefer not to have the song and dance of merging first 2 patches
through the input tree, waiting, merging the spitz patches through SoC
tree, waiting, and finally merging the last patch to matrix keypad
through input again, so maybe we could merge it all through SoC?
Alternatively, I could merge everything through input. What do you
think?

Dmitry Torokhov (5):
  Input: matrix_keypad - remove support for clustered interrupt
  Input: matrix_keypad - switch to gpiod API and generic device
    properties
  ARM: spitz: Use software nodes/properties for the GPIO-driven buttons
  ARM: spitz: Use software nodes/properties for the matrix keypad
  Input: matrix_keypad - remove support for platform data

 arch/arm/mach-pxa/spitz.c              | 163 ++++++++----
 drivers/input/keyboard/matrix_keypad.c | 334 ++++++++++---------------
 include/linux/input/matrix_keypad.h    |  48 ----
 3 files changed, 248 insertions(+), 297 deletions(-)

Thanks.

--
Dmitry


