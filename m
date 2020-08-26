Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6857A253820
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 21:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgHZTRQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 15:17:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41635 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgHZTRP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 15:17:15 -0400
Received: by mail-ed1-f68.google.com with SMTP id c8so2737913edn.8;
        Wed, 26 Aug 2020 12:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8xGqYRG8ajCrh4u0eYU/fQCzra6d0D+pOOx7R79TMK0=;
        b=LWI7uyd2XbwmfWGIjp1icTngzDGk5eGORHVfPlgpgDbCa3STYxhv+C7FE0ehEm65TZ
         eHNb3N66avShzv1GJU0XyddvV6XAovXttfJlBEt0eSGGvoonv6osFqWK7SsvS7Eq5gkI
         nq15w+uQHx3p6VJs5i97cmbnEbRhBHANhG/ikAioy+kX9WXROR/gpm4LIhoLgim6sGjK
         eeEMoLdMj9lyWKG/TbrlEwYU50MRNNcPFnHtPlEhlbyONjtaE/U5ihjML8H/DsoR02Ff
         1UBrNjMNYIy+eODjQppFcFbW2wHUkI+goGV0+P7aKvnNbkc4IkGBTAK7129UOznFc9/9
         31Sw==
X-Gm-Message-State: AOAM532cwLkdi+rn8cihtJFq6lE3PT5QZh1hr8bsiS0XhmVlKUMlT6oF
        nmgNx+VtZTteGXQH7y3TIVo=
X-Google-Smtp-Source: ABdhPJyQDj5GAFJqp19VI5XGmXKh+NP7EjEyumm45r/4D70WWFdTs7PKal7GGssl9pz9tBPBd/x9qA==
X-Received: by 2002:a05:6402:2031:: with SMTP id ay17mr15889987edb.46.1598469432489;
        Wed, 26 Aug 2020 12:17:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id r9sm2722466edq.44.2020.08.26.12.17.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 12:17:11 -0700 (PDT)
Date:   Wed, 26 Aug 2020 21:17:08 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 01/24] Input: bcm-keypad - Simplify with dev_err_probe()
Message-ID: <20200826191708.GA13466@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826191217.GW1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200826191217.GW1891694@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 10:12:17PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 08:16:43PM +0200, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> > +++ b/drivers/input/keyboard/bcm-keypad.c
> > @@ -379,11 +379,9 @@ static int bcm_kp_probe(struct platform_device *pdev)
> >  	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
> >  	if (IS_ERR(kp->clk)) {
> >  		error = PTR_ERR(kp->clk);
> > -		if (error != -ENOENT) {
> > -			if (error != -EPROBE_DEFER)
> > -				dev_err(&pdev->dev, "Failed to get clock\n");
> > -			return error;
> > -		}
> > +		if (error != -ENOENT)
> > +			return dev_err_probe(&pdev->dev, error, "Failed to get clock\n");
> > +
> >  		dev_dbg(&pdev->dev,
> >  			"No clock specified. Assuming it's enabled\n");
> 
> Shouldn't be this rather switch to devm_clk_get_optional() + dev_err_probe?

Indeed, it could be simplified even more. I'll send v2.

Best regards,
Krzysztof
