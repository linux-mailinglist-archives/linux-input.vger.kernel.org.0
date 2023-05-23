Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9750570E573
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 21:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238269AbjEWTbc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 15:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbjEWTbb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 15:31:31 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C75FE4D
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 12:31:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae51b07338so436625ad.0
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684870270; x=1687462270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwDjBDjP1Eb9OTHMLCOR/AtNeUUStJkdoOVhV208Dc4=;
        b=JnHGvwp0MHHOERL70p/cjO3RLqzhUHXpXt/IGTpt6niWqd33tv18uY+o73i24RL1qw
         M53aApytyNVs94yi+SrqUH9g238/bAvF11jqzC2QJuyLgWzNiZ9/Otkm9Yr1lR2Q3Jlf
         FXGmHGyY42nSz871E9Rwe7eG95HISA1p4UxbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684870270; x=1687462270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwDjBDjP1Eb9OTHMLCOR/AtNeUUStJkdoOVhV208Dc4=;
        b=PlFDIphRD4/6HwV3rcUOzlcA3r80w5gYMTHCzbf5H1bt8FkcNmfZm8+ImqKNrjlTyX
         1yxk81bMr1itjuODJk4DKJjqI2TneMdgBZ9R+BrdvHeam300EJsdtmBZpvfIC2wX5f52
         Of8ctYaNI7DoywLxZiFjqTEbmhtq27XD65bxGWUfs0zu2qpqhEtuZ2EqaE038G0GeK/6
         zLwpBZ/vYbysRIM7kifn4wan3Di6nZAdOCa3klBTsHYA6NcZbyagO8CJAxVz7L1TZ/DF
         CLcKQIXDTwTVtR86raQjbc1Mu/8OsBQNneZW2K/ZqByoRAbm8Om/biuzOeUcG2Z5U8Kh
         89aA==
X-Gm-Message-State: AC+VfDzn9Z4DO610Dehc1tCbTWi7AJdJJP4LGrvo3ZMxWAG1HTUxWk4G
        r2z0MkuKmrqb+KpVT4Imx+iPWQ==
X-Google-Smtp-Source: ACHHUZ7vfuZ1/I9FGbWeX0x+7CckoFKSaTGBFxiIakeywxadcLTtqYuNkWOGl9K3N1nc5OB4YVmv4Q==
X-Received: by 2002:a17:902:f689:b0:1ac:8148:8c50 with SMTP id l9-20020a170902f68900b001ac81488c50mr18595095plg.28.1684870270645;
        Tue, 23 May 2023 12:31:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 12:31:10 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed panels
Date:   Tue, 23 May 2023 12:27:55 -0700
Message-ID: <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As talked about in the patch ("drm/panel: Add a way for other devices
to follow panel state"), touchscreens that are connected to panels are
generally expected to be power sequenced together with the panel
they're attached to. Today, nothing provides information allowing you
to find out that a touchscreen is connected to a panel. Let's add a
phandle for this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/devicetree/bindings/input/elan,ekth6915.yaml  | 6 ++++++
 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
 Documentation/devicetree/bindings/input/hid-over-i2c.yaml   | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index 05e6f2df604c..d55b03bd3ec4 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -24,6 +24,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel:
+    description: If this is a touchscreen, the panel it's connected to. This
+      indicates that the panel and touchscreen are expected to be power
+      sequenced together.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   reset-gpios:
     description: Reset GPIO; not all touchscreens using eKTH6915 hook this up.
 
diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..a5cd8dafd450 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -30,6 +30,12 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel:
+    description: If this is a touchscreen, the panel it's connected to. This
+      indicates that the panel and touchscreen are expected to be power
+      sequenced together.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   reset-gpios:
     true
 
diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
index 7156b08f7645..c7ea6c148838 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
@@ -44,6 +44,12 @@ properties:
     description: HID descriptor address
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  panel:
+    description: If this is a touchscreen, the panel it's connected to. This
+      indicates that the panel and touchscreen are expected to be power
+      sequenced together.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   post-power-on-delay-ms:
     description: Time required by the device after enabling its regulators
       or powering it on, before it is ready for communication.
-- 
2.40.1.698.g37aff9b760-goog

