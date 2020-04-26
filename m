Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566861B91C8
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgDZQf4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgDZQfz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:35:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D5FC061A0F;
        Sun, 26 Apr 2020 09:35:55 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id w145so11781730lff.3;
        Sun, 26 Apr 2020 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=chvzGb22w/xcfuOSVALd3W/Z7BSLnEOHRuy2SgipTtI=;
        b=i1/aeuQxrp7pq08b3zW+tT16ElxsTJ8jYeOiFIqM6yMeJNwP5Yug3Z4VYbp+cMYTKJ
         fTT2FDHkZbXLNgnhGBwDH/bXS4W1+ioplqfiBuihBmaJz/wALusY8i5eH8UPjO1vwcDj
         BIkXsxkNm3CvDPABq6hnZu5DD9Lazrn0VaCqkGw4tqiP8QhWiPRTmWUfz1GH0NMwMB6+
         A6a7/5NsG7ez92BlcRiAMrH4/0AtgD6zk/+qdkRI3b3JI5jzGSM50bgm5mhwU3+n4Rck
         nicG6vEWGPbsYDak89tHCyqhUnm79V5IMb/r79aC0BkS3DHe3zFbbGbiQshN90SymUk5
         Urww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=chvzGb22w/xcfuOSVALd3W/Z7BSLnEOHRuy2SgipTtI=;
        b=gCeAnlrphEcQHb++B2T+buHV0iSY2j13Yq3MhJalRPCaGeCsHSEj83rkxVTAaEyIls
         Jc//3IjbKcOEouh4H5RjbwRWYpsrXD7Ydb3YZarz6V7hZ00aWw6HSbb5QkxNcTMCLe2G
         Uj1ZeCGDoanV2/0l/XuQK19yZyBn3X/3QB70rCfbYKZDh+kFiVTAknRFb1B3wrB2FqHs
         xoH+INgebVNK1Nw3po72+Fk57KZqpaZ3nWoBgAljWvEHukTz8fmh6f3No+cUvTXYRERd
         disdFtvitX8br20yz/vzVXE3ZhljAvv9LOselfSG17W5wxrl/8077ZKLh57BWQPwsTT9
         rU4A==
X-Gm-Message-State: AGi0PuZaimZJHaM+o5ey7MBO/UpWs/tp7DTx/u1pHDlq3enMk/uymRCt
        cPrqGq8g1lbaStQQxgXlGXt0AGtA
X-Google-Smtp-Source: APiQypJ2Oi5GryydFbN+P4YGg7PUq4QJWZbVDteCxC1022EUilUkwX+q41voPv+WzeNxBu1oRONkqA==
X-Received: by 2002:ac2:4d12:: with SMTP id r18mr12869471lfi.181.1587918953615;
        Sun, 26 Apr 2020 09:35:53 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z65sm9525650lfa.37.2020.04.26.09.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 09:35:52 -0700 (PDT)
Subject: Re: [PATCH v4 03/10] input: elants: remove unused axes
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <b6cb0f810eec2d5c6245d6128502eebd342ca02a.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0f66e93c-9c71-73d0-90b8-15e0802a79c5@gmail.com>
Date:   Sun, 26 Apr 2020 19:35:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b6cb0f810eec2d5c6245d6128502eebd342ca02a.1587916846.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 19:11, Michał Mirosław пишет:
> Driver only ever reports MT events and input_mt_init_slots() sets up
> emulated axes already.  Clear the capabilities not generated directly
> and move MT axes setup, so they are visible by input_mt_init_slots().
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> v4: reword commitmsg; reorder axis setup
> ---

Legacy pointer emulation doesn't work using v4. I think it will be
better to drop this patch for now and add this hunk to the patch #4:

--- >8 ---
diff --git a/drivers/input/touchscreen/elants_i2c.c
b/drivers/input/touchscreen/elants_i2c.c
index 060c60c04f25..3644b5b48081 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1414,6 +1414,8 @@ static int elants_i2c_probe(struct i2c_client *client,
 	input_abs_set_res(ts->input, ABS_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_Y, ts->y_res);

+	touchscreen_parse_properties(ts->input, false, &ts->prop);
+
 	/* Multitouch input params setup */
 	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
--- >8 ---

This hunk makes the DT properties to be applied for the legacy pointer,
fixing the cursor position on Nexus 7 device using Ubuntu 12.04. The MT
still works fine using Ubuntu 20.04.

Maybe input_mt_init_slots() could be changed to set up all the
properties that are needed for the legacy pointer, but I'm not 100% sure
because not very familiar with that code. Perhaps Dmitry Torokhov could
clarify?
