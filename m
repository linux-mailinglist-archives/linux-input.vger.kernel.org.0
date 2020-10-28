Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05F829D494
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 22:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgJ1VxV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 17:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJ1VxS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 17:53:18 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70CCC0613CF;
        Wed, 28 Oct 2020 14:53:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so605584pgb.10;
        Wed, 28 Oct 2020 14:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6ik2GKgZ+Q4Z7qsn1+Na4NKxNj7mlIQNoHCJBRIVKMc=;
        b=EwliCZb71i5/DbjlKhXNpify6cUiqeYAdqYKm/YBUk5m+2qb9E5VgFsFqRAMBVszAt
         Xhx5gX792ZGJ6u7bLL2gRf/q/tEmTedWDSgFszCsUuXLDtW6Y39hDC05JnCcxfW/Bp5f
         4AsrnPXyWURSrrDtYxSDlvYSpaDeqi5yhAL+ljYdXgWYZFPb719/7Fkxg4ILYDxJuDzk
         RJYxJYS97ZgIDcSSJsQ5LEe/co57odSQfnlREKrCs7Fj+nw0DC16WUp0GxjN/LUx41JW
         cZn+dNI3DgTZzvST177ZcIW7MoSsDeoPQy2NELW2k3Wiwb7+dSo43/bl8yMq/N8dR/Hi
         Xh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ik2GKgZ+Q4Z7qsn1+Na4NKxNj7mlIQNoHCJBRIVKMc=;
        b=QNwVIEao/lhb+nA0UsgfpV/P7MVDkHwDRxcft4Jj7cWjq7bzOUhzp2UtV6RxjdHH6f
         lbrWYHR+QQgDYL9CEsu0h4espU1a9U8OxJkPlO148SEzL7B1+JAdOLNCMS5ljye/WzuB
         z4bx7DSp+VNWdkirtHyjhNCrQJijDWey0oq9UB4GNgieLNjUe9r2PJR4NL7QWJlaLber
         HlP7reD3CJyeMWOfLhryG9/GWvg/2D0aJbXYmV/YFKtN+jj41pGSC7sw6zalycOwbHQr
         VYh+7giPkfn/272dw/ahCCOLq7v4y7PyGwXx3tovQXvIo2PfKpyGz/7D3HOFaddYJ7ua
         X5Pw==
X-Gm-Message-State: AOAM530vVzKi+HmAg7Ezt8JkXcNhtMw19me9k3WELhO6dVcqJpPQMLUT
        BCoLovyu3+559RCw1R/SHKO5+GBv37w=
X-Google-Smtp-Source: ABdhPJwuUsSMZsTNLKlVcxiwhvE1+NkOW2B8Md3IDEP3n+SbAJ5rlVM+lk+b9jS7kSFGyY7VbSxuww==
X-Received: by 2002:a63:5819:: with SMTP id m25mr491910pgb.398.1603908062998;
        Wed, 28 Oct 2020 11:01:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i123sm266934pfc.13.2020.10.28.11.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:01:02 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:00:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts: Convert bindings to YAML and
 extend
Message-ID: <20201028180059.GA2547185@dtor-ws>
References: <20201028101711.696423-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028101711.696423-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Wed, Oct 28, 2020 at 11:17:10AM +0100, Linus Walleij wrote:
> This converts the Armel MXT touchscreen bindings to YAML
> format and extends them with the following two properties:
> 
> - vdda-supply: the optional analog supply voltage
> - vdd-supply: the optional digital supply voltage
> 
> I also explained about the reset-gpios property that this
> better be flagged as active high (0) despite actually
> being active low, because all current device trees and
> drivers assume that this is the case and will actively
> drive the line low to assert RESET.

I wonder if we should fix that in driver and in DTs instead of doing
this cludge...

Thanks.

-- 
Dmitry
