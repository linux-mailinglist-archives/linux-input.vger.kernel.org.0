Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CA01AFD00
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 20:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgDSSKD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 14:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgDSSKD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 14:10:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBC2C061A0C
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 11:10:03 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id a23so3082327plm.1
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gP3bf94HGmWv/w801PZgYPPWZ1RYJljVn8XoFtHluHM=;
        b=KZdjfwJBPhCt920tS0GYlNoyHFL0XsewCasGTMYgzkJBVyWD2iSMIPflu6F9rZvqzl
         wUzz2ASqYLXKQSfvocwxWUAWqv9/77MaNznbwY0iucbD5RFrwd2OexToTuZ1GlNtFY75
         knlgVrZZZzGxJo0LQb5H/XKqLmYHNYzBcf0JFcJTudiY/f1DEarn/rKT5LyTuuQIsmDG
         /w6sYenLpkSyiUQ1sEzAdozTlq4IzqmY/pauIGWXTYomx+YP56BSBLlLMPsYYcpvZyT+
         ro5gpf9EgGO1mYYxiZAonC2mAkYS5e3HDM7WDkO5SbcNtjVqE3uNugJH17ufwZHgsOUv
         zYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gP3bf94HGmWv/w801PZgYPPWZ1RYJljVn8XoFtHluHM=;
        b=jYeRKWufUvKHroZXjLCTi4PmSEkq1i2aEqagSeus+LMtbAeT2Jku993iRz3rnyWeLy
         aVm8M/tlTdP2kvBLijUohKtwWOhchAoxFXDX9F/Qg3kBoDBNXy/8UM44PctdIsZCk8XR
         YLahiy3G6bjZvz5S2eD+fxrEz44z6zovVVXuumZi6R1doyomBK1opopP6wHkzRlbja01
         LNJZ2iMfHTw71ySAyaiZeph7kHP17E22/yDUTprtz0A1cObDO/JYHVLH1yA3DsDuEaIp
         Ohq6MuFIei+3G8sVYzSQhZm5hGhRRH0H3G8nuJJjluMMaey/F7O04kOdOie5n+EH7KY5
         zdpQ==
X-Gm-Message-State: AGi0PuZt917szdEBkAPD0Sa8xgfuO3Q/nru9PKd2l5olxKsJknvzntJJ
        6/IrPV4vd+r1XlfiQzTQ0Cg=
X-Google-Smtp-Source: APiQypLpBd/Hbgbro7UIGBlYqi+VR4ClqvumLyEiD3rR8KsYLTayq7kN73pRNChuqBFK0B8OzQ+D+w==
X-Received: by 2002:a17:90a:d901:: with SMTP id c1mr17985393pjv.120.1587319802718;
        Sun, 19 Apr 2020 11:10:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id i8sm7011127pfq.126.2020.04.19.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 11:10:02 -0700 (PDT)
Date:   Sun, 19 Apr 2020 11:10:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     BOUGH CHEN <haibo.chen@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before request
 the line as GPIO
Message-ID: <20200419181000.GL166864@dtor-ws>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
 <1581410472-3225-2-git-send-email-haibo.chen@nxp.com>
 <20200310042643.GB192640@dtor-ws>
 <VI1PR04MB504032C19CA8D76AE845AE6A90FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB504032C19CA8D76AE845AE6A90FF0@VI1PR04MB5040.eurprd04.prod.outlook.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 10, 2020 at 07:15:35AM +0000, BOUGH CHEN wrote:
> 
> > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Sent: 2020年3月10日 12:27
> > To: BOUGH CHEN <haibo.chen@nxp.com>
> > Cc: linux-input@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH 2/2] input: egalax_ts: free irq resource before request
> > the line as GPIO
> > 
> > On Tue, Feb 11, 2020 at 04:41:12PM +0800, haibo.chen@nxp.com wrote:
> > > From: Haibo Chen <haibo.chen@nxp.com>
> > >
> > > +	egalax_free_irq(ts);
> > 
> > It sounds to me you want simply disable interrupts in suspend. Does not
> > calling disable_irq() here suffice?
> 

> Here why I want to disable interrupts here is because in the newest
> gpio system, if the gpio is request as an irq, it can't be request as
> a gpio anymore.  In the function egalax_wake_up_device(), we need to
> request the irq pin as a gpio for a while, generate a signal to wake
> up the device. So before request the pad as gpio, need first free irq
> resource.

This seems like a fairly common pattern and I wonder if our GPIO
overlords can help us here.

Linus, Mika, Andy, would it be possible to have an API that would allow
driver to temporarily "take over" GPIO that is used for interrupts and
drive it as output without resorting to freeing and re-acquiring irq?
I.e. something like gpiod_irq_drive_output_start() and
gpiod_irq_drive_output_end()?

Thanks.

-- 
Dmitry
