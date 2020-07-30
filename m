Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8113B2335D1
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 17:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbgG3Pov (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 11:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbgG3Pou (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 11:44:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9207C061574
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 08:44:49 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so25342903wrs.11
        for <linux-input@vger.kernel.org>; Thu, 30 Jul 2020 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=wzYqFtqKjg8PRXgfibVwrHndFM+p4gHeofCPD8HlVYM=;
        b=VrGqHT5q+Z52x6+oL92dn2whiNxSn/ANDbQMK42UAw1yKx+Kc81CGW4h49/Nh+5nKV
         G1LYvCzPSbpvYTNwfS0GmkaBf8fbEcUA53S66sB7PQ88wc2zB+X8lHn78RvJuoiOM/00
         CpJDo7OGKEW9nZhyxTJSt+Wy2P45oJnd7s4iU0TsxkDWdfqaLB/BPcFjGDkGunBs/89t
         BJw2y8cz1MYWu40AfquTqgv5x12DPO9+LoWq1ZmW6oER9kjojqRDYSu6M7U3vbkfSAFT
         5EpRe2qB4KZFQEifqXZgxHCSqAke5qrHQ8mU2qrlxvrW6UdlXVSsEWoEs36HdXjxKBfY
         CK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=wzYqFtqKjg8PRXgfibVwrHndFM+p4gHeofCPD8HlVYM=;
        b=CfEERLVu6y4O1jM+4fb3JrVeJbYSgVWDyqGHIT1uZjggpvGZhWdgm8kfqSMMYZ3a+B
         4uz42J7utysCOiPfebEWR02J7b3ty0JWfbQf2LHtr+zC22Ens1C8xUux3mfBLzOHEH+y
         tkD1D5KzMY4ZLbdVIIqiaWEv/mhN1JUusRjv1UdCcj1gGSVEuIRK/0JqMoRo2xLgeloH
         ZMDp+KjSXMqDS4L42XR34TelSpArZsarqOGplRcePYsadOzRW/8YlmHGQbUarHaQIsUT
         lvXtn0X+cYGe1RSuX9ogHciWRLGUTBAYEnqFV/5qFDlhPqw7ge0EnKAPXHuMQDvxIYUh
         YDsA==
X-Gm-Message-State: AOAM5319t44Ygyg/2cg9e7OqOOPVOmn1Jw1B8yAEQuw6mjhazk2pwFZl
        Y101pI1wkx+zXpxpMP8ART8=
X-Google-Smtp-Source: ABdhPJzhuoIizndqwgJC8sKDwOvsZJgH018P4OBpgCBozD7l1pRymOfBFt7oo5dAM0AA6YqMNgiQ5g==
X-Received: by 2002:adf:92a1:: with SMTP id 30mr3600271wrn.56.1596123888509;
        Thu, 30 Jul 2020 08:44:48 -0700 (PDT)
Received: from 168.52.45.77 (201.ip-51-68-45.eu. [51.68.45.201])
        by smtp.gmail.com with ESMTPSA id j5sm9944418wmb.15.2020.07.30.08.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2020 08:44:48 -0700 (PDT)
From:   Ismael Ferreras Morezuelas <swyterzone@gmail.com>
Subject: [PATCH] Input: xpad: Remove a conflicting Razer Sabertooth using the
 VID/PID for the Razer DeathAdder 2013 mouse
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Valentin <benpicco@zedat.fu-berlin.de>
Message-ID: <b9e7cb27-1866-83bb-b453-ae265ab6bde6@gmail.com>
Date:   Thu, 30 Jul 2020 17:44:46 +0200
User-Agent: nano 6.4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While doing my research to improve the xpad device names I also noticed
that the 1532:0037 VID/PID seems to be used by the DeathAdder 2013,
so that Razer Sabertooth instance looked wrong and very suspect to
me. I didn't see any mention in the official drivers, either.

After doing more research, it turns out that the xpad list
is used by many other projects (like Steam) as-is, this
issue was reported and Valve/Sam Lantinga fixed it:

https://steamcommunity.com/app/353380/discussions/0/1743392486228754770/

(With multiple Internet users reporting similar issues, not linked here)

After not being able to find the correct VID/PID combination anywhere
on the Internet and not receiving any reply from Razer support I did
some additional detective work, it seems like it presents itself as
"Razer Sabertooth Gaming Controller (XBOX360)", code 1689:FE00.

Leaving us with this:
 * Razer Sabertooth (1689:fe00)
 * Razer Sabertooth Elite (24c6:5d04)
 * Razer DeathAdder 2013 (1532:0037) [note: not a gamepad]

So, to sum things up; remove this conflicting/duplicate entry:

{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },

As the real/correct one is already present there, even if
the Internet as a whole insists on presenting it as the
Razer Sabertooth Elite, which (by all accounts) is not:

{ 0x1689, 0xfe00, "Razer Sabertooth", 0, XTYPE_XBOX360 },

That's it. No other functional changes intended.

Fixes: f554f619b70 ("Input: xpad - sync device IDs with xboxdrv")
Signed-off-by: Ismael Ferreras Morezuelas <swyterzone@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c77cdb3b62b5..1510438c5578 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -249,7 +249,6 @@ static const struct xpad_device {
 	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
 	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
-	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
 	{ 0x15e4, 0x3f00, "Power A Mini Pro Elite", 0, XTYPE_XBOX360 },
-- 
2.22.0

