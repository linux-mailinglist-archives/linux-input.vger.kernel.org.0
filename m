Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9F31B4EBA
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 23:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgDVVCM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 17:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgDVVCK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 17:02:10 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A02C03C1A9;
        Wed, 22 Apr 2020 14:02:10 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y25so1749748pfn.5;
        Wed, 22 Apr 2020 14:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vM87nllaJmlXnX4UfDWzv50cEvq54jUoqSc9qadX5i8=;
        b=fdU2a2tT2HBq44vMfv6glQVIYFB71heRdkQLckx+Q4+Z5kSAOBp+ZJzryFgZN3JUWF
         nt9qsUFzMbO67NmVnjK5s+C0yGBviTrnqyt15qMMOrB1rTvb2YG2EnqJ4QZ6YXAR4ePB
         iU3arVyp25hGHX8yfL9CXObeCvTts9DtJwVI5Znx15ZLl3Dqwi+JdHUZZd5Rg3K63WrM
         ATw7izjYcIvEbUlJXZXzZFx8ouPouQlrwg8XzX+wDhEXNzp/f7z3lZuIMjAJ/RLTURhL
         M/ACXCtOZWlwIeHPxw2Sj687SJSIQfm1PbyzHT6q1u/yKYXn1esfOAVsNYV6M7I+V7lX
         Bfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vM87nllaJmlXnX4UfDWzv50cEvq54jUoqSc9qadX5i8=;
        b=okSmT+jYjz88lGh2SMfSlx3Dy1K53sLkWKReypVSXAcx2C6m1XfqyuE6zcN5WWL8Ss
         5ycTutJGYX4VWAy17o3I7jSK6NwckgBwJ7Hh5VGpzWGOYGdsL7DU7jkSWmbTe7/TDuFU
         Aj0lAq9Sb9iduRugTP4eTu5ZPt+PqEwMIAcGWOCUgtxXWHFK2I9fE2duW+lOuAtIPCXG
         hARh5H2ZyO8ROxgK/awfdVOljNiutS3MonW1eViZ3nMEQ2qlioHhtwGMI5q+4y1wxhPY
         grx8KuZ3Swr3mLErdRJVikHpdoee6rVp6M8eFX2EaYOQ3tLLeOmObG8iC1M3ylMD9a2c
         OE0g==
X-Gm-Message-State: AGi0PuZwKUnLhyGP4BGL9czBOf2OHTbS23Gxqm8HEKLy5I6MKoAIUGBn
        mCRfMR/cqNhp3XCyO84Ph3fX43n1
X-Google-Smtp-Source: APiQypLK44Vr0SQ5de0EnOaZsXzgTdnmCH/6Rc9VV/B0cjaPxyDBY14F3UA1WjJM49oIcZ2+19nWWA==
X-Received: by 2002:a62:dd4e:: with SMTP id w75mr412569pff.221.1587589329687;
        Wed, 22 Apr 2020 14:02:09 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m2sm150311pjl.21.2020.04.22.14.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 14:02:09 -0700 (PDT)
Date:   Wed, 22 Apr 2020 14:02:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Herring <robh@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: dlink-dir685-touchkeys: Fix a typo in driver name
Message-ID: <20200422210207.GE125362@dtor-ws>
References: <20200412213937.5287-1-christophe.jaillet@wanadoo.fr>
 <CACRpkdZMLec8gXSJo-SpNXa3bBne2gDCRT3M_BEz21EtMXUAMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZMLec8gXSJo-SpNXa3bBne2gDCRT3M_BEz21EtMXUAMw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 16, 2020 at 01:08:28PM +0200, Linus Walleij wrote:
> On Sun, Apr 12, 2020 at 11:39 PM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> 
> > According to the file name and Kconfig, a 'k' is missing in this driver
> > name. It should be "dlink-dir685-touchkeys".
> >
> > Fixes: 131b3de7016b ("Input: add D-Link DIR-685 touchkeys driver")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

> 
> Yours,
> Linus Walleij

-- 
Dmitry
