Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7E8765A08
	for <lists+linux-input@lfdr.de>; Thu, 27 Jul 2023 19:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbjG0RTe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jul 2023 13:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbjG0RTS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jul 2023 13:19:18 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E563AA9
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 10:18:50 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686f19b6dd2so727107b3a.2
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690478329; x=1691083129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JE0/UXh96ihgYVclX63uFx20OU8KLkSmKPmtU0UMZZk=;
        b=jFm7Y3pVztqxRpdquGXn2GCDPzKNRJczGTzTOaX187e/SfwDrJBxSzzonbM4Bjz+P9
         uEOhwdf/+JdRdT+MJHMzWK1WoaFhvxbd3DqXDhNFE9w32cSkuiw7MFJ6oFNQT3Vcy2p+
         zzRxkIHv7qezN3fHVjV8gV3aAnNQYniV7Lb+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690478329; x=1691083129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JE0/UXh96ihgYVclX63uFx20OU8KLkSmKPmtU0UMZZk=;
        b=Um6SeHRZeVxlwJhFiJhHaY8NVBs8BJmR67/TO052wTpgOoSIsIzN3jf4kTorco4V6p
         Y3L/5Zr1k5KC51nOSHWaUHRQmmDC0UdEfkbA0gE2tuipHsdCz3eLKCapJ3ruFPu4htMm
         XEVEwiUmer+e8n9CbuXZSG4Rh64d5lxpBu9+ZkEK7Y+uj2G1DexcRvwK1F3CnNM7HU3B
         4Us5O572s/OMP7SblPqnvYrtc6LNCvYsAmd+MbDM0A4CQsinQXXOnA5cOF2+i44TmRtP
         U/e68u2jDrOEfq5u0KWFgdZxcimI5WgkZvJTofE01t26FfhIhaoJm8tSY0BU3x1ZQmD1
         wJ2A==
X-Gm-Message-State: ABy/qLYRWoY2ym0INTtwC6yt+P9JlYaFHpDKC2T2G4rzcgyNszHnAMcc
        CqW+ocKNXZDgm23DaCWaL3RPmw==
X-Google-Smtp-Source: APBJJlG5PO4jOR+JrrecJ0XN7BS9lBiF+A7oJWjyuw0srUfej6DlO1pGmADkWGz3mc8LeneWVnX6nQ==
X-Received: by 2002:a05:6a00:15cb:b0:686:be77:4311 with SMTP id o11-20020a056a0015cb00b00686be774311mr5711310pfu.4.1690478329127;
        Thu, 27 Jul 2023 10:18:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2339:954b:b98f:611a])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:18:48 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 08/11] HID: i2c-hid: Suspend i2c-hid devices in remove
Date:   Thu, 27 Jul 2023 10:16:35 -0700
Message-ID: <20230727101636.v4.8.Ic3ecad4a825905f4e4ce2a772b17f3c9cb2d60a2@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the i2c-hid remove() function we currently try to power off,
depopulate our child device, and free our resources. That's OK, but...

* If the i2c-hid device is on a power rail that can't turn off (either
  an always-on or a shared power rail) we won't try to put the device
  in a low power state during remove(). This probably doesn't matter
  for very many devices but it could be nice in some instances.

* If the i2c-hid device somehow manages to generate an interrupt after
  we tried to power off it is conceivable that the interrupt could
  arrive during or after the call to hid_destroy_device() but before
  the call to free_irq(). That could cause a crash since our IRQ
  handler isn't expecting it. One could imagine this happening in
  the case where we couldn't turn off (see the previous bullet) or,
  possibly, if the interrupt line could glitch shortly after the
  device powered off.

Let's call the suspend code during remove to avoid these issues. That
will put the device into a low power state and also disable
interrupts.

Technically, one could consider this a "fix" of commit 4a200c3b9a40
("HID: i2c-hid: introduce HID over i2c specification implementation").
However, since the above bullet points are more theoretical than
problems seen on real systems and since the remove() of an i2c-hid
touchscreen isn't terribly likely to be called in production, it's
probably not worth the bother of trying to backport it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Suspend i2c-hid devices in remove") new for v4.

 drivers/hid/i2c-hid/i2c-hid-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index fa8a1ca43d7f..46658ed6380f 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -941,7 +941,7 @@ static void i2c_hid_core_shutdown_tail(struct i2c_hid *ihid)
 	ihid->ops->shutdown_tail(ihid->ops);
 }
 
-static int i2c_hid_core_suspend(struct i2c_hid *ihid)
+static int i2c_hid_core_suspend(struct i2c_hid *ihid, bool force_poweroff)
 {
 	struct i2c_client *client = ihid->client;
 	struct hid_device *hid = ihid->hid;
@@ -956,7 +956,7 @@ static int i2c_hid_core_suspend(struct i2c_hid *ihid)
 
 	disable_irq(client->irq);
 
-	if (!device_may_wakeup(&client->dev))
+	if (force_poweroff || !device_may_wakeup(&client->dev))
 		i2c_hid_core_power_down(ihid);
 
 	return 0;
@@ -1143,7 +1143,7 @@ void i2c_hid_core_remove(struct i2c_client *client)
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 	struct hid_device *hid;
 
-	i2c_hid_core_power_down(ihid);
+	i2c_hid_core_suspend(ihid, true);
 
 	hid = ihid->hid;
 	hid_destroy_device(hid);
@@ -1171,7 +1171,7 @@ static int i2c_hid_core_pm_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_hid *ihid = i2c_get_clientdata(client);
 
-	return i2c_hid_core_suspend(ihid);
+	return i2c_hid_core_suspend(ihid, false);
 }
 
 static int i2c_hid_core_pm_resume(struct device *dev)
-- 
2.41.0.487.g6d72f3e995-goog

