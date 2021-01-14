Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BC12F6471
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 16:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbhANPYQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 10:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729200AbhANPYP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 10:24:15 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22D9C0613C1
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:34 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v15so2507910wrx.4
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cUSIVImOhh6mnD33JdJKn9l+xD1dBbES1ADQWyw/cSQ=;
        b=xMh/CZ1b26BOHhoxUuGWCrtKccuWrXwsla3Jb8f49NJCwCVpAmALeqJ50oxnz87jRf
         rkaYJnGrQR7ZclSxlw5FrsfP9lBQEO0PbwDU5Oxl35M3dnTUd7LDyhGEZ1XCzh/snZwC
         bl9LK/YQkBaLgfdSuTcbXpcFCrBnXrSw5tC1aAwEScghnNgAuNAIlWMKepDjUg4g3m0g
         xDyOxAPlYWgMIbAzedZzXwavu1HrtBa+dZHK0UxeofUssJyP/YKahXpSsoS8avdmyt7W
         r7I/NFtffiI0A+VqNDdaaauCk1HvVrpbnIAqtZ9xWpjVnZZGmmGlNEKX2A+3Lxi8kYeL
         webQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cUSIVImOhh6mnD33JdJKn9l+xD1dBbES1ADQWyw/cSQ=;
        b=eBgWkIy0d+VvsB2d84VFXJj/yZttVG6YY6F3Ijtl8i8fKcF+GUVf7y+6a9YwdFEcQW
         RWfWp7MBURVTTXKTWZA3pjUB8amj2AxRVknZP1jTHCifve9tJQBJZizPtHMUhSgRMOVE
         +21S6W10uEFuZ8kZoW5mYGCXtSXC0NQy9B2osKvLeDlfgYjWfO5g4VQeUAqZCNELHl74
         l0TeL00HEt8XAnMSdk/1nfENw+R/pxbu7rUe5blnV0u8esSXFs0AWVDpN7QlSDBnym+h
         jj2QU8HZ9PsM/oXR8DrF5FTcvZxQXgErcDxKfCYpJWPgytuB8V6GyNIwGBklLVIQVMU8
         8HOA==
X-Gm-Message-State: AOAM530n18i08ufyiQXc+8iG36EG6I0UBypV1PiJYMNFs/+LnQGmwQpX
        qDS26k08iHQx92etndEpmXlFzQ==
X-Google-Smtp-Source: ABdhPJz0ji0rfOQMV2IR5mKX8CEEVKtkzkGzxDncQYZmm/N8GG3eov3UlqqJX7AIk5l+x6tuJ6aQkg==
X-Received: by 2002:a5d:58d3:: with SMTP id o19mr8708735wrf.250.1610637813543;
        Thu, 14 Jan 2021 07:23:33 -0800 (PST)
Received: from dell.default ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 07:23:32 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: [PATCH 1/5] input: mouse: synaptics: Replace NOOP with suitable commentary
Date:   Thu, 14 Jan 2021 15:23:19 +0000
Message-Id: <20210114152323.2382283-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114152323.2382283-1-lee.jones@linaro.org>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
 drivers/input/mouse/synaptics.c:1110:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Peter Osterlund <petero2@telia.com>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Bruce Kalk <kall@compass.com>
Cc: this to <linux-input@vger.kernel.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/mouse/synaptics.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 8fb7b4385ded9..3cc8b76629fa2 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -1106,8 +1106,11 @@ static void synaptics_process_packet(struct psmouse *psmouse)
 					num_fingers = hw.w + 2;
 				break;
 			case 2:
-				if (SYN_MODEL_PEN(info->model_id))
-					;   /* Nothing, treat a pen as a single finger */
+				/*
+				 * Keep defaults
+				 *
+				 * SYN_MODEL_PEN: Treat pens as a single finger
+				 */
 				break;
 			case 4 ... 15:
 				if (SYN_CAP_PALMDETECT(info->capabilities))
-- 
2.25.1

