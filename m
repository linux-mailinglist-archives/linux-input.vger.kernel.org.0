Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58845105ACE
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2019 21:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfKUUBw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Nov 2019 15:01:52 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:44762 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKUUBw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Nov 2019 15:01:52 -0500
Received: by mail-io1-f66.google.com with SMTP id j20so4904556ioo.11;
        Thu, 21 Nov 2019 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rOmH3IkFiobKKU+Q/feAayZYHdai52igReX70qg+gYE=;
        b=Pkn6aKl+w2F/4W4un9JplmQINi9hUxgN3ulz9BeV2mYLZwYmmy3/4F2GNgMhLCgb4C
         iNIxcRU05FyXNePWc6xFKVjKK6caR/7ASrm98m4yvrvrFll7l98z0k4sv9O6ta2SuYwc
         LhGzSw+UeaS6flIHGG86BmhS6hvKyDJbz3rb1LljkPg1x5n168jnDDXE4tTr8WbweOED
         B2YSJeXG7kPFDnSGOW8lUUw/uX0JgIJw1TY+TG7PqAhe0FSBTMZuVjY6i2Hvx7fy3E/O
         r0rhjLtutKw89488lYWyUDw2GkO9oq9y+jalruaXI9GZ9cTkP7TJFmonSSchunDi+/og
         ERUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rOmH3IkFiobKKU+Q/feAayZYHdai52igReX70qg+gYE=;
        b=skjF/K/MsVcXp/kC2t4AjvM6DZkCWG0/L95GT6zXpTjcfZQHujqz2qtsSi6iVUuL+F
         F98gkTuTqnNQdQMQMEfraWNNGGUnv/a8C48V+vSZiPUeudEeESep3RlvsfysWxgskkua
         cAJZnz30ylbaf7PHh6t8kAg5z/XFAixvwTbIRQFuA9tStmxHUZ+8XqiiVCxljC7CRBTO
         zJu9bm4t4j0VGUZSq8QoyGh1Qaa6B/+atEJ+HjD+gmpbrmY7/V6IXVy28p5IVApKi2WB
         UBB1axqTHElz4jBgo+8RMj+Tf5rgua93tC60+m6fZIK2Ee3/uXGIgZyumM7ZwgrbCKM2
         bx1g==
X-Gm-Message-State: APjAAAX37jY9fjWi7+Ymv6vE3ghwYv637al4uxgwSVTXsTvGk9ynyBkQ
        NEuerT04u232dQqpUPOKhu8=
X-Google-Smtp-Source: APXvYqx9jFfSqAigK82tMwe3Y1OBiuxOZ/i4AZSb8Bg5tDVPCEUNkWSBtNH/yxRy2y5SgEukgtiDFA==
X-Received: by 2002:a6b:8b89:: with SMTP id n131mr9266482iod.55.1574366509170;
        Thu, 21 Nov 2019 12:01:49 -0800 (PST)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id t18sm1288157ioc.41.2019.11.21.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 12:01:48 -0800 (PST)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu
Subject: [PATCH] Input: Fix memory leak in psxpad_spi_probe
Date:   Thu, 21 Nov 2019 14:01:11 -0600
Message-Id: <20191121200115.24846-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the implementation of psxpad_spi_probe() the allocated memory for
pdev is leaked if psxpad_spi_init_ff() or input_register_polled_device()
fail. The solution is using device managed allocation, like the one used
for pad. Perform the allocation using
devm_input_allocate_polled_device().

Fixes: 8be193c7b1f4 ("Input: add support for PlayStation 1/2 joypads connected via SPI")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/input/joystick/psxpad-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/psxpad-spi.c b/drivers/input/joystick/psxpad-spi.c
index 7eee1b0e360f..99a6052500ca 100644
--- a/drivers/input/joystick/psxpad-spi.c
+++ b/drivers/input/joystick/psxpad-spi.c
@@ -292,7 +292,7 @@ static int psxpad_spi_probe(struct spi_device *spi)
 	if (!pad)
 		return -ENOMEM;
 
-	pdev = input_allocate_polled_device();
+	pdev = devm_input_allocate_polled_device(&spi->dev);
 	if (!pdev) {
 		dev_err(&spi->dev, "failed to allocate input device\n");
 		return -ENOMEM;
-- 
2.17.1

