Return-Path: <linux-input+bounces-3811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CFF8CDF1F
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 03:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A08E8B220B0
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 01:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AB44A3C;
	Fri, 24 May 2024 01:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHW8UOdR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0267816;
	Fri, 24 May 2024 01:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716513634; cv=none; b=gH3Cxv7anwrm44QiqKaUuyfVdKv1rXa2HeAuduD/DYOV6C5kGFbqXMn63e5vTCPMtzLFniojbijOtQptCi+mmIvnh77rtSTPN7i0dltcEVqKRwUW7I7mplYprMMYDIXR4sL7ba1CwwBiudMQ12NjLFNEBHLYmLr15PNH1NqbA24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716513634; c=relaxed/simple;
	bh=Bv2fqhQ6crAKHzkoPOocX3L0IkAyD764R4uF+Tbxds0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DL5FVGe3vIll3L7cQ0UxHnnk8ziEkCqn0gGv+JMDmxR+rAncbQkJlYUMfWZ/SjnUdsg1+GvT08VoZAeZVZflkdvrKG/Z1NuFAHzXcYrifHlEmoQfuYX7xsKm1MmfXLuuQUtsuIUEETRo2xCnzxP1b95X0UOjAqXUcCg7dQjS55k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHW8UOdR; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-68197de7400so315495a12.3;
        Thu, 23 May 2024 18:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716513632; x=1717118432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZRrj1cO5N3KcB91sUzwO9xthNjY98nDSWRAaw3nnWA=;
        b=fHW8UOdRTiR4Pyr4OaoS9nC0LEAXc2yLz66VLxT3ZjGAnKiruE49v+DcdDxiTbrxnP
         T1S2XxZs59dkZIsKKAWp802pPFjTPPxulcSIt0yN/qM3cu/bbNfvPkDgGBlumRQgsO54
         9HNAY5pAzFGq7affXhE+HkVh2r8t2N2cKh6AmZbftmXejTTc8Fd9Siom3C65xMX680yv
         TcHmA+jIzA6qYR0EBy4OjGOO3GUOFwglViccq9q2OO3Ab0yiVmqpC18fbCaUb3szatHg
         xnTI08aWaIDXCG4I9G+lax5T+SgFgp+EY+aitJwZVBkP3bChJMdaXbytDCsGtACO6TaW
         jYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716513632; x=1717118432;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZRrj1cO5N3KcB91sUzwO9xthNjY98nDSWRAaw3nnWA=;
        b=Lrb3KTI6gDRJLA1oYRX5Ye48MtNF9CbiVVvyUaNDiLjULeZO0fPZLo/JJdMnAWAB+B
         ZLYVIf2w39FcgDpXuo/ID62r8j4Vn/Fe2xH+jBlm/E7Tw5dvkGnN5PFBnBVKS3tudiZc
         T8j+xgIVq3XwYSAt2i2tD0TQASVj9DfAwWzcZgSvnyykwFuPQIlouvSZyAh+OhTunroI
         hG8dtSy6564O943Bwr1PB8pxKppvLZKB1qnkiChx0FCz0Su7mGSu5038jvNJsmaV+jNU
         ASA/KMjWStFEYMC+uoOju2jW8DZqRBxPSBqw4fecZRjc8h6m3LR1fhf4DX44MgVuGOFS
         DNHg==
X-Forwarded-Encrypted: i=1; AJvYcCXc5l/SA46qEu/zxMj24tXLdG9p8aylhewcWz5R1QhBU0hGR00fCx5r5h6axlKAPTELUAvDtZEBABg+FMEtAX6TAZwaUWXnICkn8f8=
X-Gm-Message-State: AOJu0YzKYXzwE67Zd1qcTK4mV6Q53co/xPADRBpDqtrANrLJekpZcTHL
	7BpQKUVSAZMAyUZont2ovkxy2ngEQ5NGcgzspBZnyOSKrivkR8bRPqrgsQ==
X-Google-Smtp-Source: AGHT+IGaRhvfa+ezMVGd/cYSBoxHIDvzXdZkGZ7er9nlTiTC1zKnr/SCVo9JJSjlGOQnnaJX5ssgHQ==
X-Received: by 2002:a05:6a20:3c88:b0:1af:baf9:fef6 with SMTP id adf61e73a8af0-1b212d18054mr1406254637.16.1716513631231;
        Thu, 23 May 2024 18:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a2db:c673:b8d1:3097])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9b4588sm2098185ad.259.2024.05.23.18.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 18:20:30 -0700 (PDT)
Date: Thu, 23 May 2024 18:20:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.10-rc0
Message-ID: <Zk_rXBV8E8Hwu04W@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc0

to receive updates for the input subsystem. You will get:

- a change to input core to trim amount of keys data in modalias string
  in case when a device declares too many keys and they do not fit in
  uevent buffer instead of reporting an error which results in uevent
  not being generated at all

- support for Machenike G5 Pro Controller added to xpad driver

- support for FocalTech FT5452 and FT8719 added to edt-ft5x06

- support for new SPMI vibrator added to pm8xxx-vibrator driver

- missing locking added to cyapa touchpad driver

- removal of unused fields in various driver structures

- explicit initialization of i2c_device_id::driver_data to 0 dropped
  from input drivers

- other assorted fixes and cleanups.


Changelog:
---------

Arnd Bergmann (1):
      Input: ims-pcu - fix printf string overflow

Christophe JAILLET (8):
      Input: da7280 - remove an unused field in struct da7280_haptic
      Input: tca6416-keypad - remove an unused field in struct tca6416_keypad_chip
      Input: tca6416-keypad - remove unused struct tca6416_drv_data
      Input: matrix_keypad - remove an unused field in struct matrix_keypad
      Input: lpc32xx-keys - remove an unused field in struct lpc32xx_kscan_drv
      Input: cros_ec_keyb - remove an unused field in struct cros_ec_keyb
      Input: chipone_icn8505 - remove an unused field in struct icn8505_data
      Input: zet6223 - remove an unused field in struct zet6223_ts

Dmitry Torokhov (2):
      Input: adafruit-seesaw - only report buttons that changed state
      Input: try trimming too long modalias strings

Erick Archer (1):
      Input: ff-core - prefer struct_size over open coded arithmetic

Fenglin Wu (4):
      Input: pm8xxx-vibrator - correct VIB_MAX_LEVELS calculation
      input: pm8xxx-vibrator: refactor to support new SPMI vibrator
      dt-bindings: input: qcom,pm8xxx-vib: add new SPMI vibrator module
      input: pm8xxx-vibrator: add new SPMI vibrator support

Joel Selvaraj (2):
      dt-bindings: input: touchscreen: edt-ft5x06: Document FT5452 and FT8719 support
      Input: edt-ft5x06 - add support for FocalTech FT5452 and FT8719

Karel Balej (1):
      Input: ioc3kbd - add device table

Kirill Artemev (1):
      Input: xpad - add support for Machenike G5 Pro Controller

Krzysztof Kozlowski (1):
      Input: stmpe - drop driver owner assignment

Marek Szyprowski (1):
      Input: cyapa - add missing input core locking to suspend/resume functions

Ricardo Ribalda (1):
      Input: sur40 - convert le16 to cpu before use

Uwe Kleine-König (1):
      Input: drop explicit initialization of struct i2c_device_id::driver_data to 0

Diffstat:
--------

 .../devicetree/bindings/input/qcom,pm8xxx-vib.yaml |  16 +++-
 .../bindings/input/touchscreen/edt-ft5x06.yaml     |   2 +
 drivers/input/ff-core.c                            |   7 +-
 drivers/input/input.c                              | 104 ++++++++++++++++++---
 drivers/input/joystick/adafruit-seesaw.c           |  21 ++++-
 drivers/input/joystick/as5011.c                    |   2 +-
 drivers/input/joystick/qwiic-joystick.c            |   4 +-
 drivers/input/joystick/xpad.c                      |   2 +
 drivers/input/keyboard/adp5588-keys.c              |   4 +-
 drivers/input/keyboard/cros_ec_keyb.c              |   2 -
 drivers/input/keyboard/cypress-sf.c                |   2 +-
 drivers/input/keyboard/dlink-dir685-touchkeys.c    |   2 +-
 drivers/input/keyboard/lm8323.c                    |   2 +-
 drivers/input/keyboard/lm8333.c                    |   2 +-
 drivers/input/keyboard/lpc32xx-keys.c              |   3 +-
 drivers/input/keyboard/matrix_keypad.c             |   1 -
 drivers/input/keyboard/max7359_keypad.c            |   2 +-
 drivers/input/keyboard/mpr121_touchkey.c           |   2 +-
 drivers/input/keyboard/qt1070.c                    |   4 +-
 drivers/input/keyboard/qt2160.c                    |   2 +-
 drivers/input/keyboard/stmpe-keypad.c              |   1 -
 drivers/input/keyboard/tca6416-keypad.c            |   6 --
 drivers/input/keyboard/tm2-touchkey.c              |   4 +-
 drivers/input/misc/ad714x-i2c.c                    |  10 +-
 drivers/input/misc/adxl34x-i2c.c                   |   2 +-
 drivers/input/misc/apanel.c                        |   2 +-
 drivers/input/misc/atmel_captouch.c                |   2 +-
 drivers/input/misc/bma150.c                        |   6 +-
 drivers/input/misc/cma3000_d0x_i2c.c               |   4 +-
 drivers/input/misc/da7280.c                        |   1 -
 drivers/input/misc/drv260x.c                       |   2 +-
 drivers/input/misc/drv2665.c                       |   2 +-
 drivers/input/misc/drv2667.c                       |   2 +-
 drivers/input/misc/ims-pcu.c                       |   4 +-
 drivers/input/misc/kxtj9.c                         |   4 +-
 drivers/input/misc/mma8450.c                       |   4 +-
 drivers/input/misc/pcf8574_keypad.c                |   2 +-
 drivers/input/misc/pm8xxx-vibrator.c               |  92 +++++++++++++-----
 drivers/input/mouse/cyapa.c                        |  16 +++-
 drivers/input/mouse/elan_i2c_core.c                |   4 +-
 drivers/input/mouse/synaptics_i2c.c                |   4 +-
 drivers/input/rmi4/rmi_i2c.c                       |   2 +-
 drivers/input/rmi4/rmi_smbus.c                     |   2 +-
 drivers/input/serio/ioc3kbd.c                      |   7 ++
 drivers/input/touchscreen/ad7879-i2c.c             |   4 +-
 drivers/input/touchscreen/ar1021_i2c.c             |   4 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |  10 +-
 drivers/input/touchscreen/auo-pixcir-ts.c          |   2 +-
 drivers/input/touchscreen/bu21013_ts.c             |   2 +-
 drivers/input/touchscreen/bu21029_ts.c             |   2 +-
 drivers/input/touchscreen/chipone_icn8505.c        |   1 -
 drivers/input/touchscreen/cy8ctma140.c             |   2 +-
 drivers/input/touchscreen/cyttsp4_i2c.c            |   2 +-
 drivers/input/touchscreen/cyttsp5.c                |   2 +-
 drivers/input/touchscreen/cyttsp_i2c.c             |   2 +-
 drivers/input/touchscreen/edt-ft5x06.c             |  12 +++
 drivers/input/touchscreen/eeti_ts.c                |   2 +-
 drivers/input/touchscreen/egalax_ts.c              |   2 +-
 drivers/input/touchscreen/ektf2127.c               |   4 +-
 drivers/input/touchscreen/goodix.c                 |   2 +-
 drivers/input/touchscreen/goodix_berlin_i2c.c      |   2 +-
 drivers/input/touchscreen/hideep.c                 |   2 +-
 drivers/input/touchscreen/himax_hx83112b.c         |   2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |   4 +-
 drivers/input/touchscreen/max11801_ts.c            |   2 +-
 drivers/input/touchscreen/mcs5000_ts.c             |   2 +-
 drivers/input/touchscreen/melfas_mip4.c            |   4 +-
 drivers/input/touchscreen/migor_ts.c               |   2 +-
 drivers/input/touchscreen/mms114.c                 |   2 +-
 drivers/input/touchscreen/raydium_i2c_ts.c         |   4 +-
 drivers/input/touchscreen/rohm_bu21023.c           |   2 +-
 drivers/input/touchscreen/s6sy761.c                |   4 +-
 drivers/input/touchscreen/silead.c                 |  12 +--
 drivers/input/touchscreen/sis_i2c.c                |   4 +-
 drivers/input/touchscreen/stmfts.c                 |   4 +-
 drivers/input/touchscreen/sur40.c                  |   2 +-
 drivers/input/touchscreen/tsc2004.c                |   2 +-
 drivers/input/touchscreen/tsc2007_core.c           |   2 +-
 drivers/input/touchscreen/wacom_i2c.c              |   4 +-
 drivers/input/touchscreen/wdt87xx_i2c.c            |   2 +-
 drivers/input/touchscreen/zet6223.c                |   4 +-
 drivers/input/touchscreen/zforce_ts.c              |   2 +-
 82 files changed, 328 insertions(+), 168 deletions(-)

Thanks.


-- 
Dmitry

