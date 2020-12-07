Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC642D0ACB
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 07:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLGGlX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 01:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGGlW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 01:41:22 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD76BC0613D0;
        Sun,  6 Dec 2020 22:40:36 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id f17so8077505pge.6;
        Sun, 06 Dec 2020 22:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nst2sbdvR9A2joKvbm5iRIPSSamR5cjpmMutrZgXWuE=;
        b=BBhb+gHY/v594+7w5xZMW0Vx6+jo64Vf7QlAwFBywKj8V9JZ0UqtC6/dXamNMQtuhI
         BzJakTQKRRUwVba3FQFQkfG+gOrfHHAE4b3f38bqspqDFHcCaHcVF00ZOdI7nn7rMVlh
         Y25ApKBw1evE/in0+NF7GpI/4drzEr8iI/sTWqCGgdmZvAc2Vwpbt5b6HlAF96J0sv/K
         E7Wb3gvbWAH3d2+0y03kdO/HpUQlUzUEEHAf7Wx2dO5sdXA9WUZ2bnODVRjGHMclhzaI
         WKzFNL9ltGpK9W619eMfdm7ScERddPcncpvHr7WsjAmZ7z34+DtsmvPN1ErbP4dh71hb
         GGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nst2sbdvR9A2joKvbm5iRIPSSamR5cjpmMutrZgXWuE=;
        b=NR3DzL9cu4rvu+uwCKc2Ke/zWh80Z3qEbPMyzikAWorogh1lcqxY1XA3YvkHwK2RIU
         cyjA64WnYdB7aG1/cKxj85Kn0L3kZrfOl7Zzp1YKl1nsh25bTy1YnnvtIoVELWfjcwvC
         Qdg6CJizHXh1uxZh9IxrUzNWtr78lENGbJi8ftTwmvqAyodM5vP0CtECTsRKOCe3dFWx
         nXDMsaemA2r3uBv88827d3BDdyUMQp90bE+Is1m0YvOA4C/w2byBRGtPooB4dSfhfslf
         ToLmwVx7aVRRlWHRanS34LO0Ln2BIQ14xSwaxN6E2q1K4YpVeHzWCphfZhRuK+TscJ1V
         1f5w==
X-Gm-Message-State: AOAM532Xn0bJ0UMeX4/JS8En0OPxuod+PPs2z5cwMO2g+Jx3qJsvWZwt
        489Xl/En5Ibwgrl2AD1cBH0=
X-Google-Smtp-Source: ABdhPJxBhCwvs4f6nnR2aF2ZFzOS3Bkv+UbCZXKSAlusmN+5H9F7vOpSRrSDGaSvj0DAfXAe/4UbGA==
X-Received: by 2002:a17:902:bc88:b029:da:f94c:dcd1 with SMTP id bb8-20020a170902bc88b02900daf94cdcd1mr3179339plb.81.1607323236192;
        Sun, 06 Dec 2020 22:40:36 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x23sm12786597pfo.209.2020.12.06.22.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:40:35 -0800 (PST)
Date:   Sun, 6 Dec 2020 22:40:32 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-input@vger.kernel.org, Shirish.S@amd.com,
        Andy Shevchenko <andy@infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: i8042 - Prevent intermixing i8042 commands
Message-ID: <X83OYA0TaUszBD1y@google.com>
References: <20200827144112.v2.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827144112.v2.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Raul,

On Thu, Aug 27, 2020 at 02:41:53PM -0600, Raul E Rangel wrote:
> The i8042_mutex must be held by writers of the AUX and KBD ports, as
> well as users of i8042_command. There were a lot of users of
> i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> This resulted in i8042_commands being issues in between PS/2
> transactions.
> 
> This change moves the mutex lock into i8042_command and removes the
> burden of locking the mutex from the callers.

I think there is a benefit for allowing users issue a sequence of
commands to i8042 without interruptions, so I would prefer keeping
i8042_[un]lock_chip() in place.

Given that the issue you were observing was caused by i8042_port_close()
interfering with probing, maybe we could do something like this:


diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index abae23af0791..aff871001eda 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -344,6 +344,8 @@ int i8042_command(unsigned char *param, int command)
 	unsigned long flags;
 	int retval;
 
+	lockdep_assert_held(&i8042_mutex);
+
 	if (!i8042_present)
 		return -1;
 
@@ -364,6 +366,8 @@ static int i8042_kbd_write(struct serio *port, unsigned char c)
 	unsigned long flags;
 	int retval = 0;
 
+	lockdep_assert_held(&i8042_mutex);
+
 	spin_lock_irqsave(&i8042_lock, flags);
 
 	if (!(retval = i8042_wait_write())) {
@@ -411,6 +415,8 @@ static void i8042_port_close(struct serio *serio)
 		port_name = "KBD";
 	}
 
+	i8042_lock_chip();
+
 	i8042_ctr &= ~irq_bit;
 	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_WCTR))
 		pr_warn("Can't write CTR while closing %s port\n", port_name);
@@ -422,6 +428,8 @@ static void i8042_port_close(struct serio *serio)
 	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_WCTR))
 		pr_err("Can't reactivate %s port\n", port_name);
 
+	i8042_unlock_chip();
+
 	/*
 	 * See if there is any data appeared while we were messing with
 	 * port state.


Thanks.

-- 
Dmitry
