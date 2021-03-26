Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C22E34AA01
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhCZOf7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhCZOfZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:25 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4BBC0613B1
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j18so5882357wra.2
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccGk85Qb+R/2lzURMS8M3ry2sPIqf4RAKxkbH0HWWQ0=;
        b=MQ8AqYo029jcxTkqz0fgQ0hfg9qfIz0zHA/0DYIrzjy5Wy0fxLFqL+KsGKFznObPEk
         CEeJjoFgVL5bXtmaxF6i5/cyoHXom73K7cqUKGzbk9QTmgdbq+teGlkGm4pZr4ZybdwT
         5M4Nrc99xI/Tbls+jXiZTKmShFx2ZtPh/eQjI6vZcIwMU5DXYst5davdCMTcHD8WD9CX
         FH3m7ourYeOpAa8FS3Fe4KlpOlDA7sygkHybN0BncjL7It8RnOPAj60NwvugvEGGShcl
         uq+XY5dFYgIuLxqwRC/ILbZA/qV13dO39oo2VtcPN8ok2bPEUxsODa+6pui5lurU3pIy
         0MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccGk85Qb+R/2lzURMS8M3ry2sPIqf4RAKxkbH0HWWQ0=;
        b=faWyB3lGRpx+cHjZj2In4u0STxkdwqqgYnhl2JrGEP8N99gUXwtapUpsjhRbZUqmvK
         yt8MrGDpf9wQ1XTHwI+04ig+sd+Nu45xpQ2/2i3S18cXAJQcyU9xBMjpEQpM3YASV8cn
         +9RL4oWbrlHbfvzuJGdmwk2bzjTMVEI4pe6kw6P5soA1AWUY2v2r/pIIQWtAnZafiAwQ
         MfQemiC1kBgtgbSRo4tzY+xUvrXEXmj9sDidbmNHF96QFH0xu/LOnVGYhg2DmJABAqni
         ESKSNuB/0x/3Sl9DOkOQOBZ92fGAnI8fBLrR4rjSjc/UFYu7pYRNR0JoMKKI2Ggmrh5+
         ylbg==
X-Gm-Message-State: AOAM531jMrGHjW3Jj0BqWPn6B5a2zL14L+YyB6vpHJ5+TAj02lg1oErY
        opdbbaeJb0D3yFz5RYefHISmjg==
X-Google-Smtp-Source: ABdhPJzNOI+5IVpNAxH3g74ZP94Kypg0a6A8+oRK0jJF2OD8NoyZx0Ghj9YnEuQ1ML1qp6uREg4qkg==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr15103731wru.218.1616769323414;
        Fri, 26 Mar 2021 07:35:23 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 21/25] HID: wacom_sys: Demote kernel-doc abuse
Date:   Fri, 26 Mar 2021 14:34:54 +0000
Message-Id: <20210326143458.508959-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/wacom_sys.c:1505: warning: Function parameter or member 'wacom' not described in 'wacom_led_next'
 drivers/hid/wacom_sys.c:1505: warning: Function parameter or member 'cur' not described in 'wacom_led_next'

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/wacom_sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 8328ef155c468..57bfa0ae98361 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1495,7 +1495,7 @@ struct wacom_led *wacom_led_find(struct wacom *wacom, unsigned int group_id,
 	return &group->leds[id];
 }
 
-/**
+/*
  * wacom_led_next: gives the next available led with a wacom trigger.
  *
  * returns the next available struct wacom_led which has its default trigger
-- 
2.27.0

