Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98648682D60
	for <lists+linux-input@lfdr.de>; Tue, 31 Jan 2023 14:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbjAaNJI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Jan 2023 08:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbjAaNJG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Jan 2023 08:09:06 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF02223C69
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 05:09:03 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so41449369ejc.4
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 05:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtVGZ8lsHwJ47yfcKnn1bRe6oeChLHMzfzZSc6Gf3Bk=;
        b=pA5e7TMvW7cwu+TT7l2Hls+dk56ZZZU4LdW2+MDQ1rJPyNuoyoaIIbboW9W2vfpw1x
         5kNnqcCF5WcbT8fBUpvhAIq51qswfLSi6U1lqV9+SYOI3lJkdxs2B0me5bZCn6L47cx3
         TPTHTQIUwNYyT2tDWfyXmMowMwebJsuaFs+h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtVGZ8lsHwJ47yfcKnn1bRe6oeChLHMzfzZSc6Gf3Bk=;
        b=F8mfqHf+v6HMBpTxBfbcwflsbkVW7aHYFF9tmjKdfA/DbBHBrrclqWXDxBPYEHLUcy
         6BDW+0mjA0+azyGldtMnXG03bO7DmxL1Lg/7SdF2R1wUc7+mL5ULms2gn8y7yHGpQ7xC
         K87klUn2+UTUSOUuivssw2i6vUPy58HrqI+T7ZG2nzxGH/HNyhTEbVxBn/JzwFucQiX3
         IgMaOZCy0SkHzpC4tV2OIrh1YVi8Wk5N1drXllcWE7r1tzYaP0QRErdYBcolHr56fZ+/
         cFgzf90BdpouJ3XX06RtzYvd4Yqp1TFjKI5MZW8iwfiI3JTGHoQRCdHCzei7v7EZ91eo
         s9RA==
X-Gm-Message-State: AO0yUKVI0PkF1+9E7/n/B5CGGTVpsg+AIFalWOQdvHa5ZeS6v/S3zYHf
        Ka93wpxPmXO2ZELysk1M9IjNFg==
X-Google-Smtp-Source: AK7set/Cksul47Eq5LwKVVTkjIXAKGTG73njw/C2kmdOuQ3OLYqxIfQjR7bGvW2NKfHw496llf5C4w==
X-Received: by 2002:a17:907:20b0:b0:87b:d376:b850 with SMTP id pw16-20020a17090720b000b0087bd376b850mr15363396ejb.10.1675170542167;
        Tue, 31 Jan 2023 05:09:02 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id f19-20020a170906391300b0088452ca0666sm4898956eje.196.2023.01.31.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 05:09:01 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Tue, 31 Jan 2023 13:08:46 +0000
Subject: [PATCH v2 2/5] HID: asus_remove: manually unregister led
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v2-2-689cc62fc878@diag.uniroma1.it>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675170540; l=841;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=6oFA70DnzD6hxYzPyFU4oYw2osDEjulwpyTezPO1v4g=;
 b=LzdPeS7nVFRpo8VU64kao203h0vMfO08dDdS4pMuCfp8K26oNi2WN4aYBXEv1EMMlBBQasjjEP2T
 c2hJTcoeAT73y7sOHiri1/kUbKWKBhOqOKL2ZerGBDgo+vBVjtga
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
asus_kbd_backlight_set() may schedule led->work after the structure
has been freed, causing a use-after-free.

Fixes: af22a610bc38 ("HID: asus: support backlight on USB keyboards")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-asus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index f99752b998f3..0f274c8d1bef 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1122,6 +1122,7 @@ static void asus_remove(struct hid_device *hdev)
 
 	if (drvdata->kbd_backlight) {
 		drvdata->kbd_backlight->removed = true;
+		devm_led_classdev_unregister(&hdev->dev, &drvdata->kbd_backlight->cdev);
 		cancel_work_sync(&drvdata->kbd_backlight->work);
 	}
 

-- 
2.25.1
