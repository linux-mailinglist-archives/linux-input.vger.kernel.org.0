Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BB2319322
	for <lists+linux-input@lfdr.de>; Thu, 11 Feb 2021 20:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhBKTbh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 14:31:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhBKTbf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 14:31:35 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE32C061574
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 11:30:55 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id u11so3839967plg.13
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 11:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKk/FtFcJEM7ZyFSmOVQ8Ygrd1f+2kW93on5bwuV/n0=;
        b=Hqije6bsckt2AyLS/OE89jbP89xw9lwenY1iEjlL2pLnFPlm4gQz/l96gai74xKMcb
         DQsh849apPMwbXXP9Sa2AISnRjiMbu7XgXBz9owaK80hUUkhXSpcUD5+M1/5Zd6ZNYsU
         q0NSvmg7MwTrmBKaiFMUxcdcHIOIGDS8naoagmpznFAHSjmxhewmX4fF1rrefDd69hry
         kJts0ql7vR5IHvrIR5VCibQJpxjHfmNqqq5ogVvpc+KpS7HKT3S7r1Ckc7YC94heFQhi
         W3tSeSDzvCar/3InUYj6k0SI+6V4hjGBIY6lC4v7e0EAdVQsSBiQzRbHupOvJnqSJG6e
         ZU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKk/FtFcJEM7ZyFSmOVQ8Ygrd1f+2kW93on5bwuV/n0=;
        b=TSU/V66gmZW0u0r9g+wVJ9Z5BVQ6p4tPQx8yZ2AhMIpeukYui2WzuJGHAkMLhmFVJa
         BX8kyBGaRkLtWMr2rEobpo1HD5eR3VOluaBWMxmX6rIh9yGTlxY5Ie9DyV4ZV8Owx9he
         /JeVuMtMyZ1d2O2J9Q82xX3Ch+4ea724Q1i+btA5ROIdJUZxSkDEJ5/e8FH8Lddp9tw4
         5Q288UXu2/ggVnVWrA0ffhRdNvjFa/OJVy09ARezpjYspnh3Y1thpe5xMoSivFo3+g5W
         7QwyjGZUiaWUresxMjiu4SsSfMBjavJAZV8jlNwwNWYKxoRyBZGRhrZpoexUkfrAPv8c
         g/QA==
X-Gm-Message-State: AOAM53149gV4FmxQD/LkrSuqqLPnt54mWljVPAA6xAEvvHYi5RLRv2Dt
        pL0gRAlvy1pEH2CTzGqPtXMhmMaypEB3uw==
X-Google-Smtp-Source: ABdhPJwlxpSxc/BdVW3xF0YuPpnolfCCjSCW6pIcr8mr+8Ofw2vrvj/6nEolYxhqa8sHe2GACY7MIA==
X-Received: by 2002:a17:90a:d34b:: with SMTP id i11mr5272261pjx.235.1613071854971;
        Thu, 11 Feb 2021 11:30:54 -0800 (PST)
Received: from horus.lan (71-34-94-168.ptld.qwest.net. [71.34.94.168])
        by smtp.gmail.com with ESMTPSA id k24sm6327218pfg.40.2021.02.11.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 11:30:54 -0800 (PST)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: core: Remove excess whitespace around code block
Date:   Thu, 11 Feb 2021 11:30:52 -0800
Message-Id: <20210211193052.70219-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Correct whitespace error found by smatch:

    hid-core.c:2404 hid_add_device() warn: inconsistent indenting

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 56172fe6995c..ee6862203e3b 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2401,10 +2401,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.30.1

