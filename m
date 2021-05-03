Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8944E37206F
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 21:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhECT3j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 15:29:39 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:45030 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhECT3j (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 May 2021 15:29:39 -0400
Received: by mail-ot1-f49.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so2131093otp.11;
        Mon, 03 May 2021 12:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jhhpn9NYBV5aYOb5xCU71puhRz+23sT/8/8mM+p2NaU=;
        b=opyr9IKbgf2gixRyr+ChnrtLYrFVxiD4f9Jxja/XkLMP29srI/eCLk2T9OXzab0Ir7
         7x6NmLsO+fUGpbYn5Mt786NTgZfca2B2LeUXABuKfTHT7bdn3Tv9fudoDW1KAri/YzzO
         1MBUqDUmoKIoXAS7msztF4oPAzFbahuDjSQUE4TLXGTgNg4jmZQm1BRoV8KCl78L7VkC
         MquwA/aBDHb3rxqeHoe4BfFsdC+7F+xKEqjSFq31hzgADUNfmjYEpl6doKIq80OgZZm8
         RzE9S5EKn8BzV2UO92AsvjaugzCi6XanYeea/x/FmyEx6TI4cchMTg+301vVZae/RJ6Y
         DK/w==
X-Gm-Message-State: AOAM532hXouWWULV917zapJJqZyfFuaUC1yE6KV3ZTLqMVlUaX5WJI/9
        uEQrulbM6kPDXtMaPpvxbQ==
X-Google-Smtp-Source: ABdhPJygRYjzKbasu80k7e5nA2cdJ4GM54d+Z/a/gZynHxWgtO0WH5vsHQtLcp7+z0aWiRVcNEwk/g==
X-Received: by 2002:a9d:10a:: with SMTP id 10mr16199332otu.188.1620070125193;
        Mon, 03 May 2021 12:28:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z9sm165458oog.25.2021.05.03.12.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:28:44 -0700 (PDT)
Received: (nullmailer pid 2242383 invoked by uid 1000);
        Mon, 03 May 2021 19:28:43 -0000
Date:   Mon, 3 May 2021 14:28:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     fparent@baylibre.com, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: input: mtk-pmic-keys: add MT6358
 binding definition
Message-ID: <20210503192843.GA2242334@robh.at.kernel.org>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
 <20210428164219.1115537-5-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428164219.1115537-5-mkorpershoek@baylibre.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 28 Apr 2021 18:42:16 +0200, Mattijs Korpershoek wrote:
> Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.
> 
> MT6358 is a little different since it used separate IRQs for the
> release key (_r) event
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
