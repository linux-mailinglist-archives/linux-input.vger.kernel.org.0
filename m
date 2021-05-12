Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7254937D11E
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 19:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237006AbhELRsL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 13:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245566AbhELQw5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 12:52:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F26C0611A8;
        Wed, 12 May 2021 09:38:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id l14so24286280wrx.5;
        Wed, 12 May 2021 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YMb7uN/QWY5kpiEORQpOCJvo0plM7mzHsaNeBHSjrWg=;
        b=pxjAbg1WrLWOXCdwri/iyguoBHX06bS+zsC1ZbzXBKincC3w+e7sr8NUhh4kg8fw0J
         g/3VpiDSYjgo3NqDU462rHTuSpM51uDXm9sY0RvYOfP73vWjoKxYX8UNfRNz258pUL3t
         xCtiDTUk0UjlU5qmi/sVccDAYCY4BlEz44Br9BR1qazP6d/2EdDdN42asYTVkXVsm0MJ
         zOkrzjMl153Y0OhqSMnlHVWtqV0Kxb6XapepjSFHo9aR4rhOHLChqHtubpNBKaUu7IIa
         Lr2UQahSAsbve/8abe41aR1lplbAuX1AkSz+gaUNSyE8FuvMlORnLz1WjTv6oapQt5f/
         VLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YMb7uN/QWY5kpiEORQpOCJvo0plM7mzHsaNeBHSjrWg=;
        b=YKvMSPueDhe9yq+vCe9dl/oXEFdQvHbgSPBJT/ISc573EDQ3Lbfox174Ohg2SK3NQf
         S81cIwJ3bjsQDAyPZAdtMzjicc8s2diNkT35ulPNeGadFZlNMUYGwldSQl/06aLnSZnt
         7rFCP8Wut1C+b+mBB3xuKsXQqOF3Ddn0khTSCwSwc3JJeUo/vcH7vyuC/FaanQk4MXUN
         5g4Lyam9LDjOlzYEQvT1TBmb25ixdGgjvZUsVWHeIa+nwSLagXPAO4MElLxcNkQPEtZA
         G+ExxKeDg4/NipYhaMwF6Tqafuj9gHbr+l5VrWvp3clKsKtSQQq2LJanVEXTZBq8TWXE
         YVAA==
X-Gm-Message-State: AOAM530AF75wd/4hd3i2aoD/mHoLwKlInkEZim6ZHGxoLchw4giqoTzA
        kpF3vadkzQxm0kd9vV20IXnga/1KKLepwg==
X-Google-Smtp-Source: ABdhPJxFNrKOWVPM0JkDbkwH3AwuL6kakoN+0Qnbn/3gkIZ1tbCKYCw8x+nyqNJtJr7PUf/fvUK6Lg==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr46235148wrj.75.1620837535360;
        Wed, 12 May 2021 09:38:55 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
        by smtp.gmail.com with ESMTPSA id z5sm179335wrn.69.2021.05.12.09.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 09:38:54 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To:     Ikjoon Jang <ikjn@chromium.org>,
        linux-mediatek@lists.infradead.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hsinyi Wang <hsinyi@chromium.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210510092631.3141204-1-ikjn@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
Date:   Wed, 12 May 2021 18:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510092631.3141204-1-ikjn@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

On 10/05/2021 11:26, Ikjoon Jang wrote:
> Add a 'cbas' device node for supporting table mode switch in
> kukui devices.
> 
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..40030ed48854 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>  			compatible = "google,extcon-usbc-cros-ec";
>  			google,usb-port-id = <0>;
>  		};
> +
> +		base_detection: cbas {
> +			compatible = "google,cros-cbas";

I'm not able to find any binding description for this. It seems linux-next has
driver binding to this compatible, but the description is missing.

Can you please clarify.

Thanks,
Mathias

> +		};
>  	};
>  };
>  
> 
