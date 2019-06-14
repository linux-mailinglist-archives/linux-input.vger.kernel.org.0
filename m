Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D45794681B
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbfFNTTG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:19:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39871 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFNTTG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:19:06 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so2001126pfe.6;
        Fri, 14 Jun 2019 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pdZCIoYkfFDkgl8kzCeEDsmfwf1PzfJjurY0dcIItS4=;
        b=QUTkAVVYi2/skfDf6DBwJ5ENDmGC5fkUGoIzzRYyJcxiUDpYts3JcnatvfK8vBf3tU
         CqYYiiXbTApyLk9CX1cVLHy6wXRLUjiDUqB2eIIjqqvRaFX6baWP3RUKlceXwmkNexHY
         c1MvmgAPBHTIL85FuASAGvveDfcILX6IjI4VuNNYPQ/tJ+KCw7v5Hz9NdoFMDso0w686
         pMa5R8NNf4EyojnwyA32cYSc/6Ht7kBFrDqxHRP37lx5bmjSrkuPSvkltwfBor3Pa9Zc
         Gg0q8UhPQtvSNgQcriQoUVXtv9ZE4g38zZ8I83YFSKE2/CFE5ij/g24dUH5cTrAd/8zt
         gThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pdZCIoYkfFDkgl8kzCeEDsmfwf1PzfJjurY0dcIItS4=;
        b=GDHA7EE51g3HxxF3NkZsBIEKmC3O2igHwedv07yNJqjjrCuYYRfMLrAD11nKTn9Bxx
         9dDfaGSRYXUBsaMorgFXkYS2CNRAUkx6SqWZmOkWXdwgWR5nhuQHQ+WHlgFgscFM6BOG
         9GDSipUj+t+WgsKTc9SIXE22BvH/uSECcNAdhRPwbzLYV6x3pdBBKGNXwuCW4Ad0A/qr
         5/7U1WijVRJ5XM2PRCg3WPX3Rg/O8DvyFx6GQjA3jthE//yYuCLLcnC42NNb04yfhU7A
         wYIaTLFATqpD6Kx+zrhK05W742+iCTzUY00Xn5Dh9IPcnKS0Z0FJRaF2NHRmaPFGMib9
         +JZA==
X-Gm-Message-State: APjAAAUxFmhzeIVAKuAj0N0jAyGT6rrW2nYozJLMocdx7cHXNATbwi+e
        l23ecMKbzVcQesMdNkJTAqw=
X-Google-Smtp-Source: APXvYqxEOlGI5oHrg4Xwdaz3mx7Yaq5Z51fHqlcWxHxcVFoODI2RRu8Vlox2N5WVZSNoC9ph2K9N1Q==
X-Received: by 2002:a63:441c:: with SMTP id r28mr37334130pga.255.1560539944980;
        Fri, 14 Jun 2019 12:19:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o20sm3209780pgj.70.2019.06.14.12.19.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:19:04 -0700 (PDT)
Date:   Fri, 14 Jun 2019 12:19:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benson Leung <bleung@google.com>
Cc:     Enrico Granata <egranata@google.com>,
        Ting Shen <phoenixshen@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        gwendal@chromium.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] Input: cros_ec_keyb: mask out extra flags in event_type
Message-ID: <20190614191902.GA150432@dtor-ws>
References: <20190614065438.142867-1-phoenixshen@chromium.org>
 <CAPR809sASD=MrQkJULVBgc_iqiPKE2xr8eUR0d4qymQkLUYRaw@mail.gmail.com>
 <20190614185533.GA142889@dtor-ws>
 <20190614190957.GA243443@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614190957.GA243443@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 14, 2019 at 12:09:57PM -0700, Benson Leung wrote:
> Hi Dmitry,
> 
> On Fri, Jun 14, 2019 at 11:55:33AM -0700, Dmitry Torokhov wrote:
> > On Fri, Jun 14, 2019 at 11:27:03AM -0700, Enrico Granata wrote:
> > > On Thu, Jun 13, 2019 at 11:54 PM Ting Shen <phoenixshen@chromium.org> wrote:
> > > >
> > > > http://crosreview.com/1341159 added a EC_MKBP_HAS_MORE_EVENTS flag to
> > > > the event_type field, the receiver side should mask out this extra bit when
> > > > processing the event.
> > > >
> > > > Signed-off-by: Ting Shen <phoenixshen@chromium.org>
> > > 
> > > Reviewed-by: Enrico Granata <egranata@google.com>
> > 
> > EC_MKBP_EVENT_TYPE_MASK is not in Linus' tree. It would be better to
> > merge this path through whatever tree that is bringing in that
> > definition.
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Yup, this looks like it's coming in through Lee's MFD tree, a series from
> Gwendal to update cros_ec_commands.h.
> 
> 784dd15c930f mfd: cros_ec: Fix event processing API
> 
> That commit is in the immutable branch for v5.3 here:
>  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-cros-v5.3
> 
> I'd recommend the chrome-platform tree since we'll be pulling in that IB too
> for some other refactoring Enric is working on.

Yeah, I'm fine with this going through chrome-platform.

Thanks.

-- 
Dmitry
