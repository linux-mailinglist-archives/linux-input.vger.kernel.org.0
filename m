Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC301693985
	for <lists+linux-input@lfdr.de>; Sun, 12 Feb 2023 20:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjBLTB1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Feb 2023 14:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBLTBY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Feb 2023 14:01:24 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7FA11157
        for <linux-input@vger.kernel.org>; Sun, 12 Feb 2023 11:01:23 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id lu11so27051128ejb.3
        for <linux-input@vger.kernel.org>; Sun, 12 Feb 2023 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh/UKIXKiKTQVDUlV3UWWD570IF4/BDU9PZ9FyIy/sA=;
        b=J6PKRYKBYEmGAVL7rt2WCxbffU3b3leYr48LgyvRq7CkFj6mUzXrORML7jFnb6mwty
         6n7PW6cyXzTBqDxYry33A9GK8Q6+NgcuWdTrHORV8ESmbxzXV64cx4HA/ZwwgzGhPRn6
         VxPXWoMy6CSwvwfSaMaSu5/oXrZaDAI4aL7FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh/UKIXKiKTQVDUlV3UWWD570IF4/BDU9PZ9FyIy/sA=;
        b=zX9aPdUcZJ/akS27XAFlQtADL2avUNF6eg+dTRAtiDiOiFVmEkXLXY5B3Ia/8WTfcK
         ieMapWklFK6VW0yYQozhhgJU+eza40/10Fcy2phA6dS6fATr6XNOsIAPMeCYkIuMQSvk
         91lUNnsd8l9TTyV9qXjJDyCHystB0h8naQvr7gh3xBqWa6we2IBA4tQhOtKMnlRw2sVS
         mOF/aCTicsH2pwxOD28Z1Kc8hUpuorbFg8mBLUfjXnzESHa7gMxgnF7DcnsXDrx+JUjo
         sSt2VvuVZSxbEr9Tn4SAAJH+SlTzLNT1+gFAga20UCLzkWSZXgPL5uwVNWecediTlgdR
         zY8w==
X-Gm-Message-State: AO0yUKU+3yQ7q/PXSXJ0nFt0zNs1Q7Oie8IX/nFZ9G+g3wn/Py1nUWSw
        D48PIy8ybtogEksug3yeBang1g==
X-Google-Smtp-Source: AK7set+O6uJQ6LGcIo1ASlmFFEsONi8bY7xs/6WombXPge6kUrTCiR5SuK7e78P2rg7Htz5c36EU+A==
X-Received: by 2002:a17:906:9f0c:b0:8af:7b80:82ba with SMTP id fy12-20020a1709069f0c00b008af7b8082bamr7161002ejc.20.1676228481708;
        Sun, 12 Feb 2023 11:01:21 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906079a00b008966488a5f1sm5714368ejc.144.2023.02.12.11.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 11:01:21 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Sun, 12 Feb 2023 19:00:03 +0000
Subject: [PATCH v4 5/5] HID: asus: use spinlock to safely schedule workers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v4-5-7860c5763c38@diag.uniroma1.it>
References: <20230125-hid-unregister-leds-v4-0-7860c5763c38@diag.uniroma1.it>
In-Reply-To: <20230125-hid-unregister-leds-v4-0-7860c5763c38@diag.uniroma1.it>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>, Hanno Zulla <abos@hanno.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pietro Borrello <borrello@diag.uniroma1.it>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676228478; l=1688;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=oZoYiaaa/o7giXPl4cCeWsb4GMTS11aKqe6P5yflgp0=;
 b=hw2c1ER525F2ulFom6GZr679UyhjUVgz9rGkWUCc4nT8BRAR7ysnPWu6TpF5JYhc8RhQ/r19Oo6e
 6EOWtZAsAZ6g0Hn7vkZQ8incLmf9T/aHWShWTTRgs3SfybShzfAC
X-Developer-Key: i=borrello@diag.uniroma1.it; a=ed25519;
 pk=4xRQbiJKehl7dFvrG33o2HpveMrwQiUPKtIlObzKmdY=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use spinlocks to deal with workers introducing a wrapper
asus_schedule_work(), and several spinlock checks.
Otherwise, asus_kbd_backlight_set() may schedule led->work after the
structure has been freed, causing a use-after-free.

Fixes: af22a610bc38 ("HID: asus: support backlight on USB keyboards")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-asus.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 9f767baf39fb..d1094bb1aa42 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -491,6 +491,16 @@ static int rog_nkey_led_init(struct hid_device *hdev)
 	return ret;
 }
 
+static void asus_schedule_work(struct asus_kbd_leds *led)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&led->lock, flags);
+	if (!led->removed)
+		schedule_work(&led->work);
+	spin_unlock_irqrestore(&led->lock, flags);
+}
+
 static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 				   enum led_brightness brightness)
 {
@@ -502,7 +512,7 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
 	led->brightness = brightness;
 	spin_unlock_irqrestore(&led->lock, flags);
 
-	schedule_work(&led->work);
+	asus_schedule_work(led);
 }
 
 static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
@@ -526,9 +536,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
 	int ret;
 	unsigned long flags;
 
-	if (led->removed)
-		return;
-
 	spin_lock_irqsave(&led->lock, flags);
 	buf[4] = led->brightness;
 	spin_unlock_irqrestore(&led->lock, flags);

-- 
2.25.1

