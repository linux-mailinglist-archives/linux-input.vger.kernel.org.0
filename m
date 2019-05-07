Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B275C16AA9
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 20:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfEGSs3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 14:48:29 -0400
Received: from gateway23.websitewelcome.com ([192.185.50.119]:37225 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726464AbfEGSs2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 May 2019 14:48:28 -0400
X-Greylist: delayed 1455 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 May 2019 14:48:28 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 63100CBE0
        for <linux-input@vger.kernel.org>; Tue,  7 May 2019 13:24:12 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id O4lAhySm0iQerO4lAhcyhF; Tue, 07 May 2019 13:24:12 -0500
X-Authority-Reason: nr=8
Received: from [189.250.119.7] (port=44628 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hO4l9-000Qgk-Ct; Tue, 07 May 2019 13:24:11 -0500
Date:   Tue, 7 May 2019 13:24:09 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] Input: libps2 - mark expected switch fall-through
Message-ID: <20190507182409.GA11027@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.119.7
X-Source-L: No
X-Exim-ID: 1hO4l9-000Qgk-Ct
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.119.7]:44628
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch
cases where we are expecting to fall through.

This patch fixes the following warning:

drivers/input/serio/libps2.c: In function ‘ps2_handle_ack’:
drivers/input/serio/libps2.c:407:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (ps2dev->flags & PS2_FLAG_NAK) {
      ^
drivers/input/serio/libps2.c:417:2: note: here
  case 0x00:
  ^~~~

Warning level 3 was used: -Wimplicit-fallthrough=3

This patch is part of the ongoing efforts to enable
-Wimplicit-fallthrough.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/input/serio/libps2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
index e6a07e68d1ff..22b8e05aa36c 100644
--- a/drivers/input/serio/libps2.c
+++ b/drivers/input/serio/libps2.c
@@ -409,6 +409,7 @@ bool ps2_handle_ack(struct ps2dev *ps2dev, u8 data)
 			ps2dev->nak = PS2_RET_ERR;
 			break;
 		}
+		/* Fall through */
 
 	/*
 	 * Workaround for mice which don't ACK the Get ID command.
-- 
2.21.0

