Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E67E7D73
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 01:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfJ2AM4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 20:12:56 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41866 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfJ2AM4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 20:12:56 -0400
Received: by mail-pf1-f196.google.com with SMTP id p26so4014155pfq.8;
        Mon, 28 Oct 2019 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=A5yaNWv/seSl0C8AghK+VDA/9mfH1ZBe7Dx7Tv/glfs=;
        b=Iasc2Z6T19iMWg44i7udDoIG+WipYhIzrHUEMTfbXZzB6OmNtDS+/BoCJ6NRSYpx+r
         YuJ2L9Gk5ELKHCYyEgX23prPM8HURNK4bXD8seGpd3uXji+JDjhtWffOMixxw79aMIz6
         qrmy3Sq7gE3cpPV/LQO6slKe+axxu3zCIn9KBrNegcEfFe/zMgOa3GW4kgfn1r3SI29a
         T6DYoXsuyEG3rWRF0nSKf89Z09zd3PtuvANpCLkH2IvLTgpfzCq/XLekWTm8IwJlw/A3
         WhIgGB1cQ2DlACH8j4CANJ9MeEzwjnpZJWU+GeKxz1OhWN2WSeGOGFn/2RX+HKP8rCuJ
         Kdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=A5yaNWv/seSl0C8AghK+VDA/9mfH1ZBe7Dx7Tv/glfs=;
        b=NksV4zKaeLkCI7GBuNiWm4buPrzO3nMUAEmD/JNQQpuWhiloB43vYlWZp6WVrh0KtD
         QatkSnOJEC5Ln65qEJ+eh0rtAM5hQrnxuPAi4umIWJmwGEW9rsI0sdspMmUjZ1hXjEIL
         MJ3xUz149tsDhbf/8lxzYxSePjXMG4UwkIf+sbeDu03tF6XASE/OVnKMH3nOSoHvk/JL
         d9Fczd/8gSrX3Lp/ATvW3Uwxm5Aq4Y2Myf0Z+LfRZR6YmuaFTWirL7TqwUjn49ONQKU/
         rJP/1rA9JoogtcweIRJLqZ9eeojG2vm+vjKSzm8QbufLekTQMqAU2RqK+UW0wTppZ4SG
         4BkQ==
X-Gm-Message-State: APjAAAX1PovHt7kOxLiKYjE53PwuYJ9OeehXz/z41FGh0g10ZZ8OkjM5
        4ecnp/0pABQbyffm57DVqQJ8MHqe
X-Google-Smtp-Source: APXvYqxxDw4ncyQIZPOiJf5E3XENtqZsrbt+OFXIeyq46XTgCttk1fe12p28+YLNCsYlI7hzlyIQfQ==
X-Received: by 2002:a17:90a:8a0d:: with SMTP id w13mr2412350pjn.137.1572307974732;
        Mon, 28 Oct 2019 17:12:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c12sm7702901pfp.67.2019.10.28.17.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 17:12:53 -0700 (PDT)
Date:   Mon, 28 Oct 2019 17:12:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:SUN4I LOW RES ADC ATTACHED TABLET KEYS DRIVER" 
        <linux-input@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: sun4i-lradc-keys: Add wakup support
Message-ID: <20191029001250.GB57214@dtor-ws>
References: <20191028221502.3503543-1-megous@megous.com>
 <20191028233828.GA57214@dtor-ws>
 <20191028235626.5afvszxtppsieywi@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191028235626.5afvszxtppsieywi@core.my.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 29, 2019 at 12:56:26AM +0100, Ondřej Jirman wrote:
> Hello Dmitry,
> 
> On Mon, Oct 28, 2019 at 04:38:28PM -0700, Dmitry Torokhov wrote:
> > Hi Ondrej,
> > 
> > On Mon, Oct 28, 2019 at 11:15:02PM +0100, Ondrej Jirman wrote:
> > > Allow the driver to wakeup the system on key press.
> > > 
> > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > ---
> > >  drivers/input/keyboard/sun4i-lradc-keys.c | 22 ++++++++++++++++++----
> > >  1 file changed, 18 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> > > index 4a796bed48ac..bba679d7b54b 100644
> > > --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> > > +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> > > @@ -22,6 +22,8 @@
> > >  #include <linux/module.h>
> > >  #include <linux/of_platform.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_wakeirq.h>
> > > +#include <linux/pm_wakeup.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/slab.h>
> > >  
> > > @@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
> > >  {
> > >  	struct sun4i_lradc_data *lradc;
> > >  	struct device *dev = &pdev->dev;
> > > -	int i;
> > > -	int error;
> > > +	int i, error, irq;
> > >  
> > >  	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
> > >  	if (!lradc)
> > > @@ -272,8 +273,13 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(lradc->base))
> > >  		return PTR_ERR(lradc->base);
> > >  
> > > -	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
> > > -				 sun4i_lradc_irq, 0,
> > > +	irq = platform_get_irq(pdev, 0);
> > > +	if (irq < 0) {
> > > +		dev_err(&pdev->dev, "Failed to get IRQ\n");
> > > +		return irq;
> > > +	}
> > > +
> > > +	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
> > >  				 "sun4i-a10-lradc-keys", lradc);
> > >  	if (error)
> > >  		return error;
> > > @@ -282,6 +288,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
> > >  	if (error)
> > >  		return error;
> > >  
> > > +	device_init_wakeup(dev, true);
> > 
> > I do not think we want to do this unconditionally. Can we maybe key off
> > "wakeup-source" device property.
> 
> Sure thing.
> 
> > > +
> > > +	error = dev_pm_set_wake_irq(dev, irq);
> > > +	if (error) {
> > > +		dev_err(dev, "Could not set wake IRQ\n");
> > > +		return error;
> > > +	}
> > > +
> > 
> > I wonder if we could teach platform driver core to handle this for us.
> 
> Not sure, some drivers do enable/disable wake_irq by hand in suspend/resume
> callbacks, so it would probably need to be opt-in somehow. I guess calling the
> function like this is one way to make it opt-in.
> 
> The other way may be by passing a flag somewhere, like to
> request_threaded_irq. Did you have something more concrete in mind?

I think it is perfectly fine to continue using enable_irq_wake and
disable_irq_wake from the driver while marking irq as being wake irq
form the core.

Thanks.

-- 
Dmitry
