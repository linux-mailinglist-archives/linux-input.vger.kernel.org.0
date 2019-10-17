Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B7ADB265
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 18:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406542AbfJQQcU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 12:32:20 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44509 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbfJQQcU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 12:32:20 -0400
Received: by mail-io1-f67.google.com with SMTP id w12so3741623iol.11
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2019 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+0nsp8YUe6GDrJ0TuBakk/ATNKu0tD/75AlnwMlWFBo=;
        b=c0Ul3AmifOFvya7o3yhj0OCQd/wB5vbawrcr5oOEuOnJNHFSnGN4PYk9oirzftTRmp
         EXs6RkeJ4inpKI3mMCmq255xCbm34gT33YckGqVG4vp0Ur5wyxH4Z74+fD9T1LJTZnU5
         mTQ4+PELk6qy1AA6hx66C6JKyv+1D87qX6Kvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+0nsp8YUe6GDrJ0TuBakk/ATNKu0tD/75AlnwMlWFBo=;
        b=c5fxs5W/dSz5CJgCN7S0DjZCz6dtepyS5uZIqZih6tOiNeAFSHDQfurxNKdjaVpKsi
         jpnJowrehsdUQ7K5S2w08HxHsfwP0KzoShX+tmI9FtHTxvEtsOm0j5K+aLqqcAB4NyqX
         nSV2qAH14i5lnGmn49t8eO1/ulJUu5VRC3imtN7aC7+p6ylwoy0MjNKr1MT50dVwAuzM
         rqsdDon6fhO2gBSHCDqXkbUPcfmi1+CAMRHSEHh+D75Ofwp8AW5xCyBwwMP/lxGxgN7Y
         HEMEtBO+4emziuNfwNP2xkBEtZziqiXXmt0c8Sqi0EX2ysupVb0vDzqUqX7FHJwNs06L
         8Y0g==
X-Gm-Message-State: APjAAAU8vLihGY7UBKPdvZyY9cCZ5aVjq1P3Qke+clFNKZA+/W/Fbl0J
        RECfw5Omfcfsf81aTd0Kb3GsDQ==
X-Google-Smtp-Source: APXvYqzyReRkOVh7Tfwf5fVzvgZVZ5D3xC7y1UdhocS+o7WoDQiSqBZzqhxMJkTOnOzg2fO4VskDqQ==
X-Received: by 2002:a5e:cb0a:: with SMTP id p10mr3862196iom.85.1571329939058;
        Thu, 17 Oct 2019 09:32:19 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:777a:4e3:a71c:e893])
        by smtp.gmail.com with ESMTPSA id o14sm822878iob.49.2019.10.17.09.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 09:32:18 -0700 (PDT)
From:   Mathew King <mathewk@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mathew King <mathewk@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        Sean Paul <seanpaul@chromium.org>,
        Jesse Barnes <jsbarnes@google.com>,
        Duncan Laurie <dlaurie@google.com>, linux-input@vger.kernel.org
Subject: [PATCH] input: Add privacy screen toggle keycode
Date:   Thu, 17 Oct 2019 10:32:08 -0600
Message-Id: <20191017163208.235518-1-mathewk@chromium.org>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add keycode for toggling electronic privacy screen to the keycodes
definition. Some new laptops have a privacy screen which can be toggled
with a key on the keyboard.

Signed-off-by: Mathew King <mathewk@chromium.org>
---
 include/uapi/linux/input-event-codes.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 85387c76c24f..05d8b4f4f82f 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -649,6 +649,8 @@
  */
 #define KEY_DATA			0x277
 #define KEY_ONSCREEN_KEYBOARD		0x278
+/* Electronic privacy screen control */
+#define KEY_PRIVACY_SCREEN_TOGGLE	0x279
 
 #define BTN_TRIGGER_HAPPY		0x2c0
 #define BTN_TRIGGER_HAPPY1		0x2c0
-- 
2.23.0.700.g56cf767bdb-goog

