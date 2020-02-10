Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9660F1581D7
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 18:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbgBJR4A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 12:56:00 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51162 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJRz7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 12:55:59 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so78630pjb.0;
        Mon, 10 Feb 2020 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hc6rF8tlHFAsqTDsCihq67MPiEh5lF+F1GiLZq84Qik=;
        b=QQHrVR7jLfmXoJ0ywI0mYNlYQWcb/iYz7I3/ygJ/2w3i11LF0T04GYV+yN83LFgvc1
         kC/Z8mr4ZhJeNSsVBIJTjRYVXKlx6OU387B97X4+Vki880RQrvnKL4vL+/nkrTfK521k
         WM55qs6WP44XuuN+nhU6+cZlaf2RY9yglzCmZa4tm2eP6TAaiigJt84qfDxJ8KBwg/tL
         7DUc1Qw4LXsn4fVeEQN+yORgH0/M89rKBeZJ4VvfK2qORWRBNuN6LfBFGWIGB4HV4Gr3
         1HBECqnSzho4IMaUZKj43ijLo3WMNT+xn5PKHEZZOg1nhN3aQHQ925ac15HmnKIgP81w
         OdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hc6rF8tlHFAsqTDsCihq67MPiEh5lF+F1GiLZq84Qik=;
        b=WDy4MO5hAMMQ6doQAbSbo6m1S/sofq/znEJUyWUIiq3t4u0P1fJ0PlAMQMgPUsi9Vs
         juBZy2wenlVveONHX8F+Br2ooByp/Y20KUHWnP7S7U+tO45+xGqUDS8go8A07lqrlkma
         yp4cnWTmdE3a5DRyLSHjTgJs58olYCc3CjKx9vUwtIf+4HcMdYrRy6X/9dUe0/HH9+di
         Y2sApLPNwL+c9aypm/WqrPzNTwFb+nk46nJG5E9ByOHgivgBA0BhjdcWiKXlYPUSfB+c
         O7r3cYnLtU2kDiF7gxtc9v0KvsMkZlfGOFCU+C7k39ULAQuhXldLjLrZQBYqQo8ewlM0
         X15Q==
X-Gm-Message-State: APjAAAXcZpTrhWEcyi+yaoqfxtDGcx1eOyMhXBAmbi71sslKnr4+KaW5
        TKPXdgl32Q0C73HYelL9sp3Jj+ng
X-Google-Smtp-Source: APXvYqy0avjAeGUBKACUW6Emn643XOzeKfGaF9sv6cHS63WgyqpQ0N7h27veZbjutko2+st5x44zXQ==
X-Received: by 2002:a17:902:694b:: with SMTP id k11mr13918876plt.334.1581357358837;
        Mon, 10 Feb 2020 09:55:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c11sm1004540pfo.170.2020.02.10.09.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 09:55:57 -0800 (PST)
Date:   Mon, 10 Feb 2020 09:55:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Horia Geanta <horia.geanta@nxp.com>
Cc:     Robin Gong <yibin.gong@nxp.com>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Message-ID: <20200210175554.GB199269@dtor-ws>
References: <20200130204516.4760-1-git@andred.net>
 <20200130204516.4760-2-git@andred.net>
 <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20200209223836.GA199269@dtor-ws>
 <VE1PR04MB6638A4F4E3BABE0ED0CD4A5189190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <VI1PR0402MB34851857F012286250BF3BBE98190@VI1PR0402MB3485.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR0402MB34851857F012286250BF3BBE98190@VI1PR0402MB3485.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 10, 2020 at 06:33:30AM +0000, Horia Geanta wrote:
> On 2/10/2020 4:03 AM, Robin Gong wrote:
> > On 2020/02/10 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote: 
> >> On Fri, Feb 07, 2020 at 08:10:22AM +0000, Horia Geanta wrote:
> >>> On 1/30/2020 10:45 PM, André Draszik wrote:
> >>>> @@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct
> >> platform_device *pdev)
> >>>>  	if (pdata->irq < 0)
> >>>>  		return -EINVAL;
> >>>>
> >>>> +	pdata->clk = devm_clk_get(&pdev->dev, "snvs-pwrkey");
> >>>> +	if (IS_ERR(pdata->clk)) {
> >>>> +		pdata->clk = NULL;
> >>> Using devm_clk_get_optional() would simplify error handling.
> >>
> >> It sounds to me that this clock is not at all optional and the driver currently
> >> "works" only by accident and therefore optional is not suitable here.
> > Yes, then we need to add all snvs clk in dts for on legacy i.MX chips in this patchset
> > to avoid any potential function broken.

How many are there? I am not too terribly opposed of having the driver
handle missing clk if there are very many legacy DTSes out there. But
then we need to handle it properly (i.e. current iteration does not
handle referral properly for example).

> In that case the DT binding should be updated too,
> to make the clock mandatory.

I think this should be done in either case, as as far I understand the
part can not function without the clock and it worked purely by chance
on some systems as something else was turning the clock on.

Thanks.

-- 
Dmitry
