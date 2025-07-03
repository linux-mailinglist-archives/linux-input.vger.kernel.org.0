Return-Path: <linux-input+bounces-13346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85559AF66F5
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6202520F9C
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A49155326;
	Thu,  3 Jul 2025 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdusqzEJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7219E971;
	Thu,  3 Jul 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503795; cv=none; b=QQBgo1qR1ByL2Fi5Dbv/ka8QzOhRYAnYNwhDi2mokhhbXHpE14fxocX6+vNN4IMTh5QctWuMuDpj6ieRL77eHYjjmPIVSfufF7JztsZ8W3z0S5UC7Bcok3oW4B8boNkiaekQy1bXHRgppjrYPZSIzr3qcmraNFMTIxGR5WyoDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503795; c=relaxed/simple;
	bh=78kqT5f0D9kNYbpfmtOXWCn1emJzOQL/453RuMZ6n2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFHqfoKLFPbDlOQwcCKULCHpETAIKhYyMBmxKDQrGpIv+rP6lsr9jYsw4J1gCtAl2XlpGZkDIhm2NTaDb63KOjRT/F81NLMhu7adBYmWRrqP4qSK2Z5oOdCjU7yte0du4KN2NDIGeDUy4ebkh+fRyGaFlB5fN14K6oSKce/IpCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdusqzEJ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso4676988b3a.0;
        Wed, 02 Jul 2025 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503793; x=1752108593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pz4m+IpKOsEltbdskHgzBLceOoahW0W/XCt4Wjncc/s=;
        b=JdusqzEJA5FBcxULh6NTRHgZ2qVPYUqpOupVndBGiu5wdTpqDnpLytcmAysJqBo2Ov
         /76aGgPErQmzrqf0sECCzbN/MZOhjrnLziygKcF+GeSU2VuBoilD5tDjPm11pQA6XnEk
         TznOaBjxKdE8LoEbTy0cA8jRV4XkU8FiRll1jgm/qUQjVd89VU5+vEC8tQyrJn+mSYEt
         dI6lyIR8iFv7eSuj+GEkK2+FimB2d4yBLxEIw6j0NELuFKq3t8O1ezP8bd2snb8CRjx0
         SeHeOMnODd4XKlVkWptn2Y0zCJHmVvsDZdQMwCQeQu2rtzbhjMgk700WYJKB6fzMmr/C
         81gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503793; x=1752108593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pz4m+IpKOsEltbdskHgzBLceOoahW0W/XCt4Wjncc/s=;
        b=uwdVtG2EB7y9EXX5d9ZqdUmwLIOjZlBL3LKxMZiUJaod3YcLaTqh5wmYGQWSw1cJf7
         dqK9WVU4A6DRVRc8Iw0b7DJMiPT8FvqAgKuSpkig/95TsTmpVgy+Zzjd2BNZ1xz7Lnf0
         vNQMKDmXlRSF4Gou0PnQIhQE+HUUNgu9llAHHC4vNVKULOiUMXMaSp5G2R4Ty/fQ3EcF
         TJ0tKwSnckB8pBa75BeL91m8la0DApF6DOSa87ZgVb0O/T+DSP02n1YyYWwEymYR43km
         TXGkqPZSv1csG0/zWgGjXBtrF7RKWCEjenuVmZ00KcYJTEYYhUAq4xMHoSf2C0zm8QQN
         6OzA==
X-Forwarded-Encrypted: i=1; AJvYcCUdQ3HXZUP+tZqmpEPDBDIGh9f8472la7tnSNzqwaml7ht3ur6LwloGLjyrv0hauGGW2kc39ZbQN3o=@vger.kernel.org, AJvYcCUdyfrXStkx00Pe1jmofGNg4Gsv69f+0cSDIIxwfy9puBkfcFxXjxV7sjqfxVAwaY2Jdn1Y2pNLcaZmvxU9@vger.kernel.org, AJvYcCXufD45VZUAvHyev6/vVQor+9tkzfy3FHZN4Y7VxhEyTgl6VC6T46FggNKDubcFYVybWLrOo3NZAIGa34s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDt8SO7bywKSQQg9nGsiHv/qLqs4/+F2zZ9ko9lpsFpeg8iqGf
	+rzSytVd/krrFgMaOZ0E79lIc8B2/k7dSeSBVINeI3P8YKlrSoq6gSNv
X-Gm-Gg: ASbGncsD6E5lGrYRuIK+AI38k5bVculMF2ykKRq6xsz6vXECO3pGcw0MJurcj5O/iNC
	2NMtyZxu8hJMht1LJxRdQfmaoGGCmxF1tGUBboaqqXZ+U7FAyE0lZb4Yw4+t9K+rICugST7WKby
	zZUbVPQxUvsudoIVDp5I5JYHItzC9FT3bo1HpTjqvEjzxUNQRubY5fK/WeNI9EHQMkFnH4EAZhr
	MLi1r72fPPnNbip9KQrgeKxHlAEqTRscOwy6coADa0kPrRTayAT9zzi9J7vYHoT6CdePt5BacVV
	32HIXD0PkWDBmuwc8+2wI0bqixKgNkzZ1Yr+VVUBRE8/NwYV3wMGVG4ihMcF33GxxnEu8SZrJ/I
	kD1SMUj3bYu0dvPXlPMQkmeaV7ImMNWISmE+eGKgJVg==
X-Google-Smtp-Source: AGHT+IENHWb+lqG7dM8w91Tnc6V5WN0WHdNR4MyrasQRst9wI2IFDRWvc+a/Kf+MEfrtR4GhJq7A9A==
X-Received: by 2002:a05:6a00:14cb:b0:748:e9e4:d970 with SMTP id d2e1a72fcca58-74b50ff200fmr6429132b3a.1.1751503792710;
        Wed, 02 Jul 2025 17:49:52 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:52 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] HID: Add documentation for lenovo-legos-hid driver
Date: Wed,  2 Jul 2025 17:49:41 -0700
Message-ID: <20250703004943.515919-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703004943.515919-1-derekjohn.clark@gmail.com>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds ABI documentation for the lenovo-legos-hid driver

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../ABI/testing/sysfs-driver-lenovo-legos-hid | 270 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 276 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid

diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid b/Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid
new file mode 100644
index 000000000000..af99df79843d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid
@@ -0,0 +1,270 @@
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/leds/go_s:rgb:joystick_rings/effect
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the display effect of the RGB interface.
+
+		Values are monocolor, breathe, chroma, or rainbow.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/leds/go_s:rgb:joystick_rings/effect_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the effect attribute.
+
+		Values are monocolor, breathe, chroma, or rainbow.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/leds/go_s:rgb:joystick_rings/enable
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the RGB interface.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/enable_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the enable attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/mode
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the RGB interface.
+
+		Values are dynamic or custom. Custom allows setting the RGB effect and color.
+    Dynamic is a Windows mode for syncing Lenovo RGB interfaces not currently
+    supported under Linux.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/mode_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the mode attribute.
+
+		Values are dynamic or custom.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/profile
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls selecting the configured RGB profile.
+
+		Values are 1-3.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/profile_range
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the profile attribute.
+
+		Values are 1-3.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/speed
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the change rate for the breathe, chroma, and rainbow effects.
+
+		Values are 0-100.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/class/leds/go_s:rgb:joystick_rings/speed_range
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the speed attribute.
+
+		Values are 0-100.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/auto_sleep_time
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the sleep timer due to inactivity for the built-in controller.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/auto_sleep_time_range
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad_config/auto_sleep_time attribute.
+
+		Values are 0-255.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/dpad_mode
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the built-in controllers D-pad.
+
+		Values are 4-way or 8-way.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/dpad_mode_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad_config/dpad_mode attribute.
+
+		Values are 4-way or 8-way.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/mode
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the operating mode of the built-in controller.
+
+		Values are xinput or dinput.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/mode_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad_config/mode attribute.
+
+		Values are xinput or dinput.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/poll_rate
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls the poll rate in Hz of the built-in controller.
+
+		Values are 125, 250, 500, or 1000.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/gamepad_config/poll_rate_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the gamepad_config/poll_rate attribute.
+
+		Values are 125, 250, 500, or 1000.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu_config/bypass_enable
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU bypass function. When enabled the IMU data is directly reported to the OS through
+an HIDRAW interface.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu_config/bypass_enable_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the imu_config/bypass_enable attribute.
+
+		Values are true or false.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu_config/sensor_enable
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the IMU.
+
+		Values are true, false, or wake-2s.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/imu_config/sensor_enable_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the imu_config/sensor_enable attribute.
+
+		Values are true, false, or wake-2s.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls which value is used for the touchpads operating mode.
+
+		Values are windows or linux.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the os_mode attribute.
+
+		Values are windows or linux.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad_config/enable
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls enabling or disabling the built-in touchpad.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad_config/enable_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad_config/enable attribute.
+
+		Values are true or false.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad_config/linux_mode
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls behavior of the touchpad events when os_mode is set to linux.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad_config/linux_mode_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad_config/linux_mode attribute.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad_config/windows_mode
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This controls behavior of the touchpad events when os_mode is set to windows.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
+
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad_config/windows_mode_index
+Date:		July 2025
+Contact:	linux-input@vger.kernel.org
+Description:	This displays the available options for the touchpad_config/windows_mode attribute.
+
+		Values are absolute or relative.
+
+		Applies to Lenovo Legion Go S line of handheld devices.
diff --git a/MAINTAINERS b/MAINTAINERS
index 5bdae246605d..68211d6eb236 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13746,6 +13746,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
 
+LENOVO LEGION GO S HID
+M:	Derek J. Clark <derekjohn.clark@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.50.0


