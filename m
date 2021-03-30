Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4975C34E390
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhC3Iyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhC3Iye (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:34 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0707AC061764
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:34 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o16so4980023ljp.3
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+nWoIhda88CRufoRBshjxqM91Z/QYAbPeuTebH+AdA=;
        b=piJznGslXavbNLo0UigIy4MydA1w2Q+wQg2o+IArBwdMzR+WUapIgcxlmp6jAVP5lU
         4nXL3DeRqMCU/3+To+TUMIj9bOF+Qa0aFWGAeyf7q0gC+Kszjy1EBLsEtuw1sDaRQML/
         Bp2KPW2GSmMKU3iRgcnyAheH9q8HbQXLu5JlTGRUUsjIsAa1Jf92a1NZuYCVRj8gM9R+
         cWY+l4xp4RZC1INBmHTeGj3B6BpqOEEsPv2riRo8goUGANWGQGsEqqljJAmKrJmEg1px
         KG8egKWfoZQKgkWSBYGktsCyPjq3fXhcuSCICAMA+6mi6V4PWPN61RPcMxZCjZEjK0U2
         9N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+nWoIhda88CRufoRBshjxqM91Z/QYAbPeuTebH+AdA=;
        b=rFYmWx5GZPO/BYAV9dP3y69lC8/ypBGu1AUH8H0nZJF3sgdKIdwc20QMLciSzSMoZc
         /CMZW6Z0/MiiblyZdjvcNFsez5gcg0tqf+Ri6/CDFmt1R4DwtWCA1so388hACBPEiHWw
         aO9WI/RGBQxIYSuBXi3HotKp6xt9sxhwGdHjPJd4MEvwFJcudWUUYSYgOocWr3TN+PBy
         AAvKpPSu2UeWHrFTEvAkqEWWcfahfOEQKeEQqxYJgaNMvjfaSEcrq9CBa7tZKnk4vj5E
         4K+k4nVvBXw6BUPx/xS+6JhtAkqm6/Igixzn+hWjdSE+gWiHOJQ0MrMB/qFm/RHLtu32
         mx2A==
X-Gm-Message-State: AOAM533ay0iUGWVI1yatAM5cYj7UowcApt9xkd4e0dU+jFzprjDDw97D
        tM5/5fFv+0Sk6fTdjydyYBFaHg==
X-Google-Smtp-Source: ABdhPJwmeYCwNd/Fd+PfliNS6cHeLOqSUhJTvBKHrJ2YGLSrde5ldpdl1Zba3iqIMKbHfn3Av8ROow==
X-Received: by 2002:a2e:2e19:: with SMTP id u25mr21184133lju.487.1617094472533;
        Tue, 30 Mar 2021 01:54:32 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/7] Input: cyttsp - Reduce reset pulse timings
Date:   Tue, 30 Mar 2021 10:54:21 +0200
Message-Id: <20210330085424.2244653-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The data sheet for CY8CTMA340 specifies that the reset pulse
shall be at least 1 ms. Specify 1-2 ms with usleep_range()
to cut some slack for the scheduler.

Curiously the datasheet does not specify how long we have to
wait after a hard reset until the chip is up, but I have found
a vendor tree (Samsung GT-S7710) that has code for this touch
screen and there this is set to 5 ms so I use this with
the same 1 ms fuzz.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/cyttsp_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 91f8f38b3f06..84f4f1c1a220 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -230,10 +230,16 @@ static int cyttsp_set_sysinfo_regs(struct cyttsp *ts)
 static void cyttsp_hard_reset(struct cyttsp *ts)
 {
 	if (ts->reset_gpio) {
+		/*
+		 * According to the CY8CTMA340 datasheet page 21, the external
+		 * reset pulse width should be >= 1 ms. The datasheet does not
+		 * specify how long we have to wait after reset but a vendor
+		 * tree specifies 5 ms here.
+		 */
 		gpiod_set_value_cansleep(ts->reset_gpio, 1);
-		msleep(CY_DELAY_DFLT);
+		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(ts->reset_gpio, 0);
-		msleep(CY_DELAY_DFLT);
+		usleep_range(5000, 6000);
 	}
 }
 
-- 
2.29.2

