Return-Path: <linux-input+bounces-16134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D497DC61713
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 15:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59E3B4E16FF
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 14:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FDE2F0C6D;
	Sun, 16 Nov 2025 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke26n97K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F32E2F1F
	for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763304838; cv=none; b=ClcYAmuT9Iw7bxo4YbtCrLv6ht/jk4dMPbkEkXoZYWm0e/O25P43ATD+BvjILXI8SVUrd9jTyrYZjjh4m5Rp35eASzBkcOBPuAT+/VgdL4YbSWPHJfjuorCvsUbGuFSLnaGlKSDE/16ZSE8yFY1SHdViwbFaQf6r7tg7oIF/bNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763304838; c=relaxed/simple;
	bh=6/2nRe2lmV/uGkSjhwqoe9AWnw6MaOEMgmY1XqdohXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SA8ixucTBBL8ES4eC/IF+6r/Mhfc7s1Ppcc5MlAeeUuG4bCn6A1iPchY/7hsA8ZnEmfNmqQOLG2OgXYzla0DWfDwiZYrurLDrXd2iWQ7exFBAcEqmNv7KtgGQ7cEotmQMj/qAg++HIQ6ViyDXsFe5GC/OuXhQ7+YXblf6iARPSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ke26n97K; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640e970598cso646049a12.3
        for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763304835; x=1763909635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dthYGiyUHBx0Ys3b2Lkd88Hqf5+r4/yEiE0a9OcfggU=;
        b=ke26n97KRvbmMvN5xb+GKUTvYpLIhkErnIvdJFkUB0/v0qecp2tqGv9NBrECzbGWpg
         c2wamz61gygJ1XItjR+RLW5faHiPxjmTFeN00wVkD49TA7asizXgCX/xGwPul4RD7spv
         cNcMgx+myMKxVVmkiakl4/s5BUxXgLBZXjY9aZ2MakuQkK/jvvigDr49HiNHLUzrUCQc
         gHIIgxZsgfaSV5OvRLrIEToYOr1ZjVw2Eu8X4PPPCc5mefF8zwI3+A2U5DzTRbZg9Ag+
         SgetzINcRihgmalPFF2X1feRWT4ctcqhJbBBxPTcgEqpanBQNToXjE1WNgfZTIn4qIpO
         0XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763304835; x=1763909635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dthYGiyUHBx0Ys3b2Lkd88Hqf5+r4/yEiE0a9OcfggU=;
        b=tkreusJIbckgU1MXR8HsJ8/jsTK5/O3y2A0Bd/+wxfXbL21Tdg780GcKtLLL7jcK9h
         zi5TQHLU9r+JuC+PasskK4xxG6aLC8yi6v3p3Kb9gdy8xuzXQXFdp+/LYwyU6cH9ZXYA
         r/zjpBBz5HAWQ7etH/0SfGBoXUPCxcOQk9hWdXqEk62A6FIbTT4mn6TfqAk03k9oaLP4
         bKsGw957Fbx9L0ccucU93cPKgyrWI+c5aTqy6lSsF9nKLKUQIOccNDUJTWPqAO5g1v+h
         XTb40st3RBKIGVOnB5WOqbeTj1gasKdGr90n+xb2iCgvCX1cb5/gGec1ZtDisTn632ic
         PIYA==
X-Forwarded-Encrypted: i=1; AJvYcCUEaLvK0P6TIwWF8ORsjb0947F//jpXkcfksQjB9xjak7Wgf52fPQKk8rmTdmNq5i82N5RB/lKRpMVGqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9q46Bo+N7c7nsnyYxNy3ikToJeYNsgaQG1a0dlYC4mE6obOQc
	76SH0OcIMgHTsI2hmmAxd9BSNMOmVJw+iU11qcmJdqC7t+FpWJJ+Xxxm
X-Gm-Gg: ASbGncvl4m5Lf+0w0OX9dr3RIQb5sK4rZksRXjJx3jlItPlr5py/cs5NHN47a9kUoSS
	XnvU6B0QphjiCiKuffLEYQLKURYc9ab4VXU0gRcDjbu1prAEq/lzYXLBYtvhfNyy972jut5Xveq
	zmO7mkscs0EHE/rhK/OAlekkuOANQJzzu3dxrqtTM+cYV2kKW038KPVzOR1cWiGMWkkNZSDrAPe
	iKV7nMNPK8ovSN4PDzBLIGOWp4TZwNWsw2jX9KgVl1U64hs191ZJqQ+GcQoUqnH51oZEtDYyoZs
	PDx0cRW9t1W/uN6a+seeCX4uUHTL5UHULQBDHLBGghiDXbNy5g52/DnTYxKrik4eUfxPbse0dNH
	7sFOPQz4ZZ1phbu3yvaNzK1adtI/8w2WjFkQ8KHISZ6WTJ9G6y4WFzdTVuaIcAAleAc3hmeb0e2
	rV9lMUbxz97GeMYSppsQ51H9roIK+i6/OrLZQCknW1ZChMdll8izNr4T0ZYqLEOCbphGdPg2e0G
	cg=
X-Google-Smtp-Source: AGHT+IF9rvzYdW9ESxAkA2+Y5dL52x6gffAOulWnUXB4Fy66gfU8/kFJ2HlcNwKilRxkyFbbLPLE0g==
X-Received: by 2002:a17:906:9fc1:b0:b72:5d4a:45d4 with SMTP id a640c23a62f3a-b7367ef9137mr531604266b.3.1763304834878;
        Sun, 16 Nov 2025 06:53:54 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd8084csm839312166b.34.2025.11.16.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 06:53:54 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH RESEND] HID: pidff: Fix needs_playback check
Date: Sun, 16 Nov 2025 15:53:51 +0100
Message-ID: <20251116145351.27584-1-tomasz.pakula.oficjalny@gmail.com>
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


