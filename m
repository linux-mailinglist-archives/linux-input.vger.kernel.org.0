Return-Path: <linux-input+bounces-13821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2FEB1BADB
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 21:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B96018A5328
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 19:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1E821CA08;
	Tue,  5 Aug 2025 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klQkmeZD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3CF2556E;
	Tue,  5 Aug 2025 19:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421672; cv=none; b=Mu55q1Wr5m2/3PW9HayDQ5AM4toboXUWRZVyG22/TBLiutQ3UfyDOWyQVEYSL/3pOq9quhJpH3sJ708AWlsj4LP4LlVkD/Aexdx2Uby1kW6arzD58M+P32gqCb+Gr2SPSjhgNRbWIq1UBJCA91vnhzICAwU9l3XuqsmTnhDng2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421672; c=relaxed/simple;
	bh=K+rNng4Yb3Bs76SvnUFBf5JDqzfiYqFHDl+Qtgl2dx4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UYx0AgNqP8DGsmAP3RQw5Jz3ldJ8KPZ1NJZMuBE8wlN/TBWuXqF9zQJkTgl7mnW57T5zHtop+6tDZv3AsNlSnzRuNgC70YEPGjKNwn72JNdJI9FTj/ehAnUeJ7TYrL73VhLBKlnWuOHguWNdKjPTcTH5kapDCfN/i3MeLHI+418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klQkmeZD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b85d01b79so6143679e87.3;
        Tue, 05 Aug 2025 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421669; x=1755026469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUo90LSr2WR5qOqVILJJeKuf5vFKkJrA4dsv9cau6co=;
        b=klQkmeZDueIBNjJAT59Q6NMWbu8BR8jkEl6B9xyPCpa/ogyI0Dz6KYOYJa1MUwlY2K
         BANbnO9r1a36SkMwrzEsABUMltsOUZXN9WEYFIIDz5aZTIaBAty3dYhamWGZkAr42PBl
         2WTWCWpo2Yj7Ik0ljEeTMk7cLPeEbNy3mJkCDKmD95s01tqZPGn6OZNGt+EMciKmS2F2
         M1Khs4lHTd6JMtrqoy0ePvk4piqwP15HDs4AcMIy93jDJzQd8LXgB+HgWjo52Q9Mzn5m
         HKckffOVYaO5Yd3FFFiz1OoWZCegOYz2808QLBKaDXC+b30NfVtRyJQuxuzMu5nupsNX
         inLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421669; x=1755026469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uUo90LSr2WR5qOqVILJJeKuf5vFKkJrA4dsv9cau6co=;
        b=p1oE6NzPSdDWhWFe2w3hn5yDnvRAAq3muPHjsABNuKTM8PU3+zY1Pnm4vcTsmfOFnp
         LJwR9sm2cn4PIfgPBHkmR9Wn8jRlXJIkpzX2ueakn1Ja8A9MqBsitSbeqPioIkeOgkLy
         Dba/h1UcgWrFCixw6G5NoYZc05VV3tTYht7neS8B62jcrjb+GQsuV0rUnayuWsI14EsN
         V+nOCLyYI3sLUhr6uv9NMlvmb+mfUGrCrmH9RqL0R4NLb+sTHy+c+NVxh3vO262wFxgT
         tVelAriBXq69ZxfgvKtELIOZ7Tr7tJQYKmDO9egQMRG5tryDZUdpczyuzjxfN0tvG8Ln
         hB8g==
X-Forwarded-Encrypted: i=1; AJvYcCUVUBqTelxwyodXHpdJQTlb2b6+V0JoYGS+I/xDc1puUqbyJhkLSyxtJ6+jCn5ij3oHukSyMhP7uPKEB37+@vger.kernel.org, AJvYcCV9Y0I6B2PuFX4GUBG9P1mB52rPR2U4G310KagGV9gSkpI8eUzN4/iMvii1g2QiT9wzOqPOhkEl6JuzPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWPx1pJ2UDdQ4S4AlFebRTFgl8Meh2mesU9vWTW7RHNKgcgBi
	CeXULRSewKUzdUc6m1RSHZBMX2lWIXXkP+csanQW+RKZb6Y9XtSBj4CX7nT0RXQ=
X-Gm-Gg: ASbGncu3r0YU4TPA2mRqT71woCvGxC7670f7XNExFJh/b0mrzao//ayjmmJzxY2IiAJ
	5bs3x6tPb7/Gujzlw17kk+XyGxj6h7ovMHFsgfAn8C1HWo2UH/jufG7XtF34YGGSv/OQVNAlDat
	1y8wUwcWd6m4KVworG1bRZj9r1G9sstVKWrdq/nr8afN/9P8mLOSsRRe9/cOvD5hzQCdBiq60tH
	AW5gw2WPYIMAtiiOgHfP77pTvXBcHYcuaLAUGqSHUfOdBsQBldUG+nl2oslqUOdc6dihaMvgCu4
	ATrq24EgqTxJ0ENiV6iujSEgSZFs0KtGlYT5Q9BY6GgWMIZrASwUwlK9q81yviIo3etn4DSCDQg
	TJbW/7Xlu3hs=
X-Google-Smtp-Source: AGHT+IHQOmW6xh3/0K28kEhuxwMKpun9GmeJj8OzUE08iYpFZodecdT6APe0egm8Yxs237PcJsNtoA==
X-Received: by 2002:a05:6512:b97:b0:55b:8aa7:4c1e with SMTP id 2adb3069b0e04-55caf3c27eamr12992e87.53.1754421668373;
        Tue, 05 Aug 2025 12:21:08 -0700 (PDT)
Received: from frylock.hermans.pl ([2001:9b1:dfa:6c00::f02])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-33262ac17casm10258271fa.82.2025.08.05.12.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:21:07 -0700 (PDT)
From: =?UTF-8?q?P=C3=A4r=20Eriksson?= <parherman@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vicki Pfau <vi@endrift.com>,
	Pavel Rojtberg <rojtberg@gmail.com>,
	Nilton Perim Neto <niltonperimneto@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	=?UTF-8?q?P=C3=A4r=20Eriksson?= <parherman@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] xpad: Add support for Thrustmaster, Inc. Ferrari 458 Spider Racing Wheel
Date: Tue,  5 Aug 2025 21:20:27 +0200
Message-ID: <20250805192036.53918-1-parherman@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds support for the Thrustmaster, Inc. Ferrari 458 Spider Racing Wheel (USB ID 044f:b671) to the xpad driver. The implementation is inspired by the work in https://github.com/Capure/xpad.

The wheel reports steering and pedal data at non-standard offsets, so custom axis mapping is introduced via a new mapping flag.
I have tested the changes with the actual hardware on Fedora 42 (kernel 6.15.7-200.fc42.x86_64), and confirmed correct input reporting.

If you prefer a different name for the mapping flag, please let me know.

Please consider this for upstream inclusion.

Pär Eriksson (3):
  Input: xpad - Add MAP_FERRARI_458_CUSTOM_AXES mapping flag
  Input: xpad - Add Thrustmaster Ferrari 458 Spider (044f:b671) device
    entry
  Input: xpad - Implement custom axis mapping for Ferrari 458 Spider

 drivers/input/joystick/xpad.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

-- 
2.50.1


