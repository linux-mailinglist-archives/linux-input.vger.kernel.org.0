Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7E71AB141
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 21:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411790AbgDOTIU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 15:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1416889AbgDOS7z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 14:59:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1457C061A0C;
        Wed, 15 Apr 2020 11:59:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r24so4937660ljd.4;
        Wed, 15 Apr 2020 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+lgH9QEXgssaM2l+t80P4gQY7lGRB9KmgdYKNpUDs6o=;
        b=RMiUNy2eQfnY3aZ1nGyJOaQD/7k7Bhwn1NGMoOyEJsKa4Dymv7l733xXw82+YXBxa5
         HD6yD4dS4Z+0jafFk8nqJ1iSsMlCuurc1SHknGc8LLoMAG0DUHCD+HT5VkT/fxYJR8FB
         VYNOk1TiBTmJgkaMKCIsKYrqvW5Ji3Ylf7ChsI4Fkwur0oMWK50q9lTSGkDh7cD+LIku
         EmX9Br2zCpDM1EJoYRUcSSJ4RUDIYOzz4GSedf981nT6k1uKWu3szryS3s0QMsFLTi/v
         +e2K6gHcbglGR83H5vK0u7yOLotn+3eQVvPc3OSteP/AlFXOqV9pIftX5yYP2T05AcHJ
         UXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+lgH9QEXgssaM2l+t80P4gQY7lGRB9KmgdYKNpUDs6o=;
        b=Y+LHiMUxc1H7ciybuDnfp1BEWspq6Rr92Ci7jt+8rU8B3zhTmrrQn9d1STP3Vm7GUO
         0jbQlI04ns344t5OLgLqkrO6zTIZDoTRpR5RmzCHOM+D1H9E0GoyRZtOn2zbwvbbbV91
         U2ZlJ+Vv1HGFk+RLRUY4eK6GKt6x48qpsFegFzpO3CYvN38hXRv+pThPwXIXnUJH0CJL
         hyIwG++edGDajOvdjcJYg4Txmy0w1hLCTpkRMjTYxdWbTsxbcPYIl7xeFkd3Qs1K8JUc
         oHBZ/IW1j8Wt3CUWyxzmGpMqHEHjADozvKuITUIBz91hjHN4W+MvXEWZmR24KZ+2xA3S
         cifA==
X-Gm-Message-State: AGi0PuZCUqpYpzO691ufQ+UxaJyxSSN9SHt+J7xLpl7XZXS7aceepuuw
        kNuNV6CfuuytA9T2cRf+VZVUDTnk8/Q=
X-Google-Smtp-Source: APiQypKqiBElG3N9BOEElUArPJ2omb4ABpniF0/8hznTgBZEpfd2Ezm81K98PyMO3KRWjDby9/KL2Q==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr4201151lji.16.1586977193345;
        Wed, 15 Apr 2020 11:59:53 -0700 (PDT)
Received: from luk-pc.lan (host-46-186-7-151.dynamic.mm.pl. [46.186.7.151])
        by smtp.googlemail.com with ESMTPSA id z9sm17026303lfd.9.2020.04.15.11.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 11:59:52 -0700 (PDT)
From:   LuK1337 <priv.luk@gmail.com>
Cc:     LuK1337 <priv.luk@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: xpad - Update xboxone fw2015 init packet
Date:   Wed, 15 Apr 2020 20:59:40 +0200
Message-Id: <20200415185941.388910-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Appending { 0x05, 0x20, 0x02, 0x0f, 0x06 } to
xboxone_fw2015_init fixes an issue where the
controller is somewhat stuck in bluetooth
mode until you plug it into Windows PC.

Signed-off-by: LuK1337 <priv.luk@gmail.com>
---
 drivers/input/joystick/xpad.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 6b40a1c68f9f..894fa81f717a 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -455,7 +455,8 @@ struct xboxone_init_packet {
  * or later firmware installed (or present from the factory).
  */
 static const u8 xboxone_fw2015_init[] = {
-	0x05, 0x20, 0x00, 0x01, 0x00
+	0x05, 0x20, 0x00, 0x01, 0x00,
+	0x05, 0x20, 0x02, 0x0f, 0x06
 };
 
 /*
-- 
2.26.0

