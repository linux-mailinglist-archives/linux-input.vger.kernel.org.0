Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A1C399A7E
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 08:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhFCGQZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 02:16:25 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34760 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhFCGQY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 02:16:24 -0400
Received: by mail-oi1-f176.google.com with SMTP id u11so5271158oiv.1
        for <linux-input@vger.kernel.org>; Wed, 02 Jun 2021 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=e3PDKrL5MVOFhdI4AdMvQfhjcpRkxau04Ply0138w7E=;
        b=LAemQ8PV7z/sZ5epDYtMuLEXUGtStxQKEHRht7XgX/IxKUJiGCdh0Eplyp1k9ExmQo
         bcurPq3MV8FHoiU9iybK/cgbxOzbSfVwIlWcrO47AuMn9lHDa8W4aPQgI9V2SmCZboCS
         1IKUirWjiGGLdTW2Dy00FWB7sqnBp+gPaN2gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=e3PDKrL5MVOFhdI4AdMvQfhjcpRkxau04Ply0138w7E=;
        b=nM+tJXaica+/1wdR6EWklIcYBgCWlXmDGOOUpvA/Z1BWlVJYEyIXYwdrwyBljJP3fu
         R5FHQyWJPvHL73roH7QOD2ei8Tlb5JBfYlxojmbxzZCv2t+l7trWBC/MFsUTWzF/G+t/
         WTvl7hqvS7/3Ujg6gQlLSCUAjkPDMAYerhIomZMVSVXfIQN9P8uJH/Ohw/RRyHc62+Kc
         8ME1dMuos5v9xJ5LX+FqmwkyBTywMK9WbMtF6GDIOeL6e1/GeUylNa0P0MVdOuW/7Kb6
         DvyFbPoKVBQDDpi+E7kUSictVtiW3uiBqDU80zfzOQwer3hJZEtyVENjb1ZCPy5qBHCe
         WzHQ==
X-Gm-Message-State: AOAM530oj+lg4KPPtpbPFN6ctkNSbL6tt1j2X84+sIq31CipDBz6dyfJ
        9ujerrxWKPZS1QtS+aErqHMI/ke2X0RuY8dAjhWDgGgWvV4=
X-Google-Smtp-Source: ABdhPJxVRXGh0McY8Kq2QVZFEf5hHPhoESVxSZxB6o4pMi/aki7Vp94/9fv3Xkvv0PvK2plcOuy9w5nX9VR+IhhGzqQ=
X-Received: by 2002:a54:4501:: with SMTP id l1mr24414113oil.19.1622700820736;
 Wed, 02 Jun 2021 23:13:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 23:13:40 -0700
MIME-Version: 1.0
In-Reply-To: <YLhbpYq8/+JUlP27@google.com>
References: <20210510220012.2003285-1-swboyd@chromium.org> <YJnllh7GfuVlL3ze@google.com>
 <CAE-0n539o_DWqHbPuarWozk4Rev_d++2Da=AvOYALwvB1j3dVA@mail.gmail.com>
 <YLgt2ZJ6GZwUNL8T@google.com> <CAE-0n52S72vWZkzwva2_uqsMMdgdKbX7-MKtNE5PdaetyeqN2Q@mail.gmail.com>
 <YLhbpYq8/+JUlP27@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 2 Jun 2021 23:13:40 -0700
Message-ID: <CAE-0n50PZ+vUH_dSQnunViWrkEdQNHyLNHjKbrsbEbO-YL8DRA@mail.gmail.com>
Subject: Re: [PATCH] Input: elan_i2c: Disable irq on shutdown
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>, Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2021-06-02 21:33:41)
> On Wed, Jun 02, 2021 at 06:33:49PM -0700, Stephen Boyd wrote:
> > Quoting Dmitry Torokhov (2021-06-02 18:18:17)
> > >
> > > I do not think keeping counter balanced would be important here, as we
> > > are shutting down, and upon reboot everything will be reinitialized from
> > > scratch. Also, we are lucky in that there is just a handful of I2C
> > > drivers defining shutdown() methods.
> > >
> > > > Please don't make me shave this yak.
> > >
> > > I'm afraid someone has to... I'm adding Wolfram to CC to get his take on
> > > this.
> > >
> >
> > I suppose another option would be to introduce some common function that
> > i2c drivers can use for their shutdown op, like i2c_generic_shutdown()
> > that would disable the irq? I would guess that it isn't a great idea to
> > blanket disable the irq in case some i2c driver wants to do something
> > that may require that irq to come in once more during shutdown to signal
> > that things are off or something like that.
> >
> > Would having this common function that this driver opts into work for
> > you?
>
> Opting in in this fashion will still require changes in the majority
> of drivers (any I2C touchscreen or touchpad may be touched while system
> is being shut down, so all of them will need to have interrupt freed or
> disabled, or they may initiate I2C transfer). How about something like
> this;

Yes, this approach should work. I assume a device that doesn't have a
shutdown function will be happy to let the i2c core disable the irq for
it so it looks low risk.

Will you send a proper patch to Wolfram or would you like me to wrap it
up and resend?

>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 38107c0c318c..c835e7bb71de 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -603,9 +603,12 @@ static void i2c_device_shutdown(struct device *dev)
>
>         if (!client || !dev->driver)
>                 return;
> +
>         driver = to_i2c_driver(dev->driver);
>         if (driver->shutdown)
>                 driver->shutdown(client);
> +       else if (client->irq > 0)
> +               disable_irq(client->irq);
>  }
>
>  static void i2c_client_dev_release(struct device *dev)
>
