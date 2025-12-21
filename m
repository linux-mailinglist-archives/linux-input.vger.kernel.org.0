Return-Path: <linux-input+bounces-16654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB33CD3D16
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 09:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69FF030056F6
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 08:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1CE78F2B;
	Sun, 21 Dec 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux9HwHR4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5D1A9FA7
	for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766306442; cv=none; b=OnD42Y94bs2oyN+57uy08Ce6z+IhU2Qd2krez2UiD2IppLijkJjBTCUFsaGHwfCDEzZw/xbdv070+rvYfV5y3libTt3mjje5x8VzmSYXH7CcEzpp6uWViK+C3VR1BzicnAMrqhS73achO0sxJZnB0v96UVDoeNobYU0dldQjAT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766306442; c=relaxed/simple;
	bh=Qi5iMViMuVWG9xoMYbg51z1YASLbyD0m4D8zRsZXH/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPu3083sqqps4sgHnl/cD8N3mQSGaT/NziZyxjtSUVKbFhw+AhuOY8nxPLCrxEQDS+G7G31Mj2d7ZXEC9uxJrRcKL081zbcNyoTLuloRG2JepDmavw+80wpoADEqz/nIkqWCWxp1suIQ6usJ3Y73+jIbhf2A9jOa/9PDPeq5SjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux9HwHR4; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ae24015dc0so3716474eec.1
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 00:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766306440; x=1766911240; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8A/DbUA6t8LkaWbyH6yKzQubOvdRGHPj/KkasSzGFA=;
        b=Ux9HwHR4CxPVdMk4oLBBJFpoHqnaoxnRojHd8zr+NBMisrwWQ9wy3l5prNEUWSHVxm
         EEzVZWXgvxYCOi+Zbl4LDtBJuRkxNvL/UAdWkdHes6kGIcWXwrF3joaDUTdRmlTrCLLk
         Boy4D0Xm0UhxXMed5SG+iFTWnURZmthp6VKjP7Ghhxdp7c/cYfgZk03RpgPiMYmXbnbZ
         9T2QLBAHs5o9q8+F6ODEXrd9P9Fo937ggASWuNl1SwvAGso9OHxLF+7Y4S1n8k2+TwmF
         cE2SlFnuY/L3Akvr4JflgtQUOmEWU5BeDAovvfrj3l8RZAyIqjCn6cyRE7/lnM4nR9Lv
         3lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766306440; x=1766911240;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8A/DbUA6t8LkaWbyH6yKzQubOvdRGHPj/KkasSzGFA=;
        b=SeRM7L1YecZJgug54mbi22Z4Fjf+X1a8G/pBzhWKnSN1I993n0Wq4yp/h6Nx/2gf/j
         lpVJgOHK+OgzLdxmiHXM6J4+A1+sluSQCjEGbIT4hsTC0FF7vn8wZtR0WDO6jGoALjWb
         wbKD1cMjHDhUEIvT4Q00xWGxhmGiew7l+MSq6lD5C01PZK+ZX5YHbTI/THhhXY24cthQ
         BQnii5UU/Z588IAcdVJ5iT4and/KkULcyA4YqyWdHt1FS/X+P81UkTxOLaDOylZYwkz8
         svhv5VOwwXlUCg+iUjQaHXE7UEs5Iue4gTj6FEikwai+OdNmj9QLoSHyfXciYSr7hxKS
         XI2g==
X-Forwarded-Encrypted: i=1; AJvYcCUluljgN8l3NM0YAYTNvFC8uJ8NRJpz/fTBHDyzKh4fuhF1qWrjVvlijiLTC9ckF+m53eF0aYy7f6O9aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgl1UGbXANB02HbjGVC5eFDY5sRYBeqKhajMEzTSs3b/9Q3Q0z
	sqrDVrR2A0zUBNIrb9A5HeLgIzcxDH6KVuoRJrd8HgA+0siIEuxo03N+
X-Gm-Gg: AY/fxX7kV/X0CCXQU2ohJWPGaw/GhFf45GS+ZzU8ghd/DzneYFz0eqPZgre7PLqeMYu
	mLyWrgDQ1G0V3OKAczZ02z5TJwHk+l/5a88Qw6DBb5KOs+DGNoOMhbjrHSH00WK0hpsP6ZiVu+n
	NOOIQ+vZzkXcwKgyQmQEUmFjDw4iLIhKis9o2V99VjC+w0Ku4uTtmMn+ZaVYe7isOItRmAnE1V7
	H7MH8+dx1LjlnBvPr0IxDK/ltN+Kx6LkDDh14Dvcyd+s2Fx2FOVJmanG2LqITt1S8Jur7+/VRxi
	vICdmYWrdrdY0PUa3WxyYeqroy3fHH5k66w4EKUO/Nr2fRz32l/N6aicGe1VtK3xcFt1SCtHLpT
	6zNtZHXcaq4w3Q6/cWJ9QC8IdxjXhxEaO/S51T3HbdFYNI6nBNHjCnJcJZyLgIxssNPEMiH4yU4
	JeyG436aVuDcvJPF95tcgis5FUyDrAzGuJE7j7QXTzpGE90aiB8Ig=
X-Google-Smtp-Source: AGHT+IGIvBrFfhgi2EKepRZ+TUnjVfsKhv8KTU9eRc/3lC38Ph9HKotP6DtIYGI7odbbHy3UyfvGJQ==
X-Received: by 2002:a05:7022:619d:b0:11b:9386:a38e with SMTP id a92af1059eb24-12062163989mr12683707c88.21.1766306439617;
        Sun, 21 Dec 2025 00:40:39 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a8e9:9a4:3711:628c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm19391112eec.3.2025.12.21.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 00:40:39 -0800 (PST)
Date: Sun, 21 Dec 2025 00:40:36 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.19-rc1
Message-ID: <lxy277le4ku73e5xf4yawoviapa5ii3msto7wjgzl3o5fmwnrr@3bcntrq7tk4i>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.19-rc1

to receive updates for the input subsystem. You will get:

- a quirk for i8042 to better handle another TUXEDO model

- a quirk to atkbd to handle incorcet behavior of HONOR FMB-P internal
  keyboard

- a definition for a new ABS_SND_PROFILE event

- fixes to alps and lkkbd drivers to reliably shut down pending work on
  removal

- a fix to apple_z2 driver tightening input report parsing

- a fix for "off-by-one" error when validating config in ti_am335x_tsc
  driver

- addition of CRKD Guitars device IDs to xpad driver.

Changelog:
---------

Christoffer Sandberg (1):
      Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table

Cryolitia PukNgae (1):
      Input: atkbd - skip deactivate for HONOR FMB-P's internal keyboard

Duoming Zhou (1):
      Input: alps - fix use-after-free bugs caused by dev3_register_work

Gergo Koteles (1):
      Input: add ABS_SND_PROFILE

Junjie Cao (1):
      Input: ti_am335x_tsc - fix off-by-one error in wire_order validation

Minseong Kim (1):
      Input: lkkbd - disable pending work before freeing device

Sanjay Govind (1):
      Input: xpad - add support for CRKD Guitars

Sasha Finkelstein (1):
      Input: apple_z2 - fix reading incorrect reports after exiting sleep

Diffstat:
--------

 Documentation/input/event-codes.rst       | 6 ++++++
 drivers/hid/hid-debug.c                   | 1 +
 drivers/input/joystick/xpad.c             | 5 +++++
 drivers/input/keyboard/atkbd.c            | 7 +++++++
 drivers/input/keyboard/lkkbd.c            | 5 ++++-
 drivers/input/mouse/alps.c                | 1 +
 drivers/input/serio/i8042-acpipnpio.h     | 7 +++++++
 drivers/input/touchscreen/apple_z2.c      | 4 ++++
 drivers/input/touchscreen/ti_am335x_tsc.c | 2 +-
 include/uapi/linux/input-event-codes.h    | 9 +++++++++
 10 files changed, 45 insertions(+), 2 deletions(-)

Thanks.

-- 
Dmitry

