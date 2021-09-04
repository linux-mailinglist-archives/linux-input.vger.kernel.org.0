Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A783400CFE
	for <lists+linux-input@lfdr.de>; Sat,  4 Sep 2021 22:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbhIDVAA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Sep 2021 17:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbhIDVAA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Sep 2021 17:00:00 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10684C061575
        for <linux-input@vger.kernel.org>; Sat,  4 Sep 2021 13:58:58 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id m9so3761238wrb.1
        for <linux-input@vger.kernel.org>; Sat, 04 Sep 2021 13:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w4Cy4bsZ5pIXkjgn3tK9OlJpX7Tu5L+yX6d0DjsJAsI=;
        b=FW103qtC4u6DH7XHYys1fi4BGQhxxVb3JrdKBtJaNuYzllrpYocge/kqYDacKCIAOn
         Vxi5T40TzMEyYWj1NdWAJC/uZzQrqBCGE4GGTujhqbQf1LqHzBj/B3cK31X/L4CTPwiR
         BlWxlLsFF8sHLcvRXBGbTDDg2nuUZBhDfyF2fkSxbyDHn6fFO0lpZY862Apt/csab1dL
         66907K/W1vQMSMdlE2eXQpYbugHY5NYq1+d0JBfMp0Ep8R+itknLjsrfa0Q2rJcMMQmg
         VoisAwf3Pu4q8RFVxBsY5K/ic6KpidVBtXJ8zEus1XjPQMWoNimVkArcyQpRyQF2hFA0
         x9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w4Cy4bsZ5pIXkjgn3tK9OlJpX7Tu5L+yX6d0DjsJAsI=;
        b=iTzOUgXBZ4wHO1tThMFYG58HRtMAVahBOyF/CyKFdn5hOLrZc2avXk4E3Zbina+qVk
         9N3CtsNouk9ImXTJX4rK3qsWmY5mJP+erhBdjRa21gqH+uGsSMWhlzGe7bmJcX/WCc4q
         +zNCRt8JQ30P3eD56vkpvYS3jACa1uP2BAuS4FespKY6/iYkO8atxEpz+F0FY9Pux+S8
         xJQf/3aW87adYf3LFxqiVlqKTfd/dPkrV2EL/ggIPE+jzeEe7kAdtxwI/Uw2d8WSx/hd
         03110nictTx+L6OfR4hBGfJMOTEUWPXGjfnQL+VfqGW7hcUUef7psf2IHIVrwaYj1ztn
         l3kw==
X-Gm-Message-State: AOAM533WAs19isvrFnIl2NiyMM9Lhqjqw8GiSLLwtK1GErjcmOF15MfT
        /xN00l0KK1yUA4OV4o2QTA==
X-Google-Smtp-Source: ABdhPJwwn9aCLtjjtaI6jloQVQYsY+DPbx6aK3IHTH+m8xI5BRkaapuDLWhSXCk1FMgDOqdpsc+RAQ==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr5498844wrw.48.1630789136598;
        Sat, 04 Sep 2021 13:58:56 -0700 (PDT)
Received: from latitude-7275.home (2a01cb04006a0a0002b56dfffe0174e6.ipv6.abo.wanadoo.fr. [2a01:cb04:6a:a00:2b5:6dff:fe01:74e6])
        by smtp.gmail.com with ESMTPSA id t7sm3452313wrq.90.2021.09.04.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 13:58:56 -0700 (PDT)
From:   =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= 
        <jerome.debretagne@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     jerome.debretagne@gmail.com,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: Add Dell Latitude 7275 battery quirk
Date:   Sat,  4 Sep 2021 22:58:40 +0200
Message-Id: <20210904205840.78242-1-jerome.debretagne@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Wacom touchscreen/digitizer in the Dell Latitude 7275
mistakenly reports having a battery, add a quirk to ignore it.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 drivers/hid/wacom_wac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 81ba642adcb7..4d4503cbe308 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -3574,6 +3574,13 @@ void wacom_setup_device_quirks(struct wacom *wacom)
 		__clear_bit(MSC_SERIAL, wacom_wac->pen_input->mscbit);
 		__clear_bit(EV_MSC, wacom_wac->pen_input->evbit);
 	}
+
+	/*
+	 * The Wacom touchscreen/digitizer in the Dell Latitude 7275 mistakenly
+	 * reports having a battery, let's ignore it.
+	 */
+	if (wacom->hdev->product == 0x4804)
+		features->quirks &= ~WACOM_QUIRK_BATTERY;
 }
 
 int wacom_setup_pen_input_capabilities(struct input_dev *input_dev,
-- 
2.30.2

