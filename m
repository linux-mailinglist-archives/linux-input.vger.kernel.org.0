Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2683118679
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 12:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfLJLh6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 06:37:58 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41080 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfLJLh4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 06:37:56 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so19462041ljc.8;
        Tue, 10 Dec 2019 03:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TGONKFKCYbqiEX3DExtl3ks0dQN/C/p6ASZk392VZQ8=;
        b=G9aBaRVQwJ53U7co8JCrRgSLKFmQwReSdtcxni0HBtBEeDCbPWLH1xhLVbhibxLSyR
         gjmxDMSZu6uOkFgCIXDhKDF/GqtfLQkU9df5FYSGPMJU10gANLkBfOMhdAf2kJDg5jtL
         vnf2XGDe2ldxd1qj8eRlZAGzmc2rsh5iHUY0tbjf5zgnMmZLz83XCeQLI1LLGZtonRmz
         bJ2AGRSFFO57kxUeEUoL5zBxhTBd8TMOEuJVcaA45dOWlFlfg6xzkTWMW5txyFDO8rGt
         /pDEiQw4li/r8OXdee7rTCOBGmdhW+CIrtJg9VLuRbuEhJ9gZc08KI6DZdmWl5Wr3z5l
         SHDw==
X-Gm-Message-State: APjAAAVowecMeoz773NYCWqs3mrpuBxL8RJFo6JbAWL4yfpVLZVrmemq
        MR6da7vIzZoyNB2izOnEGKtHxt2I
X-Google-Smtp-Source: APXvYqyqaOiuo38RmYodGLQPrNI3fRmPmtb0hrtSlb53u1NW3HrlEbQlCo1FtioTbrMd91nFnwnljA==
X-Received: by 2002:a2e:91c1:: with SMTP id u1mr20145358ljg.181.1575977874402;
        Tue, 10 Dec 2019 03:37:54 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id z7sm1698158lfa.81.2019.12.10.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 03:37:51 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iedpu-000149-9v; Tue, 10 Dec 2019 12:37:50 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/7] Input: gtco: drop redundant variable reinit
Date:   Tue, 10 Dec 2019 12:37:36 +0100
Message-Id: <20191210113737.4016-7-johan@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210113737.4016-1-johan@kernel.org>
References: <20191210113737.4016-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Drop the second, redundant reinitialisation of the endpoint-descriptor
pointer from probe.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/input/tablet/gtco.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/tablet/gtco.c b/drivers/input/tablet/gtco.c
index eef5946a6ba4..96d65575f75a 100644
--- a/drivers/input/tablet/gtco.c
+++ b/drivers/input/tablet/gtco.c
@@ -970,8 +970,6 @@ static int gtco_probe(struct usb_interface *usbinterface,
 	input_dev->dev.parent = &usbinterface->dev;
 
 	/* Setup the URB, it will be posted later on open of input device */
-	endpoint = &usbinterface->cur_altsetting->endpoint[0].desc;
-
 	usb_fill_int_urb(gtco->urbinfo,
 			 udev,
 			 usb_rcvintpipe(udev,
-- 
2.24.0

