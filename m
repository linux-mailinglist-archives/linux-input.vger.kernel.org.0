Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF4B311A28
	for <lists+linux-input@lfdr.de>; Sat,  6 Feb 2021 04:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhBFDce (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 22:32:34 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:40442 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhBFDaD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Feb 2021 22:30:03 -0500
Received: by mail-ot1-f48.google.com with SMTP id i20so8927457otl.7;
        Fri, 05 Feb 2021 19:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mxnIFywdT9xUbNO9H2UneBOcEjIlQcVWaQNkaPhN+vs=;
        b=phZsmIiLGrYnSb2x0afQzUdsML6nA9C5se8tPxm4ajTVYvMCKnR3+cTyC0WBRC2Z6T
         8D09NUY3efo0mPkcAOFQBS1Bx26Mj82Luc6LNSBpo1F1OHZY6pMNq9GYsEb7xJjr7Wcn
         Tao3e3dZ5U8hNe+/7D/ovKm5yfa2xBVSaJyNEwIxGJ7DK8aouwX7VrJ4X8IlMyqS3O5X
         x29uI7E3w1Ls7W1VghaVYb+5EXK3u/pTCmoCdDAjqOhFl4L8zjWS0j7VJBaPbRcA1XK8
         ryKyzPCQ7P+i/2HXA0LJ9yFd2JukYaD1DJ+7HF+QPCbHsNoPw3ngN76c6ssQBwVCOSZH
         olpQ==
X-Gm-Message-State: AOAM532D1BgShr7fhJxd+h3NZKqk/tJjMY7xTYJuPC0KP9aJloiHOwXK
        1yTOtT9mVQVNjSEDRrFjJjBS2aWtYw==
X-Google-Smtp-Source: ABdhPJzNgDcQeIwJUmVNF2N1Ty0TwcWQwG5fL8hjfJCXFld6MJNH3sK1yxm9gS20vW/sgM4DeTBSwQ==
X-Received: by 2002:a9d:4d85:: with SMTP id u5mr5029369otk.47.1612566996937;
        Fri, 05 Feb 2021 15:16:36 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o20sm27784otp.20.2021.02.05.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 15:16:35 -0800 (PST)
Received: (nullmailer pid 3944047 invoked by uid 1000);
        Fri, 05 Feb 2021 23:16:34 -0000
Date:   Fri, 5 Feb 2021 17:16:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and WAKE line GPIO
Message-ID: <20210205231634.GA3944013@robh.at.kernel.org>
References: <20210122200659.7404-1-digetx@gmail.com>
 <20210122200659.7404-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122200659.7404-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Jan 2021 23:06:57 +0300, Dmitry Osipenko wrote:
> Some Atmel touchscreen controllers have a WAKE line that needs to be
> asserted low in order to wake up controller from a deep sleep. Document
> the wakeup methods and the new GPIO properties.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/input/atmel,maxtouch.yaml        | 29 +++++++++++++++++++
>  include/dt-bindings/input/atmel-maxtouch.h    | 10 +++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/input/atmel-maxtouch.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
