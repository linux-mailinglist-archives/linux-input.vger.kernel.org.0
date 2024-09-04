Return-Path: <linux-input+bounces-6129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C096AFE7
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FF5B1F24D5D
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DC081749;
	Wed,  4 Sep 2024 04:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPu0tm2i"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F9635;
	Wed,  4 Sep 2024 04:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424974; cv=none; b=G/JipL+OhNEdWkpZl6NAaPqKP5GggeufUQylOLBvGkQpLb/ikEFkgCZzrnGyDA1oB6595+hOzxmQOe+2YPK/+ZEubsgfbuC0+JNAXGEmiygtIbjWgmne2tjwzLgqfctVebpuzkGULYZCQDcL/xAcmsHLxhJWJ1Cbua/CQQsw3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424974; c=relaxed/simple;
	bh=+h8kdUCg4/FePJBhjbEGWGYW7kxu0rydT9glstDBVRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+yBJ3CxyE7EoEeCODUeF/PWeyy19k8uaabgVFpRWDsrRMaadiFnG4GhH7z9U/qUDxPEs3P1IxkfHhELTsiQOA32g4MP22Xq8Fc3SWh5D2XeLHUONVZFqfTplZ8uerRu9rb3O6xHbXMJfkvMTt7ZYJknQb4itg2ZvlpLyBl3NHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPu0tm2i; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-204d391f53bso43367015ad.2;
        Tue, 03 Sep 2024 21:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424972; x=1726029772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+JSXO+O2HtifcDjztusFG7m/5qSZGfOm+eN7aExpfA=;
        b=EPu0tm2i/Zt0s1zZR4Ws+0MJIhDICRkmy5buFIv0EMyhsaKKIAUxiYUJJqm4QNbscI
         E+Pd7Fu4PomJOkGfxljF3GbYZTrZ6Rtp4sFwSajlDlhyFQEKwo24rHZ72O8wXv4r6qLR
         tpX8Rk8t//s5LZ08FFMo/aGdRpu/KW6tWSfT0piBg0YgGytZpveaE824fJmea4G/KVLW
         /yiHnL6BSbvwNIpwsF0HtqVm2VcOkLFZC6tVlsc0lwlck4lSElbjkUEwUGFo6+IwYp84
         +q4M/7MxJsH4AW21sruG3Sr/J8PvkocI8EIc1V55SdeoKEwCwcrMuYPX8/XyinZ3LG8y
         mKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424972; x=1726029772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+JSXO+O2HtifcDjztusFG7m/5qSZGfOm+eN7aExpfA=;
        b=r9t48z7ISCOgZZjz/TMeQdLr3S2QB2dUaLrTOxSLberHJd5uFnpEuLW+ofKBisAm1o
         rzhVUwQjjEDYN/tyl+xqeQXesxtMXzixiJMB/VRv7YTJe9aKZoYJUjplD21lCYW5j3MN
         8j390jm0tAIIy8dEIQeMETXHdBq1F9eAsUtOO7TQDKCPthyBngsKy9RuI5fWe1pDxG/3
         +XSSljHimwYs47yU1x0ADU/Ti9iVWemZT0fninyOTxzHcT1fkvQTMO2OSpm0ktkFIALX
         SfZmvo6HQc5Nfefd6SlUlvdzFlGRmXopgoHq8qJe2ZSkErGeoU4Mw3BqGwJ1dRD696Xa
         CCiA==
X-Forwarded-Encrypted: i=1; AJvYcCW8x54gPhoa4CASEt+SMra0jZdIHYXYOiueG0d1HlRkg+aKdLs9BZmLFoeCsYcUY8Fbsf7pyKSvuzCSMto=@vger.kernel.org
X-Gm-Message-State: AOJu0YwURQ1GEokrQfnMWw4agfzD70svQsjL0JizYwFJvkMJVvBapKII
	jeudgYjGJy873a1sxb94sAH/lxQvkKgnEb81HX8/cMzE0w7ixQ/FqL4vXg==
X-Google-Smtp-Source: AGHT+IEI3j5ZAWVD8PshMj/wr83yRF6glgj95s7pY2LpByWQzV80dKfF+PptwN8g/Zgoy3xO+q2Glw==
X-Received: by 2002:a17:902:cece:b0:204:e4c9:ce92 with SMTP id d9443c01a7336-205472f2eb1mr137278485ad.22.1725424972384;
        Tue, 03 Sep 2024 21:42:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae951c13sm5727665ad.103.2024.09.03.21.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:42:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/22] Convert misc input drivers to use new cleanup facilities
Date: Tue,  3 Sep 2024 21:42:20 -0700
Message-ID: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts drivers found in drivers/input/misc to use new
__free() and guard() cleanup facilities that simplify the code and
ensure that all resources are released appropriately.

Thanks!

Dmitry Torokhov (22):
  Input: ad714x - use guard notation when acquiring mutex
  Input: ati_remote2 - use guard notation when acquiring mutex
  Input: cm109 - use guard notation when acquiring mutex and spinlock
  Input: cma3000_d0x - use guard notation when acquiring mutex
  Input: da7280 - use guard notation when acquiring mutex and spinlock
  Input: kxtj9 - use guard notation when acquiring mutex/disabling irq
  Input: drv260x - use guard notation when acquiring mutex
  Input: drv2665 - use guard notation when acquiring mutex
  Input: drv2667 - use guard notation when acquiring mutex
  Input: ideapad_slidebar - use guard notation when acquiring spinlock
  Input: ibm-panel - use guard notation when acquiring spinlock
  Input: iqs269a - use guard notation when acquiring mutex
  Input: iqs269a - use cleanup facility for fwnodes
  Input: iqs626a - use cleanup facility for fwnodes
  Input: iqs7222 - use cleanup facility for fwnodes
  Input: max8997_haptic - use guard notation when acquiring mutex
  Input: pegasus_notetaker - use guard notation when acquiring mutex
  Input: powermate - use guard notation when acquiring spinlock
  Input: pwm-beeper - use guard notation when acquiring spinlock
  Input: regulator-haptic - use guard notation when acquiring mutex
  Input: rotary_encoder - use guard notation when acquiring mutex
  Input: sparcspkr - use guard notation when acquiring spinlock

 drivers/input/misc/ad714x.c              |  12 +-
 drivers/input/misc/ati_remote2.c         |  57 +++-----
 drivers/input/misc/cm109.c               | 167 +++++++++++------------
 drivers/input/misc/cma3000_d0x.c         |  16 +--
 drivers/input/misc/da7280.c              |  26 ++--
 drivers/input/misc/drv260x.c             |  50 ++++---
 drivers/input/misc/drv2665.c             |  44 +++---
 drivers/input/misc/drv2667.c             |  44 +++---
 drivers/input/misc/ibm-panel.c           |   5 +-
 drivers/input/misc/ideapad_slidebar.c    |  22 +--
 drivers/input/misc/iqs269a.c             |  55 +++-----
 drivers/input/misc/iqs626a.c             |  22 +--
 drivers/input/misc/iqs7222.c             |  30 ++--
 drivers/input/misc/kxtj9.c               |  14 +-
 drivers/input/misc/max8997_haptic.c      |  15 +-
 drivers/input/misc/powermate.c           |  11 +-
 drivers/input/misc/pwm-beeper.c          |  12 +-
 drivers/input/misc/regulator-haptic.c    |  23 ++--
 drivers/input/misc/rotary_encoder.c      |  23 ++--
 drivers/input/misc/sparcspkr.c           |  10 +-
 drivers/input/tablet/pegasus_notetaker.c |  86 ++++++------
 21 files changed, 311 insertions(+), 433 deletions(-)

-- 
Dmitry

