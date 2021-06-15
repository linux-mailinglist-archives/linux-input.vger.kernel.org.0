Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041B13A783A
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 09:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhFOHs7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 03:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhFOHs7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 03:48:59 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126E4C061574;
        Tue, 15 Jun 2021 00:46:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m18so17187612wrv.2;
        Tue, 15 Jun 2021 00:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pRCUOT/E8dqT2MS7y5hoVrqgciUSYOFKJMYzhW2YrY0=;
        b=BUpGoGIdoZpn2ImUTqpffiio8OZDr5JbkFW8k/xHRF9GAAJUnmd9rAnGoSwpTUuvDB
         stmDherc+TKEVSA9qEE94rGf0dcp112iBjhlYegLViNu2n/zjrJc0dtk+iurkwzK2H58
         l3vHqMBcLRizS4l7b+qX/OuWkt/uXKV2AWZUxjdhT0gQvJdd/8aWBZ4Z3j7HQ4WHR/d7
         UEDXtd95ZWKpjyAVE8RPU3cv59Pw6VJ9PVnPaSdWKzDsKQEU3MdagDq3/iVMHvJZv0lY
         frrjxJzYmAOT1do53v0c41IvcsLpagrPkrA+3GV1KGhom6NEafGnC3CWFDl7v+gGWrMl
         iD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pRCUOT/E8dqT2MS7y5hoVrqgciUSYOFKJMYzhW2YrY0=;
        b=P/Z+tKcSQTsLZauxJvRJcS5FvFu3LUMP9u8q8/yz4dnPLWokkw4tuaza+P3+Gr52Oh
         XP3PP4nWCMCq0U7vrvcxUZ9CtK0gYTxkIzJ7d/2cLwUrT9+gbTx/nsiX0nB3KxNMazg6
         Z57zdjrS7E1IF96AivBbtEHIhxAcSykCJPq4974WeUoYYcgwK8xeBqlFsvXtwR6UoYgv
         XLhRb+ymKzhQWHMzGpUBTuXf6rff5s454beX3rg58sU9mHqzslrwmUpbq+L56klhHaut
         LsFXNw2rripmKueUeKAQyIORsdrF7iCvKJgV1T/1cEYjLz2OybImhXmJcCzkI3EDdhEf
         mzpQ==
X-Gm-Message-State: AOAM530djnHFjiHrXRd6jIzElmCfonqxBXDN2CJt2hxLZVgY3BOdE3JF
        1vEH2KNM8k9/DFFjZnjQMvq5iK5C7KWkDA==
X-Google-Smtp-Source: ABdhPJzVQjaR4UNBmnankTfifAG+EcgUpU8iXQyXV68r1OMtobZ5+Lk1teiAowYKEhMIVpNfaln12w==
X-Received: by 2002:adf:b648:: with SMTP id i8mr23498034wre.425.1623743212694;
        Tue, 15 Jun 2021 00:46:52 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.23.224])
        by smtp.gmail.com with ESMTPSA id o26sm14337442wms.27.2021.06.15.00.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:46:52 -0700 (PDT)
Message-ID: <9bf87ee0e1c2a97b0a1b98734e34e456f84ea3d7.camel@gmail.com>
Subject: Re: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 15 Jun 2021 09:46:51 +0200
In-Reply-To: <YMfQR8iM9be5Qg8+@google.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
         <20210613233041.128961-4-alexander.sverdlin@gmail.com>
         <YMfQR8iM9be5Qg8+@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry!

On Mon, 2021-06-14 at 14:55 -0700, Dmitry Torokhov wrote:
> > Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> > to Common Clock Framework.
> 
> Can this be merged standalone?

In principle, yes, but I thought it would be easier if the patches
would go via the same path as CCF conversion.

> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> >   drivers/input/keyboard/ep93xx_keypad.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> > index c8194333d612..e0e931e796fa 100644
> > --- a/drivers/input/keyboard/ep93xx_keypad.c
> > +++ b/drivers/input/keyboard/ep93xx_keypad.c
> > @@ -157,7 +157,7 @@ static int ep93xx_keypad_open(struct input_dev *pdev)
> >   
> >         if (!keypad->enabled) {
> >                 ep93xx_keypad_config(keypad);
> > -               clk_enable(keypad->clk);
> > +               clk_prepare_enable(keypad->clk);
> >                 keypad->enabled = true;
> >         }
> >   
> > @@ -169,7 +169,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
> >         struct ep93xx_keypad *keypad = input_get_drvdata(pdev);
> >   
> >         if (keypad->enabled) {
> > -               clk_disable(keypad->clk);
> > +               clk_disable_unprepare(keypad->clk);
> >                 keypad->enabled = false;
> 
> While we are at it, I wonder about handling suspend/resume. I see that
> we disable the clock even if keyboard is configured as a wakeup source.
> Is it really capable of waking up the system when clock is off?

That what "EP93xx User’s Guide" says:

26.2.4 Low Power Mode
The key scanning block also supports a low power wake-up mode. In this mode, a key press
generates a wake up interrupt. The key scan interrupt should be masked. Because the wake
up interrupt is asynchronous, and depends on external keypad lines which may have a large
capacitance value, glitches may occur on the interrupt when transitioning to low power mode.
After transitioning, all clocks to the key scanning circuitry can be shut down.

-- 
Alexander Sverdlin.


