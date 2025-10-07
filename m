Return-Path: <linux-input+bounces-15279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C959FBC11F3
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 13:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6067F4F4EB8
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 11:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBE52D97A0;
	Tue,  7 Oct 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVJpuVRJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA82D94BD
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835842; cv=none; b=ERCGJIv4bne1wdEDlda/fOL3JgJPneJucHMvAahcKBkLBpCIpsELca2He6yH2nlxR7PwSExsGOlIlPewWCUa7K3U+aBr8DBW7J/f8UAZjd9zVlS0vtepfPF3kX3PIH4U9/w7q919uMnZPG63/W7FbZuJNoHJI4BwzITtOw39RUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835842; c=relaxed/simple;
	bh=/PRiiqiF96PuWnwl9YA7Ti6MlqcyY9JOkSncfrz0x/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ty1QEE/OXkn6zdGhxiwIipSCDPSzeFqF6mvnE5Vu0gzPDOBHzbKsioZzxN/nslt0JcbV1Xv042077ViuaR6zJ9sk0zel1fV+heoJ6BIdX4+CCdWpSHrrRP0YLeY75bmhEj4ll9UKkpOFks0Z/ElTxCN0NUFhR7xISbiIuVwM088=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVJpuVRJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2897522a1dfso60570735ad.1
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835839; x=1760440639; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNPG8g2C/MjBcgwcjFgR+4meO7GrmvtOu/w3NJ8raMs=;
        b=jVJpuVRJVQBh3JJTbh+sGk+KdNmE6Iv3b1kMQdAvO1mtllRHvzkLw/y4Og8bUen34N
         NVgAqIPYAxBs86O+itMo7ynxGznLDLsoz0nsTR7ItBBGLFtl/rqzarI1BmPTKbtsCKzw
         db3sRj5vfaF5uFeS4zgoMuaj14tWMc7iDDRXURRllBhU4xgba0d3W/on5NF4c6SDdGDE
         cWDAJxdJKDSEHdhQfio4nB+p7Q8AuwJVWhbUfk37DP1+O1hm9dskyRx64EFLJ262dOpW
         k9FQLSG0JosZg36VTEQP4LQyMgxPerhN9HBcyj3ICrmLflFy6M4aQ/OmBKypI47rLpQy
         zILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835839; x=1760440639;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNPG8g2C/MjBcgwcjFgR+4meO7GrmvtOu/w3NJ8raMs=;
        b=ma48LVdfzCzE37HprfzsPlLM4Mt6dl/YgJGDsD5aaVWY8T9CahZt1UHuPlUOCSFjYG
         zHM9tjiqZfJ7bL36hgDphNzWaqgxOdeQCiKwl5pTcFy4nPFgxfNz7HLckKiH/npIBYch
         TY4J43x+d2sTq2JE9qpEsgS/CcK3QBExHc2m7SxEa2YL8sNr4Y3YY69giNcH0Rmnnekp
         vX6zPfi2WB2viSpZ1kq2UYA+S02lpKaAd/kWtw8kMZO7eyDTz6jgnXQ1q7bJ+XmdZCty
         napB1zyT3GpMMT2E7qYgBsKDQQAPb8CCXJb0EcqTAu0JSI5GRrQX21lmdJjvuWJkZ1Vl
         Aspw==
X-Forwarded-Encrypted: i=1; AJvYcCU46MIbmn0P7GhQMCsuHC5cvO84eWGsRRxgpSPwckZ8VCxL/XjspkT8GBxAoMbsUApzuu/YX1FoDyovVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBMQFFxXC+f6943t6JAszyCjOd2Mnm7rio6VuvhmND4vxXfvh7
	exMZm5BLSQLcMrQgKU0ZFYecfPLdMFyeU+8zVX742efP/sRdP1bb0mcRXaiPIB7N
X-Gm-Gg: ASbGncspv8EUfGiULqHAsobW/Gre1sJni3F/O2SVjIrvOqPpx+pyrjRdewsE1ClaB5y
	wRkGGspL1/IJJ5Lv+0LTmnFC4nKV8tXq6lRvAJ5j5quQzymzwWdS4L70T1d0vpv/Fd1Z5pqy1Dh
	QTfvIsXsxT0g+PmmdjsThPWvEtauIlsx/ej+xVPh1G+ihqNxyQLgEfm2LH4lYpgvUH+46Q4fe9S
	mzuvs5X/fzFA7cUGE2CB7V3X1xiFHToQTDpX+IxvCvoml2DxmTOPhW5gILA6OqAVQlIuWjFIyEY
	5N5ynPMGXFx7qpi04poDqI0RMCrbhOOrnfNqVwOhnGgHxEVeHKhxqJ6cWPnMOU5+6nIFSGcGbA2
	JAhLRDVvNGv74/bMazV0rS9t/qI+h9BVlGCzdpnvp+s8TUjPz6D5gjDn7lAEQ/7qQ2mEiJZQqvd
	RpQBJ5hiDMuIyAS4UN76T3lqd5pD8adDHaxV0t56QV4Q==
X-Google-Smtp-Source: AGHT+IG/GlDlGMJXanFehOuQmiIBcouCj1tMidnpz7d4eBVLB7xu7Pq5DBctdYYycE/b48lWbFXOyw==
X-Received: by 2002:a17:903:1a4c:b0:278:9051:8ea9 with SMTP id d9443c01a7336-28e9a61a8f3mr184307865ad.40.1759835838888;
        Tue, 07 Oct 2025 04:17:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v3 00/13] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Tue, 07 Oct 2025 21:16:41 +1000
Message-Id: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJn25GgC/2XM0QqCMBTG8VeRXbfYZnOuq94jurCzow6axk6NQ
 nz3phBIXX4f/H8TI4weiR2LiUVMnvw45FHuCgZ9M3TIvcubKaG0qGXFQwMUgNPz6jARr40oFQh
 pnACWo3vE1r9W8HzJu/f0GON79ZNc3i9lf6kkueDauLaCEnUr7akLjb/tYQxsoZLa5Mr85Srng
 BqtdfoAqt7m8zx/AJTAT/XrAAAA
X-Change-ID: 20250816-macsmc-subdevs-87032c017d0c
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6425;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=/PRiiqiF96PuWnwl9YA7Ti6MlqcyY9JOkSncfrz0x/4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm35ovnV2Nm5cIfwTpOjJgdy6x+4ih/Z4q784hrnD
 8fr+pIdHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzkxFKGv6IrDrZfkpTacISn
 deeNX1IahfWH9OaFvRNbep3hjkHdWwNGhoWNim96Xwb3XLneYhIfI94ulang8sMuTJQ1ZO1+/re
 LmQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series adds support for the remaining SMC subdevices. These are the
RTC, hwmon, and HID devices. They are being submitted together as the RTC
and hwmon drivers both require changes to the SMC DT schema.

The RTC driver is responsible for getting and setting the system clock,
and requires an NVMEM cell. This series replaces Sven's original RTC driver
submission [1].

The hwmon function is an interesting one. While each Apple Silicon device
exposes pretty similar sets of sensors, these all seem to be paired to
different SMC keys in the firmware interface. This is true even when the
sensors are on the SoC. For example, an M1 MacBook Pro will use different
keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
necessitates describing which keys correspond to which sensors for each
device individually, and populating the hwmon structs at runtime. We do
this with a node in the device tree. This series includes only the keys
for sensors which we know to be common to all devices. The SMC is also
responsible for monitoring and controlling fan speeds on systems with fans,
which we expose via the hwmon driver.

The SMC also handles the hardware power button and lid switch. Power
button presses and lid opening/closing are emitted as HID events, so we
add an input subdevice to handle them.

This series originally cherry-picked three Devicetree commits to build
cleanly, however these have now been merged and were dropped.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

---
Changes in v3:
- Renamed macsmc-hid to macsmc-input
- Switched to pm_wakeup_event in macsmc-input
- macsmc-input now configures its capabilities before registering the device
- Renamed macsmc_hwmon to macsmc-hwmon
- Dropped module aliases in macsmc-input and macsmc_hwmon
- Introduced new SMC FourCC macro to silence GCC errors
- Condensed hwmon binding using $defs
- Made label property optional for hwmon sensors
- Fixed incorrect hwmon is_visible implementation
- Dropped 64-bit math from SMC float ops
- Fixed incorrect use of error numbers in hwmon driver
- Replaced a number of non-fatal dev_errs with dev_dbgs in hwmon driver
- Added hwmon driver documentation
- Added hwmon subdevice directly to the DT SMC node
- Included "common" hwmon sensors in SoC .dtsi files
- Fixed typo in hwmon-common.dtsi
- Added Neal's R-b to series
- Added required nodes to t602x Devicetrees
- Link to v2: https://lore.kernel.org/r/20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com

Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com

---
Hector Martin (2):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs
      input: macsmc-input: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (9):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: add hwmon SMC subdevice
      arm64: dts: apple: Add common hwmon sensors and fans
      arm64: dts: apple: t8103, t60xx, t8112: Add common hwmon nodes to devices

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  |  86 +++
 .../bindings/mfd/apple,smc.yaml          |  45 ++
 .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
 Documentation/hwmon/macsmc-hwmon.rst     |  71 +++
 MAINTAINERS                              |   6 +
 .../boot/dts/apple/hwmon-common.dtsi     |  33 +
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  22 +
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  17 +
 .../boot/dts/apple/hwmon-laptop.dtsi     |  33 +
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  15 +
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 arch/arm64/boot/dts/apple/t6001.dtsi     |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  10 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   3 +
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  10 +
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |  11 +
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |  11 +
 drivers/hwmon/Kconfig                    |  12 +
 drivers/hwmon/Makefile                   |   1 +
 drivers/hwmon/macsmc-hwmon.c             | 850 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 208 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1672 insertions(+)
---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


