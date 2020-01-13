Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 247A0139BBC
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 22:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgAMVi7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 16:38:59 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42494 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgAMVi7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 16:38:59 -0500
Received: by mail-pl1-f193.google.com with SMTP id p9so4329791plk.9;
        Mon, 13 Jan 2020 13:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PNCK//uPfDCqysTs22q4VYtyuju/MqjD28uUh4zcIbE=;
        b=mVyvFOsLFaJ19vdKZqZvc8NcQlbNpM6sJESgAYciCSefTKQyE9eGYgyAPXr6tD8RQ5
         tuv2Z6u4Y7+5yWculISPTejy+vLL1os75RJnc18A1MXANaMahOnW/6K1axy925ysX7T1
         w6jWUGUcH/tOhOGZuaXbHANZCCaBT0Cnp/zziJBkVm3b5nlFhwkR0y4Glx27t32aDjg0
         sZ9CyX4qLR4G+oPEKCB2AYTrcVsveBxoF0+UB8d18k1rcgj6wd1twD7O3K1D/ZnIfV5Z
         jwrBTSOM7GbgNAgJT+1qKF00WoRRUBDPgu9XmuqPxUWf3P2WU93r+UNBzg7zSBWQ81TH
         wYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PNCK//uPfDCqysTs22q4VYtyuju/MqjD28uUh4zcIbE=;
        b=YXY96w15yfXL1y5g8W0R/OexiOyHp3EnFAxpdSnXBhqj3HR9+zZ6vvUCdR62/fKefC
         pVEgZF1q9c6We0x+PL3jxxHDAYc/eORHX4zAQReSXF0Vcnrnib9h7EifKeCls5j0MQLL
         qL7COIDZkSSARSIbV8i3ljqCgmVzflvGoQq3RxOJut8UOA6BoLUuU43lSiNcftUhSJAm
         Hu4s6K4/bPzv6Sb7znhhLZ5sNQk9UqCjz/jC2EsULqE536ZxlkiAE3G4XtTdgP74aXDD
         Ti+NArWvEpjxWMg0jUNHZztpBvPNfSPesmGJKbT8f1ewzXdJpPx6xuNfq43eG1VH03EX
         CgOA==
X-Gm-Message-State: APjAAAUEz0H+mxAv+kjTJg9nI+BJocz81kxMtkPZahWqe2CRLe7C+tqJ
        NmkfTM5sNqCj8Ti4ztfGuCY=
X-Google-Smtp-Source: APXvYqxc3g8yOEfefbauBlQM3MSFeixa+bS/nqKS9+h5QFHVkGJBHxwZCS+UtBDL7iak8ru/DYy20g==
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr8898358plp.252.1578951538343;
        Mon, 13 Jan 2020 13:38:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r8sm13903696pjo.22.2020.01.13.13.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:38:57 -0800 (PST)
Date:   Mon, 13 Jan 2020 13:38:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 2/3] Input: axp20x-pek - Respect userspace wakeup
 configuration
Message-ID: <20200113213855.GB47797@dtor-ws>
References: <20200113032032.38709-1-samuel@sholland.org>
 <20200113032032.38709-2-samuel@sholland.org>
 <84e9f44e-81e1-ab3d-3dd0-08388951b074@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e9f44e-81e1-ab3d-3dd0-08388951b074@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 13, 2020 at 11:48:35AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 13-01-2020 04:20, Samuel Holland wrote:
> > Unlike most other power button drivers, this driver unconditionally
> > enables its wakeup IRQ. It should be using device_may_wakeup() to
> > respect the userspace configuration of wakeup sources.
> > 
> > Because the AXP20x MFD device uses regmap-irq, the AXP20x PEK IRQs are
> > nested off of regmap-irq's threaded interrupt handler. The device core
> > ignores such interrupts, so to actually disable wakeup, we must
> > explicitly disable all non-wakeup interrupts during suspend.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> >   drivers/input/misc/axp20x-pek.c | 42 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> > index 7d0ee5bececb..38cd4a4aeb65 100644
> > --- a/drivers/input/misc/axp20x-pek.c
> > +++ b/drivers/input/misc/axp20x-pek.c
> > @@ -280,7 +280,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
> >   	}
> >   	if (axp20x_pek->axp20x->variant == AXP288_ID)
> > -		enable_irq_wake(axp20x_pek->irq_dbr);
> > +		device_init_wakeup(&pdev->dev, true);
> >   	return 0;
> >   }
> > @@ -352,6 +352,45 @@ static int axp20x_pek_probe(struct platform_device *pdev)
> >   	return 0;
> >   }
> > +#if CONFIG_PM_SLEEP
> 
> As the kbuild test robot pointed out, you need to use #ifdef here.

I prefer __maybe_unused as this gives more compile coverage.

Thanks.

-- 
Dmitry
