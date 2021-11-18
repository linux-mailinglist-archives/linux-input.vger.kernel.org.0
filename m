Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3681455595
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 08:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243820AbhKRHdT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 02:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234915AbhKRHdO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 02:33:14 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4323EC061570;
        Wed, 17 Nov 2021 23:30:14 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so6849300wme.0;
        Wed, 17 Nov 2021 23:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zz16hoxFNUL9/2j/ZHbRnpxkMTT+L+SqX6y7m7bDB/o=;
        b=l2Gth+Rw5KsfepznuOoKH2sYG0avWFZMEk63ELPibg0v4zIH+8I2Ahg046CEpIGMSx
         dAQ1/l5n8p/gNnQfGIq2RK3EK7RWt56mxI0gK/8MkL1QKRrRIsxz7BXCt3BrsW/pt7Cz
         h7BfZgYABCsLovozH3fGYLyAdRsp723pJMvwKLx+Xa4VXfvEgfCZeCH9FtlDAaPOAIKC
         EMoPxbkBQh+YSdMZip7UMV7TxrVXUW3Jibtfu63ZlL/J/LPduzTg/c1C9UMqin9Xybaa
         N0Z8xMnPlRmsFkEOppObjvtuEISGzxWojtD4ZFG86oWczymYBUzrBebE7kvjOWDZM+mM
         XLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zz16hoxFNUL9/2j/ZHbRnpxkMTT+L+SqX6y7m7bDB/o=;
        b=2UGEHqda00tu9MNVHSt8noROPxj2hkkeBXR2FwNdOtd47DrmVlNqodmYcgBuStaVMR
         EZv0AKSFzUbzFR+sOvbXmUP5pojkQ0h3odibFwebwTU9AhGwk4/y4Q1X7XrTHaHytxVY
         biL2u8h5ptSJtxDOYfVtTXfaz953W+pPsv4x9RURFA6+rFnZCaiRW85gMg7zQsTJj9Gs
         tVgI/naq3+TQwwgsWiv5Os4zbqwFPOHnMh5XBGo3s0l0iUxID2d3Z1xC+IEnnJ5q0797
         cC+3hdqITTUZxmYd5xReamLDI3v3wKmF04B1xg3o/m8b9fspVgqIkChCyDi4uPX2qDfr
         sLWA==
X-Gm-Message-State: AOAM530FysJWJTsb+uWb2ywstewC5SpHwD+7RWtXfO8iCMNtn151VQ03
        EjsBPEE0VEVsnruxjE3cUq0kmgnqpHxGDA==
X-Google-Smtp-Source: ABdhPJy85Q65QmPUdq5UPuDUVS0u6EelCECSxMNEgxbdhOvs0osyFf745AXk68/j0fWUssINEC5MUg==
X-Received: by 2002:a1c:3b04:: with SMTP id i4mr7527986wma.126.1637220612824;
        Wed, 17 Nov 2021 23:30:12 -0800 (PST)
Received: from localhost.localdomain ([94.73.39.244])
        by smtp.gmail.com with ESMTPSA id p12sm2223438wro.33.2021.11.17.23.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 23:30:12 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, alexhenrie24@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/3] HID: apple: Do not reset quirks when the Fn key is not found
Date:   Thu, 18 Nov 2021 08:29:53 +0100
Message-Id: <20211118072955.29708-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When a keyboard without a function key is detected, instead of removing
all quirks, remove only the APPLE_HAS_FN quirk.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 2c9c5faa74a9..a4ca5ed00e5f 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -428,7 +428,7 @@ static int apple_input_configured(struct hid_device *hdev,
 
 	if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
 		hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling\n");
-		asc->quirks = 0;
+		asc->quirks &= ~APPLE_HAS_FN;
 	}
 
 	return 0;
-- 
2.25.1

