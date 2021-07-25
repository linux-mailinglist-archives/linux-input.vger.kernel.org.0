Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84C3D4B2E
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhGYCr0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhGYCrV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:21 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE802C06175F
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:52 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id jz6so3440233qvb.2
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNUisHbeArG8khBqOyWiHK7Ca+ng0Dvihs9FtU2mKxU=;
        b=jNGIbJyNK7hqWepM/39WgzsGQ7jYV/+5jzFwRLkJdN5tXzo2/mn3r+N1KybE9v+Jfn
         0d1riYfmMfntex35UkZJtE6az8HFk9B0+OaJ5OiDNrb20SsCyt15SSfZ1ShL6Mc9LOFn
         JTZf2Mbb9e0d3Uhvqn2vIugldtmAb9rA5YGkmjFwC71O5ouUItMi1C/hHHOA1yzMpHLK
         Szo8YYvWHZ0xP8f8hD3RqPSFmikmBrAWNUagLGFo3Zl8hf90bzw5dyV0ycUqVy0FEtBi
         xw7G7VcYr6IGRWV0fzPRAvZxRDfLxwGkN+fm1X26z2kItZaJ3mSPwVWWAMrs/llPMsKV
         xFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNUisHbeArG8khBqOyWiHK7Ca+ng0Dvihs9FtU2mKxU=;
        b=JIHtl7L2qrtBeVTcOkIN801Hyy2RAXaBGtBtWv2i6fjPNq0Wy6SLEaAMWTynYH9LCi
         qy65mE/y547nXiT0LrZqfvodbjlmAY1MAwUWWUb1Xi1foi3gNzvNQC+hYJ9M9+3u0Evq
         oJ42KwMwL8eDD8u5tdVraflkCPaj+fV3rzGQx4xkANJoJEg7DxjfpezpjpJvp5U1loTI
         BRXT4/JXZjeEaigp1EaJf0Iwf+RqMQPp3+BNSd8Vda6PmvvZC/X65c1VkTeqb7T7gEvp
         ODHaxBNKXC2jkpQUuC1az3jdgaq0gOtk4GYgE+P6onKyzZk/mP2o9beHt0c3OnTWyE5y
         FUsw==
X-Gm-Message-State: AOAM533FH+ouumoCCRyVgIlZURhgZ9UeY4OO9aLflH6TJyuYmFbq5CLc
        FHR4XfXhuxCnATUOsm03J0XuPwC0PC9wArlC
X-Google-Smtp-Source: ABdhPJxr1uTXImEogMgBREwv0pkRtusALyFoq5wLxizByi0K9+Xy2Z/ZtP9mp8kTEU3Ey5+sx9fy+A==
X-Received: by 2002:a0c:f6c6:: with SMTP id d6mr12084488qvo.30.1627183671974;
        Sat, 24 Jul 2021 20:27:51 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:51 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 09/17] HID: nintendo: patch hw version for userspace HID mappings
Date:   Sat, 24 Jul 2021 23:27:00 -0400
Message-Id: <20210725032707.440071-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch sets the most significant bit of the hid hw version to allow
userspace to distinguish between this driver's input mappings vs. the
default hid mappings. This prevents breaking userspace applications that
use SDL2 for gamepad input, allowing them to distinguish the mappings
based on the version.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index c13fcd777fa21..f673a6903f04a 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1426,6 +1426,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_wq;
 	}
 
+	/*
+	 * Patch the hw version of pro controller/joycons, so applications can
+	 * distinguish between the default HID mappings and the mappings defined
+	 * by the Linux game controller spec. This is important for the SDL2
+	 * library, which has a game controller database, which uses device ids
+	 * in combination with version as a key.
+	 */
+	hdev->version |= 0x8000;
+
 	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
 	if (ret) {
 		hid_err(hdev, "HW start failed\n");
-- 
2.32.0

