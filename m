Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8DF54FA1B7
	for <lists+linux-input@lfdr.de>; Sat,  9 Apr 2022 04:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240617AbiDICiR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 22:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbiDICiR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 22:38:17 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D440EBC1E;
        Fri,  8 Apr 2022 19:36:11 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id s2so9981627pfh.6;
        Fri, 08 Apr 2022 19:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JpAslWEmI8x6xNr4wuOUtbZBRJ5NpOzRGwoUebYAVxA=;
        b=gJqSFYH9J9PCxOe1qJk55S/IsJj1FBzpQ45iBron2xhjo72Px8/b7uDsJko6ExDLbi
         bRe1S8FsF1CyVYI1g8z2Of5x6ItOIan9fg9T5L00W0CaBR1eheysJnFke4sscKZ/1hgr
         l4ETAZChTj6iAE+MmoV78wk9n0+Q35gdN2I3utQSsELwpYdOhUNQPcGoGaqvmQ7UijGD
         z15qpFR3OfVmyrhUIkJg3uGFnEgVB3+sKdHaftJwpQ2l71Nmf0ohXnak0yL/bKChmE1u
         EeKe6jsq/nmFm1Dca6A8UL/1myQ5PWYs4SugopF5lvTKhxzfQ+26/IHqc6Qq5B78PAW8
         8FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JpAslWEmI8x6xNr4wuOUtbZBRJ5NpOzRGwoUebYAVxA=;
        b=63Yf6dn3ltlFajOiFrabPG9RJkK6HGzF6oNf3KRTAldw+JUB+A1ISeI0crMaF4SsPa
         K2YqnnSO4Ope9yzBgLu/zIMmXXt1LlPE1BgwTrPpRgpHh35PFkmGpFJClLbkIzGQNQ7f
         Yv8/v/0dAAj1lurH7sBbvOUElkcEVbP156mHDdNR5p7qkvKzYZVmLyCLECZ21PjBMo2e
         tu2f/r7Wyb9PYkZwNtxgqphYkTZmDQSTBF5RGPp0Uqa0528MgrlYfMzWxWZI4bUowulv
         69sRjtZ/0pvJFsyGyTS7jdyM5XrqHYzS46NtB9KZFULuje+WYQy4gmkDxscxqDVRH7+K
         Axug==
X-Gm-Message-State: AOAM532p7SUL9FbW4/PDomFBYxgGGTKWp8Vpq72cIQAA4lXWjjhZZrJ1
        RJX5U8sJXUAhGM8folQJrLw=
X-Google-Smtp-Source: ABdhPJzcrr6r3QXKPBWclyGBkyT8L8wWM1zTK7wreS906PUYismJMYHq32TgvQIzdbdkwps40/nnzw==
X-Received: by 2002:a65:41cc:0:b0:380:6f53:a550 with SMTP id b12-20020a6541cc000000b003806f53a550mr17699556pgq.471.1649471771214;
        Fri, 08 Apr 2022 19:36:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9186:332c:bcb2:4506])
        by smtp.gmail.com with ESMTPSA id u11-20020a056a00158b00b004fb07effe2esm28503281pfk.130.2022.04.08.19.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:36:10 -0700 (PDT)
Date:   Fri, 8 Apr 2022 19:36:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Azoteq IQS7222A/B/C
Message-ID: <YlDxF/GFCrT85rHX@google.com>
References: <20220403221659.865997-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220403221659.865997-1-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 03, 2022 at 05:16:57PM -0500, Jeff LaBundy wrote:
> This series introduces support for the Azoteq IQS7222A, IQS7222B and
> IQS7222C capacitive touch controllers. This new family of devices is
> similar to the IQS269A, a key difference being the delineation between
> conversion cycles and sensing channels.
> 
> A cycle represents the charge transfer mechanism shared by up to two
> channels. Channels may represent keys or switches and have two levels
> of detection (proximity and touch).
> 
> Each device has its own unique features including channel count, slider
> or wheel support, and Hall-effect sensing. The driver is demonstrated
> with each device in the following videos:
> 
> IQS7222A: https://youtu.be/SyHhe9pSr8c
> IQS7222B: https://youtu.be/R9Yd8yFPmN8
> IQS7222C: https://youtu.be/-ahg52Co5zo
> 
> Like the IQS269A and its close cousin IQS626A, the IQS7222A/B/C are
> highly configurable and follow the same general structure in terms of
> how their bindings are represented.
> 

Applied, thank you.

> Jeff LaBundy (2):
>   dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
>   Input: add support for Azoteq IQS7222A/B/C
> 
>  .../bindings/input/azoteq,iqs7222.yaml        |  960 +++++++
>  drivers/input/misc/Kconfig                    |   10 +
>  drivers/input/misc/Makefile                   |    1 +
>  drivers/input/misc/iqs7222.c                  | 2445 +++++++++++++++++
>  4 files changed, 3416 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
>  create mode 100644 drivers/input/misc/iqs7222.c
> 
> -- 
> 2.25.1
> 

-- 
Dmitry
