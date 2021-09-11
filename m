Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAD54078CA
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 16:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236106AbhIKO2D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 10:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235788AbhIKO2D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 10:28:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D56FC061574;
        Sat, 11 Sep 2021 07:26:50 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y6so8318234lje.2;
        Sat, 11 Sep 2021 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7v0xGUniRMAaLr5lnK8CuaUQYawKvoIYmd2gIBcaU8w=;
        b=DXVHx9Ch4GQl3SqaD9yGddqbiM7H1G2aMzd62ek8lJkaN5JBIUQ85tfzz7gmG0D1xj
         OD698JWAnE2we7+ltmGMMuBgwLqZ22p9NzAsEBdlVkvyBkVJO1kp3Y7QSzT+6nX2KP4T
         /S9cU9VYkU93GrWJgp1VtFhyy0n5RwvxDLBW3qrLfpb8aRpR+vZsa9/XyixlHHE7fwR6
         Ro+Y49acX+sAf5SM1ghQtklZ5jylOHbr2Zcv1vc6Wy3y4VSoMEkAtuE1proAus/RV93O
         k0FpjNCLfTbmuX0Mt/j3848XiERpBvJowUXf6t6UDSs/YR0k/yNcsLsxJrkU1ErAvKrY
         Oj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7v0xGUniRMAaLr5lnK8CuaUQYawKvoIYmd2gIBcaU8w=;
        b=3jE7ykOnNdHjY0r+9vAwZcJxyWKETAPK9dzg+8C00tMlOoIGUBQ67gcSOADk1iPYSq
         rzSg+6tDd3TMqfpsVbAggDvSC2mcRl64+jzyOuYTfKHQIYzDnk7PU2iTxRrHcJAyVtQ3
         9AK/UP2b2XhQtKfIVszJeV6aLE+QGQLUmdditSbDZ0AO0gJINm88ZoISxlxKCbNPCAWz
         tXLBT6JvUFIoaKSJFRoHrVGOhgzExsmneCp701vA+EJGd4Z+vUOwF5Jb7zDXlouX1bhk
         OuBX4IbP89pXo13wJSuuMVYznjIVnSKGiMPjSdBlB2vj3F1tnst+UAThobco/HY6SisN
         hNaA==
X-Gm-Message-State: AOAM531Lasbx5eons6w1MDPcFLjvtRKqf+B0l3IxJC/8P/3ZF/SgxexA
        TSMhLMDo1Pj12ill7xzLdho=
X-Google-Smtp-Source: ABdhPJwu1a7QK+Cej5JPCogd0/gmbdv2NXDIOQTD4QJ/R/z9s9TAFMjY/sfPiYgtOF7ImaEKRSMnjQ==
X-Received: by 2002:a2e:2406:: with SMTP id k6mr2443781ljk.258.1631370408900;
        Sat, 11 Sep 2021 07:26:48 -0700 (PDT)
Received: from DESKTOP-5EKDQDN.localdomain (78-63-10-115.static.zebra.lt. [78.63.10.115])
        by smtp.gmail.com with ESMTPSA id u17sm210522ljk.124.2021.09.11.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 07:26:48 -0700 (PDT)
From:   =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: [PATCH] HID: plantronics: Fix bare use of 'unsigned'
Date:   Sat, 11 Sep 2021 17:26:43 +0300
Message-Id: <20210911142643.201-1-aldas60@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix checkpatch warning: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Aldas Taraškevičius <aldas60@gmail.com>
---
 drivers/hid/hid-plantronics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index e81b7cec2d12..4aae7569e353 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -143,7 +143,7 @@ static int plantronics_event(struct hid_device *hdev, struct hid_field *field,
 
 static unsigned long plantronics_device_type(struct hid_device *hdev)
 {
-	unsigned i, col_page;
+	unsigned int i, col_page;
 	unsigned long plt_type = hdev->product;
 
 	/* multi-HID interfaces? - plt_type is PID */
-- 
2.33.0

