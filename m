Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99AD144F2C2
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 12:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhKMLaD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 06:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbhKMLaD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 06:30:03 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B119C061766
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 03:27:11 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d5so20254574wrc.1
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 03:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=J98iuWqyLZwmPYpf4eQt1Dfy5UA0uJbS7FUexXmV0jk=;
        b=RrwB2L5rRoG9sm0N6iH4lQKT1XqAM3EQJNEiWZb2MdQg+u6VmPogw0anlj2KQr66G2
         96zeiMlfxHzd2sJzo0PGbllTNsGqNMglPq9FvCs+PUJ4lVcRilXxdORVoj0tHmKtbN6L
         +Jb1N2z0R/HqmS+Iv96QGFBnVT/7F3kSz0/aKziZDHT4i1gwJzIztK6W3bTRgsQGzDLM
         7B2qA/vShctzF6SJnuOvXDm8H5txL9xD3ubF0L6RjqUgO8G3ZqYkUuZ/Cs3ip8kkDWLv
         Ts7iLpO1di7guNYD6XSuUjnJyva2y7y8gxD15kx0XOnWkcj79TCYvSUh4B6iFHDYn77T
         UpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=J98iuWqyLZwmPYpf4eQt1Dfy5UA0uJbS7FUexXmV0jk=;
        b=rfb1ucCO24H0y4jajnfDrUcNquHhRt43E6AHOC4XGMj58Bb3hQIQsTYTsK+gmywkPw
         +T6Fr7m1M73Ump8iSJJWWmQhXNXfWNPGmoNOCpI9oxCJPt8fvp8iXoDGC2YbPod5Jbpe
         31qoouDd60AignwXo8Zahtp+EiuvV6yJvChCadxfvus8PxdB9PqZulB/zGSXJce0N1xa
         pFggTqeQHnLD5itzzjzTh5BVu7CTDJlBDIpSKmgj1zNZujfJ1i5BIIpCJ3B2OKSoseuo
         qdLDTzyCPZXlLoTmYHXzWjJCuW4CjsGvN99t/jyJgqapIOZlK4ZlIzfIAWVc/qmk9Mfe
         TzhQ==
X-Gm-Message-State: AOAM532NHtOemKzwgEy1JOA8yI3laFYshGDWok9fGqaU36lkWmubCMQa
        9crAyneHPo/NV7eH06UCv+mxjEFmpUI=
X-Google-Smtp-Source: ABdhPJzUTzUQwDmcUARjzG89C+1SliRy64ebB0BSRxdoXtSmNXHqY+OE/C+uYNpok7XoY3sJ9P2dvQ==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr27143923wrn.257.1636802829588;
        Sat, 13 Nov 2021 03:27:09 -0800 (PST)
Received: from rechenknecht2k11 (200116b845dc28008d9ba50a9af0b814.dip.versatel-1u1.de. [2001:16b8:45dc:2800:8d9b:a50a:9af0:b814])
        by smtp.googlemail.com with ESMTPSA id z18sm8080328wrq.11.2021.11.13.03.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 03:27:09 -0800 (PST)
Date:   Sat, 13 Nov 2021 12:27:06 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Ruineka <ruinairas1992@gmail.com>, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] Input: xpad - add OneXPlayer Gamepad
Message-ID: <20211113122706.4b5ba2b9@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is needed to get the gamepad on the OneXPlayer handheld console to work.

See https://github.com/paroj/xpad/issues/176

Signed-off-by: Ruineka <ruinairas1992@gmail.com>
Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c914f75a902..e51f3a2bf06b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -334,6 +334,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -450,6 +451,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
+	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
-- 
2.32.0
