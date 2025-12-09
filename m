Return-Path: <linux-input+bounces-16508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 361A0CB073D
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 16:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C5B300A845
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 15:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4457441C62;
	Tue,  9 Dec 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MV1QY9me"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A0727055D
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295235; cv=none; b=PJ04897PPAL7ViOJtzeqli48dXfR1EJCz5T+tM+nEQw6Ww0ShFRf5ccX/4UxnA6AdPrWGqrZyn3BzVvYtVBhd50KJWQZux5YHMhUJUy401+uha0mt3rz94tQq1ww4T+l66CvGIRH0BwsZkpkReMpZAGYZp6CYu1OsXX5DIQKOhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295235; c=relaxed/simple;
	bh=m2A6ZHh38QLY0KCcRCAKW90Du25XkQzdMPrnADEF3KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSeT5HtGmpusIzx3pl6oi7KFCLqkDo2Bzut2n43WeTV/wLfnk+bEE5jdgYa5rU91nozu4PG8vEcwXZGC8ZbMdnSneTqUM0YtOK81/oL+9Y0dn/SpLsvndW6BeIxVsmRle4fL2UPRyn85LpmkP93vIw1hs9R0EV6DiXRUMvqp3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MV1QY9me; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so65808165e9.3
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295232; x=1765900032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2c04LwHbF/s3zM8ygqzdu4yzOQ4Hv2zMBfxhEf+2XtE=;
        b=MV1QY9meNAZBJpggxuyc/LAC8VkGQqZ1ZfXGunE33iKv/2z+C0dnZC3I2pQL6RtJoc
         EHKWKg+TnEXuqvzjxo81o7sV/nftgzroKibt8NOR7bju9L6/V+MsDfWARwbYWgiVEK0U
         C+DPsz67gKvdg/GnaAZ95q+sWuf2A7K9qbtPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295232; x=1765900032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c04LwHbF/s3zM8ygqzdu4yzOQ4Hv2zMBfxhEf+2XtE=;
        b=iTWDWdAD9+AQj5YMi+h+w4tjAhPbZX2fqIqRxUaVJKV0jCZBiLQPBnhO1bgC5pe4v5
         VW+F8JZ4aXz6FEdYNOIiYNkgIODLuIxkpWlYyTt70aSmo6+3FPF3c1uG2NJXdz03JGX3
         5iBEGhxI3UvKqMXPFcUJNjANuf+iAZ7ipETrHyY10CEHlHFe7Dgy08hVm9mSAbt0NJaa
         iMjwxD87LZ1ev8lMI5yBmGa9Z2RMmASMK6hnhwKEtRTSjDMLWAfCOzPdXalumH2c8m02
         QyTlNceDHjSfjibKH3LXyNSn28GLrqW+p9VSBE89puCn6VRmwYS2ZF+xjGy76lvlzrRb
         Rebw==
X-Forwarded-Encrypted: i=1; AJvYcCUzbQHSQDPo23YGQLV1qgMCkJiw2etVfd1rgun77OOgl26DGEhpuWlZ7w81OZPT8q7XTLln9jhUPII1Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/al9HbHSIvPjzs/HPT3fotgbjJWkcbIHxATFP/SgFgzO9WA8R
	dFdqS2JppeaeUyVfDgqRFRjabOk4S4i3TYWQOHcXWvTheIJdHWznqR1Q3g11lQwL+w==
X-Gm-Gg: ASbGncuwCaex55BNYlelwx4eAFbtALCNh8iPiRecwVIgWgvcSaGVc4RRPlsGiPL5w4X
	PAS0nCBiFacJ4aLKVh0tNc+h0nh9peWzB/TXSTnFH51QOqGp2a8qxvTTZuj85+aC6m0wZ3GQAk2
	hjBTK7gqAbIAXgV2Cy0dC1xOE5GTrJynkxxXJd21JpSSZrZR+FwPUkUG5mh0i0KxlCeP9fAuchh
	q2crXLN0HDqGDYFW992IXHHEkHDCUdGGrUIdyoOYvSKVPYB2Htt8wwfemp7hUv+TAsBApfk9ddW
	bhoaFua+++luj/AAtSROsEk/0QYHmZJoI4c/Wd/ZmgjmG2Luk8UdSmLkSHRCuSpAC6fN5Zis4Ti
	bwYmPGiVNYkbjWuzYEe27MqyC8B9oFqZVSzgpdQTgx3GG31Hu0Ml9AWnzXgeas/TmA/7JnIZcP+
	WGrEy4V3zuEU2M8yo=
X-Google-Smtp-Source: AGHT+IETtig917c/959U67stUU8b8pUELNsuVOkLdt6GOzPmjWWtx8z0b7xMKjenAYwi61hJeTVS2g==
X-Received: by 2002:a05:600c:19cf:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47939e3a6c6mr124500145e9.24.1765295231876;
        Tue, 09 Dec 2025 07:47:11 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:11 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 0/3] Input: cros_ec_keyb: add function key support
Date: Tue,  9 Dec 2025 15:47:03 +0000
Message-ID: <20251209154706.529784-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this adds function key support to the cros_ec_keyb driver: the platform
can specify a key to be used as "function key", and that changes the
keycode emitted for other keys as long as the function key remains
pressed.

The Fn key omits its own code if pressed and released with no other
function key pressed in the meantime. Non mapped keys do not emit any
codes, this seems to be the behavior of other devices I have lying
around.

Fabio Baltieri (3):
  Input: cros_ec_keyb: clarify key event error message
  Input: cros_ec_keyb: add function key support
  dt-bindings: google,cros-ec-keyb: add fn-key and f-keymap props

 .../bindings/input/google,cros-ec-keyb.yaml   |  60 +++++-
 drivers/input/keyboard/cros_ec_keyb.c         | 193 ++++++++++++++++--
 2 files changed, 227 insertions(+), 26 deletions(-)

-- 
2.52.0.223.gf5cc29aaa4-goog


