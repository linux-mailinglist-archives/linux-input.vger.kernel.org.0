Return-Path: <linux-input+bounces-8913-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B13A01B9B
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B000A1883778
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CA81C4A01;
	Sun,  5 Jan 2025 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE1MtTj1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5FF1BBBC5
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105892; cv=none; b=sRfFpCtJAxYcBNJQp5NsC3/ucqFn6HgBfKNWtduJkotzIP1pwFl91oqptD1EimWU8+3L5U9BK2rFq3RnDSFhYREvTnT8Xe8wBWC+gXT7CKU46wBnJW1zsPnplKpy3Gf5+d8dyl2c19NfCk+L5x8YEbJZaWvnrROBpxcwO1zQUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105892; c=relaxed/simple;
	bh=noqjFJonj9JNvYq6KmZARNUpzr3L4X1h2cGmqFmU35k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ny4qAyDNaL2voMfZLFS+w4afwFta9mkYva4etg9ycAvBy5WYN+GsBFaTSy3x9zoULt9g4CcOY9H21P0IG94Vg2olrCGyqlwrVFriV6RtITdZJWQgfsNyWcZpk6s7+GqlJfYQnuXi/wUEtInO8wy9EVbzx8q+lv+t83C0oxOdQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE1MtTj1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso136817865e9.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105889; x=1736710689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aOF6L7OB0q68VeWpnzMwhic7pt6/Bcx2nRzlfzlUIc=;
        b=lE1MtTj11nsWQneLPumEEIkaGtfoj1H+geKT/5t7uJxClc67DrKwf2gibpzUEhPzSg
         tiBTpC7hfUx1elbto7/rANzvKo/msGUG9XmseSZuThvMo/gDVSN2WaiPwqjCtRF8PgjB
         m+K5+YC03aTSnsgVCNddhoD/2A2Dt7S/b0huL6+B31lmuuQTFEfmOQ7OxwS+aW3CSdlJ
         v5TjYUtay4f3ZPCloY7LanmsOcFLqTRSxs7F7dI3rF2cN2nwrcukv3oSlCuQPo3ItnnP
         sWPWtxWvaAcWGn6B+xoUVXQXS0e3nbNeHoG5My9kHGYMA0wijB2w05iLsNgJ0Mhrr2EA
         tyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105889; x=1736710689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aOF6L7OB0q68VeWpnzMwhic7pt6/Bcx2nRzlfzlUIc=;
        b=ZWeS2lucPeniG7U+4qhEqkRypPmj5/hLVhzIGIh5J/zfQAcN9nIt4f5Zcf8Mx1MLCW
         kcdjW5lHYopAxFmJx7zZexUDEHaTR0M5MYlxgWbiAP6N3ttZWz/KN/ka9ddIX5paXwN9
         Lg6+VZiU5C+lYOSIucyqNyPCzX7u3aPdfyOg1MhuiBFNZpgWp96JT0BKmDBeCCeKN9i7
         +PQl0BCK0Bf8+ApNwWU4Z751RDxlSt5yvLC1Pd3YL6CjL59hTOZn449voY2MD6A3dQ3n
         JOUTuZSUQrnKsSCntYUunNWyivod/jbnH2t1bZvbCrzrtSaQWUv1f+A7Yb43+7+O7GgR
         NrOA==
X-Gm-Message-State: AOJu0YyB/ARm8hu2NEJJ6jFa8FjIBMTTaGtUD1LPIHhB8Gp+wOuCllui
	CigvUoMG5qH76aDmw38yBpHDJqnG7rxqvuguKxoGRNVPMKLIOyCXhMt1zASCAJu1Ow==
X-Gm-Gg: ASbGncsQOYvJWTss1/mlMqMVnVYpJi8LA2DYigbNZ4r7qBsukI9tWrnCISB/JcSwz7G
	ng7oHFSEGd8YRYY/yTK4H7Kaki875OTifrRGoYQVJqUNRLbPZuuserjC+c6689VPxOYF48VA/Rf
	2BhoZ9Wz4tH/5vrVQ2avJf0ZyQZLTvRdubLVeYiVpNPP5OXyfZMy4kJBre+dMq53nOjTnfA5XTH
	5pXiSryWjd5nqA+VhxBDt+5nFmeoCS5kJYcnQpdO64v+zLK+V2zb122ZFhVdbhZHF8C
X-Google-Smtp-Source: AGHT+IGMb10S/s64ERFsxM1r5Q2SdZ2JXpn6hXYgS4nXAmOI8cOaXiynZbo/Do69e8JwqQ8rAGntWQ==
X-Received: by 2002:a5d:5f83:0:b0:385:ec6e:e87a with SMTP id ffacd0b85a97d-38a223ffaf7mr41905000f8f.43.1736105888724;
        Sun, 05 Jan 2025 11:38:08 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:08 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Andrei Ilyashenko <andrei.ilyashenko@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 08/13] Input: xpad - add support for Xbox ONE liquid metal controller
Date: Sun,  5 Jan 2025 20:37:45 +0100
Message-ID: <20250105193750.91460-9-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Ilyashenko <andrei.ilyashenko@gmail.com>

I found that my controller wasn't working with this driver.  The LED would light up and it could rumble but was not registering any button presses or joystick movements.  I suspected the problem might be that it was not being sent some required init packet so I tried sending the packets being used in xboxone_init_packets and found that sending xboxone_pdp_auth got the controller working.  At least for my controller xboxone_pdp_led_on was not strictly necessary but I decided to follow the same pattern used by the other two controllers.

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 450a45152d63..b2716b49d3b6 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -694,7 +694,9 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
 	XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
+	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_led_on),
 	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
+	XBOXONE_INIT_PKT(0x20d6, 0xa01a, xboxone_pdp_auth),
 	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
-- 
2.43.0


