Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6922AFC45
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 02:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgKLBeK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 20:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgKLAnQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 19:43:16 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63375C061A4A
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 16:41:43 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id z3so2868899pfb.10
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 16:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mjmuykYc+6IRfxhnFcBNshn4ZYHI8kwWAl9SmNJjnjo=;
        b=oYREcqIjRfeGgYSa+Ns0rz8Tfd1HDvVS0d5qrfnZXJnQVf5ySnqni8KSmbneWQMwWK
         TYgeRiLAAauZXt5IWSADfbMND/cBsxhNO1rcZPgNHImCUbOxmiPVJaapXKwXDh3VtaYl
         Hyh6GxKxYABOE9tfSgxuAEatQxAx1bcVBA1Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjmuykYc+6IRfxhnFcBNshn4ZYHI8kwWAl9SmNJjnjo=;
        b=IN6xG8ycjhULSaLDTmsAzwycfHoApdCQgnh86iJVOFTJN9QQ0qjQmYQB4fQFDANpxc
         8XLW1aYkN5hmOiZ95yUiLMcRW4rGApPGS4BZCc2pSr6RkORsbDvQYknWNu02CQyI95Ra
         T+JGoUPUJuA9y5mb7iz3nPVNcvcU7T+e/xB3NM2YRRRxG4rmJk8aYQ2anRnWpkNNX17e
         E+o5JS3o4y080CTNVXlr+nOX0jHLA3GMHrErPiZt6EQj51mxbMPbx9mXC1ewXbg4wxo6
         ynJKmw55LvLo2jRKNLCh9YR7QUm3qjsS+6Gn/B5PgHz7dAZhvgz0WBSM7MHAlt6hjPjS
         KYaQ==
X-Gm-Message-State: AOAM532pZu/mzQyD/PO7a8v3dRV8Aqh7vIIvKi7wdgoNKk2oZezIUNda
        j5amr8pcN3iT67mm3gywFBUHOw==
X-Google-Smtp-Source: ABdhPJxNiNr76eWFWPlZHLuQbAmuo6F5QkCNJ1QV8I9Pl2aPhpzBTSc7Kfd7HnXMo21gM8r5jGxEWg==
X-Received: by 2002:a63:6a82:: with SMTP id f124mr270270pgc.236.1605141702977;
        Wed, 11 Nov 2020 16:41:42 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id t26sm4265522pfl.72.2020.11.11.16.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 16:41:42 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     andrea@borgia.bo.it, robh+dt@kernel.org,
        kai.heng.feng@canonical.com, swboyd@chromium.org,
        linux-input@vger.kernel.org, hdegoede@redhat.com,
        Douglas Anderson <dianders@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/4] arm64: defconfig: Update config names for i2c-hid rejigger
Date:   Wed, 11 Nov 2020 16:41:28 -0800
Message-Id: <20201111164027.v6.2.Ic9788bdfc4cce7569f8d25e7fb52a208fb643eac@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201112004130.17290-1-dianders@chromium.org>
References: <20201112004130.17290-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-hid driver has been split in two.  Let's enable both halves.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v4)

Changes in v4:
- ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.

 arch/arm64/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5cfe3cf6f2ac..9258d623331e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -725,7 +725,8 @@ CONFIG_SND_SOC_WM8904=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
-CONFIG_I2C_HID=m
+CONFIG_I2C_HID_ACPI=m
+CONFIG_I2C_HID_OF=m
 CONFIG_USB_CONN_GPIO=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
-- 
2.29.2.222.g5d2a92d10f8-goog

