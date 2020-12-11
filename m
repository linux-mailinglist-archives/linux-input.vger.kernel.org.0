Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66E02D81FC
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 23:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406869AbgLKWZz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 17:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406874AbgLKWZd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 17:25:33 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0EAC061285
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:25:00 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id n7so8119406pgg.2
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VIjdm7RPyoMXWeTdkfAgDbOhg46BNdgtvath0gXrNtk=;
        b=ahARTxF4mJW4kkdWRdnuvkA/lzyF0FwpbdwH7n/FitnicBKDPmriJHTlpdZna2hGyu
         XCCkzrJ3M1jntA2IAcspNgIlwzC8HvNnpbFv3W1ToHOOXpueya5/sXWg+fJKq4qjKCTd
         unO6L/pb7tZ9oGEPU/7O3cJwGiCjqLxK9XIfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIjdm7RPyoMXWeTdkfAgDbOhg46BNdgtvath0gXrNtk=;
        b=ZAwzs+T2+lXN9exuoD8f4JnZC5j8NDQ446Bk7Orlna0hbtEfsp5tYejBfTQmlBzLsq
         CwY46u5CsibwrT2BqQZCzGxbObNlYe3DrfbbP8OifMWZ9+jHCvdcWsLOR1+/sRRLMGQa
         mXMqlHeA9nvqMVIaq5Fp46cHO14PNekDhuSQvSYCCGU1y1uvrvCL9sGo/b6V8+zTQ1gr
         5IlVITwx3NAAExZW1OhGgRfujoa6XoSNVriEkyMfOggQsbxbQdc1IhaZ+tv5GH37fl8k
         rcAjCvxS88EYOsHzV/PgSQLsxSXAlqFUBMQS5Q24OHXyLrzKNeH3jey7Dqzz645fM+sO
         ztUg==
X-Gm-Message-State: AOAM531RiivJkhgzFqMlUbk2rUcWe6P7ud1oFGOUHiRSKGeIG5lGXeYP
        ZuttAW0m7iMGMcT3DDBCcpSQqA==
X-Google-Smtp-Source: ABdhPJwiqtvvtoZd5f0osTYpLU4A2fLXxvlIISX7AfqEfpLfirFaGUt37LddbSz92Jca21OamL62eA==
X-Received: by 2002:a63:5856:: with SMTP id i22mr13917280pgm.349.1607725500593;
        Fri, 11 Dec 2020 14:25:00 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id w70sm11669969pfd.65.2020.12.11.14.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:25:00 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     hdegoede@redhat.com, linux-input@vger.kernel.org,
        kai.heng.feng@canonical.com, robh+dt@kernel.org,
        swboyd@chromium.org, andrea@borgia.bo.it,
        Douglas Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Li Yang <leoyang.li@nxp.com>,
        Max Krummenacher <max.oss.09@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/4] arm64: defconfig: Update config names for i2c-hid rejigger
Date:   Fri, 11 Dec 2020 14:24:46 -0800
Message-Id: <20201211142412.v8.2.Ic9788bdfc4cce7569f8d25e7fb52a208fb643eac@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201211222448.2115188-1-dianders@chromium.org>
References: <20201211222448.2115188-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-hid driver has been split in two.  Let's enable both halves.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Will Deacon <will@kernel.org>
---

(no changes since v4)

Changes in v4:
- ("arm64: defconfig: Update config names for i2c-hid rejigger") new for v4.

 arch/arm64/configs/defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 838301650a79..326198305beb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -749,7 +749,8 @@ CONFIG_SND_SOC_WM8904=m
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
2.29.2.576.ga3fc446d84-goog

