Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A662444F311
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 13:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbhKMMXv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 07:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbhKMMXv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 07:23:51 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80425C061766
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 04:20:59 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id x10so14668075ioj.9
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 04:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3UCYKJMPqjz0YRA85mwQiz0cNO5hlDXZYW6t/t681Ug=;
        b=CLF7nntLYrQLX/CmGyg81HnA+IA2ApMCsVjEHf5MgDRMmCU+Ialui2cXnKCfgJRxGt
         DcXfMHS8mmwXe1vWwK4v8ME6f4XguDa8x/B101pv1e+r/f0hU1tgte28Xnf7j/S8DhlY
         U/KqpMzqstzp7s57dRMKdzRgpv+AFHV4jbTbM8Wjh2EISfwYUhxJo+B7+gxGqDhAgas/
         tDeD432OSNUAvfx4uKfOVWncLwyiJMk9kcb2F59lNRXrveSHqXCmXM7IdcnxbWCDCwrY
         QtebArORTm5EIIhQjNye7q6BYdgKhGHPkJ1BTNEYoodFIxTVHxkdNY5RG8j843S+iQbx
         ca7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UCYKJMPqjz0YRA85mwQiz0cNO5hlDXZYW6t/t681Ug=;
        b=ZCKhqSj/TMV+ndOid210X9xL/WTc984Ws4PWuWFCrcoBXF4FyLAtUnRuAYYzEZ7+x3
         oux4hkb+TLO2zjN3C+9Hryq8SH/nb23kA7Obvw+Ns7aLIiRuHM6kRmfqFGFKOCCxnWIB
         AEfFhTspqU/MNJOq1NHw0rdrFWq6RM4dbADt6fBlr/nbqZVboWyMPLzYv3YtQ4JZZz1E
         YaP1YXtVLhjXpvhVt9lS7e4fno8GPsDboJJCk8y1LBNLEt65aqYanmgTOpumjzzOEEdl
         slMYq5risDkvHGrrkMzdlSnV+mDmqGwp4jxNaTsZ/bIBcNk8CHT9Iozspj+T4NY9ztVg
         UglA==
X-Gm-Message-State: AOAM532x7nDIU5hvWaXIgeuMCexGK5CaonlZ2mlxmqUSu5mMJ8mOeR3v
        SrB2j7CYTIztbnRQlBfWuDY=
X-Google-Smtp-Source: ABdhPJyKk/4VF8u8XmJk21Nr9Jw19A8dqwB1gfvz6xdDwB0h4b/AcBc0Z8/bTi9cy2JCyz7H1HZlVw==
X-Received: by 2002:a05:6638:3711:: with SMTP id k17mr17593092jav.72.1636806058939;
        Sat, 13 Nov 2021 04:20:58 -0800 (PST)
Received: from rechenknecht2k11 (200116b845dc28008d9ba50a9af0b814.dip.versatel-1u1.de. [2001:16b8:45dc:2800:8d9b:a50a:9af0:b814])
        by smtp.googlemail.com with ESMTPSA id x2sm4789807iom.46.2021.11.13.04.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 04:20:58 -0800 (PST)
Date:   Sat, 13 Nov 2021 13:20:55 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] Input: xpad - remove 'rumble support' from TODO
Message-ID: <20211113132055.6a85e04a@rechenknecht2k11>
In-Reply-To: <20211113131734.46fbc9bf@rechenknecht2k11>
References: <20211113131734.46fbc9bf@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rumble has been implemented on all controller types for a long while now.
Let's remove this ancient comment that just creates confusion.

Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
 drivers/input/joystick/xpad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d99dd9aed137..18caaf436ed4 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -29,7 +29,6 @@
  * TODO:
  *  - fine tune axes (especially trigger axes)
  *  - fix "analog" buttons (reported as digital now)
- *  - get rumble working
  *  - need USB IDs for other dance pads
  *
  * History:
-- 
2.32.0
