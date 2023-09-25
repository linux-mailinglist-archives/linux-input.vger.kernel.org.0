Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E39597AE0D0
	for <lists+linux-input@lfdr.de>; Mon, 25 Sep 2023 23:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbjIYVew (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Sep 2023 17:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbjIYVev (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Sep 2023 17:34:51 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FDC11F
        for <linux-input@vger.kernel.org>; Mon, 25 Sep 2023 14:34:45 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3adc9770737so4785570b6e.3
        for <linux-input@vger.kernel.org>; Mon, 25 Sep 2023 14:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695677684; x=1696282484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMjMGoX7rPrdNDm/jlmTWs+3v5W7OU2O+jGnwES/d5E=;
        b=WtbLiIIJtWB8STCyUGaSLijmwcy9BYxhP6r0aFnyZkDIGSrj6Am3ysszlrpkYbYAW9
         wAbYuB6M8e5t0sNaCmfFvBl4UIClRvNZqFEIpipW1ht6jxjUQvWLY8V1b4UpneNnJNfy
         XnwzwnHvYmW73rp3534OMky1UFOF1JL/U7rgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695677684; x=1696282484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMjMGoX7rPrdNDm/jlmTWs+3v5W7OU2O+jGnwES/d5E=;
        b=sggpA0FMvsPHDtEpTwczzqdb+hOgZ8YTDbn+fZwuP2yFa5qni8OxNLSyeJSPzKHH8P
         /pWszxi6iyicHQ/UruIza3Wgxqv2booIOfWno3uh7qe2aBQAGS7r5d31AB1qbAVmHVeU
         yu5ZoEE0TY6o2WUJHwO8cCkX0Z24JFQdwMNXMv4POfKo5XA2EeghiabSZNw/2vp2ngYp
         4yWvMQl8TF91URwufvz0oiAosCgrkasX5m3Ek25dAJ8xiYYDgCco2RLvaldYAgWQz7sj
         RyokKl61nhQMnA1w0/BtrqKEicfJ1KRADtWare03s8CggwtMMbzDHQ8Tqqsm4omLcKwv
         dnGg==
X-Gm-Message-State: AOJu0Yyvoc4wrbeeYqa3sNP0qhrTdhfxIoXZmgmQcFsABjzQXB6k367I
        pURCX4wSSxdJ10/dal7pDQhEGq8nLQjjH33pavY=
X-Google-Smtp-Source: AGHT+IELofpTuOkM1+jEeSQWZhq8Q7AeywQCNorWAhdi4ndK0ke3S4LrJNiYoaPRMWVkh/RJQcr1oA==
X-Received: by 2002:a05:6808:2084:b0:3a7:a3b1:ac30 with SMTP id s4-20020a056808208400b003a7a3b1ac30mr11443301oiw.44.1695677683997;
        Mon, 25 Sep 2023 14:34:43 -0700 (PDT)
Received: from jdenose34.roam.corp.google.com (99-137-158-190.lightspeed.cicril.sbcglobal.net. [99.137.158.190])
        by smtp.gmail.com with ESMTPSA id u31-20020a056808151f00b003a9cd23980esm5903oiw.8.2023.09.25.14.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 14:34:43 -0700 (PDT)
From:   Jonathan Denose <jdenose@chromium.org>
X-Google-Original-From: Jonathan Denose <jdenose@google.com>
To:     linux-input@vger.kernel.org
Cc:     Jonathan Denose <jdenose@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Takashi Iwai <tiwai@suse.de>,
        Werner Sembach <wse@tuxedocomputers.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
Date:   Mon, 25 Sep 2023 16:33:20 -0500
Message-ID: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ThinkPad T14 Gen 1 touchpad works fine except that clicking
and dragging by tapping the touchpad or depressing the touchpad
do not work. Disabling PNP for controller setting discovery enables
click and drag without negatively impacting other touchpad features.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---

 drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 1724d6cb8649d..c487047d878cd 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -830,6 +830,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
+	{
+		/* Lenovo ThinkPad T14 Gen 1*/
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "20S0002UUS")
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOPNP)
+	},
 	{
 		/* Lenovo ThinkPad Twist S230u */
 		.matches = {
-- 
2.42.0.515.g380fc7ccd1-goog

