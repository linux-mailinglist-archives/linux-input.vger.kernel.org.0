Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC22D3B1B80
	for <lists+linux-input@lfdr.de>; Wed, 23 Jun 2021 15:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhFWNsw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Jun 2021 09:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhFWNsw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Jun 2021 09:48:52 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B47C061574
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 06:46:34 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso1408229wms.1
        for <linux-input@vger.kernel.org>; Wed, 23 Jun 2021 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=imZ3OXeMyZz6bDmbx3FYq7fmRLeLp/Y3Qxck/UIP5zI=;
        b=dnS3Y7bnMetbd+bmWmHq9IBznx1bwe4/UlbvgQ+VYm8PUmYsr33lvtAQFcQmKmPgaI
         h8GZXDB3TzEyFmLqeHP3syhb/2IG4NFBfMvKXtv6DkbzroVJk6yaEpAWvF3873nOoB+a
         rbSyvBQ10PB4+uMz4oYzBxDGeCMP2vt5bEVTbacnerR7Wx3AElWECbGoT+6TkjXrl+He
         I+SqOy7TR76jbd7lzEkdXcl1UA+yTxxmknUh+vkCa347bhS9mkQ/rGL1fP02Phywetda
         tILZIMtqaoXYi0/7Gy3P8Wzo+CHzxqVN+0yGUEpv/yrujD14h/J02on7KRKK/pRFN8N3
         +f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=imZ3OXeMyZz6bDmbx3FYq7fmRLeLp/Y3Qxck/UIP5zI=;
        b=KR9YnEGYXF+9XQjMVbwArblU4unmykB5+pR2ztm6cWSQAfkWNtM7NTiwML6jFaQ0QD
         CTB1gJtqYJX10kb8rrq8oRGaspc+YIzuCFbo9Ay50WEseVHpzv1yeol2GJFUbMR45HcZ
         YV22pIYNzgGsdIef3KyPF/8594PwQhGyoFkio3XEH8uMcYqUTWTgh/IbygOViMVAxrqJ
         w3UPc08x+l0y4nXpYN5tEJxdWGSyzr6yfXCVisbRKekqCw7o4J9MaCmrter8606rMx4C
         YN/IN+qOEvZV0I3sPmHec27CfXjKSa331GtMPamD+dUuvhQ/UsFW0hbJdI3L5Ycb2ycs
         WWuA==
X-Gm-Message-State: AOAM531BMkZec3k3aw1Suf8nCEZRvmU21qYsZMcpcEdiDfd4BegJ9xv0
        05ocCATGbJwa7PfajoYCeIeJBQ==
X-Google-Smtp-Source: ABdhPJy3LClhWqPO7KXylIx1pcnjVm6dORYP41P0uibUBchkQugYD0VGxyn78p6UQljLMhhEz02BZQ==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr11141341wmc.1.1624455993080;
        Wed, 23 Jun 2021 06:46:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:78f0:ea41:c81:639b])
        by smtp.gmail.com with ESMTPSA id l4sm89546wru.41.2021.06.23.06.46.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jun 2021 06:46:32 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] Input: atmel_mxt_ts: atmel_mxt_ts: Fix event loss
Date:   Wed, 23 Jun 2021 15:56:37 +0200
Message-Id: <1624456597-9486-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
References: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If both touch events and release are part of the same report,
userspace will not consider it as a touch-down & touch-up but as
a non-action. That can happen on resume when 'buffered' events are
dequeued in a row.

Make sure that release always causes previous events to be synced
before being reported.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 807f449..e05ec30 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -990,6 +990,13 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 		input_report_abs(input_dev, ABS_MT_DISTANCE, distance);
 		input_report_abs(input_dev, ABS_MT_ORIENTATION, orientation);
 	} else {
+		/*
+		 * Always sync input before reporting release, to be sure
+		 * previous event(s) are taking into account by user side.
+		 */
+		if (data->update_input)
+			mxt_input_sync(data);
+
 		dev_dbg(dev, "[%u] release\n", id);
 
 		/* close out slot */
-- 
2.7.4

