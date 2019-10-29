Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD270E7F10
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 05:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfJ2ESJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 00:18:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34330 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfJ2ESJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 00:18:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so8592106pfa.1;
        Mon, 28 Oct 2019 21:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8w3+F/NRSYuWbxpxqVHy506WX7nChC3gJ2i3v/zu854=;
        b=G1vRPXC7mR/Hj3dOxKE0LnRjqCjOasSMLljE/JM3jCD1T+ALipbaQynyQs/p98r9WA
         RqeXtRuN3icbtDgKVriE585SkM8cwktgDfVMKt1WfURjxYPONABim6t/JLtyuscTIL+m
         yHTz5xJJrAxUWhdzfR8Kr2AwNgXPzT6aXxLff+Nz4CLFv6VGh0dFjTcZDg1aTI5Qvxax
         79HMixohdwwOXdf5ajRdU7zaRFRxup8Y7twrnKPYjGuD9lidXEMJdPcgQOejYTvJULsJ
         afsFo0dOnkGbPvSOKXoigUHzybOe8IjEisgQgV6ifxbbRlNoVl5Umzs17pgtPrlvg8rS
         KHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8w3+F/NRSYuWbxpxqVHy506WX7nChC3gJ2i3v/zu854=;
        b=nH2c6iKhczcE8xocT8VFkzBntAIBGvxI8/TzkAUmPPPWYrZasoJC5fEEbT08avmbou
         yvrhC1HTPwPprHXd4BRgggbw/ZWI4WGo33Ls46CTZ01cwOoIdsG7soWNMCweRAnBoRD4
         kSvQzAT7G/+nxmpx5+yYdYs52n4WkTh9Z4OfRhac6uA+Q1rxbRs5uO9bEaZS7saf5Do9
         pFIxUj6/xmND/tmrWuMJBLalVV70KtZ4iIXJAYhRZGxsbLTJrDj3JzHSOHc1Q/s8ipO+
         tbb418qoVo349Y0xLShXD/01JLTrx18zep3VvuCbXt+dKJ25CoigpJlBSTnVxbtnj6SP
         UC3Q==
X-Gm-Message-State: APjAAAUpR5eyNB+wih4Had+leTs6Z4eK/tNq1+ilj4Il5d9MbMcUzi5N
        735NyIfjQu/4mH8KUVIAyA0=
X-Google-Smtp-Source: APXvYqzyOsDVc2pYvZW8V97U+norsDRTXZ2KH2nEwtSVP2VMGY8ysMCwrrssH8+4jkYcPx9rv8iuvA==
X-Received: by 2002:a63:4d0d:: with SMTP id a13mr20138350pgb.451.1572322688343;
        Mon, 28 Oct 2019 21:18:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f17sm14072917pgd.8.2019.10.28.21.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 21:18:06 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:18:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" 
        <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] Re: [PATCH] input: sun4i-lradc-keys: Add wakup
 support
Message-ID: <20191029041804.GF57214@dtor-ws>
References: <20191028221502.3503543-1-megous@megous.com>
 <20191028233828.GA57214@dtor-ws>
 <20191028235626.5afvszxtppsieywi@core.my.home>
 <20191029001250.GB57214@dtor-ws>
 <20191029014559.gif3ay7anq24un2i@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191029014559.gif3ay7anq24un2i@core.my.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 29, 2019 at 02:45:59AM +0100, Ondřej Jirman wrote:
> On Mon, Oct 28, 2019 at 05:12:50PM -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 29, 2019 at 12:56:26AM +0100, Ondřej Jirman wrote:
> > > On Mon, Oct 28, 2019 at 04:38:28PM -0700, Dmitry Torokhov wrote:
> > > > > +
> > > > > +	error = dev_pm_set_wake_irq(dev, irq);
> > > > > +	if (error) {
> > > > > +		dev_err(dev, "Could not set wake IRQ\n");
> > > > > +		return error;
> > > > > +	}
> > > > > +
> > > > 
> > > > I wonder if we could teach platform driver core to handle this for us.
> > > 
> > > Not sure, some drivers do enable/disable wake_irq by hand in suspend/resume
> > > callbacks, so it would probably need to be opt-in somehow. I guess calling the
> > > function like this is one way to make it opt-in.
> > > 
> > > The other way may be by passing a flag somewhere, like to
> > > request_threaded_irq. Did you have something more concrete in mind?
> > 
> > I think it is perfectly fine to continue using enable_irq_wake and
> > disable_irq_wake from the driver while marking irq as being wake irq
> > form the core.
> 
> I see, it looks like irq_set_irq_wake will track the calls via wake_depth
> 
> https://elixir.bootlin.com/linux/latest/source/kernel/irq/manage.c#L714
> 
> But all irqs are not necessarily wake irqs, no? So it still may need to be
> opt-in somehow.

I thought we'd do that for IRQ named "wakeirq" or the very first IRQ if
there is no named IRQ, and when we have the "wakeup-source" property,
similarly to what we do in I2C bus.

Thanks.

-- 
Dmitry
