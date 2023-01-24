Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64CB678D06
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 01:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjAXAxN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Jan 2023 19:53:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbjAXAxM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Jan 2023 19:53:12 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55701A972
        for <linux-input@vger.kernel.org>; Mon, 23 Jan 2023 16:53:11 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id h10so4660829ilq.6
        for <linux-input@vger.kernel.org>; Mon, 23 Jan 2023 16:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUsxT0mvSicvn6SF4itGCKvV5fItqF6QZkryDaKE9Sw=;
        b=aFKTPxqS9vl+A5fPcV2VxHPMGqLbC63vRjJhrIYKOX9xebbpN+D/jg5jRbea7CNqhn
         eiOgvDjqwBD8B8wOepPxjdp7zQfgTxhiW7RR4n1A7t7mxV0IJTp7pWobTnYYSxB92S8q
         6RvtE0hjBNlLKboGK0oRF4c7VnhTdjbLagLfVpYA8xPMBimkVzT7OxFTGyexmSzYP/PP
         WcdJPWwgu+m0RqLEcoa0OoKo8EZ3dgkG7Zd8uVtqZxVOvy0A+EEGrBsk6mQdEQGCILz4
         OAD21dog4elqd5E/4E3vtHx6U2lqCNwvwxXQ90b4YQiA6riYGN0MShX+/aAqsTy6zfIu
         kjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUsxT0mvSicvn6SF4itGCKvV5fItqF6QZkryDaKE9Sw=;
        b=ExEQqjhvDU7ZMolPpPwSCJJVg+yTRJ4xiCA0GsB5XGyyALUn/XUebCyMRb0jXQrsne
         YVQVdI6Js3NnfMoAz27WL+mE1ZftO+nVEnEXsWAIKg0p2AnIv4LkwQgnnKBjMm5OlmFd
         HXFfmyAGwLzBI3xzg3G4ZQjxfXKorXr5cqWeMpLGTGOfdMEcKcHUMJ/CxWq9dLNTzEhg
         ZBRGolNXlFM0/eW89J0WQet2eHN4JiZkRWV4IVEea9GsWXOULXkVkhM/i6YIr7V+XQz7
         autXrPJJjC+2CWodlG1LybcEQjVu5xI3nLqBQrSfZ7xiWz7/mFR0QqDvCqng5NF0j4Kf
         XekQ==
X-Gm-Message-State: AFqh2kpSI8A8CwBPb5kwFXi8ccmlGZcabk9U+J36oiYnDVWk0mWFNp2w
        nP9O/pr3FjKicHZWDPzmdfYfQPQ3zY8=
X-Google-Smtp-Source: AMrXdXsuk48dlM1CGdMrnR+0ZMQikXqVZXtlgTH2QE7n6nd3P98haHKMtcHZX8xO/R89IVhYjwygxg==
X-Received: by 2002:a92:c90d:0:b0:30d:8785:1e6d with SMTP id t13-20020a92c90d000000b0030d87851e6dmr17667624ilp.27.1674521591058;
        Mon, 23 Jan 2023 16:53:11 -0800 (PST)
Received: from localhost.localdomain ([37.19.221.138])
        by smtp.gmail.com with ESMTPSA id 14-20020a920d0e000000b0030d7eb788e6sm258828iln.31.2023.01.23.16.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 16:53:10 -0800 (PST)
From:   John Butler <radon86dev@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     John Butler <radon86dev@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: xpad - add 8BitDo Pro 2 Wired Controller support
Date:   Tue, 24 Jan 2023 00:52:06 +0000
Message-Id: <20230124005206.80706-1-radon86dev@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add VID and PID to the xpad_device table to allow driver
to use the 8BitDo Pro 2 Wired Controller, which is
XTYPE_XBOX360 compatible by default.

Signed-off-by: John Butler <radon86dev@gmail.com>
Cc: linux-input@vger.kernel.org
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2959d80f7fdb..f642ec8e92dd 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -359,6 +359,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -492,6 +493,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
+	XPAD_XBOX360_VENDOR(0x2dc8),            /* 8BitDo Pro 2 Wired Controller */
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
-- 
2.39.1

