Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDAD21AFBF
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 08:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgGJGve (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jul 2020 02:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgGJGvd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jul 2020 02:51:33 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B511BC08C5CE;
        Thu,  9 Jul 2020 23:51:33 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so2117887pgf.0;
        Thu, 09 Jul 2020 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aRcbte67HllyMh/6ETwbp4yTc4PE6dJTpZ82C/YKUPY=;
        b=GATO1WWYVJXlZLIbU/IfrVtJ8g2rTA/j/KNE2PnLuFrcPoo4qSGk6a6R84CQTJz6X5
         lhxjqeLd4ii//W3aDE5KKE3aHdlxe8MI5snbT8yFKil0bsQBu1+roed7E8VISlKTCzpU
         s7sH4LL2XmlVOp0RZ52wzMTyC95KLTgLbh3D6H01E1+UvwgPJ3y669XS3Oc7kzhcGvJs
         QkJJsENMDhiw5AXslt6rEFMoALS0f5glxfnXXpl6GQv+k6RTP3GuissFXEfYtnMbguDb
         dhXYwoECBJiayg0dZRjkpYOB0EUfu3wDuA09endprrsZF884FRGnKrGwy3RmDJJx6r9Z
         VapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aRcbte67HllyMh/6ETwbp4yTc4PE6dJTpZ82C/YKUPY=;
        b=DlfV8mo9/S+5bdHIU0vOPA45sCq5t7RSkWUfV19a0YItLRfjqdPhBfH2nWLhX9lW3Z
         iQK1C+pq5NuQNPrnxsq3uhIuZ/8VTFa2gEUYf4pOJniQEH/DKpkL0/d/bL2XAo1CrbOW
         7js6yYSQqNQd3Wc66NQg8jC3zi96FKVG0586mSZz/imGC0zUIvGJ1a3m4AYtcUPD4F+b
         T+dQChV67OSnTImdPjyV5kiOq3eWp1LinflWKB06anzubsB0yZDcezJjMqz3/KmthtFw
         kRPk3D8ikAcP3oKMYyoNPNpWu8LJ5xV69DVNyuMCFnqlX6jDAYRE/ZzJ/AcM67lEO2IM
         CerQ==
X-Gm-Message-State: AOAM532TwEfJ+mscDwNdSB1DMqCpzwJUqk1yvzREQd1TTpK1hCx6sIVc
        ZdFUI7N8M2HLz56HcsN1+AU=
X-Google-Smtp-Source: ABdhPJzrwJm9DDCFDBnHxszZ8U5EoHgrwcdfMEkjEfYHwCs0UFauOr6/vhv6f82txMbpH1fic+XsAQ==
X-Received: by 2002:a63:9d45:: with SMTP id i66mr58396630pgd.25.1594363893201;
        Thu, 09 Jul 2020 23:51:33 -0700 (PDT)
Received: from intel-CCE-SH.Home (x-plane.vip. [104.238.153.221])
        by smtp.googlemail.com with ESMTPSA id 137sm4688648pgg.72.2020.07.09.23.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:51:32 -0700 (PDT)
From:   Wei Shuai <cpuwolf@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     cpuwolf@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Borislav Petkov <bp@suse.de>, Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Erwan Velu <e.velu@criteo.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org (open list),
        linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK
        , TOUCHSCREEN)...)
Subject: [PATCH] break joystick limitation of maximum 80 buttons
Date:   Fri, 10 Jul 2020 14:51:10 +0800
Message-Id: <20200710065112.18286-1-cpuwolf@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cpuwolf@gmail.com>
References: <cpuwolf@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 80 limitation comes from

include/uapi/linux/input-event-codes.h

according to function hidinput_configure_usage() in file drivers/hid/hid-input.c

the joystick button mapping is not a continues space
generally speaking, the mapping space is from

1. BTN_JOYSTICK~BTN_DEAD
2. BTN_TRIGGER_HAPPY~KEY_MAX

and

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

