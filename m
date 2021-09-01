Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA73E3FE669
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbhIAXnz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXnz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:55 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EC7C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:57 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id e18so158304qvo.1
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P4mnv4mKaYqfcyDMUP/alFM9ejG5VpdGlEGHvJ5ub0g=;
        b=jMklQV/6VsRZodnBUENT32FH2LhWqiwg1nrx1nsrAXM9FdmxKXh44aed+KqZQGH5qI
         S56ADutnC62nFPa5b3KBjo5zbXqbbTvP3jN6zgCqQiQxHUqT82Kjb53b/6PLzx3DXL2+
         QSFVtsP1T2+eLBOJUtLG02ErhBQjYnOmJUCKJpw7uSQVjEvBHTY+gsdD6mQLw5VH6m4T
         uHOiw76V9rLy19Gc1X/tWqw0GeO9Dkhrg/nls/5mEE5YkJG19BdkqtpMozStXOG3q9N2
         bW+/Um317dRb1IRwK5iteRy69o7POG1m5tFQ2dRYjxYkMYuoxW8YLXj+6fBrbC93cxf6
         Eddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P4mnv4mKaYqfcyDMUP/alFM9ejG5VpdGlEGHvJ5ub0g=;
        b=HRggkPsqakqHjG4z0PHUjAnm7nk71ub4a3fHmC0rbqKPvWzsWFOeYSY9RtG95vrLwH
         drB1noJEGoahYFP3M+7rYjvIKDnxJwwI8byGC711BsWKW3nHrhH2ZyF6EhhuThecJLDp
         vN9y0wjQqowhDmp36FzK8oy7jbTnkmZz6mcQIRDR0lWrSwFac9LKGfSzqb+75u3b46uw
         xQ96qGp0VNzPgdmDt3W95h2mfR8dYnII1SHkiHbR/XgRCes/i3ZLLVgGGu+iQgL/1t8Q
         8R2+0WZrVSv6sqwBiKu9QaVjKbe+Mrj9LnxDM/VpL+Wn/XBttbHBzNF3meU+8LuTKQCP
         c1GA==
X-Gm-Message-State: AOAM531pLie6iqhBzzvV48exwxKkCl84CbxJ71V+y+FPt9HGK5cSoOq8
        HXD68njj+dwLeh/Sic6H3oA8ii/++AY=
X-Google-Smtp-Source: ABdhPJw0qsy6LISRk2B9ciopyhoNVvRg9p3nebPkAoq+ywdxhw7U3kjaFjWZqzw2+QmD+PBs5mOKEw==
X-Received: by 2002:a05:6214:38c:: with SMTP id l12mr121958qvy.57.1630539776713;
        Wed, 01 Sep 2021 16:42:56 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:55 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 09/16] HID: nintendo: patch hw version for userspace HID mappings
Date:   Wed,  1 Sep 2021 19:42:29 -0400
Message-Id: <20210901234236.3113-10-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
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
2.33.0

