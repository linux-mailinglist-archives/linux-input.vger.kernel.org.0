Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F3E49840D
	for <lists+linux-input@lfdr.de>; Mon, 24 Jan 2022 17:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243360AbiAXQBV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 11:01:21 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:46866 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243298AbiAXQBS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 11:01:18 -0500
Received: by mail-oo1-f49.google.com with SMTP id k13-20020a4a310d000000b002e6c0c05892so2041674ooa.13;
        Mon, 24 Jan 2022 08:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=cLihXDdsVsXzrgv9MgfjxTwK/WNvncmIfx+sTySIEAk=;
        b=x80rYVjz8B7/qytbkfgjNgCAf7m9xwiVoVSbjShoip5nLdNgmjg4eJ+p+vGRZjXq6C
         PPriNwQFUl9Lk/zckz9p9ap4AWF5iLSJ8YH3vS4V2sfxklS0mssUrj6L/GYQGoRCUjQ6
         WIxdddE74+tCapqt2/5TAJ3TCR3MMHyzk0Cfwn5sXs4OnLCLyuGYHwpNPwhttGr6q2K9
         HliqmRJK9aGLNqM0Vfuoq1gr0VwPfooBDxq6HVMlFxfH65lpogEb2n173aTls9DdWNpY
         5fXRez0WJqPuH441LPJGdgZZOJUhwJr6qQXHdN02KFjA+kNMMrIJwhp4bXerpFiIjSE7
         bW6w==
X-Gm-Message-State: AOAM530LFqUnQMg4JxxO7ZqEcPvZnQyEiM3FS739CGmDTFnm2lytuzpS
        7iGzxbqhdzKcQHA0zjTLlw==
X-Google-Smtp-Source: ABdhPJwgZIHI70X6BuPAo/MsW0tFg0C+V3+e2hRxrNXqL0m2DS5cON22/EFoC1DceRovbw2qpdVvkg==
X-Received: by 2002:a4a:420a:: with SMTP id h10mr410739ooj.13.1643040078030;
        Mon, 24 Jan 2022 08:01:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f6sm4348069oos.7.2022.01.24.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 08:01:17 -0800 (PST)
Received: (nullmailer pid 3901531 invoked by uid 1000);
        Mon, 24 Jan 2022 16:01:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20220123194232.85288-2-jeff@labundy.com>
References: <20220123194232.85288-1-jeff@labundy.com> <20220123194232.85288-2-jeff@labundy.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
Date:   Mon, 24 Jan 2022 10:01:12 -0600
Message-Id: <1643040072.594821.3901530.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 23 Jan 2022 13:42:31 -0600, Jeff LaBundy wrote:
> This patch adds bindings for the Azoteq IQS7222A/B/C family of
> capacitive touch controllers.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../devicetree/bindings/input/iqs7222.yaml    | 967 ++++++++++++++++++
>  1 file changed, 967 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/iqs7222.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs7222.example.dt.yaml: iqs7222a@44: '#address-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs7222.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs7222.example.dt.yaml: iqs7222a@44: '#size-cells' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs7222.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs7222.example.dt.yaml: iqs7222a@44: 'channel-10', 'channel-11', 'channel-2', 'channel-3', 'channel-4', 'channel-5', 'channel-6', 'channel-7', 'channel-8' do not match any of the regexes: '^channel-[0-19]$', '^cycle-[0-9]$', '^gpio-[0-2]$', '^slider-[0-1]$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs7222.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1583181

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

