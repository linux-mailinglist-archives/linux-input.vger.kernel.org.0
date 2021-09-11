Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51604079F6
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232985AbhIKRiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbhIKRiP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:15 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FF0C061756
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:02 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id bk29so5797471qkb.8
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czpR2U/8SvztuRjNgqTIyIRpRJzK2hatecEATnWUBi0=;
        b=oXHB5dUZElbZSaEcK5w6HDwpU537VEiJOejy1DrvYJOSJtpwrMuOKgx0Gh+ZXtfMXs
         X4gMra6Fc8vs7Ywqpi8TXiQduitfTBlP/04X9PVankmdpooecJazfUbXD2YTmuVRFdRY
         g4AFRSWnCJR8hYzxrLj3A4qjI/L9tG7izi0hJPWz3LgXgIsG0i1kqMLh+QfVEiZgJAay
         ejl1diYLPoAyHyjeOXpYrSD7CEe9yHqm9Xq1BREJDf2C3seKuP6QXg9NesVrjdN9532a
         j27xiBhrJqKkPkSlqGyeqek9/eT5slduXLNIPBxNACmGdbTXToqT+EWOpjjskEWTVwMB
         dJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czpR2U/8SvztuRjNgqTIyIRpRJzK2hatecEATnWUBi0=;
        b=XZoMshtvjLsFe7Kuw2I7PEGf76kYoBGfZ+zr3/5jAtAD1bvQkUr2nSyJ4D6zjkjG8s
         Xm8sU+vipj2U2HIqvthzhZnOy0bGmu/EE4GK0TbBLAfujOhFnwNi0C8oQS6oU6R51Oib
         xUi2x8RhdNPfQAz34etdTortQrFdMXk2ZGW065L1mfI6rIcD9uIwyW1qUk3RR3BweqCZ
         2q1PEJPoto9ylQiplZv8d36+sSO9ZNtla8g5WfX7asKMxx9wgzIHdGsCmigE8Ipd+DdX
         vRHEX9JoXB919oZIC4FqcQ4ZcPqwLSjW0nEZ0RtO1RtA5mbf/XqcCdoHV/LUI/Y7PcEM
         9UxQ==
X-Gm-Message-State: AOAM530oFXhBqDQZsj/9jbex5e9TLIjeg/ABgTYVHtO67PDpQ4UWWm7D
        9XtFGgIAahtiaMeDZra+WEga6AlxGYDM/g==
X-Google-Smtp-Source: ABdhPJzHKvMAY4NZ7/ljFr9tcjt5gCYKZ9tA/H0BsrQnzUGZPSErmh8rXs1GuIyAUSwQyJjt7NdRuQ==
X-Received: by 2002:a37:c97:: with SMTP id 145mr2836001qkm.121.1631381821414;
        Sat, 11 Sep 2021 10:37:01 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:37:01 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 09/16] HID: nintendo: patch hw version for userspace HID mappings
Date:   Sat, 11 Sep 2021 13:36:32 -0400
Message-Id: <20210911173639.5688-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
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
index cda0118ebd14b..ed9cf7b373067 100644
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
2.33.0

