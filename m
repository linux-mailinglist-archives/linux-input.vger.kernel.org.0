Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2385B2C55CB
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 14:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390337AbgKZNgQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 08:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390128AbgKZNgQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 08:36:16 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FB4C0613D4
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 05:36:14 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so2166696wrc.8
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cUSIVImOhh6mnD33JdJKn9l+xD1dBbES1ADQWyw/cSQ=;
        b=g6zRzVGz9G1rkRBJxu5GSPNOBBUME2NZh6JpVJ0XbDF3pkN9YxfMue8xN524DY45wu
         Sp8DJn8yglGxMUVUM5GPZG5fg0igrw2+z38ejyPzdWeA6TxVMyH1JIGNbMgnw2MGMadV
         mepdLcyL/Cl1BRZNhQ8AhJAj88El5PDv3BRgRpdh4Pvrz3vVqJmiycHkmr61VYJGs8M1
         3ySiuhIsQY8pQtlu3LQCrXxbvmjdS86FMsGMUahPRdEk2egdpZC1087da1lo459fWCoX
         qwwUH7ysRR4lYdn2qE7iY9fwvdhf3d0MC0BJ7vHqLvMXTlHcqbl+iltinxppF5bya/78
         rVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cUSIVImOhh6mnD33JdJKn9l+xD1dBbES1ADQWyw/cSQ=;
        b=uKX/qzso54tgvSmG8Nol0h4YyzWnddaIzg+80NILqFGRHeMQ+00l5ehCP+nePlq+uC
         8u/EnsE+JMtwbOQOTMUmMJjU7DOlrWzv351p9N1euLmqaFAckta3fSeG4yOEewMPMDNV
         UPy+VhmKFw9Oh3c4iGDMv05iwrPn4uLlxD8avG7sfCVlVNpllgDZrENDjZIfNcgyqvZq
         c+y15nXzcGhF46miPqxXFc7BhveY6Uskb9/g8lEeUGasm7t1nhqLHbc9XUgvqmJ6z/Bi
         8NRcHXDM649qImrLK82+wOoEN9ChtQw5LEuy7YVNwHfQbQTk4VrALPp1Kl2xtEBZtEsJ
         uL1A==
X-Gm-Message-State: AOAM531C7OfafoPIquUDKsF7oYNWsdFlwJnr3/zMJWuWheEaVoYp0Wd8
        osDvvhMjylvmm+8ulEE72y/JUg==
X-Google-Smtp-Source: ABdhPJyM38k3nbNTIdMzbfDCjcuDIn2fZ5gNnfZoSC241xKOUSNHw7HTf/ihb3IWGPrAVzYSSQ9IGg==
X-Received: by 2002:adf:dd09:: with SMTP id a9mr3919342wrm.128.1606397773337;
        Thu, 26 Nov 2020 05:36:13 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id l3sm9056280wrr.89.2020.11.26.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:36:12 -0800 (PST)
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
Subject: [PATCH v2 1/4] input: mouse: synaptics: Replace NOOP with suitable commentary
Date:   Thu, 26 Nov 2020 13:36:04 +0000
Message-Id: <20201126133607.3212484-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126133607.3212484-1-lee.jones@linaro.org>
References: <20201126133607.3212484-1-lee.jones@linaro.org>
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

