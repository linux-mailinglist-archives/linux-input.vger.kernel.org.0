Return-Path: <linux-input+bounces-17003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F2D154E6
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 21:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC0023017EE4
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 20:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6073B352958;
	Mon, 12 Jan 2026 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9RMkHeI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0077A34D4DE
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250672; cv=none; b=NPUOVZXZvYRbwqz3BKASMwuZnDUB0At0FCXX7CoptSbinyTel9I09+SeTEgsx41b/lA2WS2daT1BVlJsLHS4d/dDk0d64AouGbjFPc+QJtVPDpHTCNY8t7HEuLm+DoXF/FoMuAoteHI35LN3DqBasowOjhS0I4BwiJPdp23gwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250672; c=relaxed/simple;
	bh=qpCaq6TACL6eqM1utYs6sRZYduBCrJkOLynbCIHDvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZihsSi2Oh1n4NLRjL/YEt+iLOKcfLDa9ubYqWkUN5q+SdVipEh2n6ezH7jIpPbE6Q64bNCWOgtYeqs4874ZSr3j1mYCp9p/GsKvEQKHf31f/mqkpPZdu9A4FJKZ+Uc+fyDBJrpcvTMWw1kHyfFtngeg36hrT14FMguF7F8r6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9RMkHeI; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b25ed53fcbso172867485a.0
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 12:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768250670; x=1768855470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUq04sqpfNThT7kS3bI999/FPk05t6O1xEOGrVfWKpU=;
        b=F9RMkHeIfzHDLB+xqZYu1IBHkIGLbIQOt9vWtQIwlqZn8AJ87A9HcT7S5Nzm2t0AUb
         Zb85dO8qURojM1mKMPKfJKqxh5mN0oXu2pj6BOmdM8wYEjOzqceIa48FNvkDNSSfQrTE
         WgacMGz/QK2jnvlZi1PlqSyl4YmGWQx0ZacL/AyVRkqeWqJu3TsgIt5bYdF+vA+8oYsz
         1mfWuekmuTuLsoVVAdwmh9Sv7Rg/Oh/XrRqha6Civz6QT3MJMNOX3Z4AdUJLURP55A5p
         4qkfigiMQRDc4wUdOdGQndn1fh2VWor56ndcAL5a4WCtm6Tnf5q/MldSR3d3Vqbt13ZZ
         iGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250670; x=1768855470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUq04sqpfNThT7kS3bI999/FPk05t6O1xEOGrVfWKpU=;
        b=QUvFkyjW+vuD+x7kgI5152wubwrMe16M7urCGI97KldlASArKiKtnkYpZLGXdoj/um
         93+ImuXuMDrxgJ3b1GtkYTgn5ro27fJmTrnYiatJjJXelBSDXCUoHfw33QJjXxBHketK
         iW5b81OFr/nTVdzyGA4rCf34BLS6DZnif0Jcr1WEpAuPPyfEkS2FBTYI9dHB2gk3lpoz
         YC1Pb3osfHs57UjZcl86vtWO5VNod64iacFwslEfP202oGy71Bb1NOOM14gP4m0XLL5a
         lMPp09Av8g0asArw2fdjghekxO9fTVCdDXUDTIV0T9GNOwQE9QljL2xgOoPrDwtxn8ts
         e0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVldzUmh10kOe5IavT1eVAhlD2q096zB6gA9ETFoCWwdMCUp3YDBV0df5aNb55kJFurEgl4Dao8VLuUdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztHyosTXmdTzCUSrbm4tJ/ctcGVbuhvpE9JlUJwnRQpzT60AJ7
	ZnOWM6W91WEbEAqpCQZMWmf1KqKS8SsPNLfgjRyLaTQP81Tl9E/8hpfFZN6v9w==
X-Gm-Gg: AY/fxX4EbjS07cDJdXPzz+LC7y4yedBeeFm+5nZf7tb1UPss9HhoX+U2nC+YQn5wScN
	u5/+xfFzTnxzJmy2C9gi+GvZvO/j/RpHunkLY1WxJTMayMXbQh2V4g4M0nFeNL9DY6mpPxJ1P+v
	sOZECkBKwtgV/EH8unUb5W6xz8RuiBaqZZ7cYpmavb9Khv7vmLx7QQ0v8ixocnS9neeNLNRDRgU
	33H3HyTP63ihqE9X29cMEZPpZXGMGmp7rC2ES0UkZsok9ECpfEXtWomGp6CCS0zbLnGeGs8UYaT
	BrHf7fO/X8MP+q+kSG2oxZqZIOxfd5QJGdn5z1Oi6XLVM5E5hAu6OEZM39nmnt+dbOIz2J6fIx5
	q1kWRnE09wbi0Y0wPLXhZ7/W5fY83JCvAEPE7H2Y+qgFwQk0SaHYNFTqkTykAgZ3bOa5C1MJyIJ
	X84rO+74kYh8KF6ZTFYYeOMKQ+DdhfOVHZJ/o4MvWzB+uKHdQIGqLDwyPzTjWxsSMllEFsSmeB8
	9mjFZkjcHCPd4MxPu4KMw==
X-Google-Smtp-Source: AGHT+IEj1k7cb2fd0Uhwg3rDL/Jbgy35/7F5lChJPW1hzU6BQQa/0pFpWI+28ikvSEYQSgMkRmokRA==
X-Received: by 2002:a05:6a20:7287:b0:35d:d477:a7f1 with SMTP id adf61e73a8af0-3898f99146bmr17183198637.43.1768243906956;
        Mon, 12 Jan 2026 10:51:46 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cca06b16fsm18874197a12.31.2026.01.12.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:51:46 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Mon, 12 Jan 2026 18:50:38 +0000
Message-ID: <20260112185044.1865605-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Android Goldfish emulator platform bindings from text
format to DT schema.

Most of these bindings are currently located in
Documentation/devicetree/bindings/goldfish/. Move them to the
appropriate subsystem directories (serial, input, power, sound, misc)
to align with the kernel directory structure.

Update the examples to use generic node names (e.g., 'serial' instead
of 'goldfish_tty') and fix minor inconsistencies in the original
documentation to comply with current DT specifications.
---
Changes in v3:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

v2: https://lore.kernel.org/lkml/20260108080836.3777829-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20251230181031.3191565-1-visitorckw@gmail.com/

Kuan-Wei Chiu (6):
  dt-bindings: serial: google,goldfish-tty: Convert to DT schema
  dt-bindings: misc: google,android-pipe: Convert to DT schema
  dt-bindings: input: google,goldfish-events-keypad: Convert to DT
    schema
  dt-bindings: power: supply: google,goldfish-battery: Convert to DT
    schema
  dt-bindings: sound: google,goldfish-audio: Convert to DT schema
  dt-bindings: display: google,goldfish-fb: Convert to DT schema

 .../bindings/display/google,goldfish-fb.txt   | 17 --------
 .../bindings/display/google,goldfish-fb.yaml  | 38 +++++++++++++++++
 .../devicetree/bindings/goldfish/audio.txt    | 17 --------
 .../devicetree/bindings/goldfish/battery.txt  | 17 --------
 .../devicetree/bindings/goldfish/events.txt   | 17 --------
 .../devicetree/bindings/goldfish/pipe.txt     | 17 --------
 .../devicetree/bindings/goldfish/tty.txt      | 17 --------
 .../input/google,goldfish-events-keypad.yaml  | 41 +++++++++++++++++++
 .../bindings/misc/google,android-pipe.yaml    | 38 +++++++++++++++++
 .../power/supply/google,goldfish-battery.yaml | 41 +++++++++++++++++++
 .../bindings/serial/google,goldfish-tty.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/google,goldfish-audio.yaml | 38 +++++++++++++++++
 12 files changed, 237 insertions(+), 102 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.yaml
 delete mode 100644 Documentation/devicetree/bindings/goldfish/audio.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/battery.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/events.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/pipe.txt
 delete mode 100644 Documentation/devicetree/bindings/goldfish/tty.txt
 create mode 100644 Documentation/devicetree/bindings/input/google,goldfish-events-keypad.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/google,android-pipe.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/google,goldfish-battery.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/google,goldfish-tty.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/google,goldfish-audio.yaml

-- 
2.52.0.457.g6b5491de43-goog


