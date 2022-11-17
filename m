Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAE762E9D5
	for <lists+linux-input@lfdr.de>; Fri, 18 Nov 2022 00:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbiKQXse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Nov 2022 18:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbiKQXse (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Nov 2022 18:48:34 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C906634E
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 15:48:33 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so9110577ejc.4
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 15:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z3mPD0EkSC7Adcy7hDuBH4FB8RYIrp9aVOpCxQKz9XM=;
        b=gvzYiwmC5Usie4K8x8fmGF5PQz59G3pBnzjLLnBfw0wezFFVFeTv9KHN5vqOrlrxh6
         5X6arL4hwtdiCBAeZd/YvDvfLUPGj/alNej9nOZIUSwjNcRMz4xchg5F55f8T0CgcqL5
         58KC/dH/1eYW44i3wmJSESBm8ejzkEXckQ1Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3mPD0EkSC7Adcy7hDuBH4FB8RYIrp9aVOpCxQKz9XM=;
        b=ToUSMjYDy1k6sN/FfTVbzrwC4QB1YtLBkwZLltqjIXZJZc6rgSEc8g+1SgOR9t3XAP
         jpDdHA40jEgIX7YrXIgXHYOitGzTpyIUMXv4k/e8adSQxTJ+1iOhTCzLtKbdt63Krw7u
         zFagHDKB/O8pYMRgpgMMkAf7G4h0mv2HXCiFqAaFlze+zh4GYSvZO1u8pz9LuDlBd1OT
         BxgiamtSVZ1wtchIDZcb2O98K2qteJiZYwR9YKC8agQYa87SEx51vghC7A3YuL9VkcA1
         s6L9Pt4LyKp40FqsetpKcT85vSLZfaE0z2wHbxSagJnvRNklbA6qIHZe3aBVPx85t83a
         Ap3A==
X-Gm-Message-State: ANoB5pkyqqdglqRbdcYrvrAnq777FYpBl/yOmCYYgU2J/ZU0dqfQBzaO
        7wWQH1ewRi9jPuBiUz2gdbEdyq8OPt9Yw/Q2
X-Google-Smtp-Source: AA0mqf7UUvEwRw5Gz6WReEnmM2ZKlBXvkEtvq9DzeC0SAFY+GbfjcNMjKZ87OjPHcefaAuWAa4Xc0w==
X-Received: by 2002:a17:906:480b:b0:78d:9f25:6103 with SMTP id w11-20020a170906480b00b0078d9f256103mr4038333ejq.168.1668728910602;
        Thu, 17 Nov 2022 15:48:30 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id eq5-20020a056402298500b00461cdda400esm1106971edb.4.2022.11.17.15.48.29
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 15:48:30 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so2683179wms.0
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 15:48:29 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr3301736wmb.151.1668728909254; Thu, 17
 Nov 2022 15:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20221117123805.1.I9959ac561dd6e1e8e1ce7085e4de6167b27c574f@changeid>
 <Y3ayEc8sFCLahOT3@google.com>
In-Reply-To: <Y3ayEc8sFCLahOT3@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Nov 2022 15:48:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UuLKgM+0UNfRZBij1EkEZs0nQHOkY3Xp9BE2bbJWcdqQ@mail.gmail.com>
Message-ID: <CAD=FV=UuLKgM+0UNfRZBij1EkEZs0nQHOkY3Xp9BE2bbJWcdqQ@mail.gmail.com>
Subject: Re: [PATCH] Input: elants_i2c: Properly handle the reset GPIO when
 power is off
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Nov 17, 2022 at 2:13 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Nov 17, 2022 at 12:38:23PM -0800, Douglas Anderson wrote:
> > As can be seen in elants_i2c_power_off(), we want the reset GPIO
> > asserted when power is off. The reset GPIO is active low so we need
> > the reset line logic low when power is off to avoid leakage.
> >
> > We have a problem, though, at probe time. At probe time we haven't
> > powered the regulators on yet but we have:
> >   devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
> >
> > While that _looks_ right, it turns out that it's not. The
> > GPIOD_OUT_LOW doesn't mean to init the GPIO to low. It means init the
> > GPIO to "not asserted". Since this is an active low GPIO that inits it
> > to be high.
> >
> > Let's fix this to properly init the GPIO. Now after both probe and
> > power off the state of the GPIO is consistent (it's "asserted" or
> > level low).
> >
> > Once we fix this, we can see that at power on time we no longer to
> > assert the reset GPIO as the first thing. The reset GPIO is _always_
> > asserted before powering on. Let's fix powering on to account for
> > this.
>
> I kind of like that elants_i2c_power_on() is self-contained and does the
> full power sequence. Can we simply change devm_gpiod_get() to use
> GPIOD_ASIS to avoid the momentary spike in reset line state (assuming
> that the firmware initializes the reset line sanely because if it does
> not we have much longer time where we are leaking into the controller)?

I'm not sure I see the benefit of elants_i2c_power_on() initting the
reset GPIO. In general that function _has_ to make assumptions about
the state of the world before it's called. Otherwise the function
should start:

if (ts->did_I_inexplicably_turn_vcc33_on) {
  regulator_disable(ts->vcc33);
  ts->did_I_inexplicably_turn_vcc33_on = false;
}

if (ts->did_I_inexplicably_turn_vccio_on) {
  regulator_disable(ts->vccio);
  ts->did_I_inexplicably_turn_vccio_on = false;
}

Said another way: we already need to rely on the regulators being in a
reasonable state when the function starts.  Why is that different from
relying on the reset GPIO being in a reasonable state? The reset GPIO
needs to be sequenced together with the regulators. It should always
be "asserted" (driven low) when the regulators are off and only ever
deasserted (driven high) when the regulators are on.

I'll also note that, as coded today (without my patch), the
elants_i2c_power_on() is actively doing the _wrong_ thing in its error
handling. Specifically if either of the regulators fail to turn on it
will explicitly de-assert the reset again which, since it's active
low, will set the GPIO to high and start leaking power / backdriving
the touchscreen. We could remove this bit of error handling but then
we're suddenly not undoing the things that the function did. ;-) It
feels cleaner to me to just make it a requirement that the reset GPIO
is always asserted (low) when the regulators are off.

I guess one last note is that if you use GPIOD_ASIS you still
officially need to change the output later. The docs for GPIOD_ASIS
say: "The direction must be set later with one of the dedicated
functions." So I guess then you'd have to set the direction in
elants_i2c_power_on() ?

-Doug
