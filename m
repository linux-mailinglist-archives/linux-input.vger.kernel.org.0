Return-Path: <linux-input+bounces-15709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E015C08647
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 02:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A42A1C81EA2
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 00:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747B9126C02;
	Sat, 25 Oct 2025 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np3AcZKH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55277262F
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 00:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351897; cv=none; b=MZRPP1wo48MtVBZssiQMG4H1PJlmhe5aVg2zNaqrBF17ii7TQ5WG4fltycSuaLl0fAAvt3b2LM6iwLshfnIenUkpvxn+oJmpPYu8P8k1EVzDezTCdhFDnlHAAykkedhwTGhZ/iitWiHxLiPC75I6B0WXMC9sS4xK8o5PVcuhRTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351897; c=relaxed/simple;
	bh=NEwP5oOU+xmnrc/qXQvktbP4weR9cV3E4YrWW5t1/y0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t6MUc00JLs6csoKJ230xab1S+HFmJ0lL/sgWTJsRbRqvEJ9uy1DuxCS9Jk4quFjc5PV+MK5VGTdphymaAat86W17apnY0aaGf955PY2aTJUaKu/iGyNPEswkibhQERnGFOFTuZg+5yYe3qTtxRh2zVmtlgvnW1Nr0dKU2i7VI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np3AcZKH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27eec33b737so37914555ad.1
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351895; x=1761956695; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=;
        b=Np3AcZKHY8kdSB8YcveSYovM6gJjbk/lSzYWEOPsA2ybs80KlVGu8KUCIluUJwaCgn
         +7kYAv6lotYQAiJDVEFZZxUlngmATPpJDkAH/qkT2Y+qauRpUUIbReboJf+7DAu70luv
         BaYb2Cd2pbuW+EzDj7sItkI780dsnDRU+6O7VihUlmX6SP3FG8Sox/xUEdyRvjlrIOY5
         m4ox7KMBHluLMocbvmmunGOrgc0sgi/Vtav9lYi9OpUiLLjb75N/c8ioHViApDaEg/wQ
         A9rQCWfARHw4qlZtN1d150tVZrg+ceCrSo4BigNgvv1DCqezoL9y3657q62XfuFUnlt/
         JgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351895; x=1761956695;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7waYNZVKmyie4QyAlCDozACqSO94wVCOTNBrkTDXkco=;
        b=oXrrjJOqKgvjYs040qotj1ehaUCLIhSz8M4Ch96ZxrwDD+RRjo7+RaTot8EJB/sMda
         k7h6qut3gUCkWJ51PDtrG4TEA9UKhJuSiiJ7xGIxOeUOdt6tOK195AXcnbejTb8QHFV0
         0pOzprCiMwOokcOpZjn9PayUmhT+R9hb97XghgCoM1BXTiu3imMazdqeYFPi51yBLFvw
         uvuImB7UEZi1mVdP8pkQAzYrAiebUUKqcB5PuxtLgUPM2/xrJuxZ6QV/FzggBRnsIqA5
         2xfz1TUp57jb7W/BFlPpniuDpw4s23GWwfsEWAlkI8UmVhlyDm9jORD4vNw4ITFEBmH2
         nHQg==
X-Forwarded-Encrypted: i=1; AJvYcCUwssEdVqrxXQ9ty6wsguKJsyuA4aGg50xMvYNdelEagUIqCiLE8135NUHo339Ft18wM5he2xIuELUWJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkxy6gxEHR6vsiklaz1uGLfSn2O86pu3HnMKnDsB2m0R3/FaJs
	InHbgWyP9Rb1fyDGKDN3ZBbghuVl5ZykQbZEp/C+sG++iiP0umjlw1fs
X-Gm-Gg: ASbGncs1g2ynf3XBmaFHmnKJ2FYZ9e3rh21vMsla6osASftg4whVEY+QVrHsdGbb84U
	16/rWAiiXdQ9HrbGUdlUVbO3rv7nHKLUFOxtKv6sNI6Zah2+Fg+TVKh2Rpvqwb8qgPVOYY4mE2A
	lP18lDymA8LZ91Q8ajeuNunut+mNsAtBRtZb5o0Z3kJb46kNMXYH1pFQqH8TjHrKxNp27sR0lkZ
	sZ1ko5X0oOD66WAMxeTzXGsx5mpn7qsIhFoUsNkivCfiT37NfmmGitYhdoJw0LEu2CR6xJoWjlh
	pz2ONoZauY0CLxzElD31ZMGu4lVgqfHRmliwwdH1rqUEJUsH6b+Fxph9mL3GVmAloLzqNXQf0HN
	s8zr/C6mWsYDB2c+P72jjk+BaCwQVtm660vo4N0zkYk6F/EEJBWRgcuPBg4NjWllgjajjz8IsBa
	uBsWDcWndNqeLyfinCX3m6vm7wbur8aZGPsW2ZiMStIyLVPeWt4cNwKG/MxmgKk6ztX4eocGYDH
	5kYoMS3W4wv3wjM+hQCsIupPi7LxPhgksqtedzEWSL/KSY5Y2bAtrtIT0RJlnIB
X-Google-Smtp-Source: AGHT+IG8oGxBZCHK7kqo4q+7nyIf3av5yZr0y5kmaXr9sDJtxDyllc6PpENotDwXnMi5ChfG0lIiwg==
X-Received: by 2002:a17:902:e843:b0:264:ee2:c40f with SMTP id d9443c01a7336-290cb46c41cmr333345805ad.52.1761351894738;
        Fri, 24 Oct 2025 17:24:54 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:24:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v4 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Sat, 25 Oct 2025 10:24:31 +1000
Message-Id: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8Y/GgC/2XM0QqCMBTG8VeJXbc425zTrnqP6ELPjjpIDVejE
 N+9KRSil98Hv//IPA2OPDsfRjZQcN71XRzJ8cCwKbqauLNxMwlSQyZS3hboW+T+VVoKnmcGlEQ
 QxgKyiB4DVe69BK+3uBvnn/3wWfpBzO8vlW9TQXDg2tgqRUW6Evmlbgt3P2HfsjkV5IpLs+Myc
 iRNeW51gjLbcvXnAmDPVeTWWFVW1hQEcs2nafoC3zuNRCoBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7029;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=NEwP5oOU+xmnrc/qXQvktbP4weR9cV3E4YrWW5t1/y0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM6+NW/U/xjeuFezwPXetcrQbzdNpr85Z3RXXNTDQ
 eWbcp9kx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKqvcDL84bp1cj7LobIHoszM/3TLRFmLdQT1nV9Ze58J2CKyQsD4PcP/zEM3tCd
 bFrI83/Kjv4tn5Sq3wwcqfu+u8E+RLNz8QOAPLwA=
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

Since there are no real dependencies between the components of this series,
it should be fine for each subsystem to take the relevant patches through
their trees. The mfd one-liners should be taken in order to avoid trivial
conflicts.

Regards,

James

[1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t

---
Changes in v4:
- Added Rob's R-b to hwmon Devicetree schema
- Added missing include to hwmon driver
- Dropped superfluous dev_info() from hwmon probe
- Added Guenter's A-b to hwmon driver
- Renamed INPUT_MACSMC_INPUT to INPUT_MACSMC
- Dropped leftover mention of HID in input driver
- Reinstated input driver MODULE_ALIAS
- Trigger a hard wakeup on power button/lid switch when coming out of
  s2idle
- Suppress KEY_POWER event on wakeup to prevent an immediate shutdown
  when waking up
- Squashed hwmon Devicetree commits into one
- Link to v3: https://lore.kernel.org/r/20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com

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

James Calligeros (7):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: Add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: Add hwmon SMC subdevice

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
 drivers/hwmon/macsmc-hwmon.c             | 851 +++++++++++++++++++++++++
 drivers/input/misc/Kconfig               |  11 +
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 208 ++++++
 drivers/mfd/macsmc.c                     |   3 +
 drivers/rtc/Kconfig                      |  11 +
 drivers/rtc/Makefile                     |   1 +
 drivers/rtc/rtc-macsmc.c                 | 141 ++++
 include/linux/mfd/macsmc.h               |   1 +
 37 files changed, 1673 insertions(+)
---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


