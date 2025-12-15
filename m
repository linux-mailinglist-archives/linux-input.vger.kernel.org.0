Return-Path: <linux-input+bounces-16566-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44846CBD321
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A797D3014DA5
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 09:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F600327C11;
	Mon, 15 Dec 2025 09:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkBuMQaV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F507314B96
	for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791503; cv=none; b=qJDuzjFsGhTZs8wHf6EmLomVn4lk77ASmSSE8T7VMPbW7p8eXB7ec4W5svj1r9w9heA0WZH6lQGerUHFjO1ddt17ZBnlepXq2+R8Zb+esZIQ9uxUwmJYhGziwhwaBmk10c4Ls7Cj9vI90E+ctmpUWDJsgiE1egaE199R/2l5nCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791503; c=relaxed/simple;
	bh=LpUT1tST1uzwN8B4qY2fL3L3g40kh3NGJb9E7/IhWWo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RRS3qobgNp7vrj7MHNJU0XqwzmstALH5qH3HmBRqCyvcE6FSFoaALqZ18Jo+E3baHBXjn4AZG71fKuY6rouRxECyg7yD4IMbnpK046PxCLKdgPi2cCxnvx5wlSeLjx7fXakRDBgxWHrOE506da+7SnR3U2jaQle/8VWYQ5gLtcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkBuMQaV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0fe77d141so7400635ad.1
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 01:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791500; x=1766396300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ofUMV8vPgmaOuh+YZV7CVgRP8TEUPgjBpp5OjiYrM=;
        b=WkBuMQaVNm3w2IFMdDpuPihJ4CviWsphhMGLfaRffcQIW8utplyzsq+avhCViEEmsn
         OWFUs9ozb3ExlRtcyHLjJD5rXSTGfuVQlB1UfnBEXwacX5gPP82gJjXE2jH/mpzpf3JC
         0bEroh1HMKHYBWY0x9ykuQyPJZRAFJK5pb5Y1H7tSgWBG3nYTgl94tZqfd/B/8gbtQ+V
         igubWP3/oQ3uyKUUnEkju6vQNeIu4AOjozOdJx+4faUbiyqjTscSZO4TVIS8f3Y/5Zv5
         R4dZXR/yMsDUx2Ma8e/Y81uLbDZQf5mahaiASn83YnCGfWLInyJk/ZUpvakerrdO6ieX
         aeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791500; x=1766396300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2ofUMV8vPgmaOuh+YZV7CVgRP8TEUPgjBpp5OjiYrM=;
        b=V46cvj1oOAFvCSml9wJXnpjoA/mgcq4vcLI9VcX/LCIKRAyGgjGtp0qNgR2tdR/kdn
         9nEge9Mp9cmjuqCmHp4UWWB3lduoiCQsQ5RZsTkW42AQBsNyxw/cWDxaAjimlTDYMD7I
         LQrKX16OmfwNWKJA/atzLEmQI1bV0YCVz+dtEMwL7LIg2GSKDqQb/80h1fpSE13NPoP/
         VKdTV+wXLbUS1YohZ4pbZ3OtkVwO9G+q8X2cccMhF4DMXJn7fSZlgoUoxhHq4TyeQ6xV
         FEs45dJtMQaTz2ux488XkOhO32lZaXBV7oYbE9/UQskrUQIAdHAeKE0viJaopRpOoiVx
         5B6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwXFYsUCFOP98wTqcjphXFqHsYqPoIN91B6uodGMdLPiVBw1ScxdKNF5p7UPKxw6LtJcf2VGaZOghXpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ohNdV3gRQ0JGFAVtZbY1dhu3LXvcZ/AOHTFzwJ4YNY/RuEV+
	Wus12HsYN+wmkLnw8SynHpnU84AM+9rR58iu/C62vL8ybgnhzXKCXY+2
X-Gm-Gg: AY/fxX5Xw0FD66cIbJOttyQt8b6U3bPkxYhwsM8aTfI1F/GVKz1VDVx+7VcueHXdELY
	WW/7dlGtsbOankxMwalSxXzhjllzE6ptNYISavHiiPKM3OHQly+5n59dEv/7ZIkTxaXCvFki4Ew
	ZKrwdGuONrtzZ5mRLnTsweawOBUqq56mOHWMLwD6CIlo5BbK4ACfxBBvOzbeNiTHKbMHzaZJywB
	14yr+npjlelOb3i0kT8F5g4yel1xqSHp5FR087VqppjrYPCg+Ks+EEJt6NIUb+yTw3z+ea+I0h3
	vEQSX1Z905nSTxBOwoSXolfKOZeo+598Qip2moBpbfpD7P4tvI83cyo1tSUeGYqZxXvIXKdcBNY
	Vj36QyJz1dAyRVt2EPvOXQtzitU0WcH3ZFbYBLqdyRoZX+Yn9OudQWEots53VLB3p/EKLOGqe/g
	o+c0B0qEZyZNfrjJEYGaS40/6jbWZdH5WHwm1Cnqn5h90znZpdQE6ZsRkHSFTewKsTRYw/+du/r
	bWwqcCFMtf9cfHBRXJ5l7nPU7Fl6is8d8EwH3G6peT2tTlZ4wS1HFlwIC94yfMsDSOk+dUpDvua
	K+hww4pdXjV1QdNgZeK8HdLVEvQ/Tz9WuYInIHJSrs4qYhHd/J0=
X-Google-Smtp-Source: AGHT+IGE3gq1ZgxyZw713bIINxNwXEl9ah/Lp4tSBM1uH035Fhp+NAhTmMOItSGS6fepfB6QrYDu/A==
X-Received: by 2002:a17:903:19c8:b0:2a0:906c:5caf with SMTP id d9443c01a7336-2a0906c6125mr74500505ad.17.1765791499706;
        Mon, 15 Dec 2025 01:38:19 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v6 0/7] mfd: macsmc: add rtc, hwmon and hid subdevices
Date: Mon, 15 Dec 2025 19:37:44 +1000
Message-Id: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjWP2kC/2XMQW7DIBCF4atErEs1M4AxXfUeURcYhgSpjivTo
 FaR714Sqa1lL9+Tvv8mCs+Zi3g53MTMNZc8Xdrong4inP3lxDLHtgUBGeixk6MPZQyyXIfItcj
 egqIAaCME0dDHzCl/PYLHt7bPuXxO8/ejX/H+/qbcNlVRgjQ2pi4oNgnd62n0+f05TKO4pyqtO
 Nkdp8YDG3YuGh2o33L1xxFgz1Xj0UY1pGg9A225XnEyO64bV1ZHExwPHnjLzT9HpB03jVvqWQ8
 OE/e45suy/AAFQXzSqAEAAA==
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
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6798;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=LpUT1tST1uzwN8B4qY2fL3L3g40kh3NGJb9E7/IhWWo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn21/4fePXRd+6nrcW5vKI302y0pikzlru+kH3HvytCo
 fmZYPnyjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFR7ajH8s3quunnFa2uOfSd6L0zwelt5/9nyrN63qRPEs2tjNjp8TWNkmN+WJnz
 yVdkGuzIzjo630/fd+rZPtCeC86b6tA9J0lNvsgMA
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
[2] https://lore.kernel.org/asahi/20251106140050.GQ8064@google.com/

---
Changes in v6:
- Rebase onto 6.19-rc1, dropping already merged commits
- Link to v5: https://lore.kernel.org/r/20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com

Changes in v5:
- Drop inadvertent mfd core includes in rtc and input drivers
- Link to v4: https://lore.kernel.org/r/20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com

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
Hector Martin (1):
      input: macsmc-input: New driver to handle the Apple Mac SMC buttons/lid

James Calligeros (5):
      dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
      mfd: macsmc: Wire up Apple SMC RTC subdevice
      mfd: macsmc: Wire up Apple SMC hwmon subdevice
      mfd: macsmc: Wire up Apple SMC input subdevice
      arm64: dts: apple: t8103, t8112, t60xx: Add hwmon SMC subdevice

Sven Peter (1):
      arm64: dts: apple: t8103,t60xx,t8112: Add SMC RTC node

 .../bindings/hwmon/apple,smc-hwmon.yaml  |  86 ++++++++++
 .../bindings/mfd/apple,smc.yaml          |  36 +++++
 MAINTAINERS                              |   2 +
 .../boot/dts/apple/hwmon-common.dtsi     |  33 ++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   |  22 +++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  17 ++
 .../boot/dts/apple/hwmon-laptop.dtsi     |  33 ++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   |  15 ++
 .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
 arch/arm64/boot/dts/apple/t6001.dtsi     |   2 +
 .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
 .../arm64/boot/dts/apple/t600x-die0.dtsi |  10 ++
 .../boot/dts/apple/t600x-j314-j316.dtsi  |   3 +
 .../arm64/boot/dts/apple/t602x-die0.dtsi |  10 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
 arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
 arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
 arch/arm64/boot/dts/apple/t8103.dtsi     |  11 ++
 arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
 arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
 arch/arm64/boot/dts/apple/t8112.dtsi     |  11 ++
 drivers/input/misc/Kconfig               |  11 ++
 drivers/input/misc/Makefile              |   1 +
 drivers/input/misc/macsmc-input.c        | 207 +++++++++++++++++++++++++
 drivers/mfd/macsmc.c                     |   3 +
 28 files changed, 535 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250816-macsmc-subdevs-87032c017d0c

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>


