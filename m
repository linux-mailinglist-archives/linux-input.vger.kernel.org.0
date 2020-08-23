Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E893424EB64
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgHWEmj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgHWEm3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:29 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA03DC061575
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:28 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id a65so4713891otc.8
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I75VHnKCnsj4GcNHVnPcKdSqnJ8rvRDJ1kriJis89vk=;
        b=WYbqcBjxL49EIWutYNrV1uNfbyleYTycfqOllzo8EiBCmSpjVnR0DD1c+ZJ/0CdPHL
         6iFrAtnC3l2Knpj5383bzpWNy+PC9PcOC3vTZa4WlNP6vbV8J4rrOveu3pZY8MM9x6d8
         A/vtUHsZYoOjMbvXoVY53oVw5JtYcapYSJFBqHTM+vj2LuQUq/firT46GVjLEMr4M76i
         ZMaX3pWPtsRYnpA4xWvr2kK/ciEEHMYmtz0ZtjaD3D+UTuuhmZS6sPtsQ6oBfH8z7I+f
         z1qSy7T61u5jnEsx0sFCU44BW0OkbwzdD6DP/yGiCYu2XLI1EZrXIbGkyAz8CQ/6gNYu
         3rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I75VHnKCnsj4GcNHVnPcKdSqnJ8rvRDJ1kriJis89vk=;
        b=a6EoNZY2gDztrqN9eRIMYuD/bQ3ZCpUBRGubTEC3fgpGvtX2kgR3gOU3CR/bk012UW
         tXGsbaoWoXmwaKCoRJ1SqEWlaNWvO1f/WcLRym9GSA5oIBpc92mytPG/ebrx5w6SGxVW
         /RuguhYJOZN4clAoIYc/bJSAO44XnVhzlEpEI62GwLMe9VvsBA/blgZTicgQnJABd3AN
         jrMoVkDjT8e0aFw4G4AaQSHZKIeEujCvtJkf7V0cVSIlihc3TvchziDiNO/L4UyZnPyV
         98ITLE/6a9kozAw9bTXccUPce/rotLzMZI06QcEXxe4AFvAKRraN3qpD+5wOOWGlLoh7
         GqRg==
X-Gm-Message-State: AOAM530wzKFWICLPZ9kuDnBRbEdoTvKKlo99Zp8JreCpKzJYxjAYl0n4
        Q3kNOSLIge3X9fEl2N5Oa0X6FHQ4+tzz1Q8J
X-Google-Smtp-Source: ABdhPJywH8RfbMh+PdNujnSin3j1IKeuXtTBEXgu2ilm5vpv+hclah4bWbUL7eM/uH72ezBSTcNvYA==
X-Received: by 2002:a05:6830:1d8e:: with SMTP id y14mr263748oti.129.1598157748183;
        Sat, 22 Aug 2020 21:42:28 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:27 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 09/14] HID: nintendo: patch hw version for userspace HID mappings
Date:   Sat, 22 Aug 2020 23:41:52 -0500
Message-Id: <20200823044157.339677-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index f2864fd9fc5d..c2f7dc83d875 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1423,6 +1423,15 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.28.0

