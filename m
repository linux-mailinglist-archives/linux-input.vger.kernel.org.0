Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747242AC762
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 22:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730951AbgKIVhk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 16:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730470AbgKIVh2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 16:37:28 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2118BC0613CF
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 13:37:28 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id a18so9219056pfl.3
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 13:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mjmuykYc+6IRfxhnFcBNshn4ZYHI8kwWAl9SmNJjnjo=;
        b=O0sBObBD/WzQuzBqIR2UhdL8FFkQnNA9GsP3TcxSgLFceGhxzoW6rhgZtc9+Z0VqRl
         eI7YGS0ZYz3ZuMtT2HByZaf3O4z+HJH3a4ItXhNwm6xu3T87scQDCNTsM8EdpE4EBSWh
         9F2wLWTJYvQ5Yhe5rnVMZpABhsQVxdh3oCLsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjmuykYc+6IRfxhnFcBNshn4ZYHI8kwWAl9SmNJjnjo=;
        b=lM/udCIhAvd9+4Kxkr/1rMa1XOTeXr3mhSMmh3tU82pHRaP748dmHFvFYUKkHZIe26
         IMyil4kSPn7SFdrnZphpBiEtlTBda2jnSljV9JCZvnYqCc6UYOuo5uzH8Xxjx9uzGDZ2
         2hiv5EyeGTA/h5KGHuJMidX2n73Q0mpw+4Rr32UERxxh6U28S/HzULga7kdrhhijWwi5
         /Nj6NvAdITg45ujfPfyOeSNhdIjNplGjfnFjn9fzcDS7hZobsLFvre+JYF8mHoi04T+b
         B2zy0bP3J8W6S0ZtVh7AcSI3VSyQeTQbwCuzDdXs2VN00oM4cj8eZf5fTIW50viQuKNE
         oIAA==
X-Gm-Message-State: AOAM532Jy+eJOZDwP53TAIjiZbohPPRuLKKOY20VIlvoJazvqXU6+DLO
        cWrMdzC7XrsXL0ZSsCF+bPr+ag==
X-Google-Smtp-Source: ABdhPJzZ1m/FD35icxSHf0g3HdP/6eAceyHUPH+V8QbGDISybPAEWMKP4NfP3Ty1AAlP25XTBbe5uw==
X-Received: by 2002:a63:e40b:: with SMTP id a11mr14479882pgi.26.1604957847721;
        Mon, 09 Nov 2020 13:37:27 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i10sm11895444pfd.60.2020.11.09.13.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 13:37:27 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kai.heng.feng@canonical.com, hdegoede@redhat.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        swboyd@chromium.org, andrea@borgia.bo.it,
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
Subject: [PATCH v5 2/4] arm64: defconfig: Update config names for i2c-hid rejigger
Date:   Mon,  9 Nov 2020 13:36:34 -0800
Message-Id: <20201109133526.v5.2.Ic9788bdfc4cce7569f8d25e7fb52a208fb643eac@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201109213636.1267536-1-dianders@chromium.org>
References: <20201109213636.1267536-1-dianders@chromium.org>
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

