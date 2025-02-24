Return-Path: <linux-input+bounces-10282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419AA41926
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 10:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C271883DE3
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 09:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213DA243369;
	Mon, 24 Feb 2025 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP3+kOa3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EEC158D96
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740389419; cv=none; b=S9eG83lTfnxFeT6992/oEOh8C7Rqx92QAd3UYIZHTrKnxfuCWPYeMQiZ2pH6hslxcq2IWqCy7vojvNRj+g8mK8l7pil255mfqAOG2ssIy+PrSyLbOf/ww/tklAk/FAYX6kz906Rv8e8x1zkSxO6vSlQKAeOKQPOQoI9TkVT0nVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740389419; c=relaxed/simple;
	bh=YQExJ7jUd/Cw+KmuNvncQzBndAiLM9ouibxbO6Z7Hb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFkrzDAO4I+ioF4KxtOOugc/NuwUQhrg3ciDksnoIuSN3HBwYt+UHonDI0Q3scBlkMydF/hTUpP3jafL+6zWHfgSNIfhUg5iGNvliTakVKkRu2Ic4xWdCzuf30tXk/IFX3q0I+gk6JOZ2UzU87ZnmCcAeeOkEyw3g7X9eJViQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP3+kOa3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb88d2b67eso46775166b.0
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 01:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740389415; x=1740994215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLX8/NM8OxV+h6FP7c/FoaB9RiQlmNSOqyds5cH+az8=;
        b=WP3+kOa3qKe8+UYYjUoFCs9Z84Eads58NGDKV9RV4vAk3toT+ZmwDXkWKTLF6sJ+4x
         8wtiwCBea60W8RnvD+uLtsYYG+cjbQ+NjTqPNMgm7hynP66Ytdc3O+KXSDbT7v5VuDcR
         fM4Hdg430vlALMvaweNLhJXkptWSAwZU3f+9CET/J2SjXKT85phxZHCkdPGhwgj/nDgH
         tnc9FYsl3ws8REsVLuJx3PcFhFXh4BTi1khQ27gvRGC2e3z3lHgijkOyX6mDmO9vhu7U
         UEhq2cUGRIsNzuh7BM7s4yTbJXVNiRUROhiKsKrxs/o7JedTlxkXV4/DnBEzfEZdxPst
         c7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740389415; x=1740994215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLX8/NM8OxV+h6FP7c/FoaB9RiQlmNSOqyds5cH+az8=;
        b=nY7TTFLk9ZQoxyGCAUpN9wcjKkDkT1z1vRG+jsPpPBpT1v9qLgcy59Xv6aXwjz4nxJ
         ZzLSRr8XPu3R8hI0a7N/zaO1y8hmFvf6RnRqgBJFu5sKdjVGWU6jzIpp/LTXy+zjWSn+
         t5zPtEbyt0mP1tZ4UJC3eHzEGrlASbGGTmLLgaw26LufPh/xIcyBeFiQGJ9NzUWAK6X4
         ebx/9s/HtATfATUJQkl0MYmDbG5v7DCawTGd2JyIvxf9Hs3nhkShRZsCuDJAoQLpValW
         ccJJVO50vd/iEOBgt7RgZ6iGVUnFu6+5rQZYgRi/2oByA20hJOy9Caz6GFXmYEzrozTG
         majA==
X-Forwarded-Encrypted: i=1; AJvYcCVSR2JSJtB/T3BkT1xl6D+IR/iKaeCd8WxOD2pBv0M5iwtL/ow5NlsPVEb9QYjQY0M9Cs9qpmA0Gg1i7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nRRxps5Im44SaXXXTUPhYAg8vft92MB2UiLON2CfzTYsx9hC
	gBIEsol5nGIuHSQ0DsBQCwmLfNUV24INQRLh2cMKiQ4JOplSpdL8
X-Gm-Gg: ASbGncsgoV4p1HA92N9r4WA6xlS9lAx2YbwNXDXFKKu64J7S3UnA80Zj192s/VwM4qz
	8PTk74MipIc8H34I6+jFqZR1xtEn69AkTge4jI2XT1k0abTbmuRPZ4xRe5eaR+QYUpuJq8SEaYx
	kmFso7PVUM+iYG5iRuys2vuVkcYWYJ6rJFKsFFFyAMWYy9rhdyEuZ70AVzT/rmGfPchGn4cm05n
	4ZhIxUc+RfvfR9brUCHyqmVaihzwQFRM4xrcaEqr+La4/WZ4T8zGjL1w3Cg8pIfKaUIj93DW2se
	vZqd1ZZMxreXSCyzeI7R2aczshvlyD5GaEdd2JdCgltz2gJQ5BzTzrQ3kHxnd/yAlWU6KwRp
X-Google-Smtp-Source: AGHT+IFKSl+K6Z7qlMaI6GrBCAiX2Y+x+CxhBcBRGWjUmiwW5Ec/V+BJGDkkC7pIWqISid2WD5xn7Q==
X-Received: by 2002:a17:907:608f:b0:ab7:5fcd:d4d5 with SMTP id a640c23a62f3a-abc09bd169dmr465665466b.8.1740389415455;
        Mon, 24 Feb 2025 01:30:15 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4b9ee98sm1416668666b.167.2025.02.24.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:30:15 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	anssi.hannula@gmail.com,
	linux-input@vger.kernel.org
Subject: [PATCH 3/3] HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff
Date: Mon, 24 Feb 2025 10:30:09 +0100
Message-ID: <20250224093009.1831811-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250224093009.1831811-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per USB PID standard:
INFINITE - Referrers to the maximum value of a range. i.e. if in an 8
bit unsigned field the value of 255 would indicate INFINITE.

Detecting 0xffff (U16_MAX) is still important as we MIGHT get this value
as infinite from some native software as 0 was never actually defined
in Linux' FF api as the infinite value. I'm working on it though.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 74b033a4ac1b..a614438e43bd 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -283,8 +283,9 @@ static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 	if (duration == FF_INFINITE)
 		duration = PID_INFINITE;
 
+	/* PID defines INFINITE as the max possible value for duration field */
 	if (duration == PID_INFINITE) {
-		usage->value[0] = PID_INFINITE;
+		usage->value[0] = (1U << usage->field->report_size) - 1;
 		return;
 	}
 
-- 
2.48.1


