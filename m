Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666ED2C97AA
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 07:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgLAGth (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 01:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAGtg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 01:49:36 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E889C0613CF;
        Mon, 30 Nov 2020 22:48:56 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id v1so635988pjr.2;
        Mon, 30 Nov 2020 22:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dk2Z1eCeA2+ln1Aj7Jv+4mmrerL9/IMIjrPeBWfbcYY=;
        b=AZj4va6QdxcyXtz5DQs0Kz94jPE3JZbffdjwDSmEB6lVQytpag8bAEwkeuQMWLMfuw
         T/NLgt5sj7zMEQB4wF/4e3hrYULlpbykfsx9Hj0toDfqFFOpe2H9mCu9+fN0hJoxXWQB
         kXn+2lIZfPXoyEbxugA43Mx83FTHknE6wJKjA6oVV/WBTi2MXDtMxnmAHJkXePLxqupL
         EwoWMfnCazaFcl7Wo9519qR5ODkWBEraz+W1JChG/9UcjISgVfu7G9Kyt3642Pzr1knP
         tSRZiKv9RTz/OeOpn8KqO22Y7LG2Hln257yXP/G2IJLR50WZngS3N/2NlwLxIKBiAi2A
         Ebpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dk2Z1eCeA2+ln1Aj7Jv+4mmrerL9/IMIjrPeBWfbcYY=;
        b=NT8uidutg8cjvCkq7jy+H4arxHcL5FcVPp/l8KM9tlfJiQ1kXCN8bWUvi8H3h/svL9
         Gj/yI+QdE6HeFFhjO2vjDn6PmggV+UwhcPOaz0yASZ+LtVKMrMBbilkcgfikunuKvyoO
         kiSsnD1e9yN2Ty+6pzI+c892zzAgqWBuWqAkCyO02L+w+4oras+Euq4RPzdFycnRYZXm
         NCEwnonW1Uc6iVAb/Na9boxrnpoiqYq3TazhGNleVwM1qIqW63OZOOLfqmTUAVhibZNh
         tvLmWAF1GeDq6uk6764RCjwUhQ5AvcuvCwBz/X0H0uobic5QlobwzMzoCVgAirrSG87/
         mrvQ==
X-Gm-Message-State: AOAM533m+Xmj2gzoCs80AngxXEzIKpt7KWkPpmT1bZEA4FA3iEGjA9R8
        6AgtLWjwj+1N5Y0uuLVsynk=
X-Google-Smtp-Source: ABdhPJwZ/X97r+Knl315CF6O//3POZhF45zaYg5twieZPyh6XXDwcbQ9mpXHUv/93HGFXmIhJTc71w==
X-Received: by 2002:a17:90a:43c1:: with SMTP id r59mr1294063pjg.13.1606805336162;
        Mon, 30 Nov 2020 22:48:56 -0800 (PST)
Received: from archlinux.GovzHome.Govindz.co.nz ([2407:7000:aa27:b302:92e6:aee5:1373:39cd])
        by smtp.gmail.com with ESMTPSA id z12sm1286727pfg.123.2020.11.30.22.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 22:48:55 -0800 (PST)
From:   sanjay.govind9@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     Sanjay Govind <sanjay.govind9@gmail.com>, aicommander@gmail.com,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] INPUT: xpad: support Ardwiino Controllers
Date:   Tue,  1 Dec 2020 19:48:45 +1300
Message-Id: <20201201064844.128122-1-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sanjay Govind <sanjay.govind9@gmail.com>

This commit adds support for Ardwiino Controllers

Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c77cdb3b62b5..c9d78e2acb38 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -418,6 +418,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
+	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
 	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
 	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x146b),		/* BigBen Interactive Controllers */
-- 
2.29.2

