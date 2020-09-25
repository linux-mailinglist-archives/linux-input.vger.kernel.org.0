Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304972792D7
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 23:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgIYVBr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 17:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIYVBr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 17:01:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0947C0613CE;
        Fri, 25 Sep 2020 14:01:46 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id b22so4251820lfs.13;
        Fri, 25 Sep 2020 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t4fUgn2zvUGm8EaIiZS75zCwLKOu3lWSYCpd6JL4qXM=;
        b=GnQvocB6klVSi3rD6g52ixIvaDNCL1buLXjpWZELU3HgA3y7rMKXYKK7tMKZiXxQo8
         jHW+/EA+ATUuGvAV8gdvgDvsuD1hVvlmdmc3M9iEQl3Oisebh+DU5xfvQan3FgRoA4CB
         BxQgbI7dWqzfDThfXivpJhXmJtRo7PPwg/BMe5neKiy4mFbveAm3CIPfqPnvSoF89t64
         rRMHfiS39D+txsctBAlXb4a9NgqSFAvsGUMgn14H5DWrc6081RNlGJ3ywplZeJwRI5ai
         /Kkt1MochgjegzlfIDTt9kkW6ZQig7hBSYTzM2zq2sCrkruGcG8+LS3djMKgm+nzE5r3
         FBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t4fUgn2zvUGm8EaIiZS75zCwLKOu3lWSYCpd6JL4qXM=;
        b=c1kI1KaYIFSsVHxS7HUmKoLz9Hc4a5C5kp2WM6md0SZzqPg/zGHVUwPeWYcWLLFlNY
         DazPW4tgHnGBMxPcHxIXG3VhjSs3iSpfM5aMucNjpIb3Cv3b32TcoaHF+weXRmmzXUMR
         vsMVN9IFNu8ghybkegsqP25wEyngOIph52k3dQ3MihFwBT7Yp2oOYC+FzIlG65r3XQFc
         JtSWSODQNmI1YdwhXw/Z4lccMlAfT0rO4+ht/lhgrHBui3Ub1CK3aOych1baYh7BR0cA
         u/RrDtQxJi2K0yryV0HAEhBTbxp7bsx/qCwKe3gFPtOeX4R5NmKHXSx7l6+ZiGoIk0z2
         zZaQ==
X-Gm-Message-State: AOAM532kwq5z2LE8GN0kmYdT+c8U46/rcDg8L5B2G/U714GbblP8C/cC
        HVb9HfeAI5EtA4mhwsaHYyA=
X-Google-Smtp-Source: ABdhPJyFhX4FLY8dpYXxKQv27CuKjDJ/KS9bLQrVlc/ub6So1ARhy1KKhPp/6acjw8j7JzEE6kruzA==
X-Received: by 2002:ac2:52ab:: with SMTP id r11mr252967lfm.118.1601067705342;
        Fri, 25 Sep 2020 14:01:45 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id s21sm181473lfb.76.2020.09.25.14.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 14:01:44 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] dt-bindings: input: atmel: add compatible for
 mXT1386
To:     Jiada Wang <jiada_wang@mentor.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com
References: <20200925135257.21138-1-jiada_wang@mentor.com>
 <20200925135257.21138-2-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1fd244e2-abf0-5e8e-c8c8-e3c2a1e95f08@gmail.com>
Date:   Sat, 26 Sep 2020 00:01:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925135257.21138-2-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.09.2020 16:52, Jiada Wang пишет:
> Document the mXT1386 compatible string.
> 
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> index c88919480d37..c13fc0f3f00b 100644
> --- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> +++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
> @@ -3,6 +3,7 @@ Atmel maXTouch touchscreen/touchpad
>  Required properties:
>  - compatible:
>      atmel,maxtouch
> +    atmel,mXT1386
>  
>      The following compatibles have been used in various products but are
>      deprecated:
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
