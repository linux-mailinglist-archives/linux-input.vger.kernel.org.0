Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6307739AA87
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 20:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCS4d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 14:56:33 -0400
Received: from mail-pj1-f42.google.com ([209.85.216.42]:41533 "EHLO
        mail-pj1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCS4d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 14:56:33 -0400
Received: by mail-pj1-f42.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso4480209pji.0;
        Thu, 03 Jun 2021 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wc9JE/FZgt3ZhTXspAHl2HH6aDa2OLCuakvNYunAAsk=;
        b=uluKZwO/vWxapopOzw/sqywsp4D181GUFtPRzOxVRaf3LzABTcJSMWRgH9ZEdtuyv9
         HldRq35FlTBkOskVI62o9xY6BevXH4ar9mjOgffNwibjSI1iyrpdtcqwEl6PGjoctoJj
         SIebqSzxfuBbyLcOIBd/JCbb0kZuMW+GM5p3seEVq4/XfhyHvQ/dSAPVJkFxXq0pHEy2
         rwqHu8n/pPd/1I9dPkc4ZsI+4ccDXK8M6wT1Wf7mcU+MWTBdTgOcMyT1OaW/OCvvokey
         +t8zcmi9BS8Ov21rMeSEpg4tEYUwmqW12qUtzGJIdjX68fgmMSg+zAIp34oO3XEayQtZ
         Jl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wc9JE/FZgt3ZhTXspAHl2HH6aDa2OLCuakvNYunAAsk=;
        b=Jq9WaUrgOjwSWCfADjT5zSPBOZ4AieDzsyJioRQBT7+eu3G0g54K/2hRCf/QoryaU8
         kac8xu6kuN3qNF3afyBRRVJ+0ZhxrO9vwDWZwISyD/xZsZ7oH6/4JhSECGQG8q5on3DR
         ien553XFfhlEXyPPKX7BoQf7EehJakNKXJ5Zsx6JLpO54Gr1yp/65zopWcFEc/RyJAek
         g7dlJRej0vKJZ6oWy9pObMZc3kwQRegcTBy5+6okJgjcyaTF1wTDU6iRN0xvYnPJP5oX
         LqSz/6zd2jOKAKvc7xBtgjWAIn28Oxs2FfehyrTFEzcoGXLdVipuvWGxRzEDEVCzpmdo
         5wiA==
X-Gm-Message-State: AOAM533bCGSc4ojWHwBqa1tM4WgbFpGlCec/i/501fDUGYiPUuydbKyw
        Xz83SCFL+aK0ZuIcbXTE+Jg=
X-Google-Smtp-Source: ABdhPJyT7LNPIeiX0FefjktdmOzk0MgbQEBNp2Hg/PgYqL9y1NHIuBvVlBxtOZSIa4DygM/eayhvlg==
X-Received: by 2002:a17:902:bd01:b029:fd:924f:b10d with SMTP id p1-20020a170902bd01b02900fd924fb10dmr475482pls.74.1622746412428;
        Thu, 03 Jun 2021 11:53:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:def4:9d2a:6d0e:3ecd])
        by smtp.gmail.com with ESMTPSA id c62sm2912877pfa.12.2021.06.03.11.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 11:53:31 -0700 (PDT)
Date:   Thu, 3 Jun 2021 11:53:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
Message-ID: <YLklKF+zn4iVwy14@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org>
 <YJnllh7GfuVlL3ze@google.com>
 <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com>
 <YLgt2ZJ6GZwUNL8T@google.com>
 <CAE-0n52S72vWZkzwva2_uqsMMdgdKbX7-MKtNE5PdaetyeqN2Q@mail.gmail.com>
 <YLhbpYq8/+JUlP27@google.com>
 <CAE-0n50PZ+vUH_dSQnunViWrkEdQNHyLNHjKbrsbEbO-YL8DRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50PZ+vUH_dSQnunViWrkEdQNHyLNHjKbrsbEbO-YL8DRA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 02, 2021 at 11:13:40PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Torokhov (2021-06-02 21:33:41)
> > On Wed, Jun 02, 2021 at 06:33:49PM -0700, Stephen Boyd wrote:
> > > Quoting Dmitry Torokhov (2021-06-02 18:18:17)
> > > >
> > > > I do not think keeping counter balanced would be important here, as we
> > > > are shutting down, and upon reboot everything will be reinitialized from
> > > > scratch. Also, we are lucky in that there is just a handful of I2C
> > > > drivers defining shutdown() methods.
> > > >
> > > > > Please don't make me shave this yak.
> > > >
> > > > I'm afraid someone has to... I'm adding Wolfram to CC to get his take on
> > > > this.
> > > >
> > >
> > > I suppose another option would be to introduce some common function that
> > > i2c drivers can use for their shutdown op, like i2c_generic_shutdown()
> > > that would disable the irq? I would guess that it isn't a great idea to
> > > blanket disable the irq in case some i2c driver wants to do something
> > > that may require that irq to come in once more during shutdown to signal
> > > that things are off or something like that.
> > >
> > > Would having this common function that this driver opts into work for
> > > you?
> >
> > Opting in in this fashion will still require changes in the majority
> > of drivers (any I2C touchscreen or touchpad may be touched while system
> > is being shut down, so all of them will need to have interrupt freed or
> > disabled, or they may initiate I2C transfer). How about something like
> > this;
> 
> Yes, this approach should work. I assume a device that doesn't have a
> shutdown function will be happy to let the i2c core disable the irq for
> it so it looks low risk.
> 
> Will you send a proper patch to Wolfram or would you like me to wrap it
> up and resend?

If you could do that I'd be more than happy.

Thanks.

-- 
Dmitry
