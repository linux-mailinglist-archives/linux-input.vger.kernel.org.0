Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244C136D490
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 11:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbhD1JLo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 05:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhD1JLo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 05:11:44 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6914FC061574;
        Wed, 28 Apr 2021 02:10:59 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id p12so44268682pgj.10;
        Wed, 28 Apr 2021 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=O85XFdsg7r8NEHhiBBrs/ubTFhw8JUhWaRtVRmWSkLs=;
        b=PSDF6tnsZtA1yXC2axThlCFTdJdEObYbsDIuM9MCmt5thMC+wq/SQGNoj5zKdXNxRy
         8bSFqX2Ic2mJ2Baipp49sIQFW8PcX3G1aJGq/wlrt2+KlIKvDQN8hOsy0yfb3+YyXbHn
         Dsxf4xbcFSeKu3tolQlAE6UMrI96vkurG5Q1v21V3mnRgHS2d76f0bh0j33PCU3Bp2lc
         YcQ5/CvfuXkc8LvWXhmTFFvFhl20rGi2dMu/8miAPrys97lpid5/KqzDiKEEeuv2h6Vl
         7T27hSMFPotsZDCw9c/7caJ9jsStCHO8ZIEU6J/sECKDEgZvCA3flz8Doc6zbzgnzphs
         qHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=O85XFdsg7r8NEHhiBBrs/ubTFhw8JUhWaRtVRmWSkLs=;
        b=OO48EHTmTHCE2D5Hf+qxjmx5P7/jr9bjnllFnacJHrr8Z93jWwnrTmU2CwWUSfoj5c
         A2RC++IOIYhZOl3kk/0qrDHT7LRRTf8110mE0bhSvQ81acn+L948LFzPKzoJ1pbVDfnp
         1oAbzF6PeO1nkAjKQXPEy2WJhDs5rz9d7ZsEUCQLft+N6k/pZ91ns44MeRfbZZALlMb9
         ErJ61nPBlMqSiLHmaf3BYwVkFpOZ81gP5aHdyy7ynfXLEeil9pU3MDavs8thXJxJyZQh
         HZd/nZ0GOdPt/c8LrdtidKtZ+1j+Q7u1IDTIc/vJMv6Xg/cS612RJGiQdKHEjCJiMU6F
         ax5A==
X-Gm-Message-State: AOAM530VahwkrcJqMGD6FcLhqnT7zts5q8N/Yg0uoEbH1VvSBbqaKm13
        f0Cv/9Kg22MEbBmfZXBZkUo=
X-Google-Smtp-Source: ABdhPJy1lgD7dYF7XzFsJb2YQwv50F6TNHuKsbGtiX37gk3W4qraGlVjGBQoPnTPqk0N1GgTz7uoLA==
X-Received: by 2002:a63:da55:: with SMTP id l21mr7223636pgj.188.1619601058856;
        Wed, 28 Apr 2021 02:10:58 -0700 (PDT)
Received: from localhost ([223.237.176.217])
        by smtp.gmail.com with ESMTPSA id a20sm4731761pfk.46.2021.04.28.02.10.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 02:10:58 -0700 (PDT)
Date:   Wed, 28 Apr 2021 14:40:50 +0530
From:   Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     shubhankarvk@gmail.com, colin.king@canonical.com,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanjanasrinidhi1810@gmail.com
Subject: [PATCH] drivers: input: misc: ims-pcu.c: Fix usage of spaces
Message-ID: <20210428091050.ryr7kxlxre7uhye4@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unnecessary spaces have been replaced with tab space
This is done to maintain code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/input/misc/ims-pcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 08b9b5cdb943..1e1b71166e12 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -647,8 +647,8 @@ static int __ims_pcu_execute_command(struct ims_pcu *pcu,
 #define IMS_PCU_BL_DATA_OFFSET		3
 
 static int __ims_pcu_execute_bl_command(struct ims_pcu *pcu,
-				        u8 command, const void *data, size_t len,
-				        u8 expected_response, int response_time)
+					u8 command, const void *data, size_t len,
+					u8 expected_response, int response_time)
 {
 	int error;
 
-- 
2.17.1

