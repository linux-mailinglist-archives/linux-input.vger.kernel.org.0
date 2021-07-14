Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BBC3C9137
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 22:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237870AbhGNT64 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jul 2021 15:58:56 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:44911 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241913AbhGNTyv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jul 2021 15:54:51 -0400
Received: by mail-io1-f54.google.com with SMTP id v26so3603144iom.11;
        Wed, 14 Jul 2021 12:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JdBJNAtYvBdjGt7vqYO3Z871VY9xVAV5SBNAA/ScJgk=;
        b=Iz0cgX5Euf6vI1E3J5bIqggaazD8t9lDsiGC0rN8o1Rjm7+nSv3l59FbCHsP0w4OrK
         nRI0bifTxroUwXoH/e0vxP9iSn/wy9oLJj1ohTM1pCIhz8jCFllCXMBQTXP4odGLgeON
         V6QnF15g/UCKtdvlhAojKPcXbtIqDi9z636PzVpbPme8MWZhG2FvvXkNB+y1zKehoGvS
         a14MzW0Sf6VxmIm2hsAE3kuY/NGFEwU+0KvfSbN012dKQmlpNvBb1Oz2Parn4Vg6+noT
         ppEs/lGsV3crT+w/l30XSTRKy4+yAr5qsBqpzypmk7ztRqZFsZx5w/QQ17T6CrFi29sE
         w9Bg==
X-Gm-Message-State: AOAM532go0EjB+zaZnyfqQL1Lgl0tpeWFxlE8dYGGcFg86JZDlrEwAm0
        aeDIOTMal+g+FtlxxekADA==
X-Google-Smtp-Source: ABdhPJztT4eyiIkF00BNIDS67g07hFOMZlkoZzL0+Dum9aBnIYEwwjrOIduGi/sgiIaXyoV76PYBQA==
X-Received: by 2002:a05:6638:1350:: with SMTP id u16mr4483881jad.19.1626292318228;
        Wed, 14 Jul 2021 12:51:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p21sm1853042iog.37.2021.07.14.12.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:51:57 -0700 (PDT)
Received: (nullmailer pid 3286595 invoked by uid 1000);
        Wed, 14 Jul 2021 19:51:54 -0000
Date:   Wed, 14 Jul 2021 13:51:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Srba <Michael.Srba@seznam.cz>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input/ts/zinitix: Convert to YAML, fix
 and extend
Message-ID: <20210714195154.GA3286486@robh.at.kernel.org>
References: <20210625113435.2539282-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625113435.2539282-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 25 Jun 2021 13:34:34 +0200, Linus Walleij wrote:
> This converts the Zinitix BT4xx and BT5xx touchscreen bindings to YAML, fix
> them up a bit and extends them.
> 
> We list all the existing BT4xx and BT5xx components with compatible strings.
> These are all similar, use the same bindings and work in similar ways.
> 
> We rename the supplies from the erroneous vdd/vddo to the actual supply
> names vcca/vdd as specified on the actual component. It is long established
> that supplies shall be named after the supply pin names of a component.
> The confusion probably stems from that in a certain product the rails to the
> component were named vdd/vddo. Drop some notes on how OS implementations should
> avoid confusion by first looking for vddo, and if that exists assume the
> legacy binding pair and otherwise use vcca/vdd.
> 
> Add reset-gpios as sometimes manufacturers pulls a GPIO line to the reset
> line on the chip.
> 
> Add optional touchscreen-fuzz-x and touchscreen-fuzz-y properties.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Michael Srba <Michael.Srba@seznam.cz>
> Cc: phone-devel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../input/touchscreen/zinitix,bt400.yaml      | 115 ++++++++++++++++++
>  .../bindings/input/touchscreen/zinitix.txt    |  40 ------
>  2 files changed, 115 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
