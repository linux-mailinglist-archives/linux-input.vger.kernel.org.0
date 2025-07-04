Return-Path: <linux-input+bounces-13374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE8AF873D
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 07:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2833517B96E
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 05:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01261347D5;
	Fri,  4 Jul 2025 05:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EopwffOv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B1711CA9;
	Fri,  4 Jul 2025 05:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607101; cv=none; b=KCm3tkK1HMLvJ2EG5mANpj6+hPsbUcO/wHKKAAkCcMeEmyQWY/AFjA29oULA6lPkXptFdMgE8q+jx+75i6HrKPnxPy6ITM7UKXgabrvq54Tu4I1Q3HoAxCEF/cZniXPqTJ8xtC/nUDOvxKLQ5ErRjtgKi9HP6zoexEntNG8ok2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607101; c=relaxed/simple;
	bh=V12d63hkERNm+c9AVeRrxNTF/IfNRFwdxKyd1enk4CI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqU4FvzS917JaoFg6uSpOHuQK1/2szNZU4phDEA6myyoFh5yF5uq5KcBnzMn/OM70qsRAGegsxYcLtg8gbGtHRFopcrqQM2Sz3ZwsfCHzI+cefw1JOzgdw0/cSFkrpwJbedVhpCCCeR1ReOkNMEyAfcdSOnyy3Knf8UomQ5ohhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EopwffOv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234fcadde3eso9707485ad.0;
        Thu, 03 Jul 2025 22:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751607100; x=1752211900; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pogRbjxBMF9v4j3VGI9bABnhpYMrItvYpoTjPTViwNQ=;
        b=EopwffOvd4DoVOaV3Br2g55boT4hdSomZ2jHs2fL//34+wl/bOIL3cjBjUUXYuzR/F
         bZspLUwuuNzMXKNR3djrhPxhwvRDuQA0NdQe7HSNdeToAO3Pmfza34nCA3PXttxS8zmL
         zvYMYd6+P03wambqVeJmWRMaFAh0l0/Tx3m44c7IIA12EoF4uJDc/jxfYfkZPvEgUIWr
         2sAimMxZHPiarQYqwV9q70I7bGTrEOudDYZMWJT+lNDcfU0NakogywalBsxV9gctqSGr
         3q1MmNc3QbhE8eIws4pu+yft8qTT+YvtBcUU3YpQ7760dFzAQzmd9rRJsL24/5nv/mla
         Dp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607100; x=1752211900;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pogRbjxBMF9v4j3VGI9bABnhpYMrItvYpoTjPTViwNQ=;
        b=c5INVcC6tgdIoBbx769pI6vzeYNrc9C8ndy6yFQ2T+T7DQ2oCwc+7UFx3zFLQM2l0L
         QYj43GNFyL1OLaugoukAn8i7+B0rgHrFz1bM/dxQamZuEQkNwc1/+So2+QDFeUQc0Uz3
         0j++gTWMhMk9T32E7QzQvZDcOp0R9M1VpDxxWNjxg82m3gM8zoSL7vaAi1SfuGz2MQf1
         4/QKuVsE9M/nzCVn5e5O/Dlj5HYQifV8YiN8lk7tTyyyB2xifdx7TN4gpC+8tb9gZy46
         oOYlfYfj2CsC5EwZX04Yqx/BEfgsa81u2QwTHYoYCQ6GYrXMNz52KfqLM+NkY/+Rywg2
         soEw==
X-Forwarded-Encrypted: i=1; AJvYcCX8ywaY7fdBiWgvMKCgAoK73SsVBBgpfKSlTImA7jpUxRv278WOrmnOvwP8RU73A3aqATM0rpZTMMN7+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXs9qabk3poHWrg2icHdg5eHk6FlGdLR4OILZt+LLVl0AkjBD
	1jJqpq7IJGMhqhExUky+QT88H551ZVwi+8KeodYlqTUm+1r8t3FnkoQj5OJRoA==
X-Gm-Gg: ASbGncsWaF3tWf1Amre2Wjnp2TJ9om9l6vRN19+n1kz7g0AQDycsfiw7qBH0zvfaQqz
	LV3mgyOb2EFdlK7HAWTHl7mAXoTcjCO6YM7oUiGi8eurw+fb+6QEECf5n1Un30ADUXI7I0CFEKQ
	nhFlE5NgqAsMxN37+kSIv+me34qky9LTU+bN4qlRyR8a7LHAeAmPQ8yrrkiYwbF3+bTtqhJtAlC
	GqNZ0xTjQa3SJEUbvXCWxxeJkCZQHfjEIKci4gwAB2cDHB62hX8l1LZYkfCCYx6wqZN2KJcyOHX
	eos6YGcVRdzJ1p1zomuRnew+dqqXI/rKXqREg3KjgUd7UWzIzUe1PSNEKS6AV2E=
X-Google-Smtp-Source: AGHT+IFauLb+JvWf1fzEQ+SQu05FAwhPoK0TB8DHORMtCiUZKcUsLhXeSgSlg9nmAMZnWgwXL6oPlw==
X-Received: by 2002:a17:902:e885:b0:235:1966:93a9 with SMTP id d9443c01a7336-23c8746d7c5mr15727215ad.3.1751607099621;
        Thu, 03 Jul 2025 22:31:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8ddd:816c:9ca2:2a5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c843519cdsm10719695ad.65.2025.07.03.22.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:31:39 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:31:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.16-rc4
Message-ID: <rl7tuutaftwo35bvpsdwkd2fg223yzxef6wj4ufwdz3eu2pjaf@ky6ht3qo6g6o>
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

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.16-rc4

to receive updates for the input subsystem. You will get:

- support for Acer NGR 200 Controller added to xpad driver

- xpad driver will no longer log errors about URBs at sudden disconnect

- a fix for potential NULL dereference in cs40l50-vibra driver

- several drivers have been switched to using scnprintf() to suppress
  warnings about potential output truncation

Changelog:
---------

Andy Shevchenko (1):
      Input: alps - use scnprintf() to suppress truncation warning

Chen-Yu Tsai (1):
      dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18

Dmitry Torokhov (4):
      Input: atkbd - switch to use scnprintf() to suppress truncation warning
      Input: alps - switch to use scnprintf() to suppress truncation warning
      Input: lifebook - switch to use scnprintf() to suppress truncation warning
      Input: psmouse - switch to use scnprintf() to suppress truncation warning

Jeff LaBundy (2):
      Input: iqs626a - replace snprintf() with scnprintf()
      Input: iqs7222 - explicitly define number of external channels

Krzysztof Kozlowski (1):
      Input: Fully open-code compatible for grepping

Mario Limonciello (2):
      Input: xpad - adjust error handling for disconnect
      Input: xpad - return errors from xpad_try_sending_next_out_packet() up

Markus Koch (1):
      Input: fsia6b - suppress buffer truncation warning for phys

Nilton Perim Neto (1):
      Input: xpad - support Acer NGR 200 Controller

Sven Peter (1):
      Input: apple_z2 - drop default ARCH_APPLE in Kconfig

Yunshui Jiang (1):
      Input: cs40l50-vibra - fix potential NULL dereference in cs40l50_upload_owt()

Diffstat:
--------

 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 12 +++++++-----
 drivers/input/joystick/fsia6b.c                            |  2 +-
 drivers/input/joystick/xpad.c                              | 11 +++++++----
 drivers/input/keyboard/atkbd.c                             |  4 ++--
 drivers/input/misc/cs40l50-vibra.c                         |  2 ++
 drivers/input/misc/gpio-beeper.c                           |  2 +-
 drivers/input/misc/iqs626a.c                               |  2 +-
 drivers/input/misc/iqs7222.c                               |  7 +++++--
 drivers/input/mouse/alps.c                                 | 10 +++++-----
 drivers/input/mouse/lifebook.c                             |  4 ++--
 drivers/input/mouse/psmouse-base.c                         |  2 +-
 drivers/input/touchscreen/Kconfig                          |  1 -
 drivers/input/touchscreen/melfas_mip4.c                    |  2 +-
 13 files changed, 35 insertions(+), 26 deletions(-)

Thanks.


-- 
Dmitry

