Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D87118603A
	for <lists+linux-input@lfdr.de>; Sun, 15 Mar 2020 23:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729270AbgCOWWx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Mar 2020 18:22:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41271 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729261AbgCOWWx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Mar 2020 18:22:53 -0400
Received: by mail-pl1-f196.google.com with SMTP id t16so28047plr.8
        for <linux-input@vger.kernel.org>; Sun, 15 Mar 2020 15:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=POHJNb39576N/BduiK9PvgWZr9eLq5KMyBpLPw7FP14=;
        b=dnOBtnncH1Svi0h7aIREPik51aNC156AKnVMFrJTFYFJlqbQ4sGf4rTYm2r4dIZ3jT
         HSJ8nVlTizy8WuLzVN368GhyT7lOntoaE/1TEDG3Ze9heAVL5vgVpAjgZLepqIAa/n9v
         Qpeefry7lytsbCtxRtzaLpIUFYGSSuC6FGBYWgOSAFbKjZ9tI50F7djvrXPx1wshCVZO
         kReJ+QhN5B8FXhUAZukOf5GYb6bEN8QKVZE2i9l17QVdA0VTs2I3YNPufRq5mH6ZsJDW
         /jDr6giVaA2pTeTVhqLhmhYfJtY3ATD2PA4TCleAejahQhbHHAEWU8Fq3DMgVGa8TibT
         afZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=POHJNb39576N/BduiK9PvgWZr9eLq5KMyBpLPw7FP14=;
        b=A+NEhxyxnNkzmtD7Q1/3TDyzIstJpAi7IPiYOqWtNVd6WwvDC1WY6zxU8FyovPlGSq
         Vji6HzeuEPgA+/04JB6uMnrjhBMRYoh8QyJzbHpG1v35jOH/Z2RmTOt/+GSomzfFa/GW
         TcEc70VJDBytd7g6qS+RK7WWlfWaBlVDpChxlnv18nmq0IrQv0075e8iSndLoTxQR/o1
         Y39YrlNJiWZUOQ3sLOq35y7i2fHHY1uxAwVNFUM3xEDETdpO64us9jPtn79lGsd8sUux
         MMmUhiHxRby9da3IZLD1xyqxARKMXuKrUFOwoRgkkXNMBsHlFYWlo4X/srrXEXsHLS7Q
         lXGQ==
X-Gm-Message-State: ANhLgQ1V/goTOfzCnOpuby1cFys1HdUTzKila+ttTxyWEti+/fWQP3oz
        SpvJewqTeZ70Fs0PiD/ETME=
X-Google-Smtp-Source: ADFU+vvcUYlUEBBvJcx72WKidEe9GKSCnB391zLdzU8X9yh7qaiC3MpkVo15L+Xbb51yOT2q5xEPvg==
X-Received: by 2002:a17:902:8485:: with SMTP id c5mr23743224plo.156.1584310971714;
        Sun, 15 Mar 2020 15:22:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h22sm62961475pgn.57.2020.03.15.15.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 15:22:50 -0700 (PDT)
Date:   Sun, 15 Mar 2020 15:22:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 2/2 v1] Input: cy8ctma140 - add driver
Message-ID: <20200315222248.GE192640@dtor-ws>
References: <20200310142818.15415-1-linus.walleij@linaro.org>
 <20200310142818.15415-2-linus.walleij@linaro.org>
 <20200310170809.GC192640@dtor-ws>
 <CACRpkdZYU0zvjRC-2L-Ra=td0iUSPLhP3BFQKUTkh4POYHTNNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZYU0zvjRC-2L-Ra=td0iUSPLhP3BFQKUTkh4POYHTNNg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 15, 2020 at 05:12:29PM +0100, Linus Walleij wrote:
> Hi Dmitry,
> 
> thanks for the quick review!
> 
> I fixed most stuff, just one minor comment:
> 
> On Tue, Mar 10, 2020 at 6:08 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > > +     /* According to datasheet this should be in the 2.7-3.6 V range */
> > > +     ret = regulator_set_voltage(ts->vcpin, 2700000, 3600000);
> > > +     if (ret) {
> > > +             dev_err(dev, "failed to set VCPIN voltage\n");
> > > +             return ret;
> > > +     }
> >
> > Shouldn't this already be in DT? We typically do not configure voltage
> > on various rail unless in very specific circumstances.
> 
> Certainly the DT defines the voltage range on the regulator
> on the producer side.
> 
> This is the consumer range, and DT has no facility to put
> restrictions on the consumer voltage window.
> 
> I think it is pretty natural to do in the code.

That means we will have essentially a boilerplate code in many many
drivers.

If we indeed want to do this (although I am not sure if practically this
makes much sense - nobody creates a rail delivering 24 volts by default
and saying "oh well, when driver loads it will request us to lower the
voltage down to 1.5V that components attached to the rail require") can
we consider adding consumer side constraints to the DT so that
regulator_get() can set the voltage right there and driver does not have
to? I am just trying to limit the amount of custom code in the drivers.

> 
> The typical usecase is when two components share the
> same line, and in this case two voltage consumer inputs
> *may* be connected to the same producer regulator.
> 
> The regulator framework will the infer that the producer
> can produce a voltage that fulfil the constraints on all the
> consumers.
> 
> The fact that few devices issue regulator_set_voltage()
> is a combination of "good enough" and general sloppiness,
> I think it should reflect the operation voltages of the component
> and stop people from shooting themselves in the foot.
> 
> But I CC Mark on this and see what he says. (I might be wrong.)

Thanks.

-- 
Dmitry
