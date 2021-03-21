Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CD3343567
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCUWkP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbhCUWkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:40:09 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78199C061574;
        Sun, 21 Mar 2021 15:40:09 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id u19so7407025pgh.10;
        Sun, 21 Mar 2021 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xOxl4J+gaL5mXp7jLwmlzUFd6rJJflkq4ygTnBvJT4M=;
        b=GuMEytY7TtmswJXpDvUtYEHIitP5d21S5RZrRY77/hspzygn7FaS1kTy1II9LS5TL5
         APWs2IMlOO+otcMdS3s07gLsFkflC5uzIgnJpYiOrN2NZBot2BPhHq6pa7XwPZwD5VeK
         oDA8FroOjsE8ru4W3aFCZ5Fwq+UvtQ7AR/twoTVEq0pV+KoDsmt0EFRGzX3FaaiYZ8eR
         jyMiF4gYyITdM40i3Q+/v1RFJPdGnP46ptLhF0J4XtCbhGouB3ysA0TMiDCcoRS/jO34
         qxZOSXrO4dS2eij8G2wAH9rr51TqZzdg/ex3ztDt78tfX5rfufbtPbHTTKZyMMiJLwSc
         vwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xOxl4J+gaL5mXp7jLwmlzUFd6rJJflkq4ygTnBvJT4M=;
        b=uG8y9EBOlLtCwBoKaO4XQUthA18Jf7dBmE6uRD51RSEvKs2PUYN44VzMeOtMOAdoqE
         3UZJyZ4p/U7ohXnGYPclKQz3d7+8x3PnZZ7BExYC9I4u/Lt/OemNBfFWrxFny0f4BfbH
         klZu7xGQAS1eYVs1hirM2N1vf0X1AQQUc6C8NZlbLUlhBWYHJ+ntNBW4bomScZIbEFD8
         wW3pMT09UZzj7NJZAmiyfZHgx33XDv/0JdxWZxMYxXSb3kJSy5TcLoBzHGJGKAlDcNOl
         g/UDQKgswV0ZlGAOmymX3UfKhi/UFC3ux9Ft9AlXh30eubjETj606Zjf4XETBaWvRcJV
         FHPQ==
X-Gm-Message-State: AOAM533B95c1XfvCqobMFeJPMX6/Id/OvYnFfUPyHnJ2kDtQ3yoQgWIm
        vGM7EVgEV9PzLi1pZ1tdzUz1dw6bdwU=
X-Google-Smtp-Source: ABdhPJx3RHJ1XtU06A9FfT0I+ZF6kxv208Dgw4ROLjzio2rYSj/nXKLtOrtSFQs87wO6AcbOmHwdnQ==
X-Received: by 2002:a63:c901:: with SMTP id o1mr20758172pgg.232.1616366408894;
        Sun, 21 Mar 2021 15:40:08 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id q14sm11859021pff.94.2021.03.21.15.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:40:07 -0700 (PDT)
Date:   Sun, 21 Mar 2021 15:40:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and WAKE line GPIO
Message-ID: <YFfLRHXw/rCnGhRA@google.com>
References: <20210302102158.10533-1-digetx@gmail.com>
 <20210302102158.10533-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302102158.10533-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 02, 2021 at 01:21:56PM +0300, Dmitry Osipenko wrote:
> Some Atmel touchscreen controllers have a WAKE line that needs to be
> asserted low in order to wake up controller from a deep sleep. Document
> the wakeup methods and the new GPIO properties.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
