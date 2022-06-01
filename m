Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B87FE53ADE7
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 22:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiFAUoP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiFAUno (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:43:44 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22A525A814;
        Wed,  1 Jun 2022 13:27:21 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id s188so4134887oie.4;
        Wed, 01 Jun 2022 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwzXnf3azVD6WfYhoQELh3wDWF/dpdqfOluzUPHPtRE=;
        b=qTZh3z5RwRy6KWlvAvHHj2W1Wlofy+evOE4qf/2EdqZHO9cOnqnJrB+Xk7G0QrUYsH
         XnzpuFEqv+wOVyflchOI04/wnM6Dq4zvBnHtnFudT8xyFwRsNDb+1iE9l1He/23RKXaM
         ogdgiY9IQWgxA8Kp4Y13OUg80tAwEhOgMuZ+uOBT3kdV9DjTLrrfKuuvqf1YXnHnBr9P
         6HUm5lBkO9Lkx4FZd+W4VCLGvi+JIfv6IRXDMS0u7w8fEw0YV0xmfE9EUHuccYz97prj
         9hhSU6kbAZCG7bn0hoi9KoWNSYkNEyR6VnvMbxxrzJuVEJsRFfEQGc8qViiNbbFE5ufG
         0Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwzXnf3azVD6WfYhoQELh3wDWF/dpdqfOluzUPHPtRE=;
        b=mjQgqilRhghReQY8WrcYYI7J2H69y3Iw4aBywC7JEEf4d9UY387K4HJHvHQVmHnPvP
         iMq0mnAZ7HCrArGynA6diq6zgQT6gWCRjRq32Q4HwAHEsD/Cuk10ju7d7Y72LqSnr4kB
         dyIo0qvnSPCye4+iRtXCNi72EAa6ByktCWtujSqeQQVtVCqASu97pSbg/ZzVaS85jLMh
         k3NgZocJjq/wx5imh8EMS2RldnmB/KAC5nZ84/OZ/Z21rCcdzahRRPCotzQifODOuJ+J
         5fLqOGBQN3FtO7NGOA8NCQ5W6e9qgfUjxEFX/g6D30wGz7+7FgjWhFisiYK07MDOk/PB
         GsdQ==
X-Gm-Message-State: AOAM532kcGsyxQ3L7/Rj4MlCmA9AUFBLTIN8Ikq9yp9eX5pXlMz0pSi0
        6tgaLuP80UZ8wzaulm4SbgJmKoHpLBvLoQ==
X-Google-Smtp-Source: ABdhPJyA57ak5ngD+SHlcaG7WTty94zQ0U4li7XCwx8r2A46BzhNpYPZKbss9DU/hsgej4pJ1Vkanw==
X-Received: by 2002:a05:6808:1523:b0:32b:1a45:4bf6 with SMTP id u35-20020a056808152300b0032b1a454bf6mr606308oiw.282.1654111065150;
        Wed, 01 Jun 2022 12:17:45 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id w41-20020a056830412900b005b22a0d826csm1194512ott.1.2022.06.01.12.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:17:44 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        maccraft123mc@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Update joystick to polled for Odroid-Go2
Date:   Wed,  1 Jun 2022 14:17:30 -0500
Message-Id: <20220601191730.29721-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601191730.29721-1-macroalpha82@gmail.com>
References: <20220601191730.29721-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Update the Odroid Go Advance to use the polled method from the
adc-joystick driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
index ea0695b51ecd..9766f80166f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
@@ -23,7 +23,7 @@ chosen {
 	};
 
 	adc-joystick {
-		compatible = "adc-joystick";
+		compatible = "adc-joystick-polled";
 		io-channels = <&saradc 1>,
 			      <&saradc 2>;
 		#address-cells = <1>;
-- 
2.25.1

