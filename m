Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3654044DDF2
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 23:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhKKWvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 17:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhKKWvW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 17:51:22 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F15C061766;
        Thu, 11 Nov 2021 14:48:32 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id u130so4142315vku.2;
        Thu, 11 Nov 2021 14:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zWYuq2uKQslQhuAS9ITOBTJ7JMyhU7VzEa0F62THcNI=;
        b=C8AAScB0axppJpbpqUCrrvMBJErNBnRc3KWDKD/Z14khJvPJCxVstMI6QglSjMltmh
         0/lBybFdCXGiGSN89GfBHppFkPa/ZtiPYNCUOUPI8I3YEJoZ6MKKDgeXjI8Li7AUEuRR
         pw28F9Qzcu9K7tvOeqhlBrFP+PePZMqEK8wxjjCry/re2r5F0w6UF/NF/Z9eYGwZ+eoK
         KX9poHkFFTbxPTaEbaB1LMfwYXhUgcHlhPIdafv4CQW9dhTFLrTdU2YHwJt7PkYhyAuj
         uLJNl7XNoHY30mqdWai/4szabgA7MVABOAvk9BfxFVWi0oZ+3otbaND/wbgdUXkKFpkJ
         IHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zWYuq2uKQslQhuAS9ITOBTJ7JMyhU7VzEa0F62THcNI=;
        b=bzsIAuCWC8DJOxkObTMczSaxw8P5UtNRnqum+RvuI4TUnXw5OdN6+vo22KoiTdxyuE
         UgrnD2iUifZVXIYjfJd7vICTutRt8fOt7zEfpwYVYu9QYcO4r8yDr3YA66ho2NDCHyo/
         luuAJ4ZlUm8r0HDDlOWZSM5z+c4vw3BLhEkcR0B/YXomjkd0IMJrYO65HhPywD/gDEJZ
         /UYE+dYavgFnhBaCVGodIbFGGOI8fQIL6sZr1Y9L7uQsPeg+zW/WSyX1x1Vl2Rx33y7v
         Y1EfAqgOy8MJKVoS/Mf5SAnHMqStwqHYjuKBUR4wXnkNDiJIsywwmVcIPq0qwQ0Q+M4c
         YOag==
X-Gm-Message-State: AOAM533nLQURjOp8wtZSnjFug0suORI7pr1mPv5vJbEGy0Sbw0q9YkeK
        PcLUfZQtpfPLqmx9fASfjiA9PVzwvt0=
X-Google-Smtp-Source: ABdhPJw6Dshck5QSx1Emb2cP0Ea6LBzhOlUFrKWpQwMQk/iqHipsTut3DWNI5Aux6kqeGtRX09YjWA==
X-Received: by 2002:a1f:a704:: with SMTP id q4mr16073592vke.0.1636670911429;
        Thu, 11 Nov 2021 14:48:31 -0800 (PST)
Received: from rog-zephyrus.. ([201.46.20.144])
        by smtp.gmail.com with ESMTPSA id t5sm2987190vsk.24.2021.11.11.14.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 14:48:31 -0800 (PST)
From:   =?UTF-8?q?Vin=C3=ADcius=20Angiolucci=20Reis?= 
        <angiolucci@gmail.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.torokhov@gmail.com,
        =?UTF-8?q?Vin=C3=ADcius=20Angiolucci=20Reis?= 
        <angiolucci@gmail.com>
Subject: [PATCH] Revert "HID: hid-asus.c: Maps key 0x35 (display off) to KEY_SCREENLOCK"
Date:   Thu, 11 Nov 2021 19:47:35 -0300
Message-Id: <20211111224735.29665-1-angiolucci@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This reverts commit 2ea5999d07d2a0ab6ad92ccf65524707f2c5e456.

As Dmitry Torokhov pointed out, the previous code (KEY_DISPLAY_OFF) is
actually correct. The real issue is that current desktop environments
don't deal it properly. Mapping it to another event does not solve the
issue.

So I'm reverting that change, keeping key 0x35 mapped to KEY_DISPLAY_OFF

Signed-off-by: Vinícius Angiolucci Reis <angiolucci@gmail.com>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 5d57214d8dee..f3ecddc519ee 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -854,7 +854,7 @@ static int asus_input_mapping(struct hid_device *hdev,
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
-		case 0x35: asus_map_key_clear(KEY_SCREENLOCK);		break;
+		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
 		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
 		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
 		case 0x82: asus_map_key_clear(KEY_CAMERA);		break;
-- 
2.33.1

