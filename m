Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEE32BB428
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 19:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731705AbgKTSlI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 13:41:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:59446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731695AbgKTSlH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 13:41:07 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1978422464;
        Fri, 20 Nov 2020 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897666;
        bh=E/9PQe+ABgAMu3mq359DtgFOqDJztW3fbfkO/ssrrVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ws0i64hKVRMe099Tp/vCX0psjsfXhgBpy0pDWmvv0XRx0/HO1hFxXZD9pDQDLpdCo
         2pGJnuURwMZg7pXuPxfd3W1Bgbrnuk506JvcMwY+6k8ZdOiEK9eyB0Bo724hX7A5b/
         OQ/Q/22SXL4PKQmkwkmhIAAbZQRa40gO/qR25/f8=
Date:   Fri, 20 Nov 2020 12:41:12 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 141/141] Input: libps2 - Fix fall-through warnings for Clang
Message-ID: <d2944854e3e118b837755abf4cbdb497662001b7.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a
warning by replacing a /* Fall through */ comment with the new
pseudo-keyword macro fallthrough.

Notice that Clang doesn't recognize /* Fall through */ comments as
implicit fall-through markings.

Link: https://github.com/KSPP/linux/issues/115
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

