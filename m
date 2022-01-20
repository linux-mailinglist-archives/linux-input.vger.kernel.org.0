Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9884950E5
	for <lists+linux-input@lfdr.de>; Thu, 20 Jan 2022 16:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346280AbiATPE3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jan 2022 10:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346226AbiATPE2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jan 2022 10:04:28 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81820C061746
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 07:04:28 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso22583201wmj.2
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+Aq1htCCe4J+KaYbiBgsGd/SMns1HeFPyllEeH0HLrE=;
        b=xDCfSkp4gVRyMCsNHMACNwvOjOLWGCCFvpl6FBksdSeKoOo8g6aWif0LxVqFjOA8K6
         SwgwL+uPlvH6X5/3gjhPYOvsH4UENcXKqKMQwxp9hLNBjiXf0PgD2pYGZNtl0Gm1VHL3
         WWOxhUf62gw61bEpmXA/voFCTI40ph5VuEWl+kUuds7jetvsgWyBD+vzhqGGncSGVSRI
         9QZqQzq+AOO1prrNXCDR9JIoLxWQBDBZRS2iSbsPNDuF6app0wb5qr0ONR+r9OQ1KkcN
         wViG/TyNyKD76jQEnzEXS6zldfkxblvIY691z0e8gIOaMgOGOnNPslRA/xTk6un6u4Ix
         yZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+Aq1htCCe4J+KaYbiBgsGd/SMns1HeFPyllEeH0HLrE=;
        b=LpVaMliXduy7wz9yVfqP+Yu4qmp+0Kj57IPNcC32vJDmYR1RshJQt90r/Oc5rWEp4X
         93FDdMBpH5fy7OoP8HbGZNauU3KxQ2jRT01GqLBvA3sLDqiYHnEAkkX71ADzRrQ94WlS
         aWGfUy9Bx2OKMtVbi6RI74xRx8tWohRdQspIa7ae9/rSopbPvUS2dI0wzuG8BuKiaSUy
         1KYiN+9m47evpMqD8EjLYZGjQwRhSewfgDHxpIvT+et89ey6r/mmeKbK/ML4+4FV6CN8
         URr5VyigSCuLwrmONIy1FDvSHROOGSlI/rKPNmDnD6EHGT47JHazWgn2Mzy2ERMa04PT
         Pqug==
X-Gm-Message-State: AOAM531UDPZXZfgJ6d8WaZPzF6EQmPNuuJ8CaQDxtqHuEn83xTj+WrpW
        c0o1WWD3tUaGbM2GTUhRf34uFA==
X-Google-Smtp-Source: ABdhPJxyBL43fH2rXCx547on3ZZXkYJE/PFoHnZpDzKy6MwUXjE0eMc+fSxR2ii4QVcAX1EUgjzuxg==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr8271022wmc.35.1642691066931;
        Thu, 20 Jan 2022 07:04:26 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id bg23sm3487872wmb.5.2022.01.20.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 07:04:26 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:04:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i
 Serra from maintainers
Message-ID: <Yel5+DiQoOtV7x6Q@google.com>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 20 Jan 2022, Krzysztof Kozlowski wrote:

> Enric Balletbo i Serra emails bounce:
> 
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> 
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
>  .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -

>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -

Acked-by: Lee Jones <lee.jones@linaro.org>

>  5 files changed, 5 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
