Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B9E70E587
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 21:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238397AbjEWTb6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 15:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238373AbjEWTbo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 15:31:44 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7B5E54
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 12:31:19 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53f04fdd77dso266220a12.3
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684870278; x=1687462278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwhjQZCvvhy/Fhe2cqOT5ULwyvfB9FhkM1yVz/dZTsc=;
        b=ZGVLMSlqBZzADdesr0F46WBsI6jocekqCveWms8L17Hg3V4+Iy0jhIMir6AN/GMZEa
         DHCurLabujU9TMOtIhSTwTIfHiEeQmSjTfhRl46KfNaPW8Wf5beMWP6+yimlnoOdk499
         rNp2X4A9iIdKI1mpk6mxx74zmAa+dhz0UT9Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684870278; x=1687462278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwhjQZCvvhy/Fhe2cqOT5ULwyvfB9FhkM1yVz/dZTsc=;
        b=hT1/U8FaBt5P89UEhCbhqnAYs12U1rnfGi/KZRhzmVW6WZW7Ry474wxVjKX8GcOLQk
         MJYJfmplQBjUqlC3YJvEpTsP+p50+dx5pLmAvHqG4HEsbxKqWdlJFxTqYo9ncQzA46yX
         XnVA1GRKgCCMvgZYTg+4qD1KBBPpgoEqOmdb9alaJ2yDcLkMljIeTqi/wLCobOP1fRDi
         +TXwvuEaKZvnCvgrY59ph/z6Zbo7sMCCNdup6L0HLsvlDwef+u0xv8+FNvfGCn/7psSX
         hHSJCSHyT6JmJlXw0+ew2NUbYYQh5fAsvhrdD5nSRy1soHwvx3yYsCQi7Ra4x5SVTDgf
         16uA==
X-Gm-Message-State: AC+VfDz7DpKYUUNJi1SmouYk2M/w8EBzfm35gfVNYBw3gkzdHoWZXz4N
        Ap5qvhsA8/w1CrG8/4k0hwCAOA==
X-Google-Smtp-Source: ACHHUZ5H3AXhDwPU6wHfhEkRIiYBkTVn1VvEuEpa+4Uf48lxfP80EXQc0E9CeDOQop0j/jx/UAsT1w==
X-Received: by 2002:a17:90b:1056:b0:252:94b5:36f1 with SMTP id gq22-20020a17090b105600b0025294b536f1mr12968558pjb.27.1684870278159;
        Tue, 23 May 2023 12:31:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 12:31:17 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 4/9] HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
Date:   Tue, 23 May 2023 12:27:58 -0700
Message-ID: <20230523122802.4.Ib2a2865bd3c0b068432259dfc7d76cebcbb512be@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The SYSTEM_SLEEP_PM_OPS() allows us to get rid of '#ifdef
CONFIG_PM_SLEEP', as talked about in commit 1a3c7bb08826 ("PM: core:
Add new *_PM_OPS macros, deprecate old ones").

This change is expected to have no functional effect.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index efbba0465eef..19d985c20a5c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1085,7 +1085,6 @@ void i2c_hid_core_shutdown(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(i2c_hid_core_shutdown);
 
-#ifdef CONFIG_PM_SLEEP
 static int i2c_hid_core_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1138,10 +1137,9 @@ static int i2c_hid_core_resume(struct device *dev)
 
 	return hid_driver_reset_resume(hid);
 }
-#endif
 
 const struct dev_pm_ops i2c_hid_core_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
+	SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
-- 
2.40.1.698.g37aff9b760-goog

