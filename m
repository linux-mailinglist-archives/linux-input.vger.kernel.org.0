Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 248D71687FD
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 20:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgBUT7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Feb 2020 14:59:03 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:34549 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgBUT7D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Feb 2020 14:59:03 -0500
Received: by mail-io1-f66.google.com with SMTP id 13so3109711iou.1
        for <linux-input@vger.kernel.org>; Fri, 21 Feb 2020 11:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NRrEVxvrKc4/Fqifuc+Sp8knWZluEXtf6yc5hXYpKu8=;
        b=qusoL5slAs1sNH/ArWc86U3aLG07AWdAlbiy7e1oaWoYX80lSDxj2/fjT65KqG2m7E
         aK2Yeob3NutN4qveoVpL4XwE15J/HQ5yZBRVb3zzmmd/I1EPj136Enj0JMzmQCntdc1A
         A5dHR0dILIR5KW9sUrw6RLj6Nj+AlOUJjALJfm+Re6wipfUY75BDJ9q9XtEEmGGn9bK2
         d0NMskQn6T9L/tyOfhWMrZhlJ/4T89Z4+E7eDwblDxfCPu6iQ4ElbhvUkjXA+d6luJQ6
         Qi8gNlQBNB1zuoa8xsVmvf+c8KSXN+uMLUjmuWTio3lQJEifHOvgtc3Q2f41p6hDgi7z
         LwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NRrEVxvrKc4/Fqifuc+Sp8knWZluEXtf6yc5hXYpKu8=;
        b=GmIZH948onlz4aX7toEoASUmhncOdUKGNw5lr/hE+wSSLbBj3dSz3MUVoJm6P5MKyZ
         znQ5Xi8t90ML1vBzHZ8QihvkB8FvJCAwRb9UG3CgMvLZnkdtLOpttFhKUgZDzF417T0L
         CTGbrWHJdMLZjjkT8UQokGKOSu2Xsia1G3KTcYzf0eP/U6ayqxv6ylWka9bUbSRu+c5b
         6DjvQhYOdSWsFL3JFtpGDi7OHoZiI4yaX4ajNb6GtSJpuaryXZ32ytryqp08iliWlvOO
         A3aWMiHtsaMWizrw5hpo+aldwG1sJQqbuphlwwp9HVvtGKe7/VKaPZMk/URVoI2V0aOW
         s0NQ==
X-Gm-Message-State: APjAAAXYlOqE4JNoQrXxz7/516O741eAIqYWDS5GrxPCw6BSv/nAsHFd
        MymvefzEnp9nzxZIbUQSP37alK7a
X-Google-Smtp-Source: APXvYqxUSYnX8YdgodlTUDLIVrvzc2txYk/iktGrHDZDw+4wsbH1HpAqxV98WKHCVE3MPWpv8ZGWXg==
X-Received: by 2002:a02:9503:: with SMTP id y3mr24727870jah.14.1582315141824;
        Fri, 21 Feb 2020 11:59:01 -0800 (PST)
Received: from james-x399.localdomain (71-33-129-6.hlrn.qwest.net. [71.33.129.6])
        by smtp.gmail.com with ESMTPSA id x10sm934833ioh.11.2020.02.21.11.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 11:59:01 -0800 (PST)
From:   James Hilliard <james.hilliard1@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Lars Poeschel <poeschel@lemonage.de>,
        Ondrej Zary <linux@rainbow-software.org>,
        James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 1/1] Input: usbtouchscreen - add support for BonXeon TP
Date:   Fri, 21 Feb 2020 12:58:20 -0700
Message-Id: <20200221195820.102457-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Based on available information this uses the singletouch irtouch
protocol.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 16d70201de4a..397cb1d3f481 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -182,6 +182,7 @@ static const struct usb_device_id usbtouch_devices[] = {
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
+	{USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
 	{USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
 	{USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
 	{USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
-- 
2.20.1

