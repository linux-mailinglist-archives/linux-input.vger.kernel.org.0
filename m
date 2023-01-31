Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23870682D66
	for <lists+linux-input@lfdr.de>; Tue, 31 Jan 2023 14:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjAaNJ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Jan 2023 08:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbjAaNJK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Jan 2023 08:09:10 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD01A4F34A
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 05:09:04 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m8so5115172edd.10
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 05:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q79upilYUaTabLjtO3bZo14lYpmZpgLc63/mP4eG9WA=;
        b=Jiv6RUxvmV3Ufd8uoYWmd1situOGY4NhVV6W3e8iX/gSnI5hNoydnRNmL6pvCh8dSp
         8eGfWvxqWz8zd3of7EcGBXL41UT07GSlYrxg5SjhiHyP+oXMvTPrRuVAlouhz4+y9We6
         18ytUHl0u33LcDQGVwMctqXQbHTO04YiVQkmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q79upilYUaTabLjtO3bZo14lYpmZpgLc63/mP4eG9WA=;
        b=3a6IpZLSbGHtJlyh8nRF9iEOEUD81uoDgh/Q1jsF5tjjJ4l/zB1udQAhxxMO1HWzEK
         1RRxmxmqvX1/PsCgHs86nxL7XAWRxEluPVP1lD7eH330ARFnNUO8CHNaoOD0jznKs9kb
         5fv/7mJTfrmDzrPNT9cocV4l4G6SUYjVFDtoh8gZjJR+cPx1/4KaAf8Ty33jzgoYGL3n
         HFmC7a2wq3xaeNSSp0O4M5jyxuCVYx98Rehh6Lr7bn96A15yRhsjrYCdptxf2mIdAeEB
         AJ7kA0qJzYYXwO/0m6pPy37QmY48CPT3DHwQp+DUIWTBSep2yj8x5KFbZwHSQOz8VCVR
         aMbA==
X-Gm-Message-State: AFqh2kr6nlDubcUxDriAF5Fyru1LQkjREtV1XHKP5ExgKbQ07ne5DOkY
        8ij1L5sp+d5EHrsKD0uU+JcTpg==
X-Google-Smtp-Source: AMrXdXtiGqkeWKlRDAoIO4sROri5jyb0nQOOYcVpEPXewNUDAsDU6bDYl4l7r4L+LJVAOmVrweQMoA==
X-Received: by 2002:aa7:c052:0:b0:475:dddc:374a with SMTP id k18-20020aa7c052000000b00475dddc374amr56004206edo.18.1675170543237;
        Tue, 31 Jan 2023 05:09:03 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906391300b0088452ca0666sm4898956eje.196.2023.01.31.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 05:09:02 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Tue, 31 Jan 2023 13:08:48 +0000
Subject: [PATCH v2 4/5] HID: dualshock4_remove: manually unregister leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v2-4-689cc62fc878@diag.uniroma1.it>
References: <20230125-hid-unregister-leds-v2-0-689cc62fc878@diag.uniroma1.it>
In-Reply-To: <20230125-hid-unregister-leds-v2-0-689cc62fc878@diag.uniroma1.it>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>, Pavel Machek <pavel@ucw.cz>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675170540; l=1491;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=VPrVVBqqogjSwkjTCQxGFur+jXJWf031MbQaC/naVuk=;
 b=a5Fi08feBch0WK2QkEw6jb2k0YeWIxIy0TOvIlH4YFQDjzx5YCPMMBiXJ+X1wwE3U5mdz9JHAVyg
 S53Yt4moDbGRX18ytJbn1h1YkW4eu7pgIyCWWt7/3d1Y4VCSvbfP
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

Unregister the LED controllers before device removal, to prevent
unnecessary runs of dualshock4_led_set_brightness().

Fixes: 4521109a8f40 ("HID: playstation: support DualShock4 lightbar.")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>

---

Contrary to the other patches in this series, failing to unregister
the led controller does not results into a use-after-free thanks
to the output_worker_initialized variable and the spinlock checks.

Changes in v2:
- Clarify UAF
- Link to v1: https://lore.kernel.org/all/20230125-hid-unregister-leds-v1-4-9a5192dcef16@diag.uniroma1.it/
---
 drivers/hid/hid-playstation.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f23186ca2d76..b41657842e26 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2434,11 +2434,15 @@ static void dualshock4_remove(struct ps_device *ps_dev)
 {
 	struct dualshock4 *ds4 = container_of(ps_dev, struct dualshock4, base);
 	unsigned long flags;
+	int i;
 
 	spin_lock_irqsave(&ds4->base.lock, flags);
 	ds4->output_worker_initialized = false;
 	spin_unlock_irqrestore(&ds4->base.lock, flags);
 
+	for (i = 0; i < ARRAY_SIZE(ds4->lightbar_leds); i++)
+		devm_led_classdev_unregister(&ps_dev->hdev->dev, &ds4->lightbar_leds[i]);
+
 	cancel_work_sync(&ds4->output_worker);
 
 	if (ps_dev->hdev->product == USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE)

-- 
2.25.1
