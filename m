Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F30398019
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 06:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhFBESh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 00:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhFBESg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 00:18:36 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC85C061574
        for <linux-input@vger.kernel.org>; Tue,  1 Jun 2021 21:16:53 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id i22so952448pju.0
        for <linux-input@vger.kernel.org>; Tue, 01 Jun 2021 21:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YXhVmi+KVui1H+7u1MzE9yqL+IHTsUAOmBz91vb513E=;
        b=hPB6Koc9TV9hy7jeCWG8fMHuEASws+PRRLqiUVvfz2r1Ue6NSV/ILM+JHK2uAkul/r
         ZVIpMxGO5jOZ3AHeiq92hXep5ZkgCa1Q6Y6vW8uNT8s0hVkVXbdxNxMxjZzFIsRymZHw
         3Uyp5Yr+/91qf+tZVL161Z1jIMaSY81GBUmHm18nioLGLfDH+KmeQdYkb3M7TKHplzr6
         59oOU9hz7kkNYafwlGJRyYxLBOBWlwEUcA3Q96AdXOWFb2+TiTqXBzf8HCAv4Nb76YXA
         zXgxDiIuBdt2MoTKJwVgE7meJUsuutFQR2oDTYTO0fc81sux5HJv30ghrtPtcMZYGu/W
         U1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YXhVmi+KVui1H+7u1MzE9yqL+IHTsUAOmBz91vb513E=;
        b=Ddh8ItNSlAPq42/sICq2Y7Fr/lYiXdgUajXZatec+6fPS0HC8lm9d0QBhLwL98mjrc
         bQ06Eo9279Qpn60U93Rug0JxBxxt+tYRETxlWhHq3/NymfdBVc9k3d8E0uUtUZOHfIC1
         3mcSaRW600jLurm8fpBum65YBvvGVrOqVagrq+fPATOyqdvzH2/sWvG3uRzo1Ghs2oFY
         N1SD8YpubaARA8lD+Y61gXkebnSgcVY/QCDxRnKNyxdCzvumvnj92ueCSud+qhLQJkcU
         P2PFZI4G5CDP4TwLgbIkGJcdtlfGXLrrfElfMmXMlbYDYUAhywci6cOxskxTg9D3JU0s
         lgYQ==
X-Gm-Message-State: AOAM531IUW9VmOdmAya0oYk32SLiWVyFTVsxYpHAK6ShhElr3kjkUAoe
        VzuBvXrz4ISM32nua1pycpY=
X-Google-Smtp-Source: ABdhPJwndCpZj27H27a+7/jhJIEe+N/ki62c+5VgGT6HvDvmgmKQCJ3MoXjU9CQC/F4nAzmX0VgSRA==
X-Received: by 2002:a17:90a:588c:: with SMTP id j12mr28928003pji.10.1622607412646;
        Tue, 01 Jun 2021 21:16:52 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a596:b3cb:1a6:1ee4])
        by smtp.gmail.com with ESMTPSA id d18sm15693554pgm.93.2021.06.01.21.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 21:16:51 -0700 (PDT)
Date:   Tue, 1 Jun 2021 21:16:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        lkp@intel.com, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [input:next 2732/2735]
 drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error:
 uninitialized symbol 'z2'.
Message-ID: <YLcGMNL1MoOVhhmv@google.com>
References: <202105270957.mdv83Usm-lkp@intel.com>
 <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
 <20210527104157.GK24442@kadam>
 <YLXR2brkc4H54xtK@google.com>
 <20210601102715.uu2wflgzvrler6rt@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601102715.uu2wflgzvrler6rt@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 01, 2021 at 12:27:15PM +0200, Oleksij Rempel wrote:
> Hi Dmitry,
> 
>  
> > Input: resistive-adc-touch - rework mapping of channels
> > 
> > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Instead of iterating over channels establish and use channel map to
> > retrieve data. As a side effect this will silence "uninitialized variable"
> > warnings.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/touchscreen/resistive-adc-touch.c |  114 ++++++++++-------------
> >  1 file changed, 51 insertions(+), 63 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
> > index ea1884fb49a1..2102916a37ea 100644
> > --- a/drivers/input/touchscreen/resistive-adc-touch.c
> > +++ b/drivers/input/touchscreen/resistive-adc-touch.c
> > @@ -25,12 +25,12 @@
> >  #define GRTS_MAX_CHANNELS				4
> >  
> >  enum grts_ch_type {
> > -	GRTS_CH_NONE = 0,
> >  	GRTS_CH_X,
> >  	GRTS_CH_Y,
> >  	GRTS_CH_PRESSURE,
> >  	GRTS_CH_Z1,
> >  	GRTS_CH_Z2,
> > +	GRTS_CH_MAX = GRTS_CH_Z2 + 1
> >  };
> >  
> >  /**
> > @@ -42,7 +42,7 @@ enum grts_ch_type {
> >   * @iio_cb:		iio_callback buffer for the data
> >   * @input:		the input device structure that we register
> >   * @prop:		touchscreen properties struct
> > - * @ch:			channels that are defined for the touchscreen
> > + * @ch_map:		map of channels that are defined for the touchscreen
> >   */
> >  struct grts_state {
> >  	u32				x_plate_ohms;
> > @@ -52,37 +52,25 @@ struct grts_state {
> >  	struct iio_cb_buffer		*iio_cb;
> >  	struct input_dev		*input;
> >  	struct touchscreen_properties	prop;
> > -	u8				ch[GRTS_MAX_CHANNELS];
> > +	u8				ch_map[GRTS_CH_MAX];
> >  };
> >  
> >  static int grts_cb(const void *data, void *private)
> >  {
> >  	const u16 *touch_info = data;
> >  	struct grts_state *st = private;
> > -	unsigned int x, y, press = 0, z1 = 0, z2;
> > -	unsigned int Rt, i;
> > -
> > -	for (i = 0; i < ARRAY_SIZE(st->ch) && st->ch[i] != GRTS_CH_NONE; i++) {
> > -		switch (st->ch[i]) {
> > -		case GRTS_CH_X:
> > -			x = touch_info[i];
> > -			break;
> > -		case GRTS_CH_Y:
> > -			y = touch_info[i];
> > -			break;
> > -		case GRTS_CH_PRESSURE:
> > -			press = touch_info[i];
> > -			break;
> > -		case GRTS_CH_Z1:
> > -			z1 = touch_info[i];
> > -			break;
> > -		case GRTS_CH_Z2:
> > -			z2 = touch_info[i];
> > -			break;
> > -		}
> > -	}
> > +	unsigned int x, y, press;
> > +
> > +	x = touch_info[st->ch_map[GRTS_CH_X]];
> > +	y = touch_info[st->ch_map[GRTS_CH_X]];
> 
> Here should be GRTS_CH_Y
> 
> With this fix:
> Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you Okeksij, I fixed this up and applied.

-- 
Dmitry
