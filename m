Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F394184E4D
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 19:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCMSDj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 14:03:39 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:46712 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMSDj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 14:03:39 -0400
Received: by mail-pl1-f202.google.com with SMTP id m9so6017470plt.13
        for <linux-input@vger.kernel.org>; Fri, 13 Mar 2020 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=CVDLXdUW9/akpoopZJqSktk5WLr6W64dr/oZNQEBp/M=;
        b=MObsCsypvEE1MVadLaUVcsrSK/urgDj61mS4IUBEA19KCPVwDapvXoJrDw07lrU9y6
         1P1D2/BMkTsNI8qHkYq6j3zwFsmfPLTgUhSA+iRFjpXi/1usMOM5J3fZhISLRzqGvNJA
         3hhYJr4rvjnGGQnoSTBU5OgppfdpZsP3WC6BWzdpF3AYRtR6ShdgaHYLhxleEKAgekiP
         rOkGzcM5BfH7ZAQBrlCDJQZ2Vou6tKG1ddvu9JdvrAQmRzMjBO8u7ZKWxa6SRMKynVmL
         yC3mNqboLg/0/3VAz1Gyu2yLuRwoY6fy7FsvfYjGisLymWOgsISUpXKBD9msodpoTZcs
         9QTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=CVDLXdUW9/akpoopZJqSktk5WLr6W64dr/oZNQEBp/M=;
        b=sLtbW0jUqnx33RwJIOQk9GyOC/1eZD0BVf6AXGxwqIHf03OO6JkgDom4jitrMkq8yB
         tTJ7eP9W2e7F3DUdXDnqPKxqixOUZXIcWb6kwqYM44lWEDk5dpxQJDa6qs3OEliz9phG
         mVuVZD+MwHkJ0eKDofa85uU+oxhSrP233GMc3dTZcoDQvW4EKGEKi+ZbWH5mJxpMQ54V
         POvNSupQ3aK3gwcNfngh0LalC/VJk/BZE7ezANbiJ4+noTWkWIXvEVvXO6EEJlggV0iX
         qA4TD3gFwOs8f3PEhjfDeoY2f6ROPHrBSGkDvG2b6PmDX0NirwO7nyamSJcrjjNHQ5fF
         pb8Q==
X-Gm-Message-State: ANhLgQ2LxBVeXQu5cYqJF3EwVwFM+eAgMK1vmVGk/hqLiLSjPbKMS/7w
        raCpOaYuZEmch8xem4mAryXrOAQmG4Xm
X-Google-Smtp-Source: ADFU+vsta7Nltn3U0edYg3zcSAuqrGro5jNKtDzH8XuEdkV3HeVzf/XYWpcCo3hZ4umzeJdqfLXU86N5LJ7H
X-Received: by 2002:a17:90a:af81:: with SMTP id w1mr11210453pjq.14.1584122618151;
 Fri, 13 Mar 2020 11:03:38 -0700 (PDT)
Date:   Fri, 13 Mar 2020 11:03:33 -0700
Message-Id: <20200313180333.75011-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v3] Input: Allocate keycode for "Selective Screenshot" key
From:   Rajat Jain <rajatja@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Harry Cutts <hcutts@chromium.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dtor@google.com
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New chromeos keyboards have a "snip" key that is basically a selective
screenshot (allows a user to select an area of screen to be copied).
Allocate a keycode for it.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: Rename KEY_SNIP to KEY_SELECTIVE_SNAPSHOT
V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.

 include/uapi/linux/input-event-codes.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0f1db1cccc3fd..c4dbe2ee9c098 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -652,6 +652,8 @@
 /* Electronic privacy screen control */
 #define KEY_PRIVACY_SCREEN_TOGGLE	0x279
 
+#define KEY_SELECTIVE_SCREENSHOT	0x280
+
 /*
  * Some keyboards have keys which do not have a defined meaning, these keys
  * are intended to be programmed / bound to macros by the user. For most
-- 
2.25.1.481.gfbce0eb801-goog

