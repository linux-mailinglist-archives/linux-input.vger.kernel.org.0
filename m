Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B61532D406
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 14:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241212AbhCDNUv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 08:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241235AbhCDNUt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 08:20:49 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75028C061756;
        Thu,  4 Mar 2021 05:20:09 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id b21so18895609pgk.7;
        Thu, 04 Mar 2021 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TMjI0rhKS12moabCsKX8Cy0K0eG4CRmLI3ae6IurMaA=;
        b=h/r8pe+e3JnNENUDMnFW40r5GhCIhvAKSxM6NnKVl6MFtm3QzQb215XQfBmbYnGetU
         CYchgQpafa62nHo8M9wxwjxYpwIDzkNfjZefcBimeqAQbHMBv4PgI13Krsihdfqvru+8
         VGDmAMR/NJ/uCUx7GdvLe3exaXtABBvE7f4XVU2P6ln8h92o7CmFKBEbl5biorYiDOqL
         sEIptI5vEqoQI5ndZozEo7vgakNrzQwh4gFb+kbqXp0ObHH2YBKA/jrHRuC4PZTVJFb7
         EHWireKg2ByRsgmxbaIqu58GLwrOiTQ7qQ13LS507QYHe4UYr47BVO7J4LTnQ/WSUS8i
         d4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TMjI0rhKS12moabCsKX8Cy0K0eG4CRmLI3ae6IurMaA=;
        b=dK1iLfG3EMv8nvFvC3NVXVy8HHymitDbC35IhCWJx/vsspD/wC7e+tt+fian07tkCa
         L/h1uW8IxEauwU1CKPCOQXN/QoXDcdh70KP+fW0Htw40cH0q28hkN+VJaKvw7SnjdeiS
         l7ZXGqgSb2Y4pMFqSrcf+QDq8cAmYoqeirqQvuR2+p2rVJugS7zKz/Ogul9QDJey/kaI
         Hf0yRMrd/Y3aiC9Z2tGG8vuEhAJZo7+57RR+WIJrmT17yb0hoNQdgA71Q2HNP75V6af1
         g7XRwYy9Fsq5TNHQrmo/N7qnJPwfZdETmJ9LXydpPmPOWAzDCdb5WzLGK/jbVUyr/BXa
         ++Fg==
X-Gm-Message-State: AOAM532oGKM7cjyR2LVjc5LxieJq2nC9N92bPR2rPX9zU/cEhitvz/sA
        FvTFAwuXJTo4ujhHDW4t7sQ=
X-Google-Smtp-Source: ABdhPJy8msvN5P1vXHi7GLbrA0vGVuOuLwsW2+MCAL7LPdPRw9k/ACXwljF7FvRx7yyOVGSMluqS+A==
X-Received: by 2002:a63:e04d:: with SMTP id n13mr3580941pgj.185.1614864009047;
        Thu, 04 Mar 2021 05:20:09 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.129])
        by smtp.gmail.com with ESMTPSA id g3sm2726706pfo.120.2021.03.04.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 05:20:08 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] hid: hid-alps: fix error return code in alps_input_configured()
Date:   Thu,  4 Mar 2021 05:19:57 -0800
Message-Id: <20210304131957.7089-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When input_register_device() fails, no error return code is assigned.
To fix this bug, ret is assigned with -ENOENT as error return code.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/hid/hid-alps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index 3feaece13ade..6b665931147d 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -761,6 +761,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
 
 		if (input_register_device(data->input2)) {
 			input_free_device(input2);
+			ret = -ENOENT;
 			goto exit;
 		}
 	}
-- 
2.17.1

