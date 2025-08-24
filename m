Return-Path: <linux-input+bounces-14278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA47B32EB5
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 11:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A53DF189CFFD
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 09:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB96261B91;
	Sun, 24 Aug 2025 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpJMbsHY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA812367C3;
	Sun, 24 Aug 2025 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756027195; cv=none; b=gQyKwlEFgnxE214o67oqjQWMniq0sCzN4A5W96RePGcSJkdg0/fdObZk5QOjhlm23p3EOv07RYcOommRJrCybz7Nqzmp9QLqGnIreJ2m96gzVU7zQ4VPdLjrgRD6DlOJoWDeuYx8IxJapLYvJozfBc2yXjhj5g8z9EHFhfSkM6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756027195; c=relaxed/simple;
	bh=CLOxWccIYnvvu3kJQ2b/QNmsXCM1KjyWuzm/WqI7bsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdWB5cN8pYwE8XY0V/Q7ffmhejVa+YkENfT0mLg5jrI9qw5mBEmNn/JWtwGFIyrhtQ5Wuck+SFLnen7t+ZDMYVzC1s/SXOVKo7YErP8Bn9j7TAbIb1v+PAY7bwc8xkClffyPPhdtVmasdrDU6ihIlsvz8+BTWAZH0BQWMIzSCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpJMbsHY; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61c325a4d83so1633843a12.0;
        Sun, 24 Aug 2025 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756027192; x=1756631992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IoiYlwnNrCIW8lexuGkUDfV5aY2e9GYzOXh9ukM7g0=;
        b=VpJMbsHY4FZvfq8n3guD8hlwWDyA5gnenKJquWr+wxxrCz4vvgfVBAgWk7ZPiM8/dU
         Vbm3dpE0TRY68zQOvzIIFPOcHgUJHLBTqe390gf+HeNoN/1lMGGmqZ5j6GyTAWWI9+ge
         qqLhzZnhaCy1Zlre/IHv5qJiNCsbGm38P8PYFl3GeVb5upU2DcksPzamZNYCeYVPUOqd
         DXmjVv6ugOv1YrgeEc9DfzTaLo4UcxeW1xSRaMmfOub+ZnwiB49cVpsMyy86h3kMxVr3
         HL5q5s/qw82UgQSzJWg631u60NvYoGbfq7e18dqYCJxoJwtOyhnHYorvvFN2bW94ESXs
         IIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756027192; x=1756631992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IoiYlwnNrCIW8lexuGkUDfV5aY2e9GYzOXh9ukM7g0=;
        b=wNEDSXXgXgedPsHQu7UUkxEkgVhA4EJ7eWoYQmxMxr7E7+KqwAIwOQ7yToZsHdbsaN
         382xSUMNuXPDqLpETiYyK0xkuvV4ccuX//w0TykjHzLxahNSk/yM4WrKd0dTDVuv8GnI
         B+E9v0Ur0ab4iZCiTIjo1bo/XfH5kAyD17i9O4A2eBDVmj/NimX1/A/+IaPeW1yFLsNb
         Gwmulreq7Tc8bsZo4cCZGf3ftqZzbyVUue8akKOiqlZY+/LzZ+lQE7sf2GtOgkX+wubE
         QDKBXT5CEOZ1KrGLP0C8IS1XAI4iCMDQGaeXyMmIx254VhXkam6ljxQrLQrlNLKvdB3S
         cpRw==
X-Forwarded-Encrypted: i=1; AJvYcCXW7UYTOuF5VmVtrP/iKi8fy6JJ2n63UMXMfGlrOKs8+T8tvo+QYdBKK4u3PXffcLTn23TSsuF46Jdo+zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxmrXEhTreXR7+Xl3R4G033mCAFEvBwHJ9KZ4cwHNzuhlsh+EG
	GpQ5T6kM7d/96oR9GHiPLDzjA+I70mjR6443ZDqj1JGFCKl927jqk7/E
X-Gm-Gg: ASbGncs55U/12s/sO1YpQ0DNzEEiGmlanXG6sIZTuP96Gc1UGHa9ELESLBiAyC5VP10
	DBCRYW+26kry+Dwrdyxo04La7DbrA8tzOBY3OAL67Eqd3i3HENLavufV+WPuLwujS2MnJNO5ETe
	WFRNoip1bMt9maRMPMoS0U8r8VDBDiMq+agf+RCDnQVPSzTWNWo8f3c7C9CpJ9A7wF/3Khaxe+B
	FZXIEc+k0vGrQJT5lGeZG2+o0jUewt4DWZj7hORqoTK/jkAN9PMKGrdzvsGF5fql5tPsf9mYgGZ
	k71MWi2GPGnUlleW/jV3/MB05qxvb4EUYYylHoBIojWj/MQiTxcYBLZYRO/I6auMs9j9dYZPYid
	KGM9IzhEkHwZqAA==
X-Google-Smtp-Source: AGHT+IGfPfXz22eKmXiiINdnri7eFy8msADCastxL7L+rQSFZREB4Dx2iCO7aaVZtG2wVJRrRI4MYg==
X-Received: by 2002:a05:6402:26cb:b0:61a:89aa:8d16 with SMTP id 4fb4d7f45d1cf-61c1b4f8650mr8356820a12.23.1756027191924;
        Sun, 24 Aug 2025 02:19:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c30cf22d5sm2970156a12.0.2025.08.24.02.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:19:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2 RESEND] input: touchcreen: tsc2007: change warning to debug message if pen GPIO is not defined
Date: Sun, 24 Aug 2025 12:19:26 +0300
Message-ID: <20250824091927.105121-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824091927.105121-1-clamor95@gmail.com>
References: <20250824091927.105121-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since pen GPIO request is optional, there is no reason to throw dev_warn if
such GPIO is not defined.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 8d832a372b89..17c82baf87df 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -254,7 +254,7 @@ static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
 	if (ts->gpiod)
 		ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
 	else
-		dev_warn(dev, "Pen down GPIO is not specified in properties\n");
+		dev_dbg(dev, "Pen down GPIO is not specified in properties\n");
 
 	return 0;
 }
-- 
2.43.0


