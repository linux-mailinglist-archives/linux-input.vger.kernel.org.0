Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0590B11868B
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 12:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727374AbfLJLi0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 06:38:26 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44783 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfLJLhx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 06:37:53 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so13397047lfa.11;
        Tue, 10 Dec 2019 03:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Vzfb7uq16SGhOTeNCkEKm8i/+IfT4zo8B8umjQrP2Q=;
        b=IDeMRsaa2bRO7A7b+lJmCIhd/DU1eXrvM2dFtJAreR/LxuZudurpQzsLi2aXTp+x9G
         TqlXr+s8hVvX2kqm7ay5Me3z112brDlAKgOCGxicWyX6hbIuf3cVerUFuaPaAo3pj/1V
         SipM4rnkamrOhBFGEf9yeL0hqAfsV8Buekc3HWz4XX4SKSoCpBveY+uHIeF1VsE21Egm
         BkV2Uz/MhLkRtLmgefHnKEq375+QlmJmtiVl0plMOB5wy6GDubsbsyA0GsU2aPv9fboD
         Lh3X2yX6QMDAz7BcUCm2KDKdZVVanapswk+BKNw4PzTgtkjRG1i0muqEJTzHmdiyVsOv
         z62Q==
X-Gm-Message-State: APjAAAWG0IgexfTE4jX+o6GI0k0yBmjwjyfx6i35VkabOOgXWpQHSwK4
        WsbX3FO5I1SblzE8DKSEW9KcC85e
X-Google-Smtp-Source: APXvYqxkYaor8ZxGswMpVmxWvaZhxt0v514WJ5beneZnfPx7VLTil1pUVT4+cYcZwGtAESyfBdx7og==
X-Received: by 2002:a19:7401:: with SMTP id v1mr18239687lfe.129.1575977871028;
        Tue, 10 Dec 2019 03:37:51 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id g6sm1623983lja.10.2019.12.10.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 03:37:48 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iedpu-00013s-0a; Tue, 10 Dec 2019 12:37:50 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/7] Input: aiptek: use descriptors of current altsetting
Date:   Tue, 10 Dec 2019 12:37:33 +0100
Message-Id: <20191210113737.4016-4-johan@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210113737.4016-1-johan@kernel.org>
References: <20191210113737.4016-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make sure to always use the descriptors of the current alternate setting
to avoid future issues when accessing fields that may differ between
settings.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/input/tablet/aiptek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 06d0ffef4a17..e08b0ef078e8 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1713,7 +1713,7 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	aiptek->inputdev = inputdev;
 	aiptek->intf = intf;
-	aiptek->ifnum = intf->altsetting[0].desc.bInterfaceNumber;
+	aiptek->ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
 	aiptek->inDelay = 0;
 	aiptek->endDelay = 0;
 	aiptek->previousJitterable = 0;
-- 
2.24.0

