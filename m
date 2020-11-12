Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975142B037E
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgKLLGl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgKLLCK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:10 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79288C0617A6
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:10 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 10so4884154wml.2
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iidsrVG04+5OGr655Fc8AmVNociMTMEvIzPILgRtw34=;
        b=E+asLefU30g7IYG4PNqJ8WU7ULw0KGKd3Nvvtu5XudTRmWOs6n4eTJWI2sC8OUzJp/
         r7IaUlq23l7mKA5kbznzkvEYjNaiPAZ80v1JEmtiRXDHAQqErWeWqenoe3i2cwzG75XZ
         QsODJG8B7hlzonxu6fSrDoPbNuZvcgO+xAYXzlNdaLiBsQKK+od82u3WYx7AqKLzDumg
         b+Ptb+TJL0kBvKqaSU3ieFtlaDx706S2pKe1+VQrsLEBsC16svAj+BHtd4gtTXzfPAm6
         lhrE0pCir21AHHe5x9kpw0PcLgGNTNH2CCXr9iSd5l5c6mCbEUqHqA9hVLQGQgzEfmuB
         fWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iidsrVG04+5OGr655Fc8AmVNociMTMEvIzPILgRtw34=;
        b=hma5mRGeaGLOYwsdiGdbI4CK8g9A6xD303XDCcKyoE79189eWNUiUaUp9VRJQYnDRy
         q9xBbl5Fgnh4SpBQnbmciM8qtKBnQgjnZ4VtZXPhzIfixAGF4G2FpbK3v6vTyqQs1Ul8
         bZCLzCdy4mB0HrgAsqxiOLd8ZTCmQCoJLs7ipTr8Bji3wqs9goraSfS68a5Aq73SYeoo
         1RYQKrVlWdenv7TghREFAOWpA5rK7M25UHo+/LTlJNcyuqd1fho2JinbEMdAGWrSCvQd
         fWlXqSZH49PI43KbkpmfMvujiPuLIDqmFSqecCE5+cyo+71WwqhJlFRTCoUHCTYMRRHA
         U60Q==
X-Gm-Message-State: AOAM5300SuY8MPY4+oLD0I7Ed+t36BPslEyBd+1mSrrUgLQkMj38dqvJ
        81Heq7OOJ9qyqO6L3FzOyz2RHA==
X-Google-Smtp-Source: ABdhPJyFdXj837v2Sh4ImKatYRrWp+MMXle8DcPiD4par8LADB9Lp4CuXqbHSw8Jw3EHCeetVMvO0w==
X-Received: by 2002:a1c:1f05:: with SMTP id f5mr8763569wmf.98.1605178929098;
        Thu, 12 Nov 2020 03:02:09 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
        Cameron Gutman <aicommander@gmail.com>,
        Marko Friedemann <mfr@bmx-chemnitz.de>,
        Oliver Schwartz <Oliver.Schwartz@gmx.de>,
        Steven Toth <steve@toth.demon.co.uk>,
        Franz Lehner <franz@caos.at>,
        Ivan Hawkes <blackhawk@ivanhawkes.com>,
        Dominic Cerquetti <binary1230@yahoo.com>,
        Adam Buchbinder <adam.buchbinder@gmail.com>,
        Jan Kratochvil <honza@jikos.cz>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 01/15] input: joystick: xpad: Demote non-conformant kernel-doc header
Date:   Thu, 12 Nov 2020 11:01:50 +0000
Message-Id: <20201112110204.2083435-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/joystick/xpad.c:1361: warning: Function parameter or member 'xpad' not described in 'xpad_send_led_command'
 drivers/input/joystick/xpad.c:1361: warning: Function parameter or member 'command' not described in 'xpad_send_led_command'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Łukasz Patron" <priv.luk@gmail.com>
Cc: Cameron Gutman <aicommander@gmail.com>
Cc: Marko Friedemann <mfr@bmx-chemnitz.de>
Cc: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: Steven Toth <steve@toth.demon.co.uk>
Cc: Franz Lehner <franz@caos.at>
Cc: Ivan Hawkes <blackhawk@ivanhawkes.com>
Cc: Dominic Cerquetti <binary1230@yahoo.com>
Cc: Adam Buchbinder <adam.buchbinder@gmail.com>
Cc: Jan Kratochvil <honza@jikos.cz>
Cc: Christoph Fritz <chf.fritz@googlemail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c77cdb3b62b5b..2cd4296c2d082 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1337,7 +1337,7 @@ struct xpad_led {
 	struct usb_xpad *xpad;
 };
 
-/**
+/*
  * set the LEDs on Xbox360 / Wireless Controllers
  * @param command
  *  0: off
-- 
2.25.1

