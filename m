Return-Path: <linux-input+bounces-5803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA695D7D4
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21858B20E85
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0081B8EAB;
	Fri, 23 Aug 2024 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPS7g6RW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A571B8E87;
	Fri, 23 Aug 2024 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724445090; cv=none; b=CtXo7VE2El08GO8Jf8YdGdqkmFmtz++Lcpqr5hkyPSK2hOrZxCfmptuFOmv9M9ZnR15vlBIKL6FqACj5xdy/9/6DEPaLhoXtfYmqFtgLT+lbi1aEX5SvlcGKn6qKmQ3Vww1QRsh6w612KZSCcOgKLJkjWj46JHaReGXlaN7t14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724445090; c=relaxed/simple;
	bh=B21LZxV1wIqjOVmBZtDJRBNPAcgVHbIIFnF8egE8p4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jU1rWm5QbF6rIFb5CVDs/W+c761wa+QvmOxQJcRMJzWOlLVnnE4T4Dt2ckoqPTJsVfZWU3GTu2go4d6Z/KkShA2q4u+9kIgrxu2E6VFsD4lqlek8btw3bEsqfHgvoQ9b/+ts2bNiCVNunfeWh32jHzE3xQ0Kd6DYeLHy5dB10Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPS7g6RW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-714262f1bb4so1972864b3a.3;
        Fri, 23 Aug 2024 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724445088; x=1725049888; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVkYgAd9pwJ37tjg8sGU6xd6OORsj2mGna/zcnNQyOI=;
        b=kPS7g6RWVe9EesFhWdYGZGk517mCpEkAXqhAI0uw2DrIdHyY6kjdPkajiMFLBEaBbm
         4v7/j19u46bXh8SYFCJUhV0avZ6Y71SwnuB51MX2z2wcWCZ4Uf7KiiwftZfYvEEL4VRw
         lBXFO8uHVLsDKjekn1hNwfiS+nKCFThvr3aoJBCIyokER/CZZRXS7mKK1n8+2w4v42Jb
         rFj8O6uZinfieTrjJCZjXlh5iSg7mJryEq+hmuxxWJ+vVat84DPp9joFzdy6EcUYA/2u
         UR22M/gk6eTgSxBSTCX5NkNeaTlJt4jtWISh0C2D6ltbs2936P+QGxswL1EBWPK6Z0E4
         QmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724445088; x=1725049888;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVkYgAd9pwJ37tjg8sGU6xd6OORsj2mGna/zcnNQyOI=;
        b=PiXylIfSnynKttuSgMlam/sBTUvc7oeHYARe/x1cRRfI+4E5NKxCFLb2qrThjBIDpP
         0aXABIMtsbI32R90A7xfuYpnd8DCY0HdD1GiZCe9KfQUNYEy3zEmu8hMVeHJUmGQIOob
         2J8zXY8NsBIG7WHnhMoQcm7+77Q7C1xVLyEkD77SitSUik2RPRXi+IexUEQ3rjyjGByo
         5EYxsfG2S54rvfDHiPLGTUSdlTbmZTTXH0cCVuLhJZSpGrY2/W54n4U20woh1M62wWT5
         CkD1h0cXdCRVnIRN8Pgm2M06g+TXaEoXfst1VfbgZeyZhTKg1oiNIf0LF6IWMOVhergO
         eZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnPCpv2qMupfEdMDzseW5ohmFWFlGgpxJlBurSMpOrVIfUwj1vUiNbkXOytoC1ZP29k6QC1TPqRBqmOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztiHEEYvHcCpwTTuMiXtK7dmW+uSnTvsR3j3uOKmDkvsLG3WmG
	p7bviy4c1IbreUXeCYPWiPlvXa3Y1fZEldyZ6bxrEv5cYO9eUVwIQXHT5A==
X-Google-Smtp-Source: AGHT+IHwdfIvDGy3aVDUvOAQjl2U2G14TEsqZIEYJa1LTtRaT4M+o3I8NnK3DS4H/TTbXe74O+Yfiw==
X-Received: by 2002:a05:6a00:188c:b0:714:34c1:166a with SMTP id d2e1a72fcca58-71445e7783dmr4526213b3a.21.1724445088139;
        Fri, 23 Aug 2024 13:31:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e0d2esm3538305b3a.99.2024.08.23.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 13:31:27 -0700 (PDT)
Date: Fri, 23 Aug 2024 13:31:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.11-rc4
Message-ID: <ZsjxnTwQWOaTnPpY@google.com>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc4

to receive updates for the input subsystem. You will get:

- a tweak to uinput interface to reject requests with abnormally large
  number of slots. 100 slots/contacts should be enough for real devices

- support for FocalTech FT8201 added to the edt-ft5x06 driver

- tweaks to i8042 to handle more devices that have issue with its
  emulation

- Synaptics touchpad switched to native SMbus/RMI mode on HP Elitebook
  840 G2

- other minor fixes.

Changelog:
---------

Dmitry Torokhov (2):
      Input: uinput - reject requests with unreasonable number of slots
      Input: himax_hx83112b - fix incorrect size when reading product ID

Felix Kaechele (2):
      dt-bindings: input: touchscreen: edt-ft5x06: Document FT8201 support
      Input: edt-ft5x06 - add support for FocalTech FT8201

John Keeping (1):
      Input: adc-joystick - fix optional value handling

Jonathan Denose (1):
      Input: synaptics - enable SMBus for HP Elitebook 840 G2

Marek Vasut (1):
      Input: ads7846 - ratelimit the spi_sync error message

Takashi Iwai (1):
      Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk table

Werner Sembach (2):
      Input: i8042 - add forcenorestore quirk to leave controller untouched even on s3
      Input: i8042 - use new forcenorestore quirk to replace old buggy quirk combination

Diffstat:
--------

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  1 +
 drivers/input/joystick/adc-joystick.c              |  7 ++++--
 drivers/input/misc/uinput.c                        | 14 +++++++++++
 drivers/input/mouse/synaptics.c                    |  1 +
 drivers/input/serio/i8042-acpipnpio.h              | 29 +++++++++++++---------
 drivers/input/serio/i8042.c                        | 10 +++++---
 drivers/input/touchscreen/ads7846.c                |  2 +-
 drivers/input/touchscreen/edt-ft5x06.c             |  6 +++++
 drivers/input/touchscreen/himax_hx83112b.c         | 14 ++---------
 9 files changed, 54 insertions(+), 30 deletions(-)

Thanks.

-- 
Dmitry

