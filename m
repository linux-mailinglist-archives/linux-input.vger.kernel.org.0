Return-Path: <linux-input+bounces-11254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E8CA708A7
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F833ADB5A
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB262641ED;
	Tue, 25 Mar 2025 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMnFCm4J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C725E802;
	Tue, 25 Mar 2025 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925710; cv=none; b=diNYqp4GwRZTuB9MilMg+rAp0toj5kSLeFPwMJSxRI7rwHOAkukq0KNb25ZZ16ypBHkQgMgb1hHfQr669R2ParrOwvspRCIF9MUA1nykhe75hMS7vLX/dTjprBmPX5/KJb5SC9sHTTQIaTzUVCoPrqfl5UG/a61Z9LenYHmzW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925710; c=relaxed/simple;
	bh=qYMDHNy6x7LteSXyJourP/ZKJgw92Af9wGSpBcLqRb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEQrf1RqmNsMkGe93T75sEjW6rwJE+CnTeQ02wcYGD0elVNBaHaLgEXvj4RMFp9l8963YdlHbH/OShtNv9cFPCIYoc3VKASHMVJCeK3yw8TJXn6JDMoETHb54SL+3cf6bjiMeMzGkJFUx5wVA0EpQ1wqFU+kbdcA+SOnDgn6YCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMnFCm4J; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3011737dda0so7775932a91.1;
        Tue, 25 Mar 2025 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742925708; x=1743530508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8rvo4PVoMB8SeibvRLkn8Z5/SmePf793BhCpZf68DA=;
        b=nMnFCm4JsAy6CEBi63gIjCNysHwj54CwFhwyBIeJ1lbgHK/xzxR9/H0Ts/9RQcZH3s
         1dRzq8LKb1/U16zhEc8tVJD3WQVMVpLnG4u9eEq660lJd3bTSEvUumLr0Lp3DlFjYDPM
         VcEKA30K5WZuxqMWr9IWEcQ8Sro/5bcMCYiwsWFL2uJV7BUzOC0u52uotwuWLUAIkeAL
         p576gqltgaXW/K4NZ5lfb1JnbI60gBKaWMnIJOKQDrMD9Q3DImYD9qNe0oYUYT0ur00q
         YFCDtgjg/ix9cBPo11XjBSkm62BLmdn0TrpqDGk1/MEVNQwi4vUPD4WvICd2QG+i1m4E
         vTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925708; x=1743530508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8rvo4PVoMB8SeibvRLkn8Z5/SmePf793BhCpZf68DA=;
        b=JVo4670Fb/0EsRkcycFS7B67O8xrvbW5iW6ucykINXnDVJATPkvdPp9/lQxZ5ANHe1
         yT0FybEcLHlek4fOS1wsba5D7bwv7w46qSdSY+9Hy1pEBsw+Sb6wbznRYmsSgNw6zVT2
         oLa9Wq22tjG25ryEH9W0XrfyGE4iNEk29m8mDTRiI0VR/0vdiABtlpr4rvr4/icZ2ebw
         wKuxhMoSlPOsMmkgJ528kcOt6A3YCv6S1F0TQhrhfeP1YWoCgAUblB29csemgPaV3jDR
         3tibj1vmcyl6xI7P6sQPs5L9BSFeZ7OpEs0SSifveiB1nU4jYxbd9bQQ1AjuHWusd8Bi
         G3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6alXtVZsFlFpR3ZML0ccw8GEGgkiCRZD1hIKJn6tuuryppyGavjfz7GNi7S0JcIRqcz2K6bmws2N6kB5S@vger.kernel.org, AJvYcCWETQEk9AzzhPOPdpJ82rd16KgjFz1hc+5Dau1WN9XXfqCd2JfaQpXBy0ACSh0ICbMmw8BY/6lPtfHX1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKd+uDfiKhA0xF7q3Nf91PrxYuz6PgssAr3CsLgOHp+hze1tmk
	l2p/2h1oPAqK0HvJWWRjAuYQgA43YupMq4fq2JOeHLy8d+Obio29
X-Gm-Gg: ASbGncsXohu8gT8g8CflKnzdijbb8ZQ6PCwDnugvN1t6KQ1I9r9CBQfbmp84N7pp7p5
	XoOdkReLs+b/nsaeZIybHl0+dnl8hpT/mJnqGXig/Wjy0HVIxYXqsgwIrWSYp+pVUopS+jAiN+Q
	hp6O6NIa2N7aKYc3cnwbpjX+o1J++MzIzMNqekzuUGZvicxKPqbJD4ewtuGzF3MRy5umiU+HCUS
	opW+08o0y55rZlPOAWNUXk55CJVuuzahmrntVgdj3XFx02UJVL2uTP79r7j2nqUXiXsJHAV8sVZ
	D4i4n52DPhSUd6uGY5vzri0X1/1CmN0RjiRpmpg4ZjILSIESxNznkWcyOaFljnvfiT0PgAVF5vD
	ZD8d7EKVk/jcDEPToEMWsb0XMmm6y+0KM9FiwZI9covql/g==
X-Google-Smtp-Source: AGHT+IH+8uJxRqDClMtWkj8EBCH2dLpeOyEIFLHzml5c1ywD55VVAPMOVPy9bwm0Qv2P2WBCDUitWw==
X-Received: by 2002:a17:90b:5105:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-3030fea47e8mr30353796a91.10.1742925707548;
        Tue, 25 Mar 2025 11:01:47 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d8287sm10683796a91.15.2025.03.25.11.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:01:47 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: gargaditya08@live.com,
	kekrby@gmail.com,
	orlandoch.dev@gmail.com,
	admin@kodeit.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] HID: multitouch: Add support for Touch Bars on x86 MacBook Pros
Date: Tue, 25 Mar 2025 17:57:23 +0000
Message-ID: <20250325180138.15113-1-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aditya Garg <gargaditya08@live.com>

Hi all!

This patch series aims to improve the Touch Bar support for x86 Macs.

Recently, the hid-appletb-kbd and hid-appletb-bl drivers were upstreamed
into the Linux kernel [1]. They enabled the Touch Bar to display a
predefined set of media and function keys, exactly the same it does on
Windows Bootcamp.

Now we are about to get support added for the DRM mode of the Touch Bar
as well [2].

The DRM mode enables the Touch Bar to act as a second display,
just like macOS. So now you can add a widget, put a clock or anything
else on the Touch Bar as long as you can develop a daemon.

Now via these patches, in the DRM mode, we can use the Touch Bar as a
touch screen. The Touch Bar seems to be not compliant with the HID spec,
thus via these patches several tweaks have been done under the cover of
a single quirk, MT_QUIRK_APPLE_TOUCHBAR.

For the case of T2 Macs, apple-bce [3], the driver for the T2 Security
Chip is also needed for all the peripherals, including the Touch Bar
to work. It is still WIP, and will be subsequently sent later to the
appropriate tree. Till then, I'll suggest for get the driver from [3],
or more preferably, get Linux support from https://t2linux.org/.

Cheers
Aditya

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-6.15/apple
[2]: https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0670c2f56e45b3f4541985a9ebe06d04308e43b0
[3]: https://github.com/t2linux/apple-bce-drv

Kerem Karabay (5):
  HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX
    fields in case of Apple Touch Bar
  HID: multitouch: support getting the tip state from HID_DG_TOUCH
    fields in Apple Touch Bar
  HID: multitouch: take cls->maxcontacts into account for Apple Touch
    Bar even without a HID_DG_CONTACTMAX field
  HID: multitouch: specify that Apple Touch Bar is direct
  HID: multitouch: add device ID for Apple Touch Bar

 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 62 +++++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 5 deletions(-)

-- 
2.49.0


