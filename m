Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740F12D2041
	for <lists+linux-input@lfdr.de>; Tue,  8 Dec 2020 02:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgLHBoF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 20:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgLHBoE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 20:44:04 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96589C061749
        for <linux-input@vger.kernel.org>; Mon,  7 Dec 2020 17:43:24 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id c12so5218672pfo.10
        for <linux-input@vger.kernel.org>; Mon, 07 Dec 2020 17:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3t2dcmPtF1caicg+CvnvgxHqGgCIQDV8R0/qFPfyaME=;
        b=ADVc8BY0ob2vkmByy+npVbNqbkbWxNMIWdUAJUuIfL9JRO0+ZHSc3v4JqQuAhvj19T
         CnGcuuCQwBBsuxrKg8+x9t0tEjNLqprUEuq5NduOtN2S8Ib3KRr0qMHt5gHFk+8FuJFD
         L6A/nIbIZ5vUxCc8Dl5KwCIfRETpt3ECA3cOlP3z5jojD8eazTPZH5Dijc+zAtZS29hB
         rLdnpWnPX9JGJ/F7RrgGBkmf+/qM0n7E8srYMtIOwpu7AdtcBag64BVdnFTXkWT2Sui/
         N8/tgmawyDcLRjHn5dj3d9nmU1d98y3nXwmPhCV/TiOSTc6TjdvDmQqfgT4Bb7pfw6fA
         i11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3t2dcmPtF1caicg+CvnvgxHqGgCIQDV8R0/qFPfyaME=;
        b=GyJNe0uKQJb1PqA+CG1FLd9z+cdIxIRsMHZJkby8KSuTtplQvBaiSco+6dnP6Jm4Na
         iTH5HDcaQ4GIdyppyZ4Zxjo6p4S5m5UCzcBdjgfQnKbKIrz2XSrZjHzqJWC460jDIgFX
         pUhzWmeMCQtdn72BKcFfeFwKzYBlwNMlu8hmSwkFwdAK09aepbx+pz/wI24DyBCXXZn8
         AxDa/qMUGr6Z501opHcPbwXataYlG2g8n/RXaYxQonu5ZfHK2FpHf5sn3fs4qw2SjczB
         EkEj+eK7GOYElcWA82d6OAbgUGB2VgdUZMlTGnBtOSaJQiwL7qASKgpxWVvZ3X7a71t5
         ynyQ==
X-Gm-Message-State: AOAM533fUxgUlxHPo11E1aWMpkCxHC1jtGz4z2/PqdbwSt6HPyS2u1S4
        m+1ACYG0SXJWE8LOeeV9KLlVgoDRFNs=
X-Google-Smtp-Source: ABdhPJzl8mdQiKU+cTw03XIbRTdOP/PkEQij+yZzkqQP86Y/57E+XLMnZmIWSlSmfV2QZynI4AsEpQ==
X-Received: by 2002:a63:5845:: with SMTP id i5mr20338279pgm.355.1607391803920;
        Mon, 07 Dec 2020 17:43:23 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v8sm649086pju.32.2020.12.07.17.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 17:43:23 -0800 (PST)
Date:   Mon, 7 Dec 2020 17:43:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>, Rajat Jain <rajatja@google.com>
Subject: [PATCH] Input: cros_ec_keyb - send 'scancodes' in addition to key
 events
Message-ID: <X87aOaSptPTvZ3nZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

To let userspace know what 'scancodes' should be used in EVIOCGKEYCODE
and EVIOCSKEYCODE ioctls, we should send EV_MSC/MSC_SCAN events in
addition to EV_KEY/KEY_* events. The driver already declared MSC_SCAN
capability, so it is only matter of actually sending the events.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 023f083dadd3..354d74d62f05 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -184,6 +184,7 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
 					"changed: [r%d c%d]: byte %02x\n",
 					row, col, new_state);
 
+				input_event(idev, EV_MSC, MSC_SCAN, pos);
 				input_report_key(idev, keycodes[pos],
 						 new_state);
 			}
-- 
2.29.2.576.ga3fc446d84-goog


-- 
Dmitry
