Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3D22387F5F
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 20:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhERSRQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 May 2021 14:17:16 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46763 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhERSRQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 May 2021 14:17:16 -0400
Received: by mail-ot1-f47.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso9415635otb.13;
        Tue, 18 May 2021 11:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+g05SB4aoT3YIpI6N4IhJVhX2l169+uO0nZE9GNr+Mo=;
        b=E7tM2Rb4mpXHGisgoFKw2o8Zc4dD/1+5lEI+gksZVyLSBzttiqThuZdVqPYJlbc9qF
         xemoaoXHpZU51BRt0Q/I11GR6NMzmRuC4MBqgkWkMtt5pmchD0NuO048RwmCiU65asOA
         YSmI13SUePD2fLImhkz00RKhKhk5F6109BhsP+877XBXb3dPkX6E3CikP1prdw24nNDx
         K4WyxIu+oA1pXN3iV0+cLolz8Ni1/YMkECJG29aBXV3F6/WUE4wLwZDnbiWVmkDVc/Dt
         wL+I6HUS8CHcmN4AziTpGuXEjuf0Yc1gYd4ldIIb5GTv5fp1SdX6J3L2v1mil9Y0Ra3t
         2sog==
X-Gm-Message-State: AOAM531KMSFWZU3l1W9acB4be9UF9alxoeaEcjAmK4zuwoFvJmkNVngw
        iZx/QhA8sMHLNVtxjiSscQ==
X-Google-Smtp-Source: ABdhPJww1OVaLPTwZ5zjCatbIXjAd8Nt777S40pBMd+GHaOom3iOiJwsr7y2qRts2CV7dlh5dgtbPw==
X-Received: by 2002:a9d:7348:: with SMTP id l8mr5485819otk.240.1621361757424;
        Tue, 18 May 2021 11:15:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o80sm3845687ooo.41.2021.05.18.11.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:15:56 -0700 (PDT)
Received: (nullmailer pid 970611 invoked by uid 1000);
        Tue, 18 May 2021 18:15:55 -0000
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     David Jander <david@protonic.nl>, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210518125748.26823-4-o.rempel@pengutronix.de>
References: <20210518125748.26823-1-o.rempel@pengutronix.de> <20210518125748.26823-4-o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: touchscreen: resistive-adc-touch: add support for z1 and z2 channels
Date:   Tue, 18 May 2021 13:15:55 -0500
Message-Id: <1621361755.675568.970610.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 18 May 2021 14:57:47 +0200, Oleksij Rempel wrote:
> For pressure calculation based on plates resistance we need some additional
> properties:
> - z1 and z2 channels with additional measurements between plates
> - actual resistance of the touchscreen. Currently we use only
>   X-resistance.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../bindings/input/touchscreen/resistive-adc-touch.yaml  | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.example.dt.yaml: resistive_touch: io-channels: [[4294967295, 1], [4294967295, 2], [4294967295, 3], [4294967295, 4]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.example.dt.yaml: resistive_touch: io-channels: Additional items are not allowed ([4294967295, 4] was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.example.dt.yaml: resistive_touch: io-channel-names:2: 'pressure' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.example.dt.yaml: resistive_touch: io-channel-names: ['x', 'y', 'z1', 'z2'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.example.dt.yaml: resistive_touch: io-channel-names: Additional items are not allowed ('z2' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml

See https://patchwork.ozlabs.org/patch/1480237

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

