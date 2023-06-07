Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F5B7270C5
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 23:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjFGVxM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 17:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjFGVxK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 17:53:10 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BEE210B
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 14:53:09 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-65311774e52so3231687b3a.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jun 2023 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686174789; x=1688766789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J6bms7QMm9w3IzcQHeVQuT7VvkTcEsATD8y00OpeXw=;
        b=lNOTHZUjf8JdjTbU6E6X/mqcY+Zwnqg/qRWUnY9Mwi3PCLRhThFa5YBIH0SWb6uJ1+
         rFr2+HfY1hSDBAI2d85k+n6W6gF4wlv/tcnXPvydjr0FRk5O5EZevrutN13VURxdh3VR
         aQknU7zcndxDLitCgvK20aLmQb01W2KregYks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686174789; x=1688766789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J6bms7QMm9w3IzcQHeVQuT7VvkTcEsATD8y00OpeXw=;
        b=Rqk9C/XM7rsJs90a7ai5jaBFwsenzHT96mSpScb4up+yI+naNYtnaNJiDDEZEgvzRi
         xV6gzu6xPD/pgb2L+Zsai5Ku1wNOWtP3le5ZEmOdjZDVhJLhSRJZWiJ/oS5uyCYAnTak
         FxMmc0aBHb+0Gq54JhafMK2mtwVQnwxGZMRryiGABh9AuhIMGVyYG8g53OWY74y3/N0g
         H3iuaGrCe40XEfiFwbi9EpiFBGCZELxzuNmKp6tBoA7TxpS09qgtQVwI+q0TXs+3TkN3
         MdHZUf8xck3LdLD9Vw7t62iXOZgBnzU9526z3KcZ29J2NwmExlSfCBBM3hkNUyzINPfY
         6lRg==
X-Gm-Message-State: AC+VfDyQGvoyssShqmGmJ4xldsoSgH/vBZJo9aCg0DVD5TfDm6uUBEB3
        yUefzkKmY3/v8/WVeMrfHmK//A==
X-Google-Smtp-Source: ACHHUZ6msq2zIZIoWR6/BNnd7gqzLUkkb+f55DYioqbBeFy7Kfz5MTf1YZEWIMbYfJuT7GP7UJVbsw==
X-Received: by 2002:a05:6a21:328d:b0:10b:2214:7ab0 with SMTP id yt13-20020a056a21328d00b0010b22147ab0mr2370510pzb.21.1686174788778;
        Wed, 07 Jun 2023 14:53:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 14:53:08 -0700 (PDT)
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
Cc:     dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 01/10] dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed touchscreens
Date:   Wed,  7 Jun 2023 14:49:23 -0700
Message-ID: <20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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

As talked about in the patch ("drm/panel: Add a way for other devices
to follow panel state"), touchscreens that are connected to panels are
generally expected to be power sequenced together with the panel
they're attached to. Today, nothing provides information allowing you
to find out that a touchscreen is connected to a panel. Let's add a
phandle for this.

The proerty is added to the generic touchscreen bindings and then
enabled in the bindings for the i2c-hid backed devices. This can and
should be added for other touchscreens in the future, but for now
let's start small.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Move the description to the generic touchscreen.yaml.
- Update the desc to make it clearer it's only for integrated devices.

 Documentation/devicetree/bindings/input/elan,ekth6915.yaml | 5 +++++
 .../devicetree/bindings/input/goodix,gt7375p.yaml          | 5 +++++
 Documentation/devicetree/bindings/input/hid-over-i2c.yaml  | 2 ++
 .../devicetree/bindings/input/touchscreen/touchscreen.yaml | 7 +++++++
 4 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index 05e6f2df604c..3e2d216c6432 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -13,6 +13,9 @@ description:
   Supports the Elan eKTH6915 touchscreen controller.
   This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
 
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
 properties:
   compatible:
     items:
@@ -24,6 +27,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel: true
+
   reset-gpios:
     description: Reset GPIO; not all touchscreens using eKTH6915 hook this up.
 
diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..72212382d702 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -14,6 +14,9 @@ description:
   This touchscreen uses the i2c-hid protocol but has some non-standard
   power sequencing required.
 
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -30,6 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  panel: true
+
   reset-gpios:
     true
 
diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
index 7156b08f7645..138caad96a29 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
@@ -44,6 +44,8 @@ properties:
     description: HID descriptor address
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  panel: true
+
   post-power-on-delay-ms:
     description: Time required by the device after enabling its regulators
       or powering it on, before it is ready for communication.
diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 895592da9626..431c13335c40 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -10,6 +10,13 @@ maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>
 
 properties:
+  panel:
+    description: If this touchscreen is integrally connected to a panel, this
+      is a reference to that panel. The presence of this reference indicates
+      that the touchscreen should be power sequenced together with the panel
+      and that they may share power and/or reset signals.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   touchscreen-min-x:
     description: minimum x coordinate reported
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.41.0.162.gfafddb0af9-goog

