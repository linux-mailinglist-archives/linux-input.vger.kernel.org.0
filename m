Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36682AC246
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 18:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731942AbgKIRaT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 12:30:19 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33209 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731605AbgKIRaT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 12:30:19 -0500
Received: by mail-ot1-f66.google.com with SMTP id i18so9739070ots.0;
        Mon, 09 Nov 2020 09:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=By0PfcwclbGGWqIdY33FlSgGR3U94IawXT/xMqBW40E=;
        b=CGjWpAFE7vay4WNnUocso3+HVf8UavlRxWyAUnHcYYGFpA11axGrd2PrvXXtMY0xjs
         yIs9GZaozkD3xbuPGXAku8tKoTuDGH/1xBS/R6sx/Xx91nlGPrF3dazeJUX4KkwlFN0q
         QWPffsC0/q5ydVdcgqqdmeBnpi60VVmfzLFAFRUPAPTkiMZVl+3Nvo6QIh1kf73ww5A5
         3DizGahAlil8E9heoz1P2aa30iamVhd53GkM3Y+QdAlcHtNKPK6QGcGhBxodEsBuiDFz
         BJUel1OqQtEl7fsPyTnRNG5HR/avDKB9b0VV528bUvr0LLHOnGiuc9w25vtdivkJAjEG
         q5Tw==
X-Gm-Message-State: AOAM530+d83N3J6QVQTTfqedOAwrfXILK00sTsY+miJCyJTAnVSlgmRP
        vV4r2OZwHbIJHi72iumY7SzQ4L6Tyg==
X-Google-Smtp-Source: ABdhPJw8uESyxkiXU8hrlZbactHbSu5LN58qs7p49yMnLuL/T3mgUR7DZIbagysRkiCCZviHxpRSDg==
X-Received: by 2002:a9d:6189:: with SMTP id g9mr2191501otk.231.1604943018638;
        Mon, 09 Nov 2020 09:30:18 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t20sm2561274oic.1.2020.11.09.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:30:18 -0800 (PST)
Received: (nullmailer pid 1473175 invoked by uid 1000);
        Mon, 09 Nov 2020 17:30:17 -0000
Date:   Mon, 9 Nov 2020 11:30:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH 2/3 v2] Input: atmel_mxt_ts - Convert bindings to YAML
 and extend
Message-ID: <20201109173017.GA1473085@bogus>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
 <20201104153032.1387747-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104153032.1387747-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 04 Nov 2020 16:30:31 +0100, Linus Walleij wrote:
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
> 
> Tested the schema with all in-tree users and they verify
> fine.
> 
> Cc: Nick Dyer <nick@shmanahar.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - State that the GPIO lines shall be flagged as active low.
>   We will fix all users.
> ---
>  .../bindings/input/atmel,maxtouch.txt         | 41 ----------
>  .../bindings/input/atmel,maxtouch.yaml        | 81 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 82 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.txt
>  create mode 100644 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
