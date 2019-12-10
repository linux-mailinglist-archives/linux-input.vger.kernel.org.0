Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B293A118675
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 12:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfLJLh4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 06:37:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46403 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbfLJLhz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 06:37:55 -0500
Received: by mail-lj1-f195.google.com with SMTP id z17so19422577ljk.13;
        Tue, 10 Dec 2019 03:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnAjIRm8SkZt82a6IZa+nqu/H+3MFQ2/VQwVjJgBPlk=;
        b=D76ZoydOozLVU1dlzUaTBmu/aiVkOE8bVPjlgLBGkXSC8lIp1jKwIX22w9Y5qWJZ4K
         A0XeOWCCDVQbJel5S2Uipef2TtVs08vdNm7K4I9jZooLuIP3o2imlJ6w4mh3yU+/8sau
         j0Y3tDTgwWxVRjJ23jROz9wJ8pdtS0oHgnu1eWwG7nZK/cJKLkvH7SnollXpvWj2ypuv
         qpy9FoDiIJ/6nT7lSUjI0YU4uhc1DVh5aB+h2550MIdn6cIbTx6XfNSMyTNrFVbZ3E6l
         z/vp7z3e5qqAX7VIwDf6OLjHoJbmtr98e0f9TiHSfltR7B1mRJ18VuXzXmK5lU3UOk82
         vF6A==
X-Gm-Message-State: APjAAAVoz+UAcDIQajuonS+zaLf8YxMtLx6D1VvSVdkBs4XLzd4/CWIV
        SWYutFAWUM1KaC2WhRatV8g=
X-Google-Smtp-Source: APXvYqyoRA7zMtHIgITzo6HTBEJt5wOrrIL1Np5LvhalZ6iLRNxgTNgR1UhmzwiPQuNbWDN+9KJjkg==
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr17342392ljh.192.1575977873213;
        Tue, 10 Dec 2019 03:37:53 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id v7sm1394045lfa.10.2019.12.10.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 03:37:51 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iedpu-000144-6o; Tue, 10 Dec 2019 12:37:50 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/7] Input: gtco: fix extra-descriptor debug message
Date:   Tue, 10 Dec 2019 12:37:35 +0100
Message-Id: <20191210113737.4016-6-johan@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210113737.4016-1-johan@kernel.org>
References: <20191210113737.4016-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make sure to use the current altsetting when printing size of any extra
descriptors of the interface.

Also fix the s/endpoint/interface/ mixup in the message itself.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/input/tablet/gtco.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/tablet/gtco.c b/drivers/input/tablet/gtco.c
index 799c94dda651..eef5946a6ba4 100644
--- a/drivers/input/tablet/gtco.c
+++ b/drivers/input/tablet/gtco.c
@@ -892,7 +892,8 @@ static int gtco_probe(struct usb_interface *usbinterface,
 	if (usb_endpoint_xfer_int(endpoint))
 		dev_dbg(&usbinterface->dev, "endpoint: we have interrupt endpoint\n");
 
-	dev_dbg(&usbinterface->dev, "endpoint extra len:%d\n", usbinterface->altsetting[0].extralen);
+	dev_dbg(&usbinterface->dev, "interface extra len:%d\n",
+		usbinterface->cur_altsetting->extralen);
 
 	/*
 	 * Find the HID descriptor so we can find out the size of the
-- 
2.24.0

