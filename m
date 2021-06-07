Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB46539E930
	for <lists+linux-input@lfdr.de>; Mon,  7 Jun 2021 23:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhFGVt1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Jun 2021 17:49:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:41794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230359AbhFGVt1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Jun 2021 17:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E3CC610A2;
        Mon,  7 Jun 2021 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623102455;
        bh=u9vV4UfWTCHytZo+SzuAh2oQSHhHNg5p38YQqfCxWwQ=;
        h=Date:From:To:Cc:Subject:From;
        b=WiZKHdJMtPxBhL13qPMSuBRAhBR2Hf3Qviq3aqd6IAOvL6SkOmFH2YKomQw+uxOdQ
         4Tj939BKh2m5IT3CLqNDvqNN1nszUE0yPXnE0YfNEDdlA15HB0PR/GM9B2huMAMvU3
         FwmM1aHhPi/o6gnyGT/KkOqokcnXu9pzF826UxuvVqcvcrKz72ZXEGFG+gRb+d2Lhb
         UpEGULB/vmt34geBCGAVsCusrXqYkABkiWH2QLOdXiT3oaOF81dZCK4gtwfzhjnSIb
         wUENc5BIXWdHmsUu3DwpT0IfF/KxDoimPCTZis5T+CdULelwOwJIGcgQvIV9y3Nhwt
         OMbRx7YMJTmjA==
Date:   Mon, 7 Jun 2021 16:48:52 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: [PATCH][next] Input: Fix fall-through warning for Clang
Message-ID: <20210607214852.GA65141@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a
warning by explicitly adding a fallthrough; statement.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
JFYI: We had thousands of these sorts of warnings and now we are down
      to just 13 in linux-next(20210607). This is one of those last
      remaining warnings. :)

 drivers/input/joystick/sidewinder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
index fac91ea14f17..8e9672deb1eb 100644
--- a/drivers/input/joystick/sidewinder.c
+++ b/drivers/input/joystick/sidewinder.c
@@ -660,6 +660,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
 					fallthrough;
 				case 45:				/* Ambiguous packet length */
 					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
+					fallthrough;
 				case 43:
 						sw->type = SW_ID_FSP;
 						break;
-- 
2.27.0

