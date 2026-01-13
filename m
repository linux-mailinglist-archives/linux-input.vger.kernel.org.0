Return-Path: <linux-input+bounces-17048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E9FD186FF
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 12:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AFEA30194F9
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 11:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A866830BB83;
	Tue, 13 Jan 2026 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TI6W+/nd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB38368291
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303302; cv=none; b=mn6ykN/gZOtpDk8loWsp+sn8LmxqGsPK8h65lQnm65tlCE+MrgkfJxxrE4ZkXb6MGUFOxedHwhJZRS7AahJ1UUm+LybqPoyQf5vjkV1/hDFIHq6pUmvsosg8D+hiovAwfnVRc1KtYhvz243jEi3pPKvVLMqu5chn+lgbWHRCY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303302; c=relaxed/simple;
	bh=BxQThXKC8yeHVSgVuMqaQwxA6jCxwJIGPEfZiSybX3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4YJmPP7nC8rJygSUbxo3HHbm4OmoIwhDIph4/dGTfZHDDeO3nPH/xmW9gXRve7pMf4vL/HJTaEy8EJPQSPFYRQ87DPcm3X8rF73XRlZfNoE1ILYTfNoF9ITVXythT7kRvKUkGXPwpR8kkTccbq0qQA1F6HQvLane2eDY9n6/gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TI6W+/nd; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-121a0bcd376so4475828c88.0
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 03:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768303300; x=1768908100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Sop77tdlghLGqlW2lD54uYlYaNgTrSImbZcSm1W050=;
        b=TI6W+/ndgaf9n7ZX8yCggKwfL7/jNDmTa6mG+/xH9jlpQOabHNlqRCP/gh++oJm8WK
         7YvZbkfYrP4f6ZAGpvAenaxMs5Hqoq84UFnD0c58KL6laJMdME88ebHvXLkelCE7IG63
         liMEXLYgwRh77O5WgAp6KoggCaBToi0LYdtp/2I2+iIc+/sMyRHlNgtLuwj4ECux+ape
         gE8SIQ3ScaEB5uBnVOJ7kESZjHa0xKqRW66Q+1ZQKhMG/s104K90UVldTCZXtqb8Rvar
         PRgiqJ5JQE6h/c4eM/NC+53/9Mxs2tfDQvMNqxdEbVhomwE/YrfUXm41CEVXUtyj6ZZ5
         0KZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303300; x=1768908100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Sop77tdlghLGqlW2lD54uYlYaNgTrSImbZcSm1W050=;
        b=qVXFS2JZbJ6kxWP+EQbj76+QlSf/h9HX2CG9uXkBSYnwPh/8OQYXRmdVW03wPlFQzm
         c2B9gA/FJ1zR8Y0tv9XWreZZHIhlhwZeCvdVbsagcnDZiHh1LTgWkamf1lqJNZrqF/0I
         kMwX+jpVYeOvWWQOH0OXPYBDU9V+3bckQ+/plkmJXOVOemBoNLRbKVZmWAYWRobkjylj
         yUC3joGt87BhrnGh4H3IRbxhDES8DacultLpAJQpxsKW7Spw2YEMrNVHIqG1WlhAj1EO
         RZ62oks0Bc2+WBsye7fEEEzuuSjUe8BMJHhNUa0+6ok+w/cDC8ISYavFCtwjOEXGH8Hj
         wNnw==
X-Forwarded-Encrypted: i=1; AJvYcCV3i44BZ81npbZpJRC0JbLTb+hwOgWD2xbFWR4YGpOHo9Tp8oVHLP9Q8L7X+6uyXSG/04uuj0hnmH2FRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz99qOl7fpsWqBhcSvaPgHlxbMEMi+yZZWuxJPozNfNIcV8ySQB
	QXF6kGZX8Tk8WqqFsNFLf12+53kguYkaQEAU9KBP8M5WH/zWxeo7TOY/2ub/kQ==
X-Gm-Gg: AY/fxX5lSdVOaP9LuoHYr26AfOOy+K7nNqJG+8uRKPWtBS/XmKD6OZeTs6/ZKe6nUtq
	SEvKf9xbNfp5FxNZYWZHQ2zZwUjcJFk4lubnZP1HNd1tDATWqd/5LX2BqrWIkSxPcyVVl5RuGrz
	a4GWK955L9IMIUjmA9FlI7dh6glw8V31OoMyy1nzBnOGa6VrX2SBxsSwK8iUCdj3RWYv0FlSw38
	2N/5wyfOLmGeRh+Tz6ait5WW9fq9t8VaSLsyHTA8eSQay7Irs0rNxg8YYI5+CnmlmvoK47Yt1MH
	N1ybUnMv4V4eM2vRVf/ygRBW3Pan6iqc1n2XDQRzbkg/j+s17oM/x0VLKzJMB88ooRhM/VfwmWh
	fGG6SejBoZdrjI6ldLpBOlboZtKNYnUtGiXi2Q3dkjSEpbS/29QdEDLom0qFR4famrwPz4Mldxn
	O5Eb/ynMktziilIZ26982u29EtdcC3hhwnfTpBXAsqBvc8mR5e2qbeec4gbtdPlIPI5gO417o/z
	xLFLb24RHPuUGiZ06BDxA==
X-Google-Smtp-Source: AGHT+IFDZv7qvFhhROPl5N9K7peOOsuOQ4CyM9RhLyedWdWjF2fUf/8J4j0bRoJff45OX+N60FkOeg==
X-Received: by 2002:a05:6a20:9193:b0:35d:3523:c90d with SMTP id adf61e73a8af0-3898f757a29mr19808618637.0.1768296379649;
        Tue, 13 Jan 2026 01:26:19 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0f67sm19483200a91.15.2026.01.13.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:26:19 -0800 (PST)
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
Subject: [PATCH v4 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Tue, 13 Jan 2026 09:25:56 +0000
Message-ID: <20260113092602.3197681-1-visitorckw@gmail.com>
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
Changes in v4:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v3:
- Update 'interrupts' property in examples to use decimal values where
  appropriate, replacing hex values.

Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

v3: https://lore.kernel.org/lkml/20260112185044.1865605-1-visitorckw@gmail.com/
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


