Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA19D1E03FD
	for <lists+linux-input@lfdr.de>; Mon, 25 May 2020 01:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388235AbgEXXvj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 May 2020 19:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388124AbgEXXvj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 May 2020 19:51:39 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B9DC061A0E;
        Sun, 24 May 2020 16:51:37 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j21so7930619pgb.7;
        Sun, 24 May 2020 16:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=qfV9fwTE3ujbWodXJNtbIMN60344PWC0suZnOZeBYU4=;
        b=uba3vhfWpE8BM0fHrj5V5DS/NOcrTgh6aoPbgBW/DQ0flZL+GHsHJk9RmQsAHuM0Yv
         SgxaixUUkByvv4UnxjMPH2jiohhkMUWIlTI8pMnYTElU6VFhvDkGFgfAJSf8cMsFpOzp
         Emj0ceU6zahXTsMS6hStutfmY93EiV5mkXAaWuTMHiEMpSYTPnrqOsq2L/GrWKfctYPn
         /3tbf39nK7o3wZpS/dpCgXLfhjeY+mFKpATg0oIATtDf77EhiU/mp3JEbAx8FGsql9Is
         L9AU5GvJOO9QW9oTDYQvHfkU8veTizFDzRPR0zmLYVN9vpCOUcgqutczfOK+fITfnOTZ
         OUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=qfV9fwTE3ujbWodXJNtbIMN60344PWC0suZnOZeBYU4=;
        b=rh5GeHnTvxkw6MQ4VHLd5iBNQ0+7sPDvaXdsTMfFGzUTdKzieIcdWDUB9UK9cBcQfX
         UMDG+8/DbUdym+GHAhAS3O9deTakN0cq9KhcXqj1heGpX6DD2yc/qLZYsc/qnBJ4+uwZ
         5fBLltt1Pn2bDkzn1asnKK/fejAoXaeD0Q2/u/9rqhx4KOKWtL6TlCozQjgAxVQ+IoqG
         MsSNO6uXlmpHwCei++YCmxTMbL9at6bMSw5wKLi3L3oZrGMGLCr0/5fekN6N0+qHSPww
         sfiJATvZU7msZ+dZzzKSig05aC93n8TwX1V3oXLw34RisyQJjWAtVFKPZs1jfXL6vjhA
         3C+Q==
X-Gm-Message-State: AOAM5306my20YOZhNsAITMIobceaEGoNtW3LvVw1qF5381017xt7/TmY
        VuNmpzd44eLZimJw0J5IpzM=
X-Google-Smtp-Source: ABdhPJym4Q9cVY/qHFmaxHwHQlSLSvgTYLnsZ7CC14iFkzVIiWKh7Sl6Xzs10QJ9reK0mULlcCvmAg==
X-Received: by 2002:a63:3384:: with SMTP id z126mr20355736pgz.7.1590364296959;
        Sun, 24 May 2020 16:51:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id n3sm2202956pgq.30.2020.05.24.16.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 16:51:36 -0700 (PDT)
Date:   Sun, 24 May 2020 16:51:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Yariv <oigevald+kernel@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: magicmouse: do not set up autorepeat
Message-ID: <20200524235134.GA143513@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Neither the trackpad, nor the mouse want input core to generate autorepeat
events for their buttons, so let's reset the bit (as hid-input sets it for
these devices based on the usage vendor code).

Reported-by: Yariv <oigevald+kernel@gmail.com>
Tested-by: Yariv <oigevald+kernel@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Jiri, Benjamin, this is fixes jitter in event packets that became
apparent when we moved the point at which timestamps are being
generated, so maybe mark for stable?

Thanks!

 drivers/hid/hid-magicmouse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 34138667f8af..21c0ea7459be 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -535,6 +535,12 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 		__set_bit(MSC_RAW, input->mscbit);
 	}
 
+	/*
+	 * hit-input may mark device as using autorepeat, but neither
+	 * the trackpad, nor the mouse actually want it.
+	 */
+	__clear_bit(EV_REP, input->evbit);
+
 	return 0;
 }
 
-- 
2.27.0.rc0.183.gde8f92d652-goog


-- 
Dmitry
