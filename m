Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDB368CCCF
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 03:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjBGCt1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 21:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjBGCtW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 21:49:22 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA55836467
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 18:48:54 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id u9so9988329plf.3
        for <linux-input@vger.kernel.org>; Mon, 06 Feb 2023 18:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAnZqwf1tmgF/Ssjms0XjO2WrbdQH0082JXWCubZ7GA=;
        b=gwnCBpHCBDwOtQoT/Xv+4JH01cTWKaRzALTEjRtfr/lkLw+nV9Aokjd5EWM9AiBqh/
         bZPfhy8IBVPjNhXUESF6U1wHXte5oBSZSEINYQsMNiQ9dXYhNOSITiYhh4R0QfVMbH8z
         htR46L+KtpRlEwzuJAaidtqQxrmPHBtQxTy5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAnZqwf1tmgF/Ssjms0XjO2WrbdQH0082JXWCubZ7GA=;
        b=rksvgrq79A6wGqQf5+tOuF/fVYedNzM3RFnM1eN6FxDvOTel6GNmk60F2+2CRN2p31
         ZCws6Uy8WhdvWSfwSCfpwlEi+lcvo1+GCrXUjWLlnHhqXNbI4bxI23bNHN/OAr+0kKuX
         wrEbG3Rbvy6PpGJDKxSC5z+UlmVgDshzWrTAvAU6KBSRo3Z3Cj9VapPktyzr1tSFFBke
         rQCe9XTSFaCdWOkIeoqYh8RGk6jIfTVS3z6QU5ZT6RzSuthOmvkSSbWTVzsJ6oxXXvhY
         fuoW/slO58mcgL4Aa1yO/7FG2j+l8SAn+mx9f9rdbNK0UVGOjMEc2lE3z93mm0wxyXXU
         wg9w==
X-Gm-Message-State: AO0yUKXrocg6/roCBW2Zni7AV37SD4Uek3Mcb/e1dwdCJZmCoM5Bx8ll
        tdMblhUQ94UMqWP+Ztt15xgfAQ==
X-Google-Smtp-Source: AK7set83tUsQLSdz9QWf7CPd7HfWX3LT99NQj3Oy4gTb0a7vnTFojfY2y+AJUxutEn3uONkS8qeNwA==
X-Received: by 2002:a05:6a20:a5a8:b0:bc:e82a:5c73 with SMTP id bc40-20020a056a20a5a800b000bce82a5c73mr1580561pzb.9.1675738134171;
        Mon, 06 Feb 2023 18:48:54 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:53 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: HID: i2c-hid: goodix: Add mainboard-vddio-supply
Date:   Mon,  6 Feb 2023 18:48:14 -0800
Message-Id: <20230206184744.5.Ia77a96c6c5564f9cc25e6220b5a9171d5c2639e8@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230207024816.525938-1-dianders@chromium.org>
References: <20230207024816.525938-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The goodix i2c-hid bindings currently support two models of
touchscreen: GT7375P and GT7986U. The datasheets of both touchscreens
show the following things:
* The mainboard that the touchscreen is connected to is only expected
  to supply one voltage to the touchscreen: 3.3V.
* The touchscreen, depending on stuffing options, can accept IO to the
  touchscreen as either 3.3V or 1.8V. Presumably this means that the
  touchscreen has its own way internally to make or deal with 1.8V
  signals when it's configured for 1.8V IO.

NOTE: you've got to look very carefully at the datasheet for the
touchscreen to see that the above bullets are true. Specifically, the
datasheet shows a signal called VDDIO and one might think that this is
where a mainboard would provide VDDIO to the touchscreen. Upon closer
inspection, however, a footnote can be found that says "When VDDIO is
left floating, the logic level is 1.8V [...]; when VDDIO is connected
to AVDD, the logic level is AVDD.". Thus the VDDIO pin on the
touchscreen IC is actually a selector and not a pin whre the mainboard
would pass a reference voltage.

The fact that the touchscreen isn't supplied 1.8V by the mainboard
means that when I originally submitted bindings for these touchscreens
I only listed the 3.3V rail in the bindings. It can be noted that the
original bindings and driver were added for sc7180-trogdor boards and
these boards all use 3.3V IO via a level shifter on the mainboard.

It turns out that with sc7280-herobrine-evoker, we've got a bit of a
strange monkey on our hands. Due to some very interesting but
(unfortunately) set-in-stone hardware design, we are doing 1.8V IO to
the touchscreen but we _also_ have some extra buffers on the mainboard
that need to be powered up to make the IO lines work. After much
pondering about this, it seems like the best way to handle this is to
add an optional "mainboard-vddio" rail to the bindings that is used to
power up the buffers. Specifically, the fact that the touchscreen
datasheet documents that its IOs can be at a different voltage level
than its main power rail means that there truly are two voltage rails
associated with the touchscreen, even if we don't actually provide the
IO rail to it. Thus it doesn't feel absurd for the DT node on the host
to have a 1.8V rail to power up anything related to its 1.8V logic.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/input/goodix,gt7375p.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index 1c191bc5a178..ce18d7dadae2 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -36,6 +36,13 @@ properties:
   vdd-supply:
     description: The 3.3V supply to the touchscreen.
 
+  mainboard-vddio-supply:
+    description:
+      The supply on the main board needed to power up IO signals going
+      to the touchscreen. This supply need not go to the touchscreen
+      itself as long as it allows the main board to make signals compatible
+      with what the touchscreen is expecting for its IO rails.
+
 required:
   - compatible
   - reg
-- 
2.39.1.519.gcb327c4b5f-goog

