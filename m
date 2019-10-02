Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501D8C93E5
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 23:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfJBV6R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 17:58:17 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42155 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfJBV6R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 17:58:17 -0400
Received: by mail-pf1-f194.google.com with SMTP id q12so337228pff.9;
        Wed, 02 Oct 2019 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=nW78YaON9ftxGXW1Xz94QjRHfMC0isgsL2LzRRL5B3I=;
        b=p/LKn8xyaCC9zZK0L02ezYYnpAnd+6biRqCJLy3WXmypv1FK4+o5B0Vh1tz5AEnujZ
         GH3XEDgoupBqH9rwnYrtcw0IziykawQnZy/Ggb8Am+KIv+vy9Tl5z9vPFUUXZYz1UUxu
         Epe4Nfl833nFYwwwgomYktYRZXGHK4mmFg9oHjDMuXgJ+yqkH/Qr3L+zPlrlRW0RSh9L
         EGD+nt+GaPbPaGvv+GjqFAsbbPbAkGZoBW5DH1rL3dNJQ5/iNbil3wHiApP3oK49FlAx
         YC1Ac2GAzaWlsRtyRygOlxEQppu38ddSuaVlAqNqDgi6JKXlesoxul73rVP3ewjgBY+H
         nYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=nW78YaON9ftxGXW1Xz94QjRHfMC0isgsL2LzRRL5B3I=;
        b=fUHlfVGT8e0cfPSvZtGmIi1t9B61HUnF/kg5+EBlOmcQYsI2x4bmPkTwdPrE0fzmTJ
         58oNXab2noI6VM2ZEG5avjvMS+Qn/1lI8PSMbYAFrAu2ONDLC6fxiTnuCBX5S9F9c2Es
         0/wKnOCd0pVlDgZ1mda6a776irtaENfQOi0ANqSb7sVjV30XbMmNItdSxDCISrIGBdW6
         UVm9OI41+NpEEGUTvNK1gj882/nISaDbMO37gSHUWkjCZpCtGdFkqR5WDVoorRXcsi6v
         90L58Nkpb9NoOWfT0pQSwDOhlT/OAvrxmo6CIKPSQO6DyOxKNi0/0UwoBJpgtQtIyWyW
         qO2Q==
X-Gm-Message-State: APjAAAXiwXovEMX8twfnlgL9D2i/5OxHq0RgQ9G5zT4yHfqqu6qx0E5o
        8NBeyu07Ol/KMHYjbGA8aI1ykbgf
X-Google-Smtp-Source: APXvYqxOdT2iF+VGb/xNhZQ3sWU6mcLeX1EFw/Lfw7VDzrPnwkP4P58XsYWLNKhkFdNyMgvppWFg/g==
X-Received: by 2002:a63:f113:: with SMTP id f19mr5878239pgi.75.1570053495683;
        Wed, 02 Oct 2019 14:58:15 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a8sm402067pfo.118.2019.10.02.14.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 14:58:14 -0700 (PDT)
Date:   Wed, 2 Oct 2019 14:58:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: add input_get_poll_interval()
Message-ID: <20191002215812.GA135681@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some drivers need to be able to know the current polling interval for
devices working in polling mode, let's allow them fetching it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input-poller.c | 9 +++++++++
 include/linux/input.h        | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
index 1b3d28964bb2..7d6b4e8879f1 100644
--- a/drivers/input/input-poller.c
+++ b/drivers/input/input-poller.c
@@ -123,6 +123,15 @@ void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval)
 }
 EXPORT_SYMBOL(input_set_max_poll_interval);
 
+int input_get_poll_interval(struct input_dev *dev)
+{
+	if (!dev->poller)
+		return -EINVAL;
+
+	return dev->poller->poll_interval;
+}
+EXPORT_SYMBOL(input_get_poll_interval);
+
 /* SYSFS interface */
 
 static ssize_t input_dev_get_poll_interval(struct device *dev,
diff --git a/include/linux/input.h b/include/linux/input.h
index 31da4feaa1d8..a420324b7882 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -387,6 +387,7 @@ int input_setup_polling(struct input_dev *dev,
 void input_set_poll_interval(struct input_dev *dev, unsigned int interval);
 void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval);
 void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval);
+int input_get_poll_interval(struct input_dev *dev);
 
 int __must_check input_register_handler(struct input_handler *);
 void input_unregister_handler(struct input_handler *);
-- 
2.23.0.444.g18eeb5a265-goog


-- 
Dmitry
