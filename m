Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B7E117756
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 21:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLIUW6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 15:22:58 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:45460 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbfLIUW6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 15:22:58 -0500
Received: by mail-pj1-f65.google.com with SMTP id r11so6350459pjp.12;
        Mon, 09 Dec 2019 12:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=AhU4In8PuotkeDP8I8PPfaY0k5IvXY23cMJR6CcYwQM=;
        b=CPEOa+5E8a6FVpvVq1/JmZbb6VFSoZaSXO+RQfKShpU0GPe52p7gyhCymEzGUEuSql
         uAtr+ryGKEdtn535Zagjq1GHBk+AYjLmqxhwwLkMFOZvRxyE9cZPKoDjjRs+OrB5R2io
         iZWBqVgryg3fsVGirPINrXiG/Y0hK/BD4Csj1jboMpEUaRushJt5S7j5bbPf1HNyOdI8
         gdbL5dvZsPICZSsYeNYsLCZsV7a6/lcMSmvVHZLC1J8EMhqRwv6PlTEuDM0w5vccnh6w
         Hg/WJTAGm9M2vjcbGs8sIlQ80p3jDiUrnsVb5GH/rk5cf4zaWj08gyz4Bf+AhONd5Uqo
         BM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=AhU4In8PuotkeDP8I8PPfaY0k5IvXY23cMJR6CcYwQM=;
        b=dktYa19GkTHZtsaw6kfAyIB8igww5E7Af7YZBa62IFpQDALxlFS6lFhT7aUpQGLV9B
         8eDfah/WDFyYlJb+TvJYpl4Z0cEj1i1oSJVnqbEoQNFW+eclG9hJ3J9THZwPPuKG3XUI
         JWLR1dTW/Lwj4odn6VHCZNdnITYjsiqBgfQ/NiTCD+bCJcY0f2bCG01t2QIKFBGTC9ho
         sgs+wyLzwCsZKQkmTeB6KbJ/uiobd7Bjpx7RGsi9oRDzF6l0/VbPnQwOa/gUaW8C8XKX
         yfQVk3j8MX3Pki9rxSYzVr7fEpprhll0GVstvtbwl3Ld371JfgIWvAAMkIa9QI3SIyRj
         NUQA==
X-Gm-Message-State: APjAAAW1jitwfobkHS66jP/jlbsesF3iqC11PJb8R1cpU1CvpqI7jATv
        EWGDEL3K2CTtlWpKPPh9UxpGOFAP
X-Google-Smtp-Source: APXvYqzLAsJa9qz9gsQbh6zx0DgPAVUUC1XbOfkQJSfdhrYsknBepYWuw19yhS9AE5p+Q+aYP6qcJQ==
X-Received: by 2002:a17:90a:2201:: with SMTP id c1mr982341pje.31.1575922977242;
        Mon, 09 Dec 2019 12:22:57 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e11sm208108pjj.26.2019.12.09.12.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 12:22:56 -0800 (PST)
Date:   Mon, 9 Dec 2019 12:22:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: uinput - always report EPOLLOUT
Message-ID: <20191209202254.GA107567@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

uinput device is always available for writing so we should always report
EPOLLOUT and EPOLLWRNORM bits, not only when there is nothing to read from
the device.

Fixes: d4b675e1b527 ("Input: uinput - fix returning EPOLLOUT from uinput_poll")
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/uinput.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index fd253781be71..0bb456015d8f 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -689,13 +689,14 @@ static ssize_t uinput_read(struct file *file, char __user *buffer,
 static __poll_t uinput_poll(struct file *file, poll_table *wait)
 {
 	struct uinput_device *udev = file->private_data;
+	__poll_t mask = EPOLLOUT | EPOLLWRNORM; /* uinput is always writable */
 
 	poll_wait(file, &udev->waitq, wait);
 
 	if (udev->head != udev->tail)
-		return EPOLLIN | EPOLLRDNORM;
+		mask |= EPOLLIN | EPOLLRDNORM;
 
-	return EPOLLOUT | EPOLLWRNORM;
+	return mask;
 }
 
 static int uinput_release(struct inode *inode, struct file *file)
-- 
2.24.0.393.g34dc348eaf-goog


-- 
Dmitry
