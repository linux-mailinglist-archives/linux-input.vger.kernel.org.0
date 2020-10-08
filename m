Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA91287E98
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 00:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgJHWTw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 18:19:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:58174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbgJHWTv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Oct 2020 18:19:51 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26CF322241;
        Thu,  8 Oct 2020 22:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602195590;
        bh=vh2MTDkqTCddfhj24WjA3iu9qgZTb5K4SXKLvmgxfR0=;
        h=Date:From:To:Cc:Subject:From;
        b=XHtojaceDHnalxQKsgQbWYwAiIv98i4g8qt4yqeqTZrW6hX+YqJ4EEKyXa2gzWQRO
         /QMNHJa4wnfUZzXfxpuCVqY+A8OjYYJiozjZDl0xkwhSZLycwsmIDe6pEjFaJohr8g
         uvkJx1ca1jt97uP2pWnA79Sx92QvCr/O5Q31HTIY=
Date:   Thu, 8 Oct 2020 17:25:14 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][next] Input: libps2 - Use fallthrough pseudo-keyword
Message-ID: <20201008222514.GA17682@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In order to enable -Wimplicit-fallthrough for Clang[1], replace the
existing /* Fall through */ comment with the new pseudo-keyword
macro fallthrough[2].

[1] https://git.kernel.org/linus/e2079e93f562c7f7a030eb7642017ee5eabaaa10
[2] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/input/serio/libps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
index 8a16e41f7b7f..250e213cc80c 100644
--- a/drivers/input/serio/libps2.c
+++ b/drivers/input/serio/libps2.c
@@ -405,7 +405,7 @@ bool ps2_handle_ack(struct ps2dev *ps2dev, u8 data)
 			ps2dev->nak = PS2_RET_ERR;
 			break;
 		}
-		/* Fall through */
+		fallthrough;
 
 	/*
 	 * Workaround for mice which don't ACK the Get ID command.
-- 
2.27.0

