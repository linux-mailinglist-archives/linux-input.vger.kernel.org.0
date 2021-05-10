Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B173C377C3B
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 08:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhEJGYc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 02:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhEJGYb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 02:24:31 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EE0C061573;
        Sun,  9 May 2021 23:23:27 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x5so15270855wrv.13;
        Sun, 09 May 2021 23:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ozgg+t2OGoL/gMG6femJDH394IeCSoLaxkJhSHtZh8g=;
        b=sQpdxyccy6hkn9TGWvTDaPjoZaMwRJ/uLi97x5vCJ3u0wJCJgyHOb7vrcZt2jmrPh3
         pc42JhZ2+G+FLJ+XVkO9RxTUsU3LC9DNgfz3bTgm3BwtSiYa8/ZPnAI1loV3WsXWBMkZ
         iZKqGGGZwBwa5VWidg42L0X9igLlJGqAE4Nh/tsK9GTJ8LgVDpJZx9iCixvA1XSujJfr
         spU2oN0oayFvnBsnYhl3fihCoECNCqpeMTt7uJlndkX4i36OMLVpZ70zGeM0I141VHUx
         ap6dJZgFet49lKYmj5aQ4y84wg8vcAkrXRp5LHlnkLCP3cSbqMjvFRf7KftnnGxpOD4d
         zgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ozgg+t2OGoL/gMG6femJDH394IeCSoLaxkJhSHtZh8g=;
        b=rRYewCSeIEZjeIIbFGjPDuTdsQ3+0gPTHvKlMMXTsr5oMPlfbVQlrMvC/wLIIjHtu0
         zSXHZm02Ytazh7J18wHBtl5u+QoIM7w6SdeS/NUEMrvk+iOkLHgdmX9C3H8/2mTy6onm
         nPf+BQXn6WS3T3M4bX3RsA22/SmViSYo/rYX13xhwB8FXLVZXAfauTiTyUcpOk5orAFC
         33DYjiWK3hEljMc3MWURZhHSQvbVwj/ivpCK0lC646CU2yvJbuL6+uSenqR6T8NRqFw9
         +EejbWKGY2FZeYAnPrp5mOTTrgbrTWvVTgs7kvaCoRrlz1QrdVmqhd/A05dPq5tOueRg
         abiA==
X-Gm-Message-State: AOAM531GE6C1m51PJkS1k9Ar9YPaQh8jMPND7H6BfRs3ZWouv3ygoJah
        vrgLXl3TWw/dcZzwclsvw2ImI3dG9AWtSKl+
X-Google-Smtp-Source: ABdhPJyuhMpTGVkQ4bhcSlmO4kHhc2LEdT3XPojkxohxHtukm18XlGp47IXY8c3fm2RpUy/BIOiw0g==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr28265114wrt.39.1620627805892;
        Sun, 09 May 2021 23:23:25 -0700 (PDT)
Received: from localhost.localdomain ([94.73.38.147])
        by smtp.gmail.com with ESMTPSA id a15sm20446244wrr.53.2021.05.09.23.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 23:23:25 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2] HID: magicmouse: fix crash when disconnecting Magic Trackpad 2
Date:   Mon, 10 May 2021 08:22:37 +0200
Message-Id: <20210510062237.319457-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210509155138.39601-1-jose.exposito89@gmail.com>
References: <20210509155138.39601-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When the Apple Magic Trackpad 2 is connected over USB it registers four
hid_device report descriptors, however, the driver only handles the one
with type HID_TYPE_USBMOUSE and ignores the other three, thus, no driver
data is attached to them.

When the device is disconnected, the remove callback is called for the
four hid_device report descriptors, crashing when the driver data is
NULL.

Check that the driver data is not NULL before using it in the remove
callback.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 2bb473d8c424..097870e43cfe 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -779,7 +779,10 @@ static int magicmouse_probe(struct hid_device *hdev,
 static void magicmouse_remove(struct hid_device *hdev)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
-	cancel_delayed_work_sync(&msc->work);
+
+	if (msc)
+		cancel_delayed_work_sync(&msc->work);
+
 	hid_hw_stop(hdev);
 }
 
-- 
2.25.1

