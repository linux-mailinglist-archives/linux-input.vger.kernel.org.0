Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0926935A0F6
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 16:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbhDIOYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Apr 2021 10:24:55 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:39699 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbhDIOYz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Apr 2021 10:24:55 -0400
Received: by mail-ot1-f47.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso1110585otv.6;
        Fri, 09 Apr 2021 07:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Cx9lVJUJHHOakCvhduGO1GJ0gNRIq4nn2gbW6pt+5ws=;
        b=Dqsnh6AD9MJU1hhNdnL2BXFxfipnYxaV+hinowWDurUfcqH+LA5T2Ibh5bLqgJPFeB
         j3C3O9vmmFkiM9JkffezWYGcw928R73hImd11T4pKJYdnTRAsJSYuiZ6M12z6r90u08b
         Pksw1iMYTi6N7fr7OjgxJeTM/2EH5sSduRzTkKjEQvFfWgvCa3+c8wUyd1oRUERz6a/6
         9EtMODiyUaZnYiwnmk5q8WHfDEa5pUJhY0ZfWrga7skDmqvPYz4AXp6elDLxag2HOm1s
         RtgjwffhkJq6R/JRy8fIEepb1QBiylp4yDMmcOmRvgLkIsB6K/caceexrsrSUkYCnvQZ
         iRig==
X-Gm-Message-State: AOAM533BE3yzFEbz9ZhzSy89/8nvniYZq+uwEYDgdwWPW8Ch6zOK0FaU
        lD8M6d5wjNFGk1GOb9LkrQ==
X-Google-Smtp-Source: ABdhPJw2aCgUF42Z104E9zAQvM03OvbJ37wGORrcj0aSpSnFTYL5HeSm+ZIzGE1cj5wFSaTEJ6OhiQ==
X-Received: by 2002:a05:6830:12d5:: with SMTP id a21mr12382802otq.34.1617978282236;
        Fri, 09 Apr 2021 07:24:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x20sm525624oiv.35.2021.04.09.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 07:24:41 -0700 (PDT)
Received: (nullmailer pid 3596980 invoked by uid 1000);
        Fri, 09 Apr 2021 14:24:40 -0000
Date:   Fri, 9 Apr 2021 09:24:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Simon Shields <simon@lineageos.org>, linux-input@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: mms114 - Convert bindings to YAML and extend
Message-ID: <20210409142440.GA3596911@robh.at.kernel.org>
References: <20210330201233.2360006-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330201233.2360006-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 30 Mar 2021 22:12:33 +0200, Linus Walleij wrote:
> This converts the Melfas MMS114 bindings and extend like this:
> 
> - Require nodename touchscreen@ (this seems to be the case for
>   all in-tree DTS files)
> - Add the mms134s and mms136 compatibles
> - Add the avdd and vdd power supplies
> - Define the I2C clock frequency property
> 
> Cc: devicetree@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Simon Shields <simon@lineageos.org>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../input/touchscreen/melfas,mms114.yaml      | 87 +++++++++++++++++++
>  .../bindings/input/touchscreen/mms114.txt     | 42 ---------
>  2 files changed, 87 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mms114.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/mms114.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
