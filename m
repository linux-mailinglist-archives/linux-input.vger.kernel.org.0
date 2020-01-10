Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F11441364AA
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730513AbgAJBUR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:20:17 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46286 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730500AbgAJBUR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:20:17 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so155875pgb.13;
        Thu, 09 Jan 2020 17:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7qHBXesr8QwkRbtaOO3IQUgTasNvUcS3WaDX6rref+o=;
        b=VQ9PP0kq9emuyO9zctbmMsV5NyHq8XW7Vh1JXS/aXmo4wPrzwkuuIr6EyjoK+/J9KT
         TzGek5TwC27brWx80ESHo4XMoWZ9S71kKr3hpupVLRGrXrJw555pViT1X19RgwfzoIrE
         Vgfht5QpYcYU8/+Bd7km+YAkVQ4FN8Bb5EASTSP4SzakzJg0HABpOIPpvcXjf6bXVUfr
         PH2RMEQ9kWfbabqRKgszqenRNh+xCrw72EO4G64fRS1uv5QMyQJne+0Ut3o0sUd5nnA3
         4sVpFmWTicK1mdCP/05JPz1XWI9uQD/ORIeS9sOy0xK6F+OvX0zAwzimukIcDkHKhZm0
         k5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7qHBXesr8QwkRbtaOO3IQUgTasNvUcS3WaDX6rref+o=;
        b=BQnGGeHH1/fzWIge5Nb3N3hFKQWGpRvKHjfmWSXEFgxVBfoxRiJjvAmy3aHw2HMC46
         6qfEft/1gJNbAUBC6Np0EcSqt6hcRZHqOV80DKCkGezfhOHi3wRPPxQQOujWwa/axdoL
         5qVVdTVZCdeui+CFcwBdCLMWGtxaFGfJYXiu7XTgJjQUtJSJg7XgOZnpT+3TYpX5DK1K
         ktH0lqO2ImWGhrKrsoJgMJwCiELzyQFlKqJWieBZmocLbdN1FeKvEbYyKYXBtG95hbZ2
         I1R0gpObA/vwbg4/lOFiE2dfPmSEQOBhKAv4P2k0ZFWTqbppHdWQvBCsQA/q2R0Qz5u9
         QHBg==
X-Gm-Message-State: APjAAAWg+NvxlFtE2UR5lydq0InWmqyrh3Qm3YULAbKOOpsyaS4gyxaM
        M1+27yKEDb85la68/JMJxss=
X-Google-Smtp-Source: APXvYqyrq1wKaVn4zIBzDao2JVWanRP644J1Yd9W7FW2nZwgfcda20aUAmsP0hDomJYYu/i1QhwmcQ==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr926611pfd.70.1578619216147;
        Thu, 09 Jan 2020 17:20:16 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b1sm283458pjw.4.2020.01.09.17.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:20:15 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:20:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        fengping yu <fengping.yu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <mripard@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
Message-ID: <20200110012013.GR8314@dtor-ws>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
 <1578473162.12131.13.camel@mtksdaap41>
 <20200108112609.GN32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108112609.GN32742@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 01:26:09PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 08, 2020 at 04:46:02PM +0800, Yingjoe Chen wrote:
> > On Wed, 2020-01-08 at 14:29 +0800, fengping yu wrote:
> 
> > > +	tasklet_init(&keypad->tasklet, kpd_keymap_handler,
> > > +		     (unsigned long)keypad);
> > > +
> > > +	writew((u16)(keypad->key_debounce & KPD_DEBOUNCE_MASK),
> > > +		     keypad->base + KP_DEBOUNCE);
> > 
> > You use a 13 bits mask and set it directly to KP_DEBOUNCE register. Are
> > you sure the debounce unit is ms?
> > 
> > > +
> > > +	/* register IRQ */
> > > +	err = request_irq(keypad->irqnr, kpd_irq_handler, IRQF_TRIGGER_NONE,
> > > +			  KPD_NAME, keypad);
> > 
> > please consider using devm_request_irq, otherwise you have to free it in
> > _remove function.
> 
> No, you may not use devm_*_irq() when tasklets are in use. There is a nasty
> race condition.
> 
> Actually the rule of thumb is to NOT use devm_*_irq() unless you exactly know
> what you are doing.
> 
> P.S. Why simple not to switch to threaded IRQ handler and drop tasklet? In such
> case devm_*_irq() is fine.

Actually, we are simply reading iomem data and forward it to input
subsystem, there is no need to use threaded interrupt nor the tasklet.

Thanks.

-- 
Dmitry
