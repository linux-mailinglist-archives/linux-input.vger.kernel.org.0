Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F2A1BFA8
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 00:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfEMWw3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 18:52:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46481 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfEMWw3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 18:52:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id r7so16380190wrr.13
        for <linux-input@vger.kernel.org>; Mon, 13 May 2019 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5BlvdLPT9eGxGqMPZEIkZ+NLZmAtRQS6lMCYO5Ynleo=;
        b=JX2tEQtIgBUsA+H9QEKu1bJc+/bQEfpA1f5hEw6KhLcgNJ9lOBmIymHJ7Y7khHcUL6
         luLhKCUcoPhWk+jPSaGWOr0CRUB6nlcwVEWp7n2F7wBec8hh6VLuvdAKXYSli3YDW9jY
         aYEyPVTuYGA3PKxxGMGHPEZYqQHj3VEa/z7nByQhVCZDHlJRvQt1NT3+xXYFfcROaOn/
         3iEeYzjhrrXZnl14BG6Y4/hnl3XozP1jin2fTRO69Hhdr60XYK0KxAN3p1HirU6fD7dL
         l2mxj74I+egR3THI9bPWPCYlLV/4oKTTfCX/WddFSg1CdrP27q6BO/4jPaGoC8DHWEOK
         aRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5BlvdLPT9eGxGqMPZEIkZ+NLZmAtRQS6lMCYO5Ynleo=;
        b=hFeTbJ+yUQc9ffx/mZznweTK7WG65WOSp2agnCyrAE7bL1OeZ1jPVPg3WLjtfNAtV1
         fQYh+oMW+UDOPV6qcEDqK2QCP1p6QGUHiHej3cn/am0z/AkboqV3LU7Kw0t1Rnk58dL9
         46J0bH07rsyBxXizRiIp48v8gF978bZ/LiD3/5OAuaJu/L0NUfDVUir6N8kCx+JKxGmi
         BKkUcgGqtEvTDSqrC0JsP4mNKSnFGI2xBIxEBf0PxuJ/gWVXB/WUkCMYQwMVHB2HbX+L
         e0eJPC6UETH1JediZp9YIWN3+C77xX1KjKAwqRpa7tyeDbBqIcY+y0RnwdJ9zRTVIxcm
         8t/A==
X-Gm-Message-State: APjAAAU+mNEqX77+MzWc8uCtuJGNHimQ3QlvpkmpBa6PaBfi4ku3qV58
        2pcYLXOBkzgR9z81GcPrxX619yXU
X-Google-Smtp-Source: APXvYqyhCxNVC6ioIIqrxmpgYNTgrExP7it0YOT4Sm3Vkguj+9UmGohPIO+N0Ne8w7CxjtkKGX1IUA==
X-Received: by 2002:adf:dece:: with SMTP id i14mr20019471wrn.138.1557787947185;
        Mon, 13 May 2019 15:52:27 -0700 (PDT)
Received: from yoda.heavyware (host111-60-dynamic.7-87-r.retail.telecomitalia.it. [87.7.60.111])
        by smtp.gmail.com with ESMTPSA id c130sm1963819wmf.47.2019.05.13.15.52.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 15:52:26 -0700 (PDT)
From:   guido.aulisi@gmail.com
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     Guido Aulisi <guido.aulisi@gmail.com>
Subject: [PATCH] Input: i8042: Add missing dbg msg when a command can't write its parameter
Date:   Tue, 14 May 2019 00:52:15 +0200
Message-Id: <20190513225215.29925-1-guido.aulisi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Guido Aulisi <guido.aulisi@gmail.com>

Commit 2ea9c2362b56 (Input: i8042 - add dbg msg when a command can't write its parameter)
forgot to add a dbg message to the first write command.

Add the missing dbg message to catch all write failures.

Signed-off-by: Guido Aulisi <guido.aulisi@gmail.com>
---
 drivers/input/serio/i8042.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 95a78ccbd847..0563b63094ef 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -304,8 +304,10 @@ static int __i8042_command(unsigned char *param, int command)
 		return -1;
 
 	error = i8042_wait_write();
-	if (error)
+	if (error) {
+		dbg("     -- i8042 (wait write timeout)\n");
 		return error;
+	}
 
 	dbg("%02x -> i8042 (command)\n", command & 0xff);
 	i8042_write_command(command & 0xff);
-- 
2.20.1

