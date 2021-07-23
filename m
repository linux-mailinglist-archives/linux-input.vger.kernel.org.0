Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C033D4271
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 23:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhGWVLh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 17:11:37 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:46899 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhGWVLg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 17:11:36 -0400
Received: by mail-il1-f172.google.com with SMTP id r5so2795706ilc.13;
        Fri, 23 Jul 2021 14:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=01tm74Bbmv/tKuTNrNA+/wpItd6J9gG0kjycRAEWb48=;
        b=Iis6+Gm0Q7M4ZhZC/rMU9Bj8gYTiCpTs9bwBmsD2WK6YR/sdPQX/Kk7NgcrytQ8OZU
         ic2IAKvMq/Tp58uGmCPMInnfo58nrH2HTnIwCoHo8MwOFztL6l+pb/BjkjzKP3JU9ekh
         TCabf5V/leuqVfAywiKwRNwlUnk9dmigwQGd3KF2BOtE5ixzRUw20WzPO49VgpDToTNa
         u4SiKOqRGfan6gNkSUPHrtTQAz/SkMHZUMO5iOWRcK1clbQrEq9aubZMAviTchvLFPMR
         q4s1V2Idl9r6Pf4fkDLwQYEdboxSsMfegy1th3DdfhRvdlSZwyyWnjES3+0LCE9IewxC
         MRtA==
X-Gm-Message-State: AOAM531GGdKJG1NsuAiAct628AjYCShBMlHVa5DXX1fmhAgiDrI5Cbg9
        jcI66cXU2FFlD2Rm1AlLtw==
X-Google-Smtp-Source: ABdhPJxgmuVgz4k0b9s0WCMrfOI/LpaXbfUEJLr9sk+kPglQcKJYQ8yoLLSD4hlF/yhRXZ1pOoQEjw==
X-Received: by 2002:a92:ac0b:: with SMTP id r11mr4722069ilh.44.1627077129108;
        Fri, 23 Jul 2021 14:52:09 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d9sm8939201ilv.62.2021.07.23.14.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:52:08 -0700 (PDT)
Received: (nullmailer pid 2656284 invoked by uid 1000);
        Fri, 23 Jul 2021 21:52:06 -0000
Date:   Fri, 23 Jul 2021 15:52:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 20/54] dt-bindings: input: sun4i-lradc: Add wakeup-source
Message-ID: <20210723215206.GA2656230@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-21-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-21-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Jul 2021 16:03:50 +0200, Maxime Ripard wrote:
> The LRADC can be a wakeup source and is listed as such in some DT
> already. Let's make sure we allow that property in the binding.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
