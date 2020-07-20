Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411A6226A51
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 18:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388922AbgGTQdC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 12:33:02 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33744 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731802AbgGTQdB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 12:33:01 -0400
Received: by mail-io1-f65.google.com with SMTP id d18so18264091ion.0;
        Mon, 20 Jul 2020 09:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jnt8NGEcb9QuspToNkCE0B8uWDCkviqvtXBWs7ndp7U=;
        b=dR3hTB7BiWw/IcwA5DjFjczFD2oDyELi2GOkahBJZT88PZ/PU8EGrz/VWOi6vPkCUb
         0Z7/OyQEyU7mE5T7tLMWYaqGShtJkduHX++9Id4Ahj1viAODKwx9eaTEMdyvUpUBbJny
         /FopgqQHKiUTu2vjwr5NwDg+thAako4p9sk55eNNPDQK/z436OvdKgeODv6eIAipd2yf
         KZSMY3V1ygXtuJDuwgWKYoV3UdZs+6Bfw1Ds4TTTqpsTFx3YOip9gQfyZxpO1oS+UAJK
         Q4IrbYLdbGdtrjLDA5A2mWOOF6j/P1aOt01GuRk2bEtPFb/6HqKXzKxr4Q7a8iZ8QCUB
         FeFg==
X-Gm-Message-State: AOAM532SsRu9U7wrB/r6ZcvzjopEdvZNNi9JBfc24wuoKksHV9HHJHbW
        R64LpDdQ+ggwowZBET+/2w==
X-Google-Smtp-Source: ABdhPJwcUlO64ABhqVtn8AX7Eodm+sHDVMi+gLO66Zc7WYwVg0XRJFukPDma212P5nj5hmFTmdHLSw==
X-Received: by 2002:a6b:c343:: with SMTP id t64mr24390076iof.66.1595262779894;
        Mon, 20 Jul 2020 09:32:59 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j17sm8948918ilq.7.2020.07.20.09.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 09:32:58 -0700 (PDT)
Received: (nullmailer pid 2625794 invoked by uid 1000);
        Mon, 20 Jul 2020 16:32:56 -0000
Date:   Mon, 20 Jul 2020 10:32:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Heiko Stuebner <heiko@sntech.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: input: Add docs for ADC driven
 joystick.
Message-ID: <20200720163256.GA2625563@bogus>
References: <20200719221103.91644-1-contact@artur-rojek.eu>
 <20200719221103.91644-2-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200719221103.91644-2-contact@artur-rojek.eu>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 20 Jul 2020 00:11:02 +0200, Artur Rojek wrote:
> Add documentation for the adc-joystick driver, used to provide support
> for joysticks connected over ADC.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
>  Changes:
> 
>  v2: - Add `reg` property to axis subnode in order to enumerate the axes,
>      - rename `linux,abs-code` property to `linux,code`,
>      - drop `linux,` prefix from the remaining properties of axis subnode
> 
>  v3: no change
> 
>  v4: - remove "bindings" from the unique identifier string,
>      - replace `|` with `>` for all description properties,
>      - specify the number of items for `io-channels`,
>      - correct the regex pattern of `axis` property,
>      - specify the value range of `reg` property for each axis,
>      - put `abs-range` properties under `allOf`
> 
>  v5: add `a-f` to the regex pattern of `axis` property
> 
>  v6-v8: no change
> 
>  Notes:
> 
>  Rob, the bindings example in this patch depends on changes introduced
>  in another patchset, still to be merged:
>  https://lore.kernel.org/linux-iio/20200719205307.87385-4-contact@artur-rojek.eu/
>  Your scripts will most likely fail to validate this.
> 
>  .../bindings/input/adc-joystick.yaml          | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/adc-joystick.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/input/adc-joystick.example.dts:24.31-32 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/input/adc-joystick.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/input/adc-joystick.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1331964

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

