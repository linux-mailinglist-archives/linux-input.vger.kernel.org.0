Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC58E3E4097
	for <lists+linux-input@lfdr.de>; Mon,  9 Aug 2021 08:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhHIG5Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Aug 2021 02:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhHIG5Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Aug 2021 02:57:24 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA6BC0613CF;
        Sun,  8 Aug 2021 23:57:04 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id a8so26371971pjk.4;
        Sun, 08 Aug 2021 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=80wlNqNIK3rm/8+pkiE58zByD6Mf+pJ36D0ZNxRacZE=;
        b=cI069qXxprc/9WM9pCWg33P6EJug9d0txqoro94MkeVa7iNilR7p6MkZXZuelotYw2
         e9ce2biMwTTNYYrRa6PPDpscr6CXyM0xnUgS1PjFu76YfI2sBqb31LdYYP+GT668FKC9
         5u2FDqlDUMBiOzjuM3AiQ0Sc8bs3X9pNb6+7u6YLphuMpHB8h20ZMfAowpFeCDFEW4uM
         v3g9xxf8nSgZQJgHm1Z3vL7Wpl+bg/yQUL26N4wbUjUxX2iHdni2K6POB6ez8gtpDZeu
         hrGLR4np5qY1nDXoZz4FWSkTcXR7wvkqQWuCX8WV8Gk6Lna2vtM9oglRhDCqj0OcYPQF
         oOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=80wlNqNIK3rm/8+pkiE58zByD6Mf+pJ36D0ZNxRacZE=;
        b=MFn0Mmlsp7lp34aErucgsu1itARHzKlYQoyELy6nm6crjJq4kdCcuar3BiXVMko4Pv
         I2SqQJvOX4QV51dOrYpGNAyGQmZ5g78Apv3FM+2fzZwde6XKb0fc91DBSCthyhssmxu0
         wbWy/CUVcakoTWPTydaV1BVjG77yW64Rb+QMcymOD/UI1DTHwUGyoFco6/c12uNwNlA1
         TB7/h+Aq5wx6R3ptdt+/RiuqG19jjSNJ6XhZn9kHfBEpsrOn9gyHmUkRovMbSTiepxm1
         ghkQno0iziMWDy3LcLwIAbLFaIzfMiwNpbcwh3oO9YaGNzmyxdBr3aNqtQM8DkeL9Dw9
         mJKg==
X-Gm-Message-State: AOAM532flX0DiqK/frEF27gi08N0/D1fYeEULUsBdhaBo/GvaZ6Cpaz1
        TJt8KYqKXe/jx2S8D8QuUHQ=
X-Google-Smtp-Source: ABdhPJw4HUUwURvshZGQHRRxsOWzv5KojEIpJWfC4ivHQwxgTfc+3c8qselb+b0ga4kSoSlKKNel9Q==
X-Received: by 2002:a17:902:ed82:b029:ef:48c8:128e with SMTP id e2-20020a170902ed82b02900ef48c8128emr19169945plj.72.1628492223950;
        Sun, 08 Aug 2021 23:57:03 -0700 (PDT)
Received: from curtis.lan ([2601:602:9400:21ed:bb7a:44:1dde:b064])
        by smtp.gmail.com with ESMTPSA id b10sm18654597pfi.122.2021.08.08.23.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 23:57:03 -0700 (PDT)
From:   Jim Broadus <jbroadus@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        johnny.chuang.emc@gmail.com, kai.heng.feng@canonical.com,
        Jim Broadus <jbroadus@gmail.com>
Subject: [PATCH] HID: i2c-hid: Fix Elan touchpad regression
Date:   Sun,  8 Aug 2021 23:55:05 -0700
Message-Id: <20210809065505.6823-1-jbroadus@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A quirk was recently added for Elan devices that has same device match
as an entry earlier in the list. The i2c_hid_lookup_quirk function will
always return the last match in the list, so the new entry shadows the
old entry. The quirk in the previous entry, I2C_HID_QUIRK_BOGUS_IRQ,
silenced a flood of messages which have reappeared in the 5.13 kernel.

This change moves the two quirk flags into the same entry.

Fixes: ca66a6770bd9 (HID: i2c-hid: Skip ELAN power-on command after reset)
Signed-off-by: Jim Broadus <jbroadus@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 46474612e73c..517141138b00 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -171,8 +171,6 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_3118,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
-	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
-		 I2C_HID_QUIRK_BOGUS_IRQ },
 	{ USB_VENDOR_ID_ALPS_JP, HID_ANY_ID,
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ I2C_VENDOR_ID_SYNAPTICS, I2C_PRODUCT_ID_SYNAPTICS_SYNA2393,
@@ -183,7 +181,8 @@ static const struct i2c_hid_quirks {
 	 * Sending the wakeup after reset actually break ELAN touchscreen controller
 	 */
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
-		 I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET },
+		 I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET |
+		 I2C_HID_QUIRK_BOGUS_IRQ },
 	{ 0, 0 }
 };
 
-- 
2.31.1

