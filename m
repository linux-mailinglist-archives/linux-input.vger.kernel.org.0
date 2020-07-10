Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA13A21AF49
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 08:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgGJGTk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jul 2020 02:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgGJGTj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jul 2020 02:19:39 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3ABC08C5CE;
        Thu,  9 Jul 2020 23:19:39 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j20so2092064pfe.5;
        Thu, 09 Jul 2020 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z3152dqnSlWeiXq3wOBUus0ULGBKw90/q/Q1d/LB/HE=;
        b=r+zGGnHnYmRgFFIAyQZNMQ8Uw6o+GY6iA7ubBKJNBoVMjKWQIPSXm0F4Ud9Zh1X07c
         IT3cZjVwb88qqtZgZOGamepW4yyBni47O34Lmvdae7Q/MWpFf+M3/CzCmeuhozTT/1gy
         xw7YhB6mnHKePJHGnMHHiHbL0KGFcZLVD0R2FjNjU1gp9YOosnwTIjgyKu+ftHazB3Cc
         qH5WzIeIsuY59QCR9A0/Ug5KDg0fjnex/vJeFypP6/BIZutdFpYLv8NNKyqRXjlf7XTC
         a4BeHkyC//WmbUFrB+Xmj4GO4oL8olLp98N+S7GFG9RWQZrXSXnO0fuYR/slkwqiC+Vp
         hLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z3152dqnSlWeiXq3wOBUus0ULGBKw90/q/Q1d/LB/HE=;
        b=BPX+w6WVruzFinz67E+ToY/rzY7SaeJloIurgrWX2gQjxUcY8RImbONXi2SXpMwosq
         APYM53RqU9i5tOe07qO4pHEmTyA0iuzPcb3OUhQnX3cKdm44Kd82470eEr5d49SpDQg6
         H2KF6UDRQbbHEJmVdjAzTwMD6+IbASNYLRk3jsKC/HoD8uP7pAGBYyGYAGz5oq9+edB9
         tYFfC7Nu22fI8OZ+oqy2wcO0aF6vRYurvT3EBOKVAfhUJx1hBaw22NaBCk0VxFnsvI/s
         074GMPEWkLRlTDIj2sSH7DxHM5o2chXeGzUCVCewwnVTewsCdFr6nG663NBi05e2hSMM
         tJiw==
X-Gm-Message-State: AOAM533DuYrPs/EAcrPlQS+ntoSjNSXnjYdEKTDK24WV6/PMjiub3wqE
        SthmzFVEogmGJtrIwr3RPUs=
X-Google-Smtp-Source: ABdhPJwk1O0qjcabIuGkCbS6P0zOopiQEbwplyknGnMwjadxi2LOYOAkQZimFuhs7J6PJBkLi06Utw==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr56044215pgs.399.1594361979107;
        Thu, 09 Jul 2020 23:19:39 -0700 (PDT)
Received: from intel-CCE-SH.Home (x-plane.vip. [104.238.153.221])
        by smtp.googlemail.com with ESMTPSA id m9sm4431132pjs.18.2020.07.09.23.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:19:38 -0700 (PDT)
From:   Wei Shuai <cpuwolf@gmail.com>
Cc:     cpuwolf@gmail.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Erwan Velu <e.velu@criteo.com>,
        Mark Gross <mgross@linux.intel.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...)
Subject: [PATCH] break joystick limitation of maxmium 80 buttons
Date:   Fri, 10 Jul 2020 14:19:17 +0800
Message-Id: <20200710061919.13108-1-cpuwolf@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 80 limitation comes from

include/uapi/linux/input-event-codes.h

according to function hidinput_configure_usage() in file drivers/hid/hid-input.c

the joystick button mapping is not a continues space, generally speak the mapping space is from

1. BTN_JOYSTICK~BTN_DEAD
2. BTN_TRIGGER_HAPPY~KEY_MAX

Finally I got the max limitation is 80.

Signed-off-by: Wei Shuai <cpuwolf@gmail.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 8d764aab29de..35eb59ae1f19 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -311,7 +311,7 @@ struct pcmcia_device_id {
 /* Input */
 #define INPUT_DEVICE_ID_EV_MAX		0x1f
 #define INPUT_DEVICE_ID_KEY_MIN_INTERESTING	0x71
-#define INPUT_DEVICE_ID_KEY_MAX		0x2ff
+#define INPUT_DEVICE_ID_KEY_MAX		0x4ff
 #define INPUT_DEVICE_ID_REL_MAX		0x0f
 #define INPUT_DEVICE_ID_ABS_MAX		0x3f
 #define INPUT_DEVICE_ID_MSC_MAX		0x07
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index b6a835d37826..ad1b9bed3828 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -774,7 +774,7 @@
 
 /* We avoid low common keys in module aliases so they don't get huge. */
 #define KEY_MIN_INTERESTING	KEY_MUTE
-#define KEY_MAX			0x2ff
+#define KEY_MAX			0x4ff
 #define KEY_CNT			(KEY_MAX+1)
 
 /*
-- 
2.17.1

