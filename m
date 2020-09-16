Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3626726B90D
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 02:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgIPA4B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 20:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgIPAz4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 20:55:56 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C156C06174A;
        Tue, 15 Sep 2020 17:55:56 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so2962111pfd.5;
        Tue, 15 Sep 2020 17:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5WnqQo2Lowlin22i7BC8k3J/mqtslpC+HNSb2Y/I9XU=;
        b=SQwY50URAennX8rIMsKjR9YH31Mnwtxf0Q/MtJkEQ72ewQOMgnuIBdzQClg4BXkWFF
         hG+T7sQr64XjQqH15Vir1QMZK8AOI8vn5UZY6mlrDDAp6gv7e4d5cYDiKPIw4cftBP3Y
         GfQWxB7+utjQRiFghglEvWOeAUijJziWqdZTugcZG6jUSp3txORT8dN4EAhvBy5ZK/e5
         ogSv0BFp0r8z9g3vn4qRoHBxzQz85cRrE3F6z8AIm12BQLt0ZbxrFtdvAjyoPEfGRXKg
         PukLphBlbNOb9+v27+hlkYD0xxqwZEUSVoAX/iVC/lNVYNGEoGPJZijsr7XI0Z6KC2hl
         xyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5WnqQo2Lowlin22i7BC8k3J/mqtslpC+HNSb2Y/I9XU=;
        b=OGGtJUwGW8J+EUWNSiLWn26SpNmPuNKox9N4LUTEJP61DmtTgqe/DgdspVTnkmeqgc
         QOjkCPYv+lcOQBrUC71KD0+Tm8gI3U822Vs/F3FWxdGVqlKpAwGupQG0pr2IGkfk5+42
         yG/OBpDZK0R/hWUXOMyrNfXq5/X56vbdkKCoAdM7kwWRGq7uMeQ3kjFGn5Wdo6EFyTcq
         K/fmadayENenfJIuW5CO94oKny9k0H1+WzEz7zq0mGMP7sY5B4qauTUslIf3s/BgIldJ
         u/M+WNVFmhQYwQIVfN3owKJ0rt+qNjvXbWBeSrP+RkrxJ41YEQBSBx17gP9Dl1LeBpV5
         Lr1Q==
X-Gm-Message-State: AOAM531/qYfdMB9QkzhmWeAzsXPfQxoIe6isBM4+wy1UAH+Q0mmWxhhb
        R7KYgaC7+zcQr/xJSc/orJ8=
X-Google-Smtp-Source: ABdhPJyHEaAUDNJSlMmVV9YoOH8CP9KBBg/2ow58SZYT/sQdhGP48np5EqZMtsyEDJ0m+Pj7mjuA8Q==
X-Received: by 2002:a62:3812:0:b029:13e:d13d:a062 with SMTP id f18-20020a6238120000b029013ed13da062mr19058181pfa.40.1600217755803;
        Tue, 15 Sep 2020 17:55:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e14sm12296105pgu.47.2020.09.15.17.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 17:55:55 -0700 (PDT)
Date:   Tue, 15 Sep 2020 17:55:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] Input: ep93xx_keypad - Fix handling of
 platform_get_irq() error
Message-ID: <20200916005553.GF1681290@dtor-ws>
References: <20200828145744.3636-1-krzk@kernel.org>
 <20200914065120.GR1665100@dtor-ws>
 <CAJKOXPd0=oe0vZyxTJ0sF7U4THk3B=UPofKdKdXm_4s3td13Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPd0=oe0vZyxTJ0sF7U4THk3B=UPofKdKdXm_4s3td13Uw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 15, 2020 at 06:05:22PM +0200, Krzysztof Kozlowski wrote:
> On Mon, 14 Sep 2020 at 08:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Krzysztof,
> >
> > On Fri, Aug 28, 2020 at 04:57:41PM +0200, Krzysztof Kozlowski wrote:
> > > platform_get_irq() returns -ERRNO on error.  In such case comparison
> > > to 0 would pass the check.
> >
> > platform_get_irq() is a bit of a mess. Historically we allowed defining
> > interrupt resource with r->start == 0 and for such cases non-OF non-ACPI
> > code will return 0 from platform_get_irq() to indicate that IRQ is not
> > assigned.
> >
> > We either need to stop doing this in platform_get_irq(), or the
> > conditions in this patch and followups should be "irq <= 0" and we need
> > to make sure we do not accidentally return 0 from probe ...
> 
> Hi,
> 
> It's then contradictory to platform_get_irq documentation which
> explicitly says - zero will not be returned on error. This was also
> clarified in commit e330b9a6bb35 ("platform: don't return 0 from
> platform_get_irq[_byname]() on error").

It was for OF/ACPI, but not for resources described via DEFINE_RES_IRQ
or other means. However I see we added a big fat WARN_ON() in case if we
end up returning 0 still, so I will be applying your patches.

Thanks.

-- 
Dmitry
