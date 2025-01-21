Return-Path: <linux-input+bounces-9460-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B96A18795
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 23:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B626E1676C1
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 22:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70651F193A;
	Tue, 21 Jan 2025 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHt0Oqlk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584C1B87F3;
	Tue, 21 Jan 2025 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737497129; cv=none; b=JSGo9YKaAlqU2Kx0PJNh5Ul7KWg6ToH1iHUccXQ+snYlmkc0GbFmibQEe65PJ6EWGEpOxtwkTLgUjLHt/Nys4Ig23v2IvlxuziYjH+ec1A9bUI/T/MEVhkq7eyWL7/DEHeEHOcRwPpBoo4LlxCF2ALsFKBouKlUzWyUltiTtlG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737497129; c=relaxed/simple;
	bh=6tBd8KmhQgbdbjKB3QMMp1HZ5LYvdh9SzRZSeO5h0o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+KVAM7sMM0dxb97eJxzaaLfzjB5J+qDFu32DGUOYNg9FhLpV1BacArYEJug+HGtkLaWAY1F+ej4p6hrsBUWyJkD+EDkIDwI0XlXEAKcsPn+BBJXT1oCvsy6mYKTJ/uFYFmDeQML+bRGGb2SgFLasLh304V4NaL6w3f7Mai1sd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHt0Oqlk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163b0c09afso112589855ad.0;
        Tue, 21 Jan 2025 14:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737497127; x=1738101927; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7m1a5DqkecaXuIIdi/rkfI89Lc6kiyL+e6dO9eOUmcQ=;
        b=JHt0Oqlk/TQUjXMDaMwgVSl1lUgWdiVBzF+OVggdoPJeHmfzI5xN03Po54+W1+WDK3
         JtVuU5Fpmh/bsU2FrAIC0VGsDmQQ0NHyF+qWITuX9V4wkeNSfCiip+tzIMa4UlzKYY/I
         K4zZlFdOgGscSYZQ1q3h+dXeZUQkh5ZtdWQK03PcFABXDGKaiy8GSvVn9Ncd2hKw9pvp
         clka9mkxzfEn6wMoDokfJRrmKfq4bKLJ4SBQC9pFg3NNdvhpUw1vHpa483d+RiirMyij
         T++5+DQTxd3n911eD1hVS7gioThvvWWUu4Lu1IQ9gUusdXMjBiFHOGZoXfb/Wcwq3Jf4
         2LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737497127; x=1738101927;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7m1a5DqkecaXuIIdi/rkfI89Lc6kiyL+e6dO9eOUmcQ=;
        b=CRS6Xgk4z+4fPH1KVqAMVCqY6QRQu47UE+7v/lcg6FsD4M3hIaqPKsneoZFh94DUkK
         tVoFf1VbGmRMbA28E/rH/OmkqiTc65vz2EemGiaDsPqb6kOONJ5xszBopz4oTHvIinU9
         9SHTczP+BPFxQ55S0iQHi4uHtEcagE+OspZvBdpokRSesTMYY3xJ5nSSyhNz5JbrHJIt
         1bg2JKIFe1OEz1fggnXFAqYiafwU/pnDyJplA31vmqo+zaLmE+6O5391AEYaK5IYJxM/
         JmUwld/grq37N4pNQMKmMIQl9G/ql85YVcRxTTgnkBmodb7COREWwXpqXWIf3P52TQuq
         97NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrSwgy8eBlh3nQiWQHIUAu5/2p8AE5i7DIuOi2cPGfLrnFekej6qsA8KLBV0wh2F5auA67c4aecLoLdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfhlHleQNo6U2cEhl6muSQZbXIxNKJF53WFJ6jLzqzIDURXiEu
	K9Nl1dScQ4NLBJGXaVgbEJwFpk9yYfXoEomyDqE1fCSheRV1PqSd
X-Gm-Gg: ASbGnctbiCnMjQutcKm2qmyDyCOCEQ1hYXZbdReegaWpWFlTREfnMKzsN5z42n3eBGn
	8HucLFcd60wwKl3yviZQW+mQ4Eej1QvSue/iAfqxoU6P7w2zzkAVdWoskMt1GP4nc5/ovemgytN
	9impGn6e2B9oMNa2MRsywVvrg18PLwQk7WsHVp7FVbPvmo+Fi/ej9C5nvaWU4DoV0T2OV/fV6r7
	yX4ZzB0XwKAxrrGHET/any0LmIF9AEKPwyTecZeLSN85dyWbbz1Ndx+u1gcXdEYNCPci4A=
X-Google-Smtp-Source: AGHT+IFQ1/oci51GImaph9W+ICKP+C4IX12/vv6Z6QCqdeS1kWimr0RyK8tRmqxfgVarehJgyVXf8w==
X-Received: by 2002:a17:902:d489:b0:215:a434:b6ad with SMTP id d9443c01a7336-21c35593f62mr258534675ad.33.1737497127024;
        Tue, 21 Jan 2025 14:05:27 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b7e0:baea:f99d:5c57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm83815135ad.196.2025.01.21.14.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 14:05:26 -0800 (PST)
Date: Tue, 21 Jan 2025 14:05:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.14-rc0
Message-ID: <Z5AaJFUUpzp4VgOo@google.com>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.14-rc0

to receive updates for the input subsystem. You will get:

- more conversions to the guard notation in the input core

- a fix for NXP BBNSM power key driver to clean up wake IRQ after
  unbinding

- several new vendor/device ID pairs added to xpad game controller
  driver

- several drivers switched to using str_enable_disable and similar
  helpers instead of open-coding

- add mapping for F23 to atkbd driver so that MS "Copilot" key shortcut
  works out of the box (if userspace is ready to handle it)

- evbug input handler has been removed (debugging through evdev is
  strongly preferred to dumping all events into the kernel log).

Changelog:
---------

Bartosz Golaszewski (1):
      Input: davinci-keyscan - remove leftover header

Dmitry Torokhov (9):
      Input: ff-core - convert locking to guard notation
      Input: ff-core - make use of __free() cleanup facility
      Input: ff-memless - convert locking to guard notation
      Input: ff-memless - make use of __free() cleanup facility
      Input: mt - convert locking to guard notation
      Input: mt - make use of __free() cleanup facility
      Input: poller - convert locking to guard notation
      Input: use guard notation in input core
      Input: synaptics - fix crash when enabling pass-through port

Jack Greiner (1):
      Input: xpad - add support for wooting two he (arm)

Jiri Kosina (1):
      Input: remove evbug driver

Krzysztof Kozlowski (1):
      Input: Use str_enable_disable-like helpers

Leonardo Brondani Schenkel (1):
      Input: xpad - improve name of 8BitDo controller 2dc8:3106

Luwei Zhou (1):
      Input: mma8450 - add chip ID check in probe

Mark Pearson (1):
      Input: atkbd - map F23 key to support default copilot shortcut

Matheos Mattsson (1):
      Input: xpad - add support for Nacon Evol-X Xbox One Controller

Nicolas Nobelis (1):
      Input: xpad - add support for Nacon Pro Compact

Nilton Perim Neto (1):
      Input: xpad - add unofficial Xbox 360 wireless receiver clone

Peng Fan (1):
      Input: bbnsm_pwrkey - add remove hook

Pierre-Loup A. Griffais (1):
      Input: xpad - add QH Electronics VID/PID

Thorsten Blum (1):
      Input: joystick - use str_off_on() helper in sw_connect()

Diffstat:
--------

 drivers/input/Kconfig                           |  14 -
 drivers/input/Makefile                          |   1 -
 drivers/input/evbug.c                           | 100 -------
 drivers/input/ff-core.c                         |  91 +++----
 drivers/input/ff-memless.c                      |  18 +-
 drivers/input/input-mt.c                        |  34 +--
 drivers/input/input-poller.c                    |   4 +-
 drivers/input/input.c                           | 339 +++++++++---------------
 drivers/input/joystick/sidewinder.c             |   3 +-
 drivers/input/joystick/xpad.c                   |   9 +-
 drivers/input/keyboard/atkbd.c                  |   2 +-
 drivers/input/keyboard/dlink-dir685-touchkeys.c |   3 +-
 drivers/input/keyboard/lm8323.c                 |   3 +-
 drivers/input/misc/max77693-haptic.c            |   3 +-
 drivers/input/misc/mma8450.c                    |  16 +-
 drivers/input/misc/nxp-bbnsm-pwrkey.c           |   8 +
 drivers/input/misc/regulator-haptic.c           |   3 +-
 drivers/input/mouse/elan_i2c_core.c             |   3 +-
 drivers/input/mouse/synaptics.c                 |  56 +++-
 drivers/input/mouse/synaptics.h                 |   1 +
 drivers/input/touchscreen/egalax_ts.c           |   3 +-
 include/linux/platform_data/keyscan-davinci.h   |  29 --
 22 files changed, 275 insertions(+), 468 deletions(-)
 delete mode 100644 drivers/input/evbug.c
 delete mode 100644 include/linux/platform_data/keyscan-davinci.h

Thanks.


-- 
Dmitry

