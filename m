Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0EA4273AC
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 00:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbhJHWZ3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Oct 2021 18:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbhJHWZ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Oct 2021 18:25:28 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A79EC061570;
        Fri,  8 Oct 2021 15:23:32 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id p4so10989418qki.3;
        Fri, 08 Oct 2021 15:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7BcxdZb9CxJZFbXbFYn0KgwWSM58NcabgiQg/ZHqYg=;
        b=hkld7NCh26YcK52IWI9WVPSu5jz7Gu8JOZ5vBnTbmDfCGZMSMpB+PnmHLEBBtwVysV
         dobgRfdTFk79E47Qh2bIQWLYRiXcqGF18Eo74g8xKCU0Qus9L8YzRPCOMPasB50/Ym7g
         kv9sDFJOZShqR0d5B5e6FFFsE0DihvTsTy3KryU+ik3ATA1yiNzZAh4Rmfe1eE2GYWXA
         hRLeTD3s6xEtLeZBLucGyGOag8Y0MZunDAm8/XY2TeSlrpOUHnEfTjM2gNtMuSx1AK3u
         hN3Nk4AUxoyZvo0jnZa1+0hDyEcPA++PQKDn5xTcpuppd2mXFNsZKDMpJ0wRkZJn5JkO
         4F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v7BcxdZb9CxJZFbXbFYn0KgwWSM58NcabgiQg/ZHqYg=;
        b=vZE3e9WARX59Z6u++7VCd4Hm9OEtcamaeRdyPptILP+BNmC6W3LZkt79/uEzjGUEFV
         hc3DsApWGkjlc5+LN1UdUGRjvabXvMt+lrnbPvPikYjOQFt47HidrZiIB3a6N4tclBrQ
         S7YuyDp+wBiks9WUQlUyMKIl2ZaLavyCSO0eOeZVdoxscf/GL7LgdCc7mqvSypAOcwQB
         3vzJze3LAYd9Qrrepwu1M7NJIn6p0he4TqsAneZmVJ080Viu6y2sg9E0E0puT5joKoPN
         TDRhCirT+5zobrjRroWx/DfvxbK6fQxXEKu13MHSPQjHHNrEYM39s+g/EpaJy3Mw/g1h
         AjRQ==
X-Gm-Message-State: AOAM531yg+gwovE/Ps8E4ezR7ux6ZxfTcfhdAGKHDYrsci0wLEDif3Q2
        qHzcUeYHlgiOrtsoT+xY1Vmslm2VqUKwPQ==
X-Google-Smtp-Source: ABdhPJyW5nPHEX5hAH2Dk1Q5vmit7eL1kgU/bhWzYzcJoWKg1QeNQxLIJ1TTZitIoeSBj+B/bIB6Rg==
X-Received: by 2002:a37:a48d:: with SMTP id n135mr2958033qke.296.1633731811660;
        Fri, 08 Oct 2021 15:23:31 -0700 (PDT)
Received: from fedora.. ([201.46.20.96])
        by smtp.gmail.com with ESMTPSA id d14sm551249qkg.49.2021.10.08.15.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 15:23:31 -0700 (PDT)
From:   "=?UTF-8?q?Vin=C3=ADcius=20Angiolucci=20Reis?=" 
        <itsme.vreis@gmail.com>
X-Google-Original-From: =?UTF-8?q?Vin=C3=ADcius=20Angiolucci=20Reis?= <angiolucci@gmail.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        angiolucci@gmail.com
Subject: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to KEY_SCREENLOCK
Date:   Fri,  8 Oct 2021 19:23:27 -0300
Message-Id: <20211008222327.9324-1-angiolucci@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Windows systems, ASUS laptops uses the "turn display off" key
(usually fn+f6) to turn both display and keyboard backlit off. On Linux
systems, this key has no effect at all since most desktop enviroments
don't deal with KEY_DISPLAY_OFF. By mapping it to KEY_SCREENLOCK
instead, would enable desktop environments to handle this key as a
screen lock intent from the user, out of the box.

Signed-off-by: Vinícius Angiolucci Reis <angiolucci@gmail.com>
---
 drivers/hid/hid-asus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index f3ecddc519ee..5d57214d8dee 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -854,7 +854,7 @@ static int asus_input_mapping(struct hid_device *hdev,
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
-		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
+		case 0x35: asus_map_key_clear(KEY_SCREENLOCK);		break;
 		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
 		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
 		case 0x82: asus_map_key_clear(KEY_CAMERA);		break;
-- 
2.33.0

