Return-Path: <linux-input+bounces-16709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CCCE4BA3
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 13:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA9D3021E43
	for <lists+linux-input@lfdr.de>; Sun, 28 Dec 2025 12:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C1B2C3272;
	Sun, 28 Dec 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qlf+jLLL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA812C08D5
	for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766924441; cv=none; b=ndG31JC/EjqsxR2pVA1XY+dCqI918UC/HTMQVRe1i9P+S877Him+3Y65BjDJYcK/55aGDgfGv3asYXvklwQxJZVmmQol1k0eH+SWrUh5FEqDqs3pdzwEt4yOvoXNlcTlgiOdfX/1kK3/HakR4YqZBOtCsYYgPSKxY0Hgr6rLvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766924441; c=relaxed/simple;
	bh=ZaRre9KeRHlWpTrdmOFo1E3VLeEptXG4YplvxcGUxVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGPbHVCGlIrjhuj1u0r3EBLCnThLRis/dvuyZCkOiQcqKT/qB0aBpMlenUbRPGlJjKYru8maC8S+dSrNum6DbifljKDtusgbCcSHd5t11nYRN/Ry6ZLUqLa0OwLpgEoCJrGmzWql+3ytHbGOygf+wDsMB9u9Mn00mWVGmVpabJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qlf+jLLL; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so95629786d6.2
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 04:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766924438; x=1767529238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiT7vd66H/0g7zS/sfr9KNa7Y0rTVJ0HEgehE7M8NCc=;
        b=Qlf+jLLLjUI0tC3v1m1wDP2YsJdMwbZ6fdG9zVgQfdm0VBu0nQBFQU72RN0cbou3/M
         lgNnNLSa6zuryFuaAAl2GpHl9pgdOEIuSSVUi+eRWSjl50jxqnxRB2pT4oGYJ7A27Q9T
         bXo13+bsvr6Wgxnlowoi/Lar98+YOXRyu5iM2nSs/pQY/98Gvz5o5dK5tO1T+075JDW5
         W7w69Z9LchAzmEnQ4jLVPRcI/rzRpBltDQJr4O9FliD7fFRFc0EdgT7Sg+M7lJvYusyG
         7Ru3SaBrd+LrfpJxIv+kheQuAypMHy98u/GDxIwdDB4nZPdoRqc0//Zoz8X3/1cSqJdo
         ulSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766924438; x=1767529238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WiT7vd66H/0g7zS/sfr9KNa7Y0rTVJ0HEgehE7M8NCc=;
        b=Em1M9hJxYW2AMWYoAHorvWcfJqAUaM1QU6Jwvx+vI1dOcPjLtdQanTdRzUXvpAEgSG
         QFQbfGOcBA5thZrJwLqJ6YwW8epDA/CB65BnqdywfUO/MoSWjx0UdpYR3N+KP/qnjP37
         jMutTpEgwhlBZ8s1viAuqmdFK+zFrkLM/tBXrxxI/BuZ99hebW203Buzo5hEdtARW9cY
         II2x5MQTxnP4Yaeb7ol4oeOxfdWVEHSU8q2SsRF2pX6cJvmU+4qQs9p498viXe9H98/b
         eEpDBi/8S7pqJ4ZLby/fkB7N6nCZV10nDhGe4qQUlMzCgkHeQeX7/Hf+6YGzyBJqVPDu
         oOHw==
X-Forwarded-Encrypted: i=1; AJvYcCV69BIbEDGmytK063vMKu0F+l7jxlTQg3+LPQXmwFBj94NHW14fcsTtG7KlPYIH29UmlVqLmb1Av66egw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvzSn2FQYxdrn6TOb8g1yfn7I1oK8PqMFEV9rasxeMv2sZD3Kt
	bpGaIqjahS88gLNbOrHkBZ5ZNOM3pa2GDAjJ9npzPTcDPm4Yjx73SBeBFClk2C3C
X-Gm-Gg: AY/fxX49qWphO0KaaJH6zGeNWQIGYuyZti48S4umfZolEcx5fmljPiCE5TZm+C2KbVp
	GEURLbnN6YaWMGUh1sx88fJVDTwjk0BGbPIxEgreTUuHbTT5QJ4HoN3gq2yYmQd6l9WINfBQoj5
	EDGOtqFky6hkNkXn8CENDAzNtm4GwU6mLEI2Z/SUhW0fR6q8RqFPCsMOEUt+gqOEhrbyFf0HSAv
	IfAC5nfcdU6Yc0LYW1lGvGgUGU8MRvWojQRdEFNiOQ2PthhMDXkeAtYth8mvxP3gDJJntCPpbox
	FQ7FCn85w5cn9jHCPMVj3w5WneGfgo2svf4PGX/zfueCQDuwBTL3wYh987K7vi/JY1o3jffNgsv
	+kDyzFo+IGhwJDKH5peo8T/4yiDdWIK7E2TLQNpo1lQuP3TIFp4CgytEd62I6P5hZj1x4Pk69eB
	Kb5saxufYIp/KL5LyOxlwlTShFyq1UgSmoHXvDbN7PaCEXxME5YbG2LBOBrw==
X-Google-Smtp-Source: AGHT+IHVT80eOLqzT36cdjP443bt7VWsCGjcpEsIo0xp8ya1wDSesm0f0xL8IbXzpm+3e3OHhWSFaw==
X-Received: by 2002:a05:6214:3110:b0:88a:568b:f4af with SMTP id 6a1803df08f44-88d828162edmr447081896d6.23.1766924438126;
        Sun, 28 Dec 2025 04:20:38 -0800 (PST)
Received: from achantapc.mynetworksettings.com ([2600:4040:1233:de00:c673:8e0d:7a28:6166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm208744456d6.43.2025.12.28.04.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:20:37 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH 3/4] Documentation: ABI: Document SteelSeries headset sysfs attributes
Date: Sun, 28 Dec 2025 07:20:24 -0500
Message-ID: <20251228122025.154682-4-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228122025.154682-1-srimanachanta@gmail.com>
References: <20251228122025.154682-1-srimanachanta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the SRW-S1 specific documentation with comprehensive
documentation for the hid-steelseries driver covering both the legacy
SRW-S1 wheel and the modern Arctis headset lineup.

New sysfs attributes documented:
- sidetone_level: Control microphone monitoring volume
- inactive_time: Auto-sleep timeout configuration
- chatmix_level: Game/Chat audio balance (read-only)
- mic_mute_led_brightness: Microphone mute LED brightness control
- mic_volume: Internal microphone gain control
- volume_limiter: EU hearing protection volume limiter
- bluetooth_on_power: Bluetooth auto-enable on power-on
- bluetooth_call_vol: Bluetooth call audio attenuation settings

The SRW-S1 LED documentation is preserved and moved into the new unified
documentation file.

Signed-off-by: Sriman Achanta <srimanachanta@gmail.com>
---
 .../ABI/testing/sysfs-driver-hid-srws1        |  21 ---
 .../ABI/testing/sysfs-driver-hid-steelseries  | 123 ++++++++++++++++++
 2 files changed, 123 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-driver-hid-srws1
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-steelseries

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-srws1 b/Documentation/ABI/testing/sysfs-driver-hid-srws1
deleted file mode 100644
index d0eba70c7d40..000000000000
--- a/Documentation/ABI/testing/sysfs-driver-hid-srws1
+++ /dev/null
@@ -1,21 +0,0 @@
-What:		/sys/class/leds/SRWS1::<serial>::RPM1
-What:		/sys/class/leds/SRWS1::<serial>::RPM2
-What:		/sys/class/leds/SRWS1::<serial>::RPM3
-What:		/sys/class/leds/SRWS1::<serial>::RPM4
-What:		/sys/class/leds/SRWS1::<serial>::RPM5
-What:		/sys/class/leds/SRWS1::<serial>::RPM6
-What:		/sys/class/leds/SRWS1::<serial>::RPM7
-What:		/sys/class/leds/SRWS1::<serial>::RPM8
-What:		/sys/class/leds/SRWS1::<serial>::RPM9
-What:		/sys/class/leds/SRWS1::<serial>::RPM10
-What:		/sys/class/leds/SRWS1::<serial>::RPM11
-What:		/sys/class/leds/SRWS1::<serial>::RPM12
-What:		/sys/class/leds/SRWS1::<serial>::RPM13
-What:		/sys/class/leds/SRWS1::<serial>::RPM14
-What:		/sys/class/leds/SRWS1::<serial>::RPM15
-What:		/sys/class/leds/SRWS1::<serial>::RPMALL
-Date:		Jan 2013
-KernelVersion:	3.9
-Contact:	Simon Wood <simon@mungewell.org>
-Description:	Provides a control for turning on/off the LEDs which form
-		an RPM meter on the front of the controller
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-steelseries b/Documentation/ABI/testing/sysfs-driver-hid-steelseries
new file mode 100644
index 000000000000..3066dbb486d3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-steelseries
@@ -0,0 +1,123 @@
+What:		/sys/class/leds/SRWS1::<serial>::RPM1
+What:		/sys/class/leds/SRWS1::<serial>::RPM2
+What:		/sys/class/leds/SRWS1::<serial>::RPM3
+What:		/sys/class/leds/SRWS1::<serial>::RPM4
+What:		/sys/class/leds/SRWS1::<serial>::RPM5
+What:		/sys/class/leds/SRWS1::<serial>::RPM6
+What:		/sys/class/leds/SRWS1::<serial>::RPM7
+What:		/sys/class/leds/SRWS1::<serial>::RPM8
+What:		/sys/class/leds/SRWS1::<serial>::RPM9
+What:		/sys/class/leds/SRWS1::<serial>::RPM10
+What:		/sys/class/leds/SRWS1::<serial>::RPM11
+What:		/sys/class/leds/SRWS1::<serial>::RPM12
+What:		/sys/class/leds/SRWS1::<serial>::RPM13
+What:		/sys/class/leds/SRWS1::<serial>::RPM14
+What:		/sys/class/leds/SRWS1::<serial>::RPM15
+What:		/sys/class/leds/SRWS1::<serial>::RPMALL
+Date:		Jan 2013
+KernelVersion:	3.9
+Contact:	Simon Wood <simon@mungewell.org>
+Description:	Provides a control for turning on/off the LEDs which form
+		an RPM meter on the front of the controller
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/sidetone_level
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Controls the sidetone (microphone monitoring) volume level.
+		This determines how much of the microphone input is fed back into
+		the headset speakers.
+
+		Range: 0-128 (mapped internally to device-specific values).
+		Access: Write
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/inactive_time
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Sets the time in minutes before the headset automatically enters
+		standby/sleep mode when no audio is playing.
+
+		Range: 0-90 (minutes).
+		       Some devices (e.g., Arctis 1/7X) map this to specific presets.
+		Access: Write
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/chatmix_level
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Reports the current balance between Game and Chat audio channels
+		(ChatMix). This value changes when the physical ChatMix dial
+		on the headset is adjusted.
+
+		Range: 0-128
+		       0   = 100% Chat / 0% Game
+		       64  = 50% Chat / 50% Game (Balanced)
+		       128 = 0% Chat / 100% Game
+		Access: Read
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/mic_mute_led_brightness
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Controls the brightness of the LED on the microphone boom that
+		indicates when the microphone is muted.
+
+		Range: 0-3 (off, low, medium, high) for most devices.
+		       0-10 for newer Nova series devices.
+		Access: Write
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/mic_volume
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Controls the internal microphone gain/volume of the headset.
+		This is distinct from the OS input volume.
+
+		Range: 0-128 (mapped internally to device-specific values).
+		Access: Write
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/volume_limiter
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Enables or disables the EU volume limiter (hearing protection).
+		When enabled, the maximum output volume is capped.
+
+		Values:
+		0 = Disabled
+		1 = Enabled
+		Access: Write
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/bluetooth_on_power
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Configures whether the Bluetooth radio automatically turns on
+		when the headset is powered on.
+
+		Values:
+		0 = Bluetooth must be turned on manually
+		1 = Bluetooth turns on automatically with headset
+		Access: Write
+
+What:		/sys/class/hid/drivers/steelseries/<dev>/bluetooth_call_vol
+Date:		January 2025
+KernelVersion:	6.19
+Contact:	Sriman Achanta <srimanachanta@gmail.com>
+Description:
+		Configures how the 2.4GHz Game/Chat audio is attenuated when
+		a Bluetooth call is active.
+
+		Values:
+		0 = No attenuation (mix both equally)
+		1 = Attenuate Game audio by -12dB
+		2 = Mute Game audio completely
+		Access: Write
-- 
2.52.0


