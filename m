Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8F0A4FED98
	for <lists+linux-input@lfdr.de>; Wed, 13 Apr 2022 05:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbiDMDgD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 23:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiDMDgC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 23:36:02 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B1BBC3B
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 20:33:39 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id q3so853655plg.3
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 20:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWjcJ6txlWYmGPmWUa/lkqIm8X8YcOdSGrKx1dUT1Lo=;
        b=YgtAnaC55D0KkRpSdrIiP6T3P81urr5g/Wsyj5iqniK8Yo6uNqXmgNDQKU8guUyzhO
         jlSo+XbhOceULSlwk/0SCtnBuGDZkatovifAvcLcQayYQv1lEq7uY+F77RUJezmvxfNq
         FYphnBMKohDI4+o1T5n5ebz12m/dXUiLta+AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWjcJ6txlWYmGPmWUa/lkqIm8X8YcOdSGrKx1dUT1Lo=;
        b=OO88155f+xRMoi1e7JY9+Hh4A4iu2xna5/lSL/G4LQrTsaWaHVBdv8HK7OLSadr7Le
         YSsHXNqSl2c3pY9xuRtpMtHmBVkS59sLlIakbRA0fda79tMd/8GYnL/tiDHvoI2EF5zz
         lt2T5vusaJEt2syKL1l0k1HbTsMX/LOxvoHcncmjKzCOLz3oReHZsdHIL8/vrDVV4Gru
         p7VI8d2BlJ3W+5nDOCe51uajQWhMM9ngH3vlPWAXGvDNRJZvl1FAa0sO4qqflzobuWYX
         pZghYlfz4aDrqsL5t7MWUPE+8beWQeT8AeDNBru7FjYI0AZ/y6CPQ+BhAI4eIVFg7l51
         J+TA==
X-Gm-Message-State: AOAM530zplKEQb0UQ1r1MdsdInLvOYUtnHqqflWmR6vx1p92qO5UQkiz
        rCiGEWQsy8QNR3hqGGqGBkMMtw==
X-Google-Smtp-Source: ABdhPJygH42DZ5/k1O8K6z1nX5nC/7dmhOUdeF3Vfk0lEF1VmUGlNmFOQQytziHcSMNRDQiwjuoVuw==
X-Received: by 2002:a17:90a:aa96:b0:1cb:c57f:9218 with SMTP id l22-20020a17090aaa9600b001cbc57f9218mr7161259pjq.227.1649820819494;
        Tue, 12 Apr 2022 20:33:39 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:87b3:e0ea:c924:6d1f])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a00230a00b004faa0f67c3esm39788276pfh.23.2022.04.12.20.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 20:33:39 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-input@vger.kernel.org, chrome-platform@lists.linux.dev,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [RFC/PATCH 2/2] arm64: dts: qcom: sc7180-trogdor: Remove cros-ec keyboard from detachables
Date:   Tue, 12 Apr 2022 20:33:34 -0700
Message-Id: <20220413033334.1514008-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220413033334.1514008-1-swboyd@chromium.org>
References: <20220413033334.1514008-1-swboyd@chromium.org>
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

Trogdor devices that have a detachable keyboard still have a
non-detachable keyboard input device present because we include the
cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
that every variant board includes. We do this because the
keyboard-controller node also provides some buttons like the power
button and volume buttons. Unfortunately, this means we register a
keyboard input device that doesn't do anything on boards with a
detachable keyboard. Let's delete the rows/columns properties of the
device node to indicate that there isn't a matrix keyboard on these
boards.

Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This is mostly to show an example. The patch will be picked up by qcom
maintainer if the first patch is accepted.

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index c81805ef2250..4173623cc241 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -119,6 +119,11 @@ &i2c9 {
 	status = "disabled";
 };
 
+&keyboard_controller {
+	/delete-property/keypad,num-rows;
+	/delete-property/keypad,num-columns;
+};
+
 &panel {
 	compatible = "boe,nv110wtm-n61";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index bff2b556cc75..7205062e88b4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -121,6 +121,11 @@ &camcc {
 	status = "okay";
 };
 
+&keyboard_controller {
+	/delete-property/keypad,num-rows;
+	/delete-property/keypad,num-columns;
+};
+
 &panel {
 	compatible = "samsung,atna33xc20";
 	enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
-- 
https://chromeos.dev

