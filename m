Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F243211AC
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 08:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhBVH5L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 02:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhBVH5K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 02:57:10 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EEDEC061574;
        Sun, 21 Feb 2021 23:56:30 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id w1so1816357qto.2;
        Sun, 21 Feb 2021 23:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhzvwgVncQ6MD7CZFmC+wiMajLs4T5H60snpx41H/70=;
        b=XYwdahjfwj3YMXWwrWfxNv5U5JoB/vVn5t5Z4sAHx9FQwomQDjkRip9ZQjW9MAum1y
         Gfm/wJMyM6dFT3TXXdNLYMbSIKJZynAvJ3gi/GHYccn0PPyARjCxawYGidDAoLpVt/Vq
         29IqFEBG858tC6rGIlaRck2G48rsEBS2gdRxyGojxlP6/nEMJQt40rRr4Gu3gd6Bho50
         7QLJEUe2QR+XNpUKNJL8lGSS2u0PR4St0AY7eKnGyWwPZk72vkjg+7LgMckYR8ijMCVx
         dvBpMcbydT6RYgDZ40oMdVnBl6VpFkqGvhK9U22nPBnl1IT0uF7ICQskN+zEm/hF+BaE
         aPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhzvwgVncQ6MD7CZFmC+wiMajLs4T5H60snpx41H/70=;
        b=rgFLBqXZeX8HYCYVS7ec4GSOVQOyB1n82cmRxaPUD5xdBWHx6gazEDpw9Hvrsz4SdV
         lHoZwAexg+5Y/vYQFufACdx+C2VTpwdXIICCOUfCbF9v0ovt+RaVA55NC6SQdaBV5JLo
         uxfL1giax9E690WH+mJln52ppVKkaxWPY5LtTxySdxRnEg9cdzpEJvOFmhajYGE6RNWu
         Wzgk1DWd0Aa7sqFvaaKutmN8Ltcb5Fl9KweP4dAaxYsEg7tiQ5zapdAS8iucIRqofQzd
         uYzG7cdVcUDNBrQK+Ip2vVsVRmp5uIzgnKI/UthI5luk27hQkR51jQ/ArrTGP9IPCUfW
         W4tQ==
X-Gm-Message-State: AOAM532+N+gxRWLwZsa1byjC88dzvk3YhD9biG9P4M7jgftkXdA0FNkD
        hRMAHA/Hd3jJDSTNZSESMgk=
X-Google-Smtp-Source: ABdhPJw3e+mjkQiwmxFBW6+UVF9r7pVwJm27kej86zaQfp/QZRaUanKfInmJHTslMIfbx+YhpJJ1Xw==
X-Received: by 2002:a05:622a:7:: with SMTP id x7mr18862632qtw.257.1613980589611;
        Sun, 21 Feb 2021 23:56:29 -0800 (PST)
Received: from localhost.localdomain ([143.244.44.214])
        by smtp.gmail.com with ESMTPSA id q204sm11962652qka.84.2021.02.21.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 23:56:28 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     pali@kernel.org, dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        colin.king@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] drivers: input: mouse: Change postive to positive in the file alps.c
Date:   Mon, 22 Feb 2021 13:24:39 +0530
Message-Id: <20210222075439.32201-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


s/postive/positive/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/input/mouse/alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index b067bfd2699c..4a6b33bbe7ea 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -986,7 +986,7 @@ static void alps_get_finger_coordinate_v7(struct input_mt_pos *mt,
 	case V7_PACKET_ID_TWO:
 		mt[1].x &= ~0x000F;
 		mt[1].y |= 0x000F;
-		/* Detect false-postive touches where x & y report max value */
+		/* Detect false-positive touches where x & y report max value */
 		if (mt[1].y == 0x7ff && mt[1].x == 0xff0) {
 			mt[1].x = 0;
 			/* y gets set to 0 at the end of this function */
--
2.26.2

