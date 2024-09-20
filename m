Return-Path: <linux-input+bounces-6625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEC97D786
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 17:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C44BB2102E
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 15:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA821C6BE;
	Fri, 20 Sep 2024 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uI1gr/W+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912951F949
	for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846512; cv=none; b=LobLfdxmTi50ItqEFWnCj5YGy2G6R4UZWBvlgNJ2HGdUzTRFOLXToygu3VUthgHixAQkwBMLJzC2k3ZV2Tvxi5trLVJ2Aw+tze4eJFF22kOkZs/c5nLfncam0HhpgDqPhZ8kb0KLmg/w4OUKEYtMVJ1e8wgenmrIVSe12/G2KQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846512; c=relaxed/simple;
	bh=UMSuK+ToxHqBtcnH1KneAmQVL+KP9A5VvY3fGWhE8qA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CFLpb+kwYfmZALW8jLz4NA/+w1nN4VnFlbF/zHct5verH14/VEK7idWXuObM8cS149Bfr181UXTxyX9+hdk4nOH6GGYroj1isU5nojlbUIsNtFwvkUrVqoP+lKMRalTkgbe91cmji9J0LdvFFvOI2cLzu2sfcuLSaGwUXHawCcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uI1gr/W+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso18380515e9.2
        for <linux-input@vger.kernel.org>; Fri, 20 Sep 2024 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846508; x=1727451308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISq1PQyyDViIR073wpKX7jASZAEEEZbDw0FI/0YIt0k=;
        b=uI1gr/W+hp3BNhPh7J6UXVS8sGMr5S6wp6/TFNaMuJy010COYHeaJkrQYfdPANMb+F
         jZ8VRRx+1N2JTZiKnDrpztk8u7ysXsmEYj7Zh1V85J2g0k1jVp8HMjLluEDjnfP4ZMlm
         p9YwvlDkmZ3NEUyWh4rmvnFGsSnvz2gGLDMA6/LHX56xp2SdLNx5TG5MB7uInPpIwX64
         vQuwZzOQRE5RRnTLnW635f9YWzPVvIwJfsJSVpp1KA+O3ojNLtIKxNYNi0fTjE5+3GQW
         Zn8PSEdLmgURYT6/SMMorEELpYlJmqd3xv8WmqFWeIx+L7xL0O6Il4YJCqJvmgFjzKtV
         8GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846508; x=1727451308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISq1PQyyDViIR073wpKX7jASZAEEEZbDw0FI/0YIt0k=;
        b=bL4T98ftU3zsY5yDRLbxtsucOXGRJIjTP/e3RftZRjPBaabeBdE28AJ26dn0xPwP8v
         m6irTrxb6W7kHQB79tVHpng6UeqauJJtx3j55TeS0f4k0BDchHUONFe8Q6vbTTPlzlrf
         4+oO6Q1mCIwLk/f8M0PuQPWr5hwvBx8NhBfD7dadDbhqaaTgrkuj0AaHRxlFoAbYSebB
         TEc2Co88zQ5HDL6ut+OmH3C4HENh1NJ4LnilRs79Y2QppT7WaGupPHSBGBeUYJEgAK98
         dRC3F3bmvyj2k9EN91GEzSRveeG/nkxUwsl8bJvAasWYuTa3Dl+rRda3F5QIeR+bCKFt
         GFgg==
X-Forwarded-Encrypted: i=1; AJvYcCVA1y3iUO960RxbPI3rfT4HxZPbAz96plhlMbOPob3NrK7C3njiSKw0jubmEuGPfMVAdlB9YT/pdgrizQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDcUMVfWz6Uf/yc0dqzCEqfh3LSGYMds0aUYozfMFwlWP0IQhJ
	l5PH/SkufBi0XPA2NQtvrnxJiTCKH2z/G2J4UFeHC9lINI3tdVki0kDso3YLKvw=
X-Google-Smtp-Source: AGHT+IEX/eLFRCpO5ZOZsN/h7vGxLhFq8btP55Snh5wmEF6X51he9l3lfGiw4thUgRsVJ+56G43w/w==
X-Received: by 2002:a05:600c:35ce:b0:42c:b750:19d8 with SMTP id 5b1f17b1804b1-42e7abe117amr21944335e9.4.1726846507723;
        Fri, 20 Sep 2024 08:35:07 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3790802b2d7sm5945202f8f.0.2024.09.20.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: i2c-hid-of: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:28 +0200
Message-ID: <20240920153430.503212-10-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=UMSuK+ToxHqBtcnH1KneAmQVL+KP9A5VvY3fGWhE8qA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYGRkYMj9Zuj1XjFuyJe9hWEYyxfGze0Sew6 nSPGJKZFi+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WBgAKCRCPgPtYfRL+ Th3YB/4sbj/t5y7dK0hLCGMeqaEpWjXORFPQbq8mpSdy/55n9ZcfttE0i6XjQIE8A96BdzHBxny PXNVsy0oauQkQJTWNITV0gq8Wx5Tx83mDlBXCH5uUw+DrSKnBTgHbm5lvM3xV2rkISoxtqV35Rd s1qBEC9+J3ZL6ojdGQ5neo49Y7RLgSO3uSJTY/6rx8NQGgI5StaCcwVxierLh3R1bYmb3N9WSvW aG6NmscH1VmGcycs02qLcBO4n6qM/MKbwIa4QY2SiYm76WZF7ma0ApA9kUZVi04Zc42Yj8JQ0OU ZsweEg3A6bV3wRXHCuLOiE8krva4kLetwLhsSL6fjs7pLEhC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While touching the initializer, also remove the comma after the sentinel
entry.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 8be4d576da77..57379b77e977 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -144,9 +144,9 @@ MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
 #endif
 
 static const struct i2c_device_id i2c_hid_of_id_table[] = {
-	{ "hid", 0 },
-	{ "hid-over-i2c", 0 },
-	{ },
+	{ "hid" },
+	{ "hid-over-i2c" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_hid_of_id_table);
 

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2


