Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301032C9807
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 08:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgLAHUb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 02:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbgLAHUb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 02:20:31 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B5CC0613D2;
        Mon, 30 Nov 2020 23:19:45 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id l4so675763pgu.5;
        Mon, 30 Nov 2020 23:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sNpPGZCHFhgFuvUcRqwlwBMglXYapWycTs5IELMM5Zw=;
        b=TCRdQahQldxbleL/2WUpDoHYo+Y4B9gRAE7gBc0lUlnkmSkOJNcyb4bxtzSl9Pfk2B
         Flvt+43mcT1uhTGpnjRb/pwRcusVoR3FKA9MFaiJGb1RDUK40nKw5M+cwdoNLWQUChxm
         6AlNjsXoC95NFr1v9rUOPAv/Oige2rpiGKoCkg2UoXZxEQKvj2N+gPtWFQ5rgcenfrBR
         6N5r6rYNfWysD0SnXdspqpEgm9hmZN7xG8T8vZAKATi6lECuP707uxl5K7gLlGxbSU8i
         QGITtPpGn5bsEkaubZdjKd/8Fr2t5mkauGizkcSSmxUz1Qt42zaDy9cZ7RzVncTIQFvg
         jukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sNpPGZCHFhgFuvUcRqwlwBMglXYapWycTs5IELMM5Zw=;
        b=KEc6X6yqdGkDEBaFdFf3nStn2Y5F3YVQaRvUrOVWwvEGFJgi/DHrPSP4U5m7hvTBkl
         zQ/pDM61cHK2myIAKWJupk9tvglzi0CjiN+HNIxAHB+WXl2QY0eJUxiVHxOKIeog601s
         T/kOrphnIA4BYfsKgZTjLQ3/P6Rg97dB7Z43wbzRQDhAs+UbFR+3UdJXRSBsdk0tZlbg
         Qp79rilezZN7E6Znu5BZi8P4TQjRrc14wHatWPJolDQYOM/l/4wgjCokjtrqqu+hHbsQ
         BC6jsiF7WWUglUf9aT37O2olAspc6ZPPF6aqgGFocNqNkRv2/wToDy1w76uKMw315Trl
         iS4w==
X-Gm-Message-State: AOAM532i8rbgR0nrmWWc0BuJIEoOTDNbZ9m9biLzagokRuxzJ6XaHuw3
        2axd7f8sr9+1dMySzhECf06gKth74Eh/bgpc
X-Google-Smtp-Source: ABdhPJwrUW6IinzJALyumDlrGFxhO2vWtB+ma2CNhk356v+j6ZIltRY13yXEFrclXjo+oGx4pM5WtQ==
X-Received: by 2002:a63:df14:: with SMTP id u20mr1137390pgg.77.1606807184609;
        Mon, 30 Nov 2020 23:19:44 -0800 (PST)
Received: from archlinux.GovzHome.Govindz.co.nz ([2407:7000:aa27:b302:92e6:aee5:1373:39cd])
        by smtp.gmail.com with ESMTPSA id l3sm1150064pju.44.2020.11.30.23.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 23:19:43 -0800 (PST)
From:   sanjay.govind9@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     Sanjay Govind <sanjay.govind9@gmail.com>, aicommander@gmail.com,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] INPUT: xpad: support Ardwiino Controllers
Date:   Tue,  1 Dec 2020 20:19:23 +1300
Message-Id: <20201201071922.131666-1-sanjay.govind9@gmail.com>
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
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c77cdb3b62b5..91a5c7e7bdd2 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -245,6 +245,7 @@ static const struct xpad_device {
 	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0303, "Mortal Kombat Klassic FightStick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x12ab, 0x8809, "Xbox DDR dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
+	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
 	{ 0x1430, 0x4748, "RedOctane Guitar Hero X-plorer", 0, XTYPE_XBOX360 },
 	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
@@ -418,6 +419,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
+	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
 	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
 	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x146b),		/* BigBen Interactive Controllers */
-- 
2.29.2

