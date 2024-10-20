Return-Path: <linux-input+bounces-7570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ECA9A5491
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 16:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 704B8B22628
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 14:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077CA192B99;
	Sun, 20 Oct 2024 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIZP7Okk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F6192B90;
	Sun, 20 Oct 2024 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729435673; cv=none; b=e5dCshOfv7d2KB3CGZNOw0Qf5KHOS95QjaK8/2VEF5pNmoI0JqpnCz2FST1nDMqUCwBSW9GT077imeEN/Rrh68xP6xnxUE7ohqBxFPgV+n0ScmhQs95atQhpwr8UQUPTN4jd8GElhj7PDJsw5ezmRkQx9bNYFxL25//8KBcXauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729435673; c=relaxed/simple;
	bh=gAgOhwpZlmmkuEbOHAmwjxHfuctXq5ehk/b/YaDekl8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dR/IYJx3fWfctuIuDO0M5tQSltVD8+qYBFKl4GS3TXu1fwxVezlrh4PQZu78/sP82W+OSmkCvRK0mmOtN7VDfr2PfPMkY/oinj1DjwJ1/i5Jpri1PXB4/PERxIisn23lOKom7C2gqpNTJt2uknf6ffWpHDKEcWdfmZ/oqU4/y6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIZP7Okk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9625cfe4dso4535792a12.0;
        Sun, 20 Oct 2024 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729435670; x=1730040470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKc4HUiSL08fbl+1Cp0m4Wtmx7X/6lUCNDJ1T+im9NM=;
        b=CIZP7OkklGDl7Lhf+QutEBMomIs4nl72LixSyA4ntrIcYJ8oYfcxP6Tq9Vh9TvBY+1
         yUXfAB9uLtwdnvWPPoozKFFBlzr23SLJ+Etsk7CbViHXqQXjFXpPh/XZOfSIxdYDYny2
         TGUkaLAPruv5XJG3UnOYz8XDlasZMCZlRvVpk8qrAXHMNrdB648SeBYEbqD1u4ZA6RMp
         DfFSpR2yBkwqIBN1anSvFuwfmnwdwoJ65oRJWnOK48wwb9ErSJuh5E8AwaIiVp3IVy5K
         BralCekM0yD02Tsk/YpqAvF7RNrK0eR366jd4la1h3a749LNb1mWqfsRXhcDDXLK8tb7
         sXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729435670; x=1730040470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKc4HUiSL08fbl+1Cp0m4Wtmx7X/6lUCNDJ1T+im9NM=;
        b=g4LLnn6WAs7XK9QfTFIpNMe9b+rVzNWk/m39fWakCJaTLhtwu59HjOxbi7j8kAxIar
         HeBgq5RopYtvVdOtiF/NBNR8Mg4vOvHxjwWXsZ5ImavBbgsHxUfczLFGSPjG4N1JEWKB
         hL6yAb23sEmeXe3OsjN4Vy4GgZ6MFXBbvgbkGYG8/a8ILMi7CvbzCexz7bFLe6iRl6CU
         gllynYU+exkU0eL8CvW+xrocdppY/79gUXGwueCTY44q0otvFtxLRQroiJO843OSG27U
         CR+4N8tTSvFx1k5M2YCB0lmbxbA2wonGipL+KIhbEn+13eBRD/NX8YTOfIPUj4C1WAgi
         ULJA==
X-Forwarded-Encrypted: i=1; AJvYcCVfJzQ59HiQC/MAU+akhYXs3TuPPhrmZMYC04p7J2VLBYx8Bt3L/ELKKN/WFRhf8NtmebAeNJr36+tilhBw@vger.kernel.org, AJvYcCW/kJMLj3wvXjApTgSYKbYpbULu/NiePPVmQGMCCHbjwidbKo1jftOunAFkKrreOwn8UiEwo8VUTlzoXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXTkld9trBACC2UcZBwCNx6NOLwiX1EqHalIPDGjerKxMq29P
	UF8BvtDd2NrYLeC2EIOx0GHuCBoTFZNUTikfhGAWN9yKh10CeuEh
X-Google-Smtp-Source: AGHT+IGHD3C7WMAfwu034gemcUPBTbi4GTHeY+VlhD+dixphZLpFTmlYZV+o5j5E5ifFLaLvCDDMXw==
X-Received: by 2002:a05:6402:34d4:b0:5cb:6729:feaf with SMTP id 4fb4d7f45d1cf-5cb672a12cbmr1857651a12.16.1729435669814;
        Sun, 20 Oct 2024 07:47:49 -0700 (PDT)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b525sm945788a12.16.2024.10.20.07.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 07:47:48 -0700 (PDT)
From: Karol Przybylski <karprzy7@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: Karol Przybylski <karprzy7@gmail.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Subject: [PATCH] HID: hid-thrustmaster: add endpoint check in thrustmaster_interrupts
Date: Sun, 20 Oct 2024 16:47:36 +0200
Message-Id: <20241020144736.367420-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot has found a type mismatch between a USB pipe and the transfer
endpoint, which is triggered by the hid-thrustmaster driver[1].
There is a number of similar, already fixed issues [2].
In this case as in others, implementing check for endpoint type fixes the issue.

[1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
[2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622

Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cf1679b0d4fb..f948189394ef 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -170,6 +170,13 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	ep = &usbif->cur_altsetting->endpoint[1];
 	b_ep = ep->desc.bEndpointAddress;
 
+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		hid_err(hdev, "Unexpected non-int endpoint\n");
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
 		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
 
-- 
2.34.1


