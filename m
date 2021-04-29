Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E6236EF00
	for <lists+linux-input@lfdr.de>; Thu, 29 Apr 2021 19:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240917AbhD2Rhb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Apr 2021 13:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbhD2Rhb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Apr 2021 13:37:31 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19BBC06138B
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 10:36:44 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id j7so38246412pgi.3
        for <linux-input@vger.kernel.org>; Thu, 29 Apr 2021 10:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AXnNG//uI6UzI+LacV/tB+eSQ+ET+C4V/gt9RJQIfIY=;
        b=NZvMJliuNZgK1+eGDe80k5PB/1SBfEGOr5B1t5miC6z3ORr3TuxDY2K+ZwSDmC8Cye
         qz/sHCHGmT6YO1rQNm0AP0t0OdCqOrt+Fg4DCap2Q64VCB4vXmUj+KBECPsK3gIHZr+T
         727s3ESZZPHCuaeuXGpDK291q7bim+AwsrgrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AXnNG//uI6UzI+LacV/tB+eSQ+ET+C4V/gt9RJQIfIY=;
        b=qHPRPp65beDmPgwPD/l8hgkzyJxaecqYIlm+pgoY+hbr7wKFrM9fDiUCbr/GZe0q9H
         1JjhgjuwE0stCcshUPts01UzFGMhY+JT7E82WguVlOMaqBtujyzqJqOsW+OWc9mncDOK
         bIjXejlbQKaYr/Azzf4XhyHvan/kYj2eUhCCOfvWKnwz+J2kRcuYz38104+2kFZt0Wrk
         fUnQZzyPS8+RgkDZkBb9YLr4RsqTmEV2+vZG31HFWpacA5sqXdl0ibO3uGJus9QQy6UK
         WQMSj/+8gCdoUkkmUIx7XuhEwgT8FdJe7/BdBWLjD0E6HmMjXlYebpR9i+3P2Uszz1qX
         G/VQ==
X-Gm-Message-State: AOAM530+j5sMKM23QjNcdnLiYjEmYiiOtqPjXuw3HFvTTCf31Sqw/Lx5
        fEDzHbKq6i7zpbmndUAmcEFZrg==
X-Google-Smtp-Source: ABdhPJyOCIIrVgLByDkjGatJhd5XRT9aDrboAZZ282bTbIMJYMV9LlHmy+wM5N9j4lTY2jx0LF9aiA==
X-Received: by 2002:a63:e347:: with SMTP id o7mr828830pgj.184.1619717804263;
        Thu, 29 Apr 2021 10:36:44 -0700 (PDT)
Received: from mrr-linux.mtv.corp.google.com (047-224-219-247.res.spectrum.com. [47.224.219.247])
        by smtp.gmail.com with ESMTPSA id c24sm2187072pfi.32.2021.04.29.10.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 10:36:44 -0700 (PDT)
From:   Matt Reynolds <mattreynolds@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Matt Reynolds <mattreynolds@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: xpad - add support for Amazon Game Controller
Date:   Thu, 29 Apr 2021 10:36:11 -0700
Message-Id: <20210429103548.1.If5f9a44cb81e25b9350f7c6c0b3c88b4ecd81166@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Amazon Luna controller (product name "Amazon Game Controller") behaves
like an Xbox 360 controller when connected over USB.

Signed-off-by: Matt Reynolds <mattreynolds@chromium.org>
---

 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9f0d07dcbf06..d69d7657ab12 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -268,6 +268,7 @@ static const struct xpad_device {
 	{ 0x1689, 0xfd00, "Razer Onza Tournament Edition", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfd01, "Razer Onza Classic Edition", 0, XTYPE_XBOX360 },
 	{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },
+	{ 0x1949, 0x041a, "Amazon Game Controller", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0002, "Harmonix Rock Band Guitar", 0, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0003, "Harmonix Rock Band Drumkit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1bad, 0x0130, "Ion Drum Rocker", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
@@ -440,6 +441,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x15e4),		/* Numark X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x162e),		/* Joytech X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
+	XPAD_XBOX360_VENDOR(0x1949),		/* Amazon controllers */
 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harminix Rock Band Guitar and Drums */
 	XPAD_XBOX360_VENDOR(0x20d6),		/* PowerA Controllers */
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA Controllers */
-- 
2.31.1.527.g47e6f16901-goog

