Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A976947A9AD
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 13:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbhLTMZz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 07:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbhLTMZk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 07:25:40 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5510C061398
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 04:25:31 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id z5so37605291edd.3
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 04:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5l6X42Q1hhXCCV2zsPbnIHkIz6QpyD+5/B2sPrSWbY=;
        b=uHtnQauXfEDehUTW3/mo9D+1L4N9XvyEnrV3PWHgIVKLDI0+YN6JE59jYmRUu8ttAt
         snnxXD/D/LfL4gCCzkyGoT80nqJCm1pv9GEQCuWz73zs71md02zDrXnEZafgTrP8lHiN
         UFGQAGnwigOuPBvE182PuL34GxLCmKBT7N+5VSyIWaJBN7u1pFH5voc5Kypo2PSwKpo1
         VLuyc3Q5ZSJcUql9Jfue73VA6vpf94pys2R1tl8svSpsz0XNuncp4eL3NSbhaN+sNimc
         mRmAWdH6kcbsjeE/VO1HfmRMvdycysQ2XRzDqxjp2fKCrBMfp9NjlEd2abN0RWaMITmZ
         P5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5l6X42Q1hhXCCV2zsPbnIHkIz6QpyD+5/B2sPrSWbY=;
        b=sHRJzlVDAO2A+Hx7qfbecVwfYUVw6vPfF+aHc5NZhDrjA04MpGfCVCU3Di8f9vc5VE
         H6rMx0GV6B7GNEd41/9oPpGplFXcgsjOjJjdgthuhw4zBbJJJa5nUMSvImOlSNJLj84F
         8F6sAizH2uMmlV+2xH2Bg4TPzODzmZ84rj6lTJetXJURz2mwc//ObYTdJEeM3ow+F2Dq
         lqhII/lWPTqJXFJgspv3jb+33fvKIDYRjuDXz7LY6Ra75scKnXdl+yzkNHTBtnnHXvm+
         TsZCtflOhCaFAidBiqOuZ0RTZ7k1O3BdySu/PfK73ZB2rLnSLt+m4tqVK6obyEuz9ks/
         Uf+w==
X-Gm-Message-State: AOAM533RRf84ocOw62k4HI9yRrRLIqIxfjVlEbg/hASKPKTAK43J8Hy2
        EeqE2tZPw2YnEB9U5UPE0Kjaxw==
X-Google-Smtp-Source: ABdhPJy7gIVM+o8shhal/Gr1KRTZnigRs3pcnv4cEkYdnY7HfAegHCfmBO0COi70irMOHyzh7/q03A==
X-Received: by 2002:a17:907:16a8:: with SMTP id hc40mr10497296ejc.210.1640003130404;
        Mon, 20 Dec 2021 04:25:30 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id f27sm4335374ejc.137.2021.12.20.04.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 04:25:30 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, woojung.huh@microchip.com,
        UNGLinuxDriver@microchip.com, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        clang-built-linux@googlegroups.com, ulli.kroll@googlemail.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        amitkarwar@gmail.com, nishants@marvell.com, gbhat@marvell.com,
        huxinming820@gmail.com, kvalo@codeaurora.org,
        linux-wireless@vger.kernel.org, rostedt@goodmis.org,
        mingo@redhat.com, dmitry.torokhov@gmail.com,
        ndesaulniers@google.com, nathan@kernel.org,
        linux-input@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 4.14 6/6] Input: touchscreen - avoid bitwise vs logical OR warning
Date:   Mon, 20 Dec 2021 13:25:06 +0100
Message-Id: <20211220122506.3631672-7-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220122506.3631672-1-anders.roxell@linaro.org>
References: <20211220122506.3631672-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nathan Chancellor <nathan@kernel.org>

commit a02dcde595f7cbd240ccd64de96034ad91cffc40 upstream.

A new warning in clang points out a few places in this driver where a
bitwise OR is being used with boolean types:

drivers/input/touchscreen.c:81:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
        data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This use of a bitwise OR is intentional, as bitwise operations do not
short circuit, which allows all the calls to touchscreen_get_prop_u32()
to happen so that the last parameter is initialized while coalescing the
results of the calls to make a decision after they are all evaluated.

To make this clearer to the compiler, use the '|=' operator to assign
the result of each touchscreen_get_prop_u32() call to data_present,
which keeps the meaning of the code the same but makes it obvious that
every one of these calls is expected to happen.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://lore.kernel.org/r/20211014205757.3474635-1-nathan@kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/input/touchscreen/of_touchscreen.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen/of_touchscreen.c
index 8d7f9c8f2771..db499ef6ccff 100644
--- a/drivers/input/touchscreen/of_touchscreen.c
+++ b/drivers/input/touchscreen/of_touchscreen.c
@@ -79,8 +79,8 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-size-x",
 						input_abs_get_max(input,
 								  axis) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
+						&maximum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
 						input_abs_get_fuzz(input, axis),
 						&fuzz);
 	if (data_present)
@@ -90,8 +90,8 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-size-y",
 						input_abs_get_max(input,
 								  axis) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
+						&maximum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
 						input_abs_get_fuzz(input, axis),
 						&fuzz);
 	if (data_present)
@@ -101,11 +101,11 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	data_present = touchscreen_get_prop_u32(dev,
 						"touchscreen-max-pressure",
 						input_abs_get_max(input, axis),
-						&maximum) |
-		       touchscreen_get_prop_u32(dev,
-						"touchscreen-fuzz-pressure",
-						input_abs_get_fuzz(input, axis),
-						&fuzz);
+						&maximum);
+	data_present |= touchscreen_get_prop_u32(dev,
+						 "touchscreen-fuzz-pressure",
+						 input_abs_get_fuzz(input, axis),
+						 &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis, maximum, fuzz);
 
-- 
2.34.1

