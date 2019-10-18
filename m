Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7E4DCE50
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 20:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505810AbfJRSjo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 14:39:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34465 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502793AbfJRSjo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 14:39:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id k20so3843235pgi.1;
        Fri, 18 Oct 2019 11:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NNlXxl/DrRRMXAZJXRt6LTbwngxwuuZui4B951pX1Wk=;
        b=X8BR9oW7d21Zevs2Srs2fuq3NnjuvCjuAzNFngBvN7cSgDtmTxCmiVyWvfN3uitpFu
         a6FUoeu29Ejrkdo/DsBjcYoKQ+invmgsOHeC16jTiurWhiAv0blf7bQetRYnIPnEAeyU
         Cb7eOLBPNuololZcbxiLqNaZwx+uOO6bhalw+aJNg2YEY8NGlZv390EPjHuLWYRlbEeW
         XRsXycQCseUyR4glJQdl9yrVX/htKTkVESi0wAKa8+OThZnaou/Y6l7qhPeRgqTRQb50
         fC92HjwOaiGiapgyCWfqulAJqCeMfEEJ2Q+OiUwu5DbKv2Q07ViF5XXzqsdphp4EMSgs
         LZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NNlXxl/DrRRMXAZJXRt6LTbwngxwuuZui4B951pX1Wk=;
        b=S0eXUCj+Esjc7cwf5ZJ52tgq36Vcg5ifx+3nrWMNoC7T+HL6P6i3s1twOmodZUZL6V
         DE0ddjUiBUKx9068a99ov0mItWD7cMrDqleYMsn84uJ+nG43Y1v3tKcKF+8Lujak9wSa
         PCzabA5NdXZ5oYKTqBvegBzJKZG8Aw7ONaiwwRc+Qt+ViJ0dtbt/qPmTkKNSzolOkf+s
         gDUSDg8VeDBYLIJygLSDKhLIyWyCLyJLoLZScEfBy6gRUXhEfI0wBkQPNR0aBinvKehn
         t91s2pFrBr8Nyz7IR+RzZMwCKs9VrmaEcWXgyITipOh8cmv+QqBr8h/6fyOd5cOWzxgj
         XA/Q==
X-Gm-Message-State: APjAAAVlr/JNwu//T6krtJAjQWSJKX7tOxrL+S3y90F2Hg1G3X+W+WnE
        MWo4QTJ2O/MWp7jThl3nbwCA3mB+
X-Google-Smtp-Source: APXvYqyEbZiaLs72fryFE2CLF+ABwj3lfjmQQm9VaNEuZFxiOVaqlo65cSjcLF+36HYyGG2zSnPrXg==
X-Received: by 2002:a62:e90d:: with SMTP id j13mr8390525pfh.86.1571423983449;
        Fri, 18 Oct 2019 11:39:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v9sm6874172pfe.109.2019.10.18.11.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:39:42 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:39:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 25/46] ARM: pxa: mainstone-wm97xx: use gpio lookup table
Message-ID: <20191018183940.GM35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-25-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-25-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 05:41:40PM +0200, Arnd Bergmann wrote:
> This driver hardcodes gpio numbers without a header file.
> Use lookup tables instead.
> 
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Arnd, do you have these devices by chance? I had stached patches
converting wm97xx core to use threaded ISR and it would be great if
someone could test them...

-- 
Dmitry
