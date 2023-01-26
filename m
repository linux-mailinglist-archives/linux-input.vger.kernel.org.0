Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C2267C177
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 01:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjAZAZX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 19:25:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235501AbjAZAZW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 19:25:22 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA521F909
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 16:25:19 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id kt14so1152819ejc.3
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 16:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVEYvFEMrraWoQ7QT2wXIP7h3ryQSGtMxUMhn5j85to=;
        b=C3EeXIM8zZRnu5xNrA8Gc9HN0F5GlwEdD02/sPoHMzFozJ4magY30282G8iG5H4zIz
         b9x68i45tj+rOwlZUFjohp1XpW6SLbEjZEuTPXhU1JuMzYSgRCGrPYya4yNm20NuH8jP
         aKgcw26/1izrmQj6m5B8CdqbErUk+2l8pTrCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVEYvFEMrraWoQ7QT2wXIP7h3ryQSGtMxUMhn5j85to=;
        b=RuaQTO+Zc6Jq7mNpDiY43f1tVWC+fdr1Bujdp+RFDGnKrLDLPECO/55UxelUPjk5Cd
         khV5RGIODwFYb+0TdyhAEUOsQZ/Uye2RqKLeTz9ox+X9E4k+oHz38sYbCDeOc6gOpW/W
         6+o+smk1uEXxRO4kS6ErYuqBiekOnc2ZCYmZpKe4fj6IJhY7HagKSb+SmdyfelnQiHGT
         VMXkQWKsv+mTkMCJ2xT/nEg6sq04pe05d9Qc/jOhDWy/bJK9sb08yGBgSzf+dq0IskQj
         T1vewfKkwpUfWBcZBgiRNSPmFcJyzdBK8OP6lLYoU0qRL5ZCPa/zU6lTn8+p6Sl37nEH
         j5Kw==
X-Gm-Message-State: AFqh2kr0Ns+cPBSV+J+WliMDGtV+u9Cvue/tYCyz8WFCxNzjustOssoo
        mkjSyO7iJbyiDV/O348xvBUCUw==
X-Google-Smtp-Source: AMrXdXvNB5ebPAPHq8AehhbAuiTcZz8be6ERSXcRmw+xrVEERM1j2n0aZM4LEzaB6iG8VQieBFZAqg==
X-Received: by 2002:a17:906:a058:b0:84d:4e9b:ace5 with SMTP id bg24-20020a170906a05800b0084d4e9bace5mr32825179ejb.67.1674692717739;
        Wed, 25 Jan 2023 16:25:17 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id jy12-20020a170907762c00b008784e808553sm555707ejc.6.2023.01.25.16.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 16:25:17 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Thu, 26 Jan 2023 00:24:55 +0000
Subject: [PATCH 3/5] HID: dualsense_remove: manually unregister leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v1-3-9a5192dcef16@diag.uniroma1.it>
References: <20230125-hid-unregister-leds-v1-0-9a5192dcef16@diag.uniroma1.it>
In-Reply-To: <20230125-hid-unregister-leds-v1-0-9a5192dcef16@diag.uniroma1.it>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>,
        Carlo Caione <carlo@endlessm.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Sven Eckelmann <sven@narfation.org>
Cc:     linux-leds@vger.kernel.org,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Pietro Borrello <borrello@diag.uniroma1.it>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674692715; l=1139;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=SvER2QR/buwN2h3b+3BWIArkM0IQ7m++XDGtEXQz+9g=;
 b=qW9+bWMaNmKhDr6NQKingzmD9HAWuZOqvux3OkWnb+BMnkHySl4U1rk2fuaF+vhNLEyXt1df4IWn
 +5poktuVDNCULHaugZqS3T8NwCRpB0Dm0fX+dmcfj3crVpz6EHU1
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

Unregister the LED controller before device removal, as
dualsense_player_led_set_brightness() may schedule output_worker
after the structure has been freed, causing a use-after-free.

Fixes: 8c0ab553b072 ("HID: playstation: expose DualSense player LEDs through LED class.")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-playstation.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 27c40894acab..9e23860b7e95 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1503,11 +1503,15 @@ static void dualsense_remove(struct ps_device *ps_dev)
 {
 	struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
 	unsigned long flags;
+	int i;
 
 	spin_lock_irqsave(&ds->base.lock, flags);
 	ds->output_worker_initialized = false;
 	spin_unlock_irqrestore(&ds->base.lock, flags);
 
+	for (i = 0; i < ARRAY_SIZE(ds->player_leds); i++)
+		devm_led_classdev_unregister(&ps_dev->hdev->dev, &ds->player_leds[i]);
+
 	cancel_work_sync(&ds->output_worker);
 }
 

-- 
2.25.1
