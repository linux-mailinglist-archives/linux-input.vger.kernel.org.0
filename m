Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D02C682D62
	for <lists+linux-input@lfdr.de>; Tue, 31 Jan 2023 14:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbjAaNJK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Jan 2023 08:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbjAaNJH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Jan 2023 08:09:07 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD3DE061
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 05:09:04 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qw12so25514926ejc.2
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 05:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVbivV8EGu+km89gAq7ikjZD9Nt9wLtDAtt21fJbyIE=;
        b=pJVMbn/vZRNaPQe0/Pfzxri/P1+RByqeFUJ9/umN+VsPxL3e3/bBzc6h668t114S/u
         sW0RQ1vPA/6lSs5n+Rn3J70dvTRtFZbVX8QiMjDTuDt7ZIOIuevWut63gXisf4/2autT
         pzVkokK1srC+UOM9kbemm2181pRPbr+c1pDBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVbivV8EGu+km89gAq7ikjZD9Nt9wLtDAtt21fJbyIE=;
        b=aqSZhmpfD02Z9Gka4e0QMwIEzL+fCCyVegDhJgtPf2APWGLV8jq0rl+yYPi0PLiwB9
         A/tpjsXiMMfAeB9gHTeYBEVgVgXxmNOYw4Jt/+95Fgt0TPV0AT3KIpMjyZGDduYqF7KS
         5wjHQ9qIkYwxNX+745KR1M77IaiPJ1JN8vDzmBlzVq3f5U6TJC1XlKzMrZN0eUdyenSI
         sJdUYHESAp6wjYg3vleyU8uYvW5jhh6y6KFJTEDSLvtiKHR2HX704lehYomFEJLMk7jp
         XT9I5Hyu129iM4/CYvvhmWx6BfhCdBo1TMyqMi4Tv84mCkCb8PPK2CSS8Z+Y8RE6yxRm
         nBIg==
X-Gm-Message-State: AO0yUKVrfO2UdVqrSGiykGFRBa8r7mn6aKRQcKruFAXoDtrBvarlhBOo
        o6YOOSM5xGPLBOMsa8j/eCV48g==
X-Google-Smtp-Source: AK7set8/dsb0DwLaEBtLxuVxd2bPqNpGLBTx6byaW3iLpH0RJzEEdVF24gASNLKt0q4ByhBIplGh5g==
X-Received: by 2002:a17:906:208b:b0:885:d02f:d4ad with SMTP id 11-20020a170906208b00b00885d02fd4admr12778878ejq.43.1675170542716;
        Tue, 31 Jan 2023 05:09:02 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906391300b0088452ca0666sm4898956eje.196.2023.01.31.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 05:09:02 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Tue, 31 Jan 2023 13:08:47 +0000
Subject: [PATCH v2 3/5] HID: dualsense_remove: manually unregister leds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v2-3-689cc62fc878@diag.uniroma1.it>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675170540; l=1556;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=I/aK9DcIPRri1R7+BoQmPFot08oQLGwMbJpqlNV1B8M=;
 b=5sp2HxZcrnV1R0s9GQ65lRPDmAjbbTrzRLu2QOtJ2rZ+CPXfd6lM34SYzoZQTTz5wcKpPq3+C4Rz
 xTnnHicND5nqprX0be6N1UIrfJQbhy+wplZo58FC2enoRBiPpDC4
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
unnecessary runs of dualsense_player_led_set_brightness().

Fixes: 8c0ab553b072 ("HID: playstation: expose DualSense player LEDs through LED class.")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>

---

Contrary to the other patches in this series, failing to unregister
the led controller does not results into a use-after-free thanks
to the output_worker_initialized variable and the spinlock checks.

Changes in v2:
- Unregister multicolor led controller
- Clarify UAF
- Link to v1: https://lore.kernel.org/all/20230125-hid-unregister-leds-v1-3-9a5192dcef16@diag.uniroma1.it/
---
 drivers/hid/hid-playstation.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 27c40894acab..f23186ca2d76 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1503,11 +1503,17 @@ static void dualsense_remove(struct ps_device *ps_dev)
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
+	devm_led_classdev_multicolor_unregister(&ps_dev->hdev->dev, &ds->lightbar);
+
 	cancel_work_sync(&ds->output_worker);
 }
 

-- 
2.25.1
