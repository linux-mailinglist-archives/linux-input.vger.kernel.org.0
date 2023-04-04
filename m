Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B5F6D56E4
	for <lists+linux-input@lfdr.de>; Tue,  4 Apr 2023 04:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232605AbjDDCs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Apr 2023 22:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDDCs4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Apr 2023 22:48:56 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC4E1FD3
        for <linux-input@vger.kernel.org>; Mon,  3 Apr 2023 19:48:56 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id l7so29131816pjg.5
        for <linux-input@vger.kernel.org>; Mon, 03 Apr 2023 19:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680576535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvGC0vJU8UTE+JaOZYTd1ugvwGmwWLrdOy8xNdtaEMQ=;
        b=Z8LJlM1Uja7/j9PSe38X6AmzNKfQ5iDA6LRS6bxqLhSbPtQFbGEG7w599YIlvfWbeR
         SEsfTdZew9NSxGzBAex36zKDyEJZWJEmEtTbRqM5YQ11b+WFTOSzGnSlIvJo/Um2rigz
         TW86UfRVA+ecEKYfi2oSwEM/1Wv8XJ6xKcu/Qxtjo3eUWMnGlsg16N7inHQwA7+d1EMh
         Htj1FuA9HvqVBzKhLi3i4eu8VV8vrSVJdu/Ngn+M26uZ7MYJrKqhVstCCBJZ5dPJGHwD
         31vWvcnWOqGvWmgeHyVXHQikvHbD7q15zpwYZGSPZa+u7UCx7iSIoAdBSYtaqOuyMf+X
         R0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680576535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvGC0vJU8UTE+JaOZYTd1ugvwGmwWLrdOy8xNdtaEMQ=;
        b=nzUCiK5apa6+7vfq7Bmpt/Kym25HXe5XYL/fT/ek7s5NyY0WYufQ4vjaoCaMHpyzfe
         90X0Dv+9L0Gk2opwxJv/DlBIRMygVH98oQIdsXOq5PIVuBvDSwBAaq15cZK51ncHeVMV
         zF8rZPCKx37Y0KeahQjWkYyunAcGnDhEH70HezCgSXXvIaQ9MW8P0fqO4Ckii92tAwNb
         8qYb/AIHhMWNXPpsyPVlR7s2kQ7QmdioWGfO6maf0FoygzlOl5LU608Bs6EBRYLUKQFM
         SvHPSl2rpFWJYLqd3NLMWNcdQDGuGtcJgkyPHdJkmREwnnAm4Jn943ECMVUCgA3c82JG
         sWng==
X-Gm-Message-State: AAQBX9chTEr553sAC8D4XdzCDhuo+QDDiRIOwuzcvuBp+wkmAs8T1hTC
        ncHBdRIQRJCUD0yHya1Ge//lxTQrlcI=
X-Google-Smtp-Source: AKy350ZmbZ14wJR5tCfhBv3lL0gMamQYSe9nL4j8Jj+0LT/9NvQbvKHHYE+QQJgG8Ld0hOR//17eZQ==
X-Received: by 2002:a17:903:2441:b0:1a2:7462:d674 with SMTP id l1-20020a170903244100b001a27462d674mr19155157pls.24.1680576535177;
        Mon, 03 Apr 2023 19:48:55 -0700 (PDT)
Received: from xavier.lan ([2607:fa18:92fe:92b::2a2])
        by smtp.gmail.com with ESMTPSA id a11-20020a63e84b000000b00502fd70b0bdsm6706896pgk.52.2023.04.03.19.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:48:54 -0700 (PDT)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, jkosina@suse.cz
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH] HID: apple: Set the tilde quirk flag on the Geyser 3
Date:   Mon,  3 Apr 2023 20:48:29 -0600
Message-Id: <20230404024829.13982-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I was finally able to obtain a MacBook1,1 to test and I've now confirmed
that it has the tilde key quirk as well:

Product    Model  Year  System      CPU    Shape  Labels     Country  Quirky
============================================================================
05ac:0218  A1181  2006  MacBook1,1  T2500  ISO    British    13       Yes

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
It's probably too late to squash this into my previous patch, but you
can if you want.
---
 drivers/hid/hid-apple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 5c145775482b..e2c73a78b597 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -875,7 +875,8 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER3_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER3_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER3_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
 			APPLE_RDESC_JIS },
-- 
2.40.0

