Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A273D4A1E
	for <lists+linux-input@lfdr.de>; Sat, 24 Jul 2021 23:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhGXUzv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 16:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhGXUzu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 16:55:50 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0694C061575;
        Sat, 24 Jul 2021 14:36:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r16so6336889edt.7;
        Sat, 24 Jul 2021 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tPf1PIZz12QDELKKGSLQrfITc/1OkYNKrPmPjikeM0U=;
        b=JzgPFzRsg6759sgBZxYMy3jbIGht0S4m0+xImW+VqEaID5gMFAS3qWNwrvORvAT47b
         c6o/3rfIImmYHeE3y3JEceQfoiQU3esGgHImIswM67N7w6Aiw4JPkrLQ+LiT8qxudhaT
         R3ZLqEQvfqdPW/QCxRPXUpf5oS4IPSw/EHPlMSzl9LN+9awTjUUfPAL7dKaXzaEmBRIt
         iZmp4f3W6P2kq9Cr+xdpiGMEYJG3LZAJ5fsI+rUPLIYw6wqQg35a4e9ojvvL/xaWjrQp
         Rmnt/H+hKGYexBVXpeB0brxZWimHtW0Aw5UExC6uIMlLTZMvFmUl399se+YlAB9gSwWW
         E6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tPf1PIZz12QDELKKGSLQrfITc/1OkYNKrPmPjikeM0U=;
        b=YKicQbOiBWbySuNZbl0qFGh1EVhCco24LW7l2YX4kTtJbt0VrnIQMuFpHPljw9HOgv
         Y/Hy6YPFOjQbUdPLUL84v+Snw5QByFpZlq/Hv2HOCZUkc3L6QwmkW14q61v3pDqVc6nl
         TdaIiDIDVT6lyldip2axSRdm2XEKdl6kVbVOP/VOQB84ktBFpoSpGAWhsWm1HNxAR2lo
         S6J2vnSxE1ggAKUK7w+5fAakWDi+YkCeqLRFfKXszuu4VI71q8liwo1C17JICS2ENuE9
         WSjG62tZJ08FyYrLGnSJz0su4Gs9wKwsgut6bO1gYKaNxvaPYb0B/+B0Cm50yQ9v3jAS
         h/1A==
X-Gm-Message-State: AOAM53299gOBRr7PQSz9GOYfFLx6iDAFwie2JV7y+gtGKNRDfPYkHBF7
        VaKgJFZIUtaVkP+gOSvQQM4=
X-Google-Smtp-Source: ABdhPJw/d9jb+6rh7zjFkNWDy7e6ranUmG7el4bjBF2NyMRER2mkc1klYcX8HcSXFic2jvSBgWWkJQ==
X-Received: by 2002:a05:6402:22e1:: with SMTP id dn1mr13164174edb.8.1627162580240;
        Sat, 24 Jul 2021 14:36:20 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id ch27sm17045324edb.57.2021.07.24.14.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:36:19 -0700 (PDT)
Date:   Sat, 24 Jul 2021 22:36:17 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: joystick: pxrc: use usb_get_intf()
Message-ID: <20210724213617.GA586795@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use usb_get_intf() in order to increment reference count of the usb
interface structure.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/input/joystick/pxrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
index ea2bf5951d67..59304352548b 100644
--- a/drivers/input/joystick/pxrc.c
+++ b/drivers/input/joystick/pxrc.c
@@ -143,7 +143,7 @@ static int pxrc_probe(struct usb_interface *intf,
 		return -ENOMEM;
 
 	mutex_init(&pxrc->pm_mutex);
-	pxrc->intf = intf;
+	pxrc->intf = usb_get_intf(intf);
 
 	usb_set_intfdata(pxrc->intf, pxrc);
 
-- 
2.25.1

