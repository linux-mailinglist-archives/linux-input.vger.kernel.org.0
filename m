Return-Path: <linux-input+bounces-16866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26913D03AFC
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69FFB30E802F
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 14:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1FE3D411A;
	Thu,  8 Jan 2026 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bt51/15k"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367933A0EBB
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865838; cv=none; b=KU/zz5xLX6arMxB1uj81SC8ClivirVl3LHez6czxAGDAAM7SDv3UaEFbb0XHUw5HkfVNZaBIi+GKqFj/mocn/gcvkov9wC4rqrPH1hpWAncV2FFgkOJbHT/vUPtjq/xtmq1cmD43qkQqrhB04C5mis9H61Ltgcmew+g27rsXmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865838; c=relaxed/simple;
	bh=F+HI9weCrGvZqZdvGzT41fozcChUp0aiMuJIzq7Twlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KLn9RaftZ98c+jbmvvAK+PZV0d289eweKgKttBgr+l1H1GtxhEmFY6DBAZZr3LWplz+uYe2AUqgS0OujWtaWnnUuUwUYQNv0WnsxROtOdgnjjOqYp8ow3NaaLIp3sCuObk7di8WScFZSMXqaDi5vzOs5IVrGy43N949B3sfLtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bt51/15k; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dbde7f4341so1404756137.1
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 01:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767865831; x=1768470631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNWaW5uyJY39Ee5wA6GOpA1sGvgkAjuELUOx96wJt9s=;
        b=bt51/15k+FZq/oiT6irEuyqX0gub3Qiodajt4hk33n/E98gHkX0CEhLzaawm9t6qJe
         Ap3fS7ghl2S3X0o8pFoxbvjEjdcMlpHn1ofo10XQNIRHzKBL9ZXNhJz2WPhT3MJnqIHg
         M2AejoNsv2by1jM5GXKQ+h61yLOvjvSjSjX7dkjT2KJhsTrY1c1i8k9IjjXl3gyI450g
         p9fs1zIik2BPmujGP4qZVm52/7RxSBje38tcDgxDvZxW1EkIanUvL6GT0XMRy/1/4TJl
         IosoBB+W7idvk4JCzrIYfk+QPHwYev4rCcPpd+q6fNytQs75xXcbzRvKi5TrJapRXHiq
         qkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865831; x=1768470631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNWaW5uyJY39Ee5wA6GOpA1sGvgkAjuELUOx96wJt9s=;
        b=CTdHlZYO5bZaRasDs1Vz9JBdPurpwIJ++bthZaTYcvBPejmK0QueBteUA96IlC4HYp
         SpKd0BTIi3tVpOt2/OreQn38smxKjOEu+HhDZEuogS4cYy4trzQTV/qYRMnq35dyPyt2
         VW+DAneSN/jJisrCu3wOXYzj6L+9mHT8iMvF7wOqDIV4EGs0zOq9oh5RcPVPKzs2jXX4
         Sm+H0mKEPPlLt5oanNz0/IHRxwMEOVHf6Xg/Ruga5wvAlRZP7ATEQ/dsTjFrLtHB/Lw1
         ctFiR3wP8wTnANk8jeCNdYHPd+k3kA1YTkiSgNnp8UDhaBjXPyoLL7vxL5sY4VYvbs0p
         tUYA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8uQKSu2lC4MDsLsxIK7YBXxcfEwu2pf0EESuAms+DGLBcXDKYbkyN5tSrffm7+9sxoRfrakFNJ8FRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3qw/CAH+LX0yoLj2X61e6p/0FevPC80MPTuQxt8KkstJiZpGn
	ZLGP6ysdq6ufFqtO9WY1seR+Qc4UYFiRP1Uudvv0/mYNEuGyMiA/cZLEm26Faw==
X-Gm-Gg: AY/fxX4JETsjOGecSzbfdrg/LXMRZb0CMv4ftCFV1sMqYt8qwos/WHy6UyRuLtuaChY
	OkKgQB4ESUBW8kKkbazxYZuCest/6OLUvXSye4pXRfYqmo26E9WCdU1Zwl3q46NjBary6TuXFoe
	txIABvQZ2mZgAZccwiEM2C7YAK7YRBjiSYXrKSYCvLTiIkO/LnDKTNJQgSuVwXOwUkGLl0JBMKr
	oOq9UTCaOeZvj1g91mNZ0sZ2vNOAl8bWs9E+v2/NXegIumpRp6OnACJKJwNcnRDHDTL6VBztYnc
	Y6dkxrkBnIanqpj2m/P7M0aRcs+XP65BWq9EjYs+7i898k8m5BSaPsXxoumHXN7PxSPTuPNuKPf
	+5Ny0SFWQ1V7tjArzQZlMMoIYFKxC9+yr+NBiC1p3H6QscYoBNm/D5lIrwhmiINR7zzx1yvdDMi
	ieQniqd0BXR0tSzMf9E53sqww/AEYttdepcs1s2xgGf30wkL0gg9bM5M1fgYld7fL+Z9DCzDim7
	u0I+RQYcbbXOP7s8nBF/g==
X-Google-Smtp-Source: AGHT+IHWNlnOIQoHRnNghuP/KuzB06upezljxGJd8aibyns6gUrJ5zRj9QVDAk4WOeIpJQ1oogEYew==
X-Received: by 2002:a17:90b:314a:b0:343:3898:e7c9 with SMTP id 98e67ed59e1d1-34f5f831c74mr8109800a91.2.1767859745886;
        Thu, 08 Jan 2026 00:09:05 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm6900582b3a.16.2026.01.08.00.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:09:05 -0800 (PST)
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
	krzysztof.kozlowski@oss.qualcomm.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 0/6] dt-bindings: goldfish: Convert to DT schema
Date: Thu,  8 Jan 2026 08:08:30 +0000
Message-ID: <20260108080836.3777829-1-visitorckw@gmail.com>
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
Changes in v2:
- Add references to generic subsystem schemas (serial, input,
  power-supply) where applicable.
- Update property validation to use 'unevaluatedProperties: false' for
  schemas referencing generic bindings.

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


