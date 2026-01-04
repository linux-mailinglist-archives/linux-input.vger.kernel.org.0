Return-Path: <linux-input+bounces-16779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D7CF154D
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 22:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CE013005ABE
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 21:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8911A2F2605;
	Sun,  4 Jan 2026 21:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkn3Q34S"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637A23958D
	for <linux-input@vger.kernel.org>; Sun,  4 Jan 2026 21:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562301; cv=none; b=fPAVXangre9tTIspS4kXbfop0nDVVzija2BuxOMbRt4QJh/c8AdFthoRCo9inqIpmOB65ip9/PzhBs9eorymrhMDV4ExhXXRsJTPi9xLPIRTDw5BNWjwaddIQSjpu+FLGfZpmjm9lgZ2O9ZeX1k/4Y65IiBp8fOiATpsFRhsRt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562301; c=relaxed/simple;
	bh=TNOReyKeSxvnchWjGZNXLUxlPtmF/TJa8GbVtAOOrqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZG82R18vMxMfPee5zTU7SSFRPTfZrerBzgGEt5uOTIiehUMT131iuNjEtviTAsNLyl89DVS0IrPmacrcNKHTKl9l9kZ9JNtENj838ZVH+RBnK7mTQb0IgU6BaPJOqwcP9f993EG9tSvFcJOTp2Cq3v0o9p4EJtTG2eyQ0WmhaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkn3Q34S; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso3179126a12.3
        for <linux-input@vger.kernel.org>; Sun, 04 Jan 2026 13:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562294; x=1768167094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vX1nJ/KwU+ERB9DqMZcEiz8CUIvFleb2W4tNHZPrWVs=;
        b=gkn3Q34SvpvxvPXw8kwwczMEXscFEGvmkf9Q06uuyNY7SfFd84s1iD40sxzKCoH4b+
         GV7skoGH2uhHPvVqwbGHk/5c/WVsUBDQxG1JvpGjkLosRgZByEzTMbuOi9PpPCplb6xy
         4V4AWaAd+KAoAvQfJ2ni/VIkN6Ty6FnxX4QtWnG4HNxCnsZyoYvz2mO6jmVhF9Up+Tz7
         WzZhcQjxdoH5PZAKnIQO3vJOaLnElstZJuL7F63cwYe1PW/W2a6UOB63/56UXoF7a+3g
         O7ck2N/KMuJJKABctIsjGPN7gvJW1d2rBjtEfxOK/KpZLUx5meiSq/vd+tKu2B5xbw3O
         92JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562294; x=1768167094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vX1nJ/KwU+ERB9DqMZcEiz8CUIvFleb2W4tNHZPrWVs=;
        b=a2IHw1YoXe6bbyEpIfJsJaPC/oroAncbje6YDzYjCRjrsM8jjqs9v5wk8jtolmbVtl
         rjRkKgBtPOJfDf1tzSCJybNiJztWKyHzyY6KeNIARv9Uzu4uRUH4I5HEaTH5ysinrVjs
         C7U/IjPZZLcADbWNNUb1LwXqexYxEjN7oKFXvBCBChB8n8ipYOjTp0G4TMMJLwz0hVW6
         H4teZS3XJAPi65OgyA4lnyoBVq2NzDoRJHaZAwl4poTni5pJPHKi8Dm7praDCUQYzPEC
         ydf8aG3y0lUdH/t8o9SQvC9Q9UH5FZcX+w3xfiKMNs1m0ZeuPrH6GQO4jmJ39qCmdMWG
         qXLQ==
X-Gm-Message-State: AOJu0YzyWa5WfcgST/MI5W6y/VjxbIoikexDx/yhuEfR0RuQP6LjHAPj
	cLkT8eKMKDQAICwB2Q7E9iDnU3tPy9RF/CE8DEDTZ+huOkh/c9fGy6il
X-Gm-Gg: AY/fxX6Ire5U7JKs6PvAnP+L6PxPKLFxk+MPWFZ+qdZ7I4Oc4QfcPzDm5GmTNPt1lJ5
	HCdKJhj5VcFNwosRD8/zUrFeO9QKE2h38vsVT+QlbeN7nmz9Q+isTPXXu57+XOJuJXePIF/zp70
	pK1b9KhrmNx5N1RLSFCmHU/+xO5VMTIi0ZIIq2bPHXLyltX3nQp+vP17yLAdWqUWMO7FO1tDVxA
	mxMBF90farHNXcejsfMSV1h3/XUwpSt2evwVZlUzSqY6ElyiB5iVfoSsvxREPI4p7vXWqBueGKy
	L4KjUEiELz+sLv8QCtq9PGMsugTf4u1+h+CI7YbkP4pWC0JEE2oeW2Ag3mUq2gklP8+2qCYIh7O
	13i3GmPxr/gXXyhmwp52gVm6P7f9CflnlWtpemnrKKTscjlbz9f4PV5hw4V984CaE1TCid81y6b
	Xx9dLT6LzSrixdxRnQF82DljweDxhEgUfqVnKITjb3Er4LXHCJH/sdpGTN5LkTmTYQ
X-Google-Smtp-Source: AGHT+IH9VObKoIZ26E6P6XUYtsRgGhF4IuzPxCVXmWX+XnEXOUDYTOW6tdmIebLvOtmgM4+nvN5b0Q==
X-Received: by 2002:a05:6402:268a:b0:64b:76cb:5521 with SMTP id 4fb4d7f45d1cf-64b8e94bf43mr26815826a12.2.1767562293872;
        Sun, 04 Jan 2026 13:31:33 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9c4sm51947772a12.12.2026.01.04.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 13:31:33 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com,
	corbet@lwn.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vi@endrift.com,
	linux-kernel@altimeter.info,
	peter.hutterer@who-t.net
Subject: [RFC PATCH 0/6] Input: New EV_BTN event for generic buttons
Date: Sun,  4 Jan 2026 22:31:26 +0100
Message-ID: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds EV_BTN and it's handling to the input system. It's main
focus is to add a simple event for generic buttons, not relying on defined
usages and meanings.

Joysticks unlike keyboards, mice and even gamepads (though that's debatable)
define arbitrary number of buttons that don't mean anything. They can be used
in any kind of software, but mainly games, by assigning them manually to
functions. Some games even carry default presets for devices based on their USB
VID:PID pairs.

The more important issue that this is trying to solve is the longstanding
problem of limited button support in Linux. The use for arbitrary number of
buttons wasn't considered some 20 years ago because Linux wasn't a good platform
for gaming. First, Joystick and Gamepad ranges were limited to 16 buttons, later
extended by 40 additional usages in the TRIGGER_HAPPY range. By allowing the
usages to be incremented up to KEY_MAX, Joysticks were able to expose up to 80
buttons for the past 15 years or so.

Many simracing, simflight etc. devices actually expose way more then that. 128
is a pretty common number with even more in the wild. Usually the numbers get so
big to support things like positional rotary switches as one such rotary can
have 12+ positions. My Moza GS V2P wheel has 5 such rotaries and that's not
counting other buttons.

Doing something about this limit was brought up maaany times in the past:
https://forums.x-plane.org/forums/topic/299033-xp12-linux-winwing-orion-2-throttle-has-too-many-buttons/?page=1
https://forum.falcon-bms.com/topic/26403/solved-winwing-orion-2-on-linux-only-80-buttons-detected
https://lore.kernel.org/linux-input/CACa7zynMpa3BOJUW=s_Tj1TwH5txDQOuta5Fph45PYhDOtQQ3g@mail.gmail.com/
https://lore.kernel.org/linux-input/20200710065112.18286-1-cpuwolf@gmail.com/#r
https://lore.kernel.org/linux-input/20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/linux-input/20250201113906.769162-11-tomasz.pakula.oficjalny@gmail.com/
https://lore.kernel.org/linux-input/20251119163844.1343-1-Hunter.Moore@garmin.com/
https://lore.kernel.org/linux-input/20251220194100.GA12646@altimeter-info/
https://lore.kernel.org/linux-input/665df7c9-0d32-4ecd-9f4d-fff67deb5878@endrift.com/

But some considerations:

1. Usages have their actual meanings and we shouldn't use them willy-nilly to add
more buttons, even if that approach works with naive approaches use by SDL and
Wine alike.

2. Extending the KEY_MAX will cause additional issues when it comes to bitmask
sizes, mapping usages and reading them afterward. Basically, we're moving the
goalpost somewhere, but a device that would define 1024 buttons would break
things again.

I must give HUGE thanks to Dmitry for forcing this into my head to a point where
I actually understood the whole issue.

Thus, I thought up of a best, long-term solution to this problem. I do think
EV_BTN should be a first-class event so it can be as easy to handle as possible.
If there's a need, it could be hooked up for Gamepads as well as HID gamepads do
the same thing and only expose raw buttons without specific usages. The usages
are a best guess when handling generic ones and only custom drivers can actually
assign proper buttons like BTN_A, THUMBL etc.

In the future, the Joystick usages could be completely removed and joysticks
could rely ONLY on the new event. For now, the old way is kept to not break
compatibility.

I'm eagerly waiting for comments, recommendations and critique. Currently, there
isn't a way to poll states of all buttons like with EVIOCGKEY but I'm not sure
if it's needed? I added INPUT_MAX_KEYS just for some sane limits BUT I don't see
a real use for it. Instead of this define, we could just use U16_MAX. 65k of
buttons ought to be enough for ANYBODY :D

Companion changes to consumers that already show the working state of this patch series:
Wine: https://gitlab.winehq.org/wine/wine/-/merge_requests/9853
SDL: https://github.com/libsdl-org/SDL/pull/14758
evtest: https://gitlab.freedesktop.org/libevdev/evtest/-/merge_requests/25

Tested with my Moza Racing R9 and Moza Universal Hub (both expose 128 usable
buttons). hid-universal-pidff driver was disabled for testing as it contains
usage range hack.

Sneak peek from updated evtest:

Event: time 1767559522.509446, type 6 (EV_BTN), button 12, value 1
Event: time 1767559522.509446, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
Event: time 1767559522.509446, type 1 (EV_KEY), code 299 (BTN_BASE6), value 1
Event: time 1767559522.509446, -------------- SYN_REPORT ------------
Event: time 1767559522.656447, type 6 (EV_BTN), button 12, value 0
Event: time 1767559522.656447, type 4 (EV_MSC), code 4 (MSC_SCAN), value 9000c
Event: time 1767559522.656447, type 1 (EV_KEY), code 299 (BTN_BASE6), value 0
Event: time 1767559522.656447, -------------- SYN_REPORT ------------
Event: time 1767559523.737498, type 6 (EV_BTN), button 112, value 1
Event: time 1767559523.737498, -------------- SYN_REPORT ------------
Event: time 1767559523.807477, type 6 (EV_BTN), button 112, value 0
Event: time 1767559523.807477, -------------- SYN_REPORT ------------

Tomasz Pakuła (6):
  Input: Introduce EV_BTN event for generic buttons
  Input: Add info about EV_BTN
  Input: Fire EV_BTN if found in ev_bit
  Input: Assign EV_BTN event to HID Joysticks
  Input: Realign rest of the HID_UP_BUTTON cases
  Input: Add EVIOCGBTNCNT

 Documentation/input/event-codes.rst    |  5 ++
 drivers/hid/hid-input.c                | 77 +++++++++++++++++---------
 drivers/input/evdev.c                  |  5 ++
 drivers/input/input.c                  | 10 ++++
 include/linux/input.h                  |  4 ++
 include/uapi/linux/input-event-codes.h |  1 +
 include/uapi/linux/input.h             |  1 +
 7 files changed, 77 insertions(+), 26 deletions(-)

--
2.52.0


