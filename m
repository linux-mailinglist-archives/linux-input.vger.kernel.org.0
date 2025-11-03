Return-Path: <linux-input+bounces-15873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C35C2DF95
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 21:04:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ACAB1897909
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 20:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1802923F424;
	Mon,  3 Nov 2025 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMpCWZYS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3322D9F7
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 20:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200171; cv=none; b=tx8FBB3hjqi8rwIQ1ZbBzipSvkY0/x36xkAxTsoPddTZ8bHwE9PjLwW1QFShhRPH7t3abaEJ6qTXYS0eRYBuTSEaAwJ1Wb3xPaX+LIPhhFCn8fp4alN2Gu7s+pxUA28/lqaFtLwrylhWKH2FNYa8SY/27Z6SM0EZBh3UegEhwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200171; c=relaxed/simple;
	bh=6/2nRe2lmV/uGkSjhwqoe9AWnw6MaOEMgmY1XqdohXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qhkFrHmgqJln+uAGh5EMjr8Sm4/xmIBda68S30ZIhp7Ei8k9nR5kmKP898LZuU42g/sztrokt8fdC0CeZO7Lrtkbsj4yfjPvL5/XugYIyZca0rJzW6moJ2MukVbvBhfAm9T+Z9188AamYpYpWM6ZGOpwstB7KTX0DlI7XTtdoYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMpCWZYS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64093f3f7ddso525132a12.1
        for <linux-input@vger.kernel.org>; Mon, 03 Nov 2025 12:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200167; x=1762804967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dthYGiyUHBx0Ys3b2Lkd88Hqf5+r4/yEiE0a9OcfggU=;
        b=BMpCWZYS5odESVyPg8VjKM7T16Ys9zy/I/iJa0k1g3zCsUHZlsMIlNu3YATpEuPV3N
         k6jnoZMWdHUFHf40PprICrd8xGzawGmfv+QqAOpt4GNJTrgZqriDZ4zgikH7IqJf7LR9
         ZuRL9UisGDsFtG+uzMKoJflIN1bl31+MADjiNQensGLlc5x1XtMviTWGSmLVsV7cQ5Ip
         mmfv7kIZ5hE5IeFqlOIBBRDRB7TPLO7bBQq2b72O7xvPvtDjNQp7vGp0XYPF/0UU2bIC
         0I1Rewz7d8H6FWU1m/wspDIo4uWPDW3bR1L0XRb0Wh2Lr2AF2PfxSXONGLSiZplXa3kn
         3CVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200167; x=1762804967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dthYGiyUHBx0Ys3b2Lkd88Hqf5+r4/yEiE0a9OcfggU=;
        b=AWPeibn5zKROewmz1r8F8QwdaIaEXD4PNixS4JsOKbd0cObcAhP9Sg3ov2iD1J0B5o
         zjMQdnd6NVEu9UsVXyja5KkppkcTSfjVJJNIwDTohQ+bxcdgMZS2Yf3lnvIT1zoyOgPx
         ht50La3eOVpMOfIPRgb6/DCfOmJEzF+4WGM3nagYy4kqn0/owjWZ/HJO/5asrdT4RgWZ
         HrbKJVTKalZpKZ3XfoSovW/7UhE2pcyCxz5QuN+heDp36SVLPRu9k03I1owQZFYMQWy7
         swaMtQ3MbfM6bYzl+Qxt+ibQWeU2nJ/M1H/grmFNfGMdPDOVrOcNAZ96MHrVUxXqemdX
         /eHA==
X-Forwarded-Encrypted: i=1; AJvYcCUqVxWzsYdlkZBiB1sC+kBHT7o55O0dogIcPRTluM9o1EXKiDKjHILuejeRo8fy/C7c8bYZrjFnsQpBtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEoqVcUzV6oTDS00wsuEom3NeVDf1Ca75Ff/9mxfqZulA3YQCu
	MW35ZynJs8e1u7yOHEmwjZ1QSYLJCc7EOlRvnUrUkP68qBZm5LgNZIZi
X-Gm-Gg: ASbGnctZE/kc3NYiOJN2uWS38JpqhDHXo0a8+HbcNYI92Z90VxO2ozHyg2BdPldpoVa
	6cDXMOBQxjK3hp+uoYoXUj7nIr2sPTZoT2apkG42xGMzVaS0a+s6CoizePC6U0pUFQvoTUce904
	HPUcVJecU6sHpK/jYCU/a+bZ4l2n7tQtb/pmx8cxKpWNv3w9pICao67xtqOetLHjI6b4I+jG3WI
	1TrIclnvyHHnqzVo2r+PJyu/eeqmV/HA4kTG8oOlmO9XvemS/3tSZEK45HzFrEaHlBrzNr720tI
	WSBAZHzsGv5ZJ3fT5/TzFduHbb3CP1SJUK1LJ6/O++j+4Lrzji0DxiukmvYwK6cFsfUwyGm+EpP
	nwEv3LdVpd1LW9uC6TtdUYDnq4pZAS+7x6eNt4fPh3LBnbGngRLNkxzm7nfoC2paKn+3lB877A7
	fqp5ABO1r51bHvbPozfBe7p0uDqjO259tvULzbh6BoRTFTUH1P/3soO4QF3WLLuvkU
X-Google-Smtp-Source: AGHT+IFfokRTeHkFRkb4VquZKjaYQX864W6neDYh+qBWQJkPQ4LSWquUeEjYhoYgW/4yMa6u5xQoDQ==
X-Received: by 2002:a05:6402:2102:b0:63b:f26d:2eab with SMTP id 4fb4d7f45d1cf-64076f68401mr6958889a12.2.1762200167350;
        Mon, 03 Nov 2025 12:02:47 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805800sm239561a12.11.2025.11.03.12.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:02:46 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: pidff: Fix needs_playback check
Date: Mon,  3 Nov 2025 21:02:43 +0100
Message-ID: <20251103200243.1154544-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Urgent for 6.18 rc period

A small bug made it's way here when rewriting code to Linux quality.
Currently, if an effect is not infinite and a program requests it's
playback with the same number of loops, the play command won't be fired
and if an effect is infinite, the spam will continue.

We want every playback update for non-infinite effects and only some
for infinite (detecting when a program requests stop with 0 which will
be different than previous value which is usually 1 or 255).

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index edd61ef50e16..95377c5f6335 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -806,8 +806,8 @@ static int pidff_request_effect_upload(struct pidff_device *pidff, int efnum)
 
 static int pidff_needs_playback(struct pidff_device *pidff, int effect_id, int n)
 {
-	return pidff->effect[effect_id].is_infinite ||
-	       pidff->effect[effect_id].loop_count != n;
+	return !pidff->effect[effect_id].is_infinite ||
+		pidff->effect[effect_id].loop_count != n;
 }
 
 /*
-- 
2.51.2


