Return-Path: <linux-input+bounces-16952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A91D108F2
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 05:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E41FB307CD18
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 04:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADA530C62C;
	Mon, 12 Jan 2026 04:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftDb5JC8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68BB3A1DB
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768191674; cv=none; b=Cd85tFbY0UooOSzYJ/aU3fSLWHJto0vEQCeigcFCwwUsf5AoME5r8Z9/vtBs0irSYu7JluVtxs1A2O59xQgJv5FCGOz0VXa7gQgunBum1s9t5UgK9c82hGScaBdJZ4BgEuvruLh8WjbJh7fEiM9sgztu+SGlpsPAHWp2XatTleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768191674; c=relaxed/simple;
	bh=7UaSxTQ2Yc0mb2nb6iU/EEk22Ltb7ihTOtx2WiOtDnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltT1xQPEto1H0UQKh5kpJf/rKr/cshtdX199oTOjyA4cUUlhJqKR+lFIhp66yy1eAwGxA9I2fFRqRFgwQZci50RtP6W3wkNAQTAH1gRLPnvT/LIhQaNmz0qHBCwYnMBiCk/l6I23ffF1/scrxMNJwIJJWCwCIDVBp4gECXwRlg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftDb5JC8; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8bb6a27d390so376943285a.3
        for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 20:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768191669; x=1768796469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh1c04wFbVOigUWpnYzUN8Rw1919gYg4oTrqAHTOBh4=;
        b=ftDb5JC8ZoPZAmSFuYPkWByxitcpb7mL+lp83nbBxjI5gR5MmSA3h+ep6j4Hfr8p2T
         3kN2TBs1oACD0i+ACJZj8df2VRm7tPwn3UR2Z8eWebBRAb8Ir6P9/HQEZaptNT6aI8ou
         RtAAZKVepL6FE/7ed/ueIfv32sYiYNQZ+Agf9d4Bh6FLnuoPrLtLsBXgHLorpcuWEMX/
         xbp2okyxtfHuorsgYz5qv1IlZosu71x0TzcZjFOgtFjEuSFoR2IIqeSvY13u+oc6tKqF
         TUPJVRf3/1qwgnNGbDOzXhl0ANf6s1rDweofGM2+KugLqi3UuDvHLnCYHSBHcxW/0QhX
         L/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768191669; x=1768796469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lh1c04wFbVOigUWpnYzUN8Rw1919gYg4oTrqAHTOBh4=;
        b=dsrbfGhh2ZBXWzomJ4J8g43ICBJOuza3bKLQ6LxLoI+G4G6A8f/BBVXLVumgJhqLPr
         Af3GRCc2dzSas/D/LgOPy5SzuDKH4cE1PK9llI7TH+9tJMUx07ZHZAQK9c5+0PYnDp1E
         cPghBc/7lWNpBbJfnj4FNq/TjPk7KxiIN0Jt33MVLJs392pstazLcxMBWtBwXTGyZVD1
         xKlQJXcoe19XNzm3NP5LLnAlLEzjWw9kT8Ltx1yUl7i7NYuDXh2QksxCzGo9rqh1WoWu
         WPqU6QIE4ofHc6q9a82TdwJClPMG5fL2pDIICqM9ug9dMx6b0pSpTJvFBR9BZPVFaaYC
         SMxw==
X-Forwarded-Encrypted: i=1; AJvYcCXpY+uY1f7GvS9WEmz+Uez+gQNnJbLwf4vieKOyEPi+KvhLC1MKlzdK8H/mF3YAx12NdhUqXqArLH5DTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxteot/z7n+hbh2TnQnwou3bgNsEf2rF2a97q65SChPDCi3tiwE
	46UJKOI1N4q9X7/gKP/4H1tGJDZlrcHR2fTtxKXX9RWzjcBpxgdC4EE6
X-Gm-Gg: AY/fxX7QkEn38To1SkWhcRh3rN9Dlt0MTUpLKSdD7eBhgcLwpvsKl6MIjyia2UhktiV
	FGg6a1UuKhkfQjuDEemDglHtM7kXR9PsOsxHkFZto6iR4t6IATzdOdtuNESrzeJrL1G4az5WKVC
	CMA1fxrsnV8/kUnPkabevd76NRb/8TYVr3EBQ1SQucdd2w+FvXWnGm7okKXVOIclaqDnH1uvmMQ
	hjs2fVkgWUG6Nq5/zPVuuWyEZL25fHwX2amINmv1Tlo5OWgZlu7R0VL+S4mjn80AjsWmqxw9gpI
	7WPinyvehohbkkm2c6HV61+GTajeXIf28ZxgTY6veqWknpZHflBI/YmNha5iDnAOrWgEfS1AGpz
	7ys4ybmhzm6kYrBD4vSGafXx9ODYQgJANa/q/XIrkZyH0+lFq1huATpG4DJeTAPHmHMfbQwwzR+
	5t383ira+kzdlnHMzlX0mGzZ1AojStdVVhj6OBrg==
X-Google-Smtp-Source: AGHT+IFF5vbmaE7IjWvNhPplGIN2Nh58rAHAmjsC7o9jlL+1womd5SDbjNcR3/yoRzyWL9eOIhYyKA==
X-Received: by 2002:a05:620a:2a09:b0:8b2:e5cd:fa42 with SMTP id af79cd13be357-8c3891b060cmr2364137885a.0.1768191668822;
        Sun, 11 Jan 2026 20:21:08 -0800 (PST)
Received: from achantapc.tail227c81.ts.net ([128.172.224.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4cd7a3sm1470618385a.24.2026.01.11.20.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:21:08 -0800 (PST)
From: Sriman Achanta <srimanachanta@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sriman Achanta <srimanachanta@gmail.com>
Subject: [PATCH v2 3/4] Documentation: ABI: Document SteelSeries headset sysfs attributes
Date: Sun, 11 Jan 2026 23:19:40 -0500
Message-ID: <20260112041941.40531-4-srimanachanta@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112041941.40531-1-srimanachanta@gmail.com>
References: <20260112041941.40531-1-srimanachanta@gmail.com>
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
 .../ABI/testing/sysfs-driver-hid-steelseries  | 131 ++++++++++++++++++
 2 files changed, 131 insertions(+), 21 deletions(-)
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
index 000000000000..751cf01ceda3
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-steelseries
@@ -0,0 +1,131 @@
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
+
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
+
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
+
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
+
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
+
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
+
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
+
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
+
+		Access: Write
-- 
2.52.0


