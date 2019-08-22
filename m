Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E45469997E
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 18:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731976AbfHVQoC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 12:44:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43526 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731880AbfHVQoC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 12:44:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id 4so3767376pld.10;
        Thu, 22 Aug 2019 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=x9uce55kb6LZ9BYo7W+bqT1uxPy/bJS6Nheim+gxljU=;
        b=bJBIjamPcgpm1ZXLpSxXD0oE/Ox67cJ9ESF+xyrbA/SkjeUjRz3OYUPh/q+mkf6WPW
         gszvgZjW5Ii222UQ9cZcihxFW9h+rMspa/JpeAzL9LDsIz1jJ2swtPZe1+VUL+eFM9Qw
         v4aTIGmNbz/8XbkanLChrI9PtQkDfbDkLzjQUvgRF1GkSFAHkj43uMm8zG5WdJd86Uqq
         25hDzDwOIyhEmj0XRkqFgyrD7sWCaS3R/HCu4C/fUeMTPu+4fYv0uhFml2qpve1ViKF6
         a/v6zkuV7yow07+jTxSnJu5/hqZ1aa54rlkappzHoqjQnR0pBhSNVwj70K8m/FAFnW1J
         8e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=x9uce55kb6LZ9BYo7W+bqT1uxPy/bJS6Nheim+gxljU=;
        b=BitY8RPyuPv+IhDjAqlTsTOQ2sAncWTRBjdsARK94A7jrLLJVMTEObQBpOlQ5hNdVi
         uxBG8H9HwL8WOcAi+Lq8gl7F/9xZJelUivKEoJLWRMbt9XW8FH6nTQjFVuSHUa2YAVjn
         3mmMWAlWJcEswxyXBD/LNGvOpjhZkJq8sawK5fElp4qwkueNXW7BqYMiO2fdXcddlUpX
         ifNzW4PsqTFCHablKd8RfTWhZhRgqFW0KCQG4hUjWjMSuNS5g4twZ/IgfQxc4+KiWTRW
         bSLYmpqUWvVSJlS/9G3kbBsBv5rKI3X0thaZjKwymj1MEtTdUQZNaWqahDcOu061WOYp
         Eukw==
X-Gm-Message-State: APjAAAUTX+8hi38MYG1jzwaJJpnPwRrdFywFipMUR4qM6V9NGTDOJoVT
        2zacugH3DO7AvWZI4Lfx+lY=
X-Google-Smtp-Source: APXvYqxe6fOEzOe3vusXfkDM0IxXECeWeFZdwOpLMUqOaDlOvoQ66CBYHAGy9zDgc8muHzhUyugvfQ==
X-Received: by 2002:a17:902:9686:: with SMTP id n6mr39475715plp.113.1566492241825;
        Thu, 22 Aug 2019 09:44:01 -0700 (PDT)
Received: from localhost.localdomain ([106.51.107.181])
        by smtp.gmail.com with ESMTPSA id br18sm83722pjb.20.2019.08.22.09.43.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 22 Aug 2019 09:44:01 -0700 (PDT)
From:   Rishi Gupta <gupt21@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>
Subject: [PATCH] HID: hidraw: replace printk() with corresponding pr_xx() variant
Date:   Thu, 22 Aug 2019 22:13:52 +0530
Message-Id: <1566492232-13590-1-git-send-email-gupt21@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit replaces direct invocations of printk with
their appropriate pr_info/warn() variant.

Signed-off-by: Rishi Gupta <gupt21@gmail.com>
---
 drivers/hid/hidraw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 006bd6f..67b652b 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -197,14 +197,14 @@ static ssize_t hidraw_get_report(struct file *file, char __user *buffer, size_t
 	}
 
 	if (count > HID_MAX_BUFFER_SIZE) {
-		printk(KERN_WARNING "hidraw: pid %d passed too large report\n",
+		pr_warn("hidraw: pid %d passed too large report\n",
 				task_pid_nr(current));
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (count < 2) {
-		printk(KERN_WARNING "hidraw: pid %d passed too short report\n",
+		pr_warn("hidraw: pid %d passed too short report\n",
 				task_pid_nr(current));
 		ret = -EINVAL;
 		goto out;
@@ -597,7 +597,7 @@ int __init hidraw_init(void)
 	if (result < 0)
 		goto error_class;
 
-	printk(KERN_INFO "hidraw: raw HID events driver (C) Jiri Kosina\n");
+	pr_info("hidraw: raw HID events driver (C) Jiri Kosina\n");
 out:
 	return result;
 
-- 
2.7.4

