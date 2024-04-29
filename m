Return-Path: <linux-input+bounces-3305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEE8B6671
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2024 01:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE18B1C21120
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 23:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549B5199EA6;
	Mon, 29 Apr 2024 23:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n3CE4WKF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B3199E84
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 23:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714434037; cv=none; b=FvP7AvBTYrl20Xrn+ZSjbQa0zQoEpGRyDa2FAARVqHJB4sJgb5yMDoLCHm4HzBqeyPug5j80m/kQNQy0A2FVjuYUoTeNT0L7xQkIrQrQp+zR51VzpQx/iy2UX7mb3q1kX/oG4NGmUbygboxvjMZ2dUCIQRufsyNmjI7tFzbN3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714434037; c=relaxed/simple;
	bh=lue8tGKQodCQW7f9Ah8mLVDqX/DjwpQuD96ROdxcrKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mhbcMgwxfJwLpOtGW4EcsIy39Mmxjaplziaby45jjp3MDjaE1XWmyv9gpsUzF1P/Z+Ij+3JzVqC9nMNwY+ty7DpeGLEx+qZj3DMU7Km97V6Y5L7TB8rrv8b43Hou9Uf1U3Asr3A8tRe8Nah7pickakk8VB5++4wEpSMC9UfHLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n3CE4WKF; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-233f389a61eso2596503fac.3
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714434034; x=1715038834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RbyRopVLlo3z9muP6tADTHE5XtuugaNtZZWMLb0Jpk=;
        b=n3CE4WKF3ND/TUY3+9YxfL3fys9TCoaqxOAoU2s5yl/wugLbbqjrmzy7hFZ97Glvmk
         JyGNcQusHWdmW2pWMlEmf7dMRtSAIE5sqGVXlB4Z5DbOcXPYsvkkCqbLGYvlZxCnqScL
         EgJYtYOJ/NNBhJDq+u88rCVD2EiUhU0R4MXeJxBQNmx57OIJBNrzhVKXJO4XuQGLr9P2
         4yA1AKRkzUNft0nZGrH/PWcbFFCFE7+Nz+uA3/pbu6io5P/gxUqCgV70Y1ylzoK+QNrJ
         MP8jLCPuqy+bKrkFUyYzafcI1oVYKyBNzyN48Axsc0+bgOP1kpCDNeofqGBvqT0z7JeJ
         CHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714434034; x=1715038834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RbyRopVLlo3z9muP6tADTHE5XtuugaNtZZWMLb0Jpk=;
        b=BjnqsCXED0Algbo/v3Gml0d0DtkxsBWpC/NxRLgdGw0nk1uG86Gaf9KZpo2MLW53uT
         oyANwZ6lfG1gsPyPJZAYsnZpW/RKaDbiC6amT6KNfrl54kgsVCOXakWTIOl76MWoCq5S
         FFS7aeBrgpoc339JaPLxrxXMAEhq7ZBbWi6ojSPC574ONB6D8UiOpGaFgN2KApzq2ACG
         GbBQI7eAUMM3Km5sa2lT37UkSE9Vhotl2vDN+aPXNfc0ZijJKwS1m8KBpRTwwbZxk9oV
         6qqzOZqPHyb36iYg2L6euD8IE1bSvyq6Fu8k3V6U2YlJ7hTPdG1zqMvuFPJaVJ+du6CU
         lr0A==
X-Forwarded-Encrypted: i=1; AJvYcCWduER6qTWMHQt++6FrKIWX/KTfLpYInsE+0l5Ug2odPO1XHclqs1uNDFIEiQVUi1xjKnCTmXH2qXW7kc2oMso7SdlmXBWUHe4hQnA=
X-Gm-Message-State: AOJu0Yw4JKGfTtE8KRkHApJm5GwhZOFLvFP+/dpvv4lvQhX/Urpwn8tO
	oNM8aUDMbohhu8FTxBnO1FMc2tunl8g+9a6n1c+0/fgjaO1fRJVJcShMpkwvYLU=
X-Google-Smtp-Source: AGHT+IGP5WuztYu6eAOehmTgcCwU3XFCxmv4osL3pF9V/oN2vHxn21J6GhNMYPv+HR2qW2NPzbUEJw==
X-Received: by 2002:a05:6870:f22a:b0:22e:c787:5fa2 with SMTP id t42-20020a056870f22a00b0022ec7875fa2mr12446265oao.58.1714434033950;
        Mon, 29 Apr 2024 16:40:33 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id hp22-20020a0568709a9600b0023b58aa20afsm2144508oab.25.2024.04.29.16.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 16:40:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-input@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 0/7] regulator: new API for voltage reference supplies
Date: Mon, 29 Apr 2024 18:40:08 -0500
Message-ID: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

In the IIO subsystem, we noticed a pattern in many drivers where we need
to get, enable and get the voltage of a supply that provides a reference
voltage. In these cases, we only need the voltage and not a handle to
the regulator. Another common pattern is for chips to have an internal
reference voltage that is used when an external reference is not
available. There are also a few drivers outside of IIO that do the same.

So we would like to propose a new regulator consumer API to handle these
specific cases to avoid repeating the same boilerplate code in multiple
drivers.

As an example of how these functions are used, I have included a few
patches to consumer drivers. But to avoid a giant patch bomb, I have
omitted the iio/adc and iio/dac patches I have prepared from this
series. I will send those separately but these will add 36 more users
of devm_regulator_get_enable_read_voltage() in addition to the 6 here.
In total, this will eliminate nearly 1000 lines of similar code and will
simplify writing and reviewing new drivers in the future.

---
Changes in v2:
- Reworked regulator patch to remove dev_err_probe() and properly unwind
- Combined two proposed functions into a single function
- Renamed function to devm_regulator_get_enable_read_voltage() everywhere
- Fixed other feedback on consumer patches (see individual patches)
- Picked up Jonathan's Reviewed-bys (hopefully changes were trivial enough)
- Link to v1: https://lore.kernel.org/r/20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com

---
David Lechner (7):
      regulator: devres: add API for reference voltage supplies
      hwmon: (adc128d818) Use devm_regulator_get_enable_read_voltage()
      hwmon: (da9052) Use devm_regulator_get_enable_read_voltage()
      iio: addac: ad74115: Use devm_regulator_get_enable_read_voltage()
      iio: frequency: admv1013: Use devm_regulator_get_enable_read_voltage()
      staging: iio: impedance-analyzer: ad5933: Use devm_regulator_get_enable_read_voltage()
      Input: mpr121: Use devm_regulator_get_enable_read_voltage()

 Documentation/driver-api/driver-model/devres.rst |  1 +
 drivers/hwmon/adc128d818.c                       | 57 +++++++----------------
 drivers/hwmon/da9052-hwmon.c                     | 38 ++++-----------
 drivers/iio/addac/ad74115.c                      | 40 ++++++----------
 drivers/iio/frequency/admv1013.c                 | 40 ++++------------
 drivers/input/keyboard/mpr121_touchkey.c         | 45 ++----------------
 drivers/regulator/devres.c                       | 59 ++++++++++++++++++++++++
 drivers/staging/iio/impedance-analyzer/ad5933.c  | 26 +----------
 include/linux/regulator/consumer.h               |  7 +++
 9 files changed, 124 insertions(+), 189 deletions(-)
---
base-commit: 84c1815e46bdcb8bb0259db3d6cdd934cb70a0e9
change-id: 20240326-regulator-get-enable-get-votlage-5dedf40ff338

