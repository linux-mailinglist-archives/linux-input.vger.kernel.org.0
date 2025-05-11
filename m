Return-Path: <linux-input+bounces-12263-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3925AB26E9
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 08:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25AF21893CB5
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 06:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FE617555;
	Sun, 11 May 2025 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sh6+cLMw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF228FF;
	Sun, 11 May 2025 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746945119; cv=none; b=KYJi3sDskQyGuJC6xUMXHuUGYFd/tFrzdC6pN7lY0VmL5U4arNqoDu3lgobcFmg9elrWw4x1hsxKwO+TqrZhlugf9ICODVfRCK4C/1s1qtY5uvo1G2VA14nPxntoSNfFucjVOvA15mQnB7ePhq+KFXGpF6FHxOho1gUyFgyLyzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746945119; c=relaxed/simple;
	bh=znWVQx+aqXY7eayIr59PYdm+cbIp1ZLO7od2r167Aho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i2y4vJ23/vk//o/9WgxZ6TV/3vUBkg/KOdWyIca5ADw9a0cKLDDhbBfZCGGjDBe6H5rplrkG001v92+jqzjG7cXJgQvrCZ9Djapf43NpvTKx1JWJuBc8VU0EvncHZnt25PywTPnepne5OLF18N6HOa1E5D0CiP9V+qqckgnHreM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sh6+cLMw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30a9718de94so3290295a91.0;
        Sat, 10 May 2025 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746945117; x=1747549917; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pTJSC0l4aJk91qxHFBVyudGRwUZQSvuJfiYEWiJ6nRQ=;
        b=Sh6+cLMwg1EsVCaIEABUuwBI/3u9LWehZk4zjcwuIqL2PB8n1ohwgO/Bi/AuTPPJ+d
         KgAZ6gA0rzmMD6k3kcNirK8fGa7k2/TnUGMVwIHJIueCqTD45ykRcz7sny9srbweZplF
         6BZwIZNFupBk9oQFuCPx+SAcK3FAmoWh7ggs7hrOG4Nc8RMzlaoj8XiwqQo5HvJ6xptB
         rR2mV2XeOEsbO/AjkYUjTOK/Sc0PKsqxm2da04stVcOiBr871rJc/oJhETW8GBr5o5iC
         mWUDbSihhXEjn8F5QQ7yOFhs9R6ay6P4f0PNATXxaktTWjQqNL5YBrnCEHBhqWTvzSLK
         gG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746945117; x=1747549917;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTJSC0l4aJk91qxHFBVyudGRwUZQSvuJfiYEWiJ6nRQ=;
        b=lVXNCq3ZEXoutlOKxyqaoEQSksS8oaoREJsc0a4LrDkCcdTNY06cTtFO579ylxMmC4
         Gpe8QN2v/OWgZYrgJg71OCxTGuRVegNDnHwPj9At4wCE82vsbt13gTZLUPmZkvUihm8G
         g/xVTNbsS/YqTnUOFnfusCmhswsYDQRELJVwkHsPPiK2x13Dd18SPu0HqwnTBeBcbjlg
         goqH2MdHiXwZ3aA7pLF57V+IwJzI3gm2m4HR1XQMx5Khzd+gPHy/JSmJfZCEePEAw0Hv
         kApruAGrFUAKTLTJ8KGIVH9k9BcdJmSDm5t916iBDdFpYSdtJ58CCZqUQJS83Cahs0BZ
         HqdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc0nXh7AIHFgv0VB8h4cjq/mx2BGyQxnOSIFXv6qUUBPVDYGW9J5VjWMMMu4sEYvsZIwl04J+FYjzurw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1rmn8J9L+iWNXCYH9sD/8sQOLv2JVR/fJujjrV/FMgZzu5mHc
	e/Y3lcXy6tepuBGlj7HYw9jIqKQCoGdVMEDN2BBVR+uWMtn0HJ2fL6OTZQ==
X-Gm-Gg: ASbGncsS5mlBr+a1CxC3wWKeWmxnVNZYnxYo0Fo5F29hX969Qh5fBO6LoFaOBQicnAa
	UkPzIzVZdEfbYb/SJHPwi+HMZC+NpZyiaK8jaZs1eN9Lnoz0ZtKlJ9XwfC40CUNHFSyV3BbNv+a
	wFUrcEXHWsvfB2xf5nSnHkUaKduxjkesQeeHsGBwi0b0FQAquxjtOMETMuhuZP74p2Rj1y/pQiH
	rMYqAa4bL51D34Wa6sSmBSrbrogzqgxYuyiPen0y6MiQJ15hLCJ0sWMk9gS28ivtUHndfKTSnYI
	WgSSgKJayV+tOG/01pyOjhDOJacA5fAZGEd0XjzF1xXcjJWj6Fgp
X-Google-Smtp-Source: AGHT+IHWNoCsOihMMlrfYsfq/Fv2v5HxGZVSIulYCQFLHZGUVh0kjdIMMNXSwI8fdL5Vzkaq7Cy2TQ==
X-Received: by 2002:a17:90b:35d2:b0:30a:214c:24c9 with SMTP id 98e67ed59e1d1-30c3cafbd2cmr13244319a91.3.1746945116770;
        Sat, 10 May 2025 23:31:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:81cd:844c:3bd7:4808])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad483fe6fsm6526582a91.6.2025.05.10.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 23:31:56 -0700 (PDT)
Date: Sat, 10 May 2025 23:31:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.15-rc5
Message-ID: <vjfoxhbcvltgxbmmnjfnqllyrynjwh2cpraylma644hyhlv5jh@dzbn3dmblhyq>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.15-rc5

to receive updates for the input subsystem. You will get:

- Synaptics touchpad on multiple laptops (Dynabook Portege X30L-G,
  Dynabook Portege X30-D, TUXEDO InfinityBook Pro 14 v5, Dell
  Precision M3800, HP Elitebook 850 G1) switched from PS/2 to SMBus mode

- a number of new controllers added to xpad driver: HORI Drum
  controller, PowerA Fusion Pro 4, PowerA MOGA XP-Ultra controller,
  8BitDo Ultimate 2 Wireless Controller, 8BitDo Ultimate 3-mode
  Controller, Hyperkin DuchesS Xbox One controller

- fixes to xpad driver to properly handle Mad Catz JOYTECH NEO SE
  Advanced and PDP Mirror's Edge Official controllers

- fixes to xpad driver to properly handle "Share" button on some
  controllers

- a fix for device initialization timing and for waking up the
  controller in cyttsp5 driver

- a fix for hisi_powerkey driver to properly wake up from s2idle state

- other assorted cleanups and fixes.  

There will be a trivial conflict in drivers/input/joystick/magellan.c -
please simply accept version coming form this pull request.

Changelog:
---------

Aditya Garg (3):
      Input: synaptics - enable InterTouch on Dynabook Portege X30L-G
      Input: synaptics - enable InterTouch on TUXEDO InfinityBook Pro 14 v5
      Input: synaptics - enable InterTouch on Dell Precision M3800

Arnd Bergmann (1):
      Input: stmpe-ts - use module alias instead of device table

Dmitry Torokhov (1):
      Input: synaptics - enable SMBus for HP Elitebook 850 G1

Gary Bisson (1):
      Input: mtk-pmic-keys - fix possible null pointer dereference

Hugo Villeneuve (1):
      Input: cyttsp5 - ensure minimum reset pulse width

Kees Cook (1):
      input/joystick: magellan: Mark __nonstring look-up table

Lode Willems (1):
      Input: xpad - add support for 8BitDo Ultimate 2 Wireless Controller

Manuel Fombuena (1):
      Input: synaptics - enable InterTouch on Dynabook Portege X30-D

Mattijs Korpershoek (2):
      dt-bindings: mediatek,mt6779-keypad: Update Mattijs' email address
      MAINTAINERS: .mailmap: update Mattijs Korpershoek's email address

Mikael Gonella-Bolduc (1):
      Input: cyttsp5 - fix power control issue on wakeup

Ulf Hansson (1):
      Input: hisi_powerkey - enable system-wakeup for s2idle

Vicki Pfau (4):
      Input: xpad - fix two controller table values
      Input: xpad - fix Share button on Xbox One controllers
      Input: xpad - add support for several more controllers
      Input: xpad - fix xpad_device sorting

WangYuli (1):
      Input: sparcspkr - avoid unannotated fall-through

Diffstat:
--------

 .mailmap                                           |  1 +
 .../bindings/input/mediatek,mt6779-keypad.yaml     |  2 +-
 MAINTAINERS                                        |  2 +-
 drivers/input/joystick/magellan.c                  |  2 +-
 drivers/input/joystick/xpad.c                      | 49 ++++++++++++++--------
 drivers/input/keyboard/mtk-pmic-keys.c             |  4 +-
 drivers/input/misc/hisi_powerkey.c                 |  2 +-
 drivers/input/misc/sparcspkr.c                     | 22 +++++++---
 drivers/input/mouse/synaptics.c                    |  5 +++
 drivers/input/touchscreen/cyttsp5.c                |  7 +++-
 drivers/input/touchscreen/stmpe-ts.c               |  7 +---
 11 files changed, 65 insertions(+), 38 deletions(-)

Thanks.


-- 
Dmitry

