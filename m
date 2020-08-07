Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC1C23E538
	for <lists+linux-input@lfdr.de>; Fri,  7 Aug 2020 02:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgHGAhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 20:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHGAhX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 20:37:23 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA33CC061574;
        Thu,  6 Aug 2020 17:37:23 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id y206so64436pfb.10;
        Thu, 06 Aug 2020 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qWcwX1l6Umnk+E6XdaK/wrT5r0pF+cUEma4DsgXJgWM=;
        b=ZoiDDtJ3vb5ZpeX3nFnX+z2Expkxoc5vDv61Qk4KMqAwrVCMMtjoKwtWpHY8xGyziu
         xnhN0zDvpzXKrL53j93pJHDTJ0wYKFhZnPO0PnkvwPBxT1UUgFdEvvCeNBus/2pJ8vuQ
         TADVk06BDHUw1AQAfbGDvXGVtnQF/OSZt4QssDdyL7r6oDIW/BM9GFBArjRzUWqdKkFG
         wWkkxDmT22NkgBkuTlumVSlmDpHnw2HlgD47NSn7f3NmiVhlY8LcYDqR7SMinbRtpZ+r
         ho2Hn+uAMTKs5rx7+uvAMfIgmLtLoH0NYPZr8vCt8cQtFoQxL57iMf+/yDND610G49MN
         MUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qWcwX1l6Umnk+E6XdaK/wrT5r0pF+cUEma4DsgXJgWM=;
        b=pvfXoBLpZSZN/hzRLW2gdh1Gus+GKe/yC5TCjA8aWowZku0WjUkwtIi5KENLk7Snmr
         s7aR/QiipiIdZHlIiBQxBbN+kynqaTBBLxifxmTFbHKwahg7bzI9dV0ZreDfKzpsOxZI
         3NkcWNJWHeWc5fTM3kwd/1D5tJCx8yUTOzvs/XAM2gFY9jI4KnavBRV7GFwi1OOCpEug
         UrPFDrqJRH2MoMr9jbjYjYBS3pw9KCJGBRjcyFK0f1HIisHJjoYigQZq67nNKaWyDItC
         BhThsibpecgS1M+SNcqnnJMGi8Wwamw8zB9nfYp5KuFLqV7GFHMLtcv55xlFc46CMt4L
         YJDA==
X-Gm-Message-State: AOAM532jfVH/qXMw8BV4fuw8+bxmzNaycQSgB+ofMTHQCoKNVVz6E//e
        iJYy8X2WLCDIutUp1o3kSvY=
X-Google-Smtp-Source: ABdhPJwPE6rE93apfT5VeJjuBX2DB4dsmop+zSRNhhB5WXbd3GR6OR6NyQmbvM/Hy/NOWF9sy1R/Ww==
X-Received: by 2002:a63:9dcd:: with SMTP id i196mr9293205pgd.378.1596760641334;
        Thu, 06 Aug 2020 17:37:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id l8sm8713424pjb.14.2020.08.06.17.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 17:37:20 -0700 (PDT)
Date:   Thu, 6 Aug 2020 17:37:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCHv4 3/4] Input: EXC3000: Add reset gpio support
Message-ID: <20200807003718.GP1665100@dtor-ws>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
 <20200805160520.456570-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805160520.456570-4-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 05, 2020 at 06:05:19PM +0200, Sebastian Reichel wrote:
> Add basic support for an optional reset gpio.
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Applied, thank you.

-- 
Dmitry
