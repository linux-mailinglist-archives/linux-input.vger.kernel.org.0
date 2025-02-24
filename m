Return-Path: <linux-input+bounces-10279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3DA41930
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 10:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5954A162194
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7522244195;
	Mon, 24 Feb 2025 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/5L0Fp+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7B245007
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389415; cv=none; b=F9hzT7wAidzMhtlb/xISL2hloBk4RKy0dB9qokOIUstC/A/gduc7xFZGz4Q2yGMeFVo5iQb03NyYyTXFO1EGe0jh5lObzE4BdIAHnMOWuxgMMsycdyrpac7UUdD/UToldYFvi3hMmohkh+z/nz4EFtXYCxUOyxYR8fW20LnkW6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389415; c=relaxed/simple;
	bh=NbfFUQMrfkBzQH3R++I65gqPG9gERgDcRkS/gf2HSDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UvxSTr0MGvJp2kjL3JO7fE3ayDg4eP80QRF/1bvTMG3nemEqK44+figwSAcAiGDeY3/CrJcX08ub2WLFekmDKGqLhh5fe6fEkuJqFfYZD1xH0RkSNuAkR/6wyfotOj17e3OD9UY08i7cvEkEnoaKX9jOSeq3Sd+3OVjxxQAXQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/5L0Fp+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7dd005cb0so57963666b.3
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 01:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740389412; x=1740994212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gf6A2LCef6MhSbmSY37k0s1wKSCT0J6Y4GQFFO0azts=;
        b=g/5L0Fp+zNATdMuEtQ/+kLesAQfjdgJyRdw7o1pl8N0PYZ0eFrQOyKq9tvADla8PZf
         HQndx3GGp9nieX+Z64h+9B/l7c1DhAUdbYXwisHD+RaeTzk9KQiQ+ZKsLoQ0sIoMf28K
         AU8nkTg8jSa4GjDb4lDqueQymFso3/Y/PhdVfHj4gZOBUF1J6swGTOj9g5QYaMv8itZt
         alpzIkP5IQWdcLTtZ5r3sMY9xC+h9Ld4ff4w95HCeHCcFebjhnIz5qAf14YNetmfc6WH
         g1zdrA3od2/jVC8BbCIn0BvrVrXtuk8mGIDhkU+sNoDe4u8PK7nmVwIEcK/fUMFDnh4a
         LqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389412; x=1740994212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gf6A2LCef6MhSbmSY37k0s1wKSCT0J6Y4GQFFO0azts=;
        b=vyBfo7E4c+20uP0e740CC1wCCcTCjl/sZXK9yajETnqpk4i96vWVh7qH5vUy/gdmjO
         cqLPTtjkNR3DrxuF6BcEuLiLgwzic7mi/Ij0pjSrJzi5jkEA5du2PX4Ya1TNa3VWDauT
         qmTwxc/Z+STjrsPPc3kort8Nk6SIkMcwgHd4BahvEOkQo/c38xMkGbufFbivIyPSEQ3M
         OYmG6yvUu2o73kaXBgF/pn+NM8NRLDblpzgLe3c2weLTpwIEnISMinpJzhADYqXKQIOE
         qKz4VuGGXX0pHt02jmo1kDMors2f9dQspqOHOb1bGf6SuueUO1juE/os5bA1ekNszcZG
         JmLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTvGMZK0NsUI1qS3GUbsCEJbNCOS3fcOZcUCmYFqu3cB1Iw4IZ07meJJYsgFduG+6mYoFUE+rPOrsN8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rFRH7cbySeVyqJLXp03B/HIezBc+YcHk0aON6Pakm8QFCpSS
	PwjZrw9WpkA+/bjsKIlJO2eKQ9wL9e7CPGDv45HXqStV39PuJNG6tULdSPSv
X-Gm-Gg: ASbGncsP80np9oFOQ+m4+nhWUy4kCHDS1yUsiP72DPd4UKuwVAMRslRyLa7F1czlSTk
	lE+K5UHJ/GnJRZWiUjhecVYc6pYA52enDsUooykChr8tVcQDKxY398ky71LJyJ8jlIcdmxv8rgI
	4mz6tF5tfKOJut90/8P0SMwG2upm24PscbBzsiBtJLDIXymisd7feJOEgfohn8C/pWhlQ4mV8xW
	DDom2q0StH+XgFJjCvHen3Aw1cdLJgdtGa5svO647HDbkenOsRIUWP9OOb74sKquN/zbEIPFh6b
	6steqio3Uif9/X0uqdfMoJf5GkHZpd/8cczo7kKwHIYt0WeQV70kYpHnNQCz+FCAeq175Ive
X-Google-Smtp-Source: AGHT+IE8NlsZmzxwOc9a92Z2cz4sREriNmiALhF9Ny+WADGwTFYQSqvpWXDkPRe6Hqgi1AtE2SdHcw==
X-Received: by 2002:a17:907:7f9e:b0:abb:e7b0:5437 with SMTP id a640c23a62f3a-abc096c807fmr494369466b.0.1740389411782;
        Mon, 24 Feb 2025 01:30:11 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4b9ee98sm1416668666b.167.2025.02.24.01.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:30:11 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	anssi.hannula@gmail.com,
	linux-input@vger.kernel.org
Subject: [PATCH 0/3] hid-pidff fixes and PID compliance improvement
Date: Mon, 24 Feb 2025 10:30:06 +0100
Message-ID: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on top of current hid.git#for-6.15/pidff

Another batch of updated to the generic USB PID driver. Apart from
realigning two function names with the rest of the driver, clamping
LOOP_COUNT value to the logical max to fix some errors.

Infinite values were previously hardcoded to 0xffff but the standard
actually calls for the max possible value for the presented field size.
If the duration is not 16 bit, but 32 bit 0xffff won't work as infinite.

Setting infinite value works now by computing this value from report
size. We still need to look out for 0xffff as that's the max possible
value we can get from the ff API. 0 was never actually defined in the
Linux kernel as explicitly INFINITE but it seems like it has become a
de-facto standard.

After pidff, I'll (at least try) working on extending and updating
the ff API as it lacks some features and could be considered incomplete.
The biggest issue is that there's currently no way of obtaining effect
status or sending device control commands.

And a quick question. If Anssi is not active in the kernel development
maybe we should remove his email from the hid_info message:
"Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>"

Just the email as a user with potential issues might email him
directly instead of coming to mailing lists or bugzilla? I've seen
that it was a bit of a standard to include this info in old drivers
but IMO it would be good to alter all these messages to not include
any direct contact info as it might get/be outdated at some point.

Tomasz Pakuła (3):
  HID: pidff: Rename two functions to align them with naming convention
  HID: pidff: Clamp effect playback LOOP_COUNT value
  HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff

 drivers/hid/usbhid/hid-pidff.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)


base-commit: b9c340b67b33cd37e543195b157c73a7bb0c8d4a
-- 
2.48.1


