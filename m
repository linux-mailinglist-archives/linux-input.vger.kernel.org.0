Return-Path: <linux-input+bounces-8415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE09E606A
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 23:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7441885680
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 22:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA5B1C3C1F;
	Thu,  5 Dec 2024 22:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldj4riYC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986A1BBBF1;
	Thu,  5 Dec 2024 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733437363; cv=none; b=nY7Hwn3RXRhqD22EkbP8IZtWTN1IMkqRXo2sVs/gESc0gSgYiJu6J4Kt4yf6Atg5Uok8VWmAtEbzxmU6BxfkcZhefBPpxwFVwYnSrXZkiurQ+ZMqgXoK1cvM+ZtT4FeL4kE4Rbqh1hp3nqJmS+3HlONlllYn6SGw29uK/SBFxEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733437363; c=relaxed/simple;
	bh=nAK65Za/KWKxEgWqGsbbQekGzsAf+jmT6jYsvSM8Xko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MlSQskQTiVL2tGsI56RPwvVerxBqzzgMJg3YyWMNR7Ukw+jwIpth3vKPzT8G/Tx2U2RKobhQZjWfEe0tWzskV5/2v/00R4JIfFOJ7bqqEoCGn6DVojGukNzIuniNTs1+wYMjpn/YTvaiZJ2l6bqzFiz2qrW3l42eP21JV34dyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldj4riYC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa54adcb894so248528766b.0;
        Thu, 05 Dec 2024 14:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733437360; x=1734042160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=;
        b=ldj4riYCXGtEi6kEzajqkB5WyRpTp2RrJ+TKASM++R1a+09suXWJGKV0SiQibwDwuk
         flo5Vhw8niFZ7UW8K10diBZt8mCNY0VfUhliU9lYDJQrit2uhdC7pZ1SUrpavojVmUe5
         oo2j7oODl7i7ep+scMWDZzcK2S+nQVO87nHrhiBhOIjbbRHNhL9JHTSt2aNVl3yYl/W1
         uLv9iYqbpxKkSvyHAqic0+vzdatIsHsriq6FNKZc4nb/Tlf7Ho5GeqUZQnkx6zT5HlEU
         S19ihVvt5Yok+CtdqSxSw6yzGgyCTEGeq3Ozr3BwXgaj8Lli7g9TI21En4SwswNKZUu+
         3jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437360; x=1734042160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3lyXrqzIu+Kk45XA+AociMWK/OJuQLe7K4aBvShe1s=;
        b=dTIVTaUpQTgBAQrXb0M0o8K8ZLRkZRmIQ7kIrHZQwOsSym31gLAMRWfuAz8XNVf3TG
         7kkYnJJ6OV7jr9mlE9Ts+PQ2euraBEMoSjdfNe3K+1R73IalDK9DqasuNkT2y5eWrZag
         8Eag97XQ4Os7VAAyVszuSTfgl9Xeceo198sNzHK3abk6CeBfxHyYs5QOclGH/zk3QFDg
         igUHwPfvZMW1hk0IbTu2IQG91FC5/7NOIv0RvLJ7tkolSzqfpH9b8tQfF0X8xWRELpK9
         0q6dcy5g9tvb0nlaxZEMDY+ZUGKDzcrb59qWNzpEGunJFYkhrz83w/uA66evNNjIgR9z
         sm0w==
X-Forwarded-Encrypted: i=1; AJvYcCVTQNu3Z6R8IG3uHYq7R2TUNSrEvZdV1AAlf5G8W4zkKBs7wYtN8G0vz5yOSGyfYASylPJvTqefFwQAKrmq@vger.kernel.org, AJvYcCWw9rtJKxpljZ717C0Iemeln5wUvvnOM59zLDkoQPCbsrcP7ng7oa3KspdC7Yjk6Ywk83C/iDm6w0lxBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznQBPQl/EzSZyDRl4rRXMYdO1VIKst8muNhREjeP4HgKaMng65
	frQ9C3V96AJgagyIbe7C47i6c3hCaRfcEsRUDT9kiuskv0cpLKCD
X-Gm-Gg: ASbGncu3bn/7AviPBJyGjbYlOY8XkrfAOzAmVISd/yvvojDkhy+vvixmTqpATL1NLBg
	fcimxukqHCWqBoKv/ujr+2tnxCjfB4W0OxLvWywEAKHPrVAFRTPTeVYmRYF9a/XHH7AzSZjbOgT
	nZ1G41wwKfBrRs40TPfsqUquM/dB7UIQnZLjgCn+35QEOagxBuSikHlr0sEnjyoGi9q4kdzaZ7m
	E2N7sUdNzVTxWnXziHEIcF47NTdOW3UpKeaSWj1pfAYBeOo/zjRmxqWXwh+
X-Google-Smtp-Source: AGHT+IGcrLT4gONP5gatqkYWWG2Utr7wcaZ76fP3t5w0AD0MTmF9LBS0SpqfRAOkQ11uPNvWm5iasQ==
X-Received: by 2002:a17:907:7703:b0:aa5:449e:1a1d with SMTP id a640c23a62f3a-aa639fa434cmr49156166b.2.1733437359965;
        Thu, 05 Dec 2024 14:22:39 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e33f7sm148805566b.183.2024.12.05.14.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:39 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: skhan@linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Subject: [PATCHv2] HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check
Date: Thu,  5 Dec 2024 23:22:21 +0100
Message-Id: <20241205222221.3094702-1-karprzy7@gmail.com>
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
 drivers/hid/hid-thrustmaster.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cf1679b0d..6c3e758bb 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -170,6 +170,14 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	ep = &usbif->cur_altsetting->endpoint[1];
 	b_ep = ep->desc.bEndpointAddress;
 
+	/* Are the expected endpoints present? */
+	u8 ep_addr[1] = {b_ep};
+
+	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		hid_err(hdev, "Unexpected non-int endpoint\n");
+		return;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
 		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
 
-- 
2.34.1


