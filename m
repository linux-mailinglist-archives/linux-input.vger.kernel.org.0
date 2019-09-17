Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E058B5088
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 16:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbfIQOhS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 10:37:18 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35723 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfIQOhS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 10:37:18 -0400
Received: by mail-oi1-f195.google.com with SMTP id x3so1579824oig.2;
        Tue, 17 Sep 2019 07:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BigMPexxOngg61i5wfyf2Qw8qA3RwUd/7pmyWTeWTRk=;
        b=r8VogfcZ/a+QEZAGcRd0yxrkbPwxoUHcKZdM/fTXd29tj9HD0cd7CRGcRF2DH850dz
         HgrkD1yE6jWJw+88JRaTiIiEjcHbgBMR31k3fCoVKxwrefA6fjWKUGRva9eKb4HzZ849
         bkSoHD8caCutgekruxmEU23GJYOa6CmuWlXSMGcOzflepad8UPMeGcdg3NO0udMnTLvY
         YS3OUsogc4WeQUxJPmPPgyla42EagaVvt+Rmt2bmiXo0T2pAgI7y0JyVSIFHYyzXnnkG
         qztsp+oAZfzG/lndLGtQF8JkAm3OOKPTKDDPN2Bgjtw6IFFW6zySH7LDKT2QXJtYu0rY
         TG7A==
X-Gm-Message-State: APjAAAVFEZPjt83E2MiLj2o6vwDBAwujLiOIyLLAj1CETr4Nod99m7qg
        dPC2l1G4IEWFiQPgD7pdog==
X-Google-Smtp-Source: APXvYqyrZdwgk1e0LtNYLYAkGvhS8of2AI4Dnqt2nTvScQNTn7frbrk6hp6W5qCg80z0n/wV5AcQ1A==
X-Received: by 2002:aca:4fc7:: with SMTP id d190mr3871430oib.25.1568731037314;
        Tue, 17 Sep 2019 07:37:17 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a21sm673465oia.27.2019.09.17.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 07:37:16 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:37:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, olof@lixom.net,
        mripard@kernel.org, arnd@arndb.de, jagan@amarulasolutions.com,
        dinguyen@kernel.org, bjorn.andersson@linaro.org,
        marcin.juszkiewicz@linaro.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, cw00.choi@samsung.com,
        enric.balletbo@collabora.com, m.felsch@pengutronix.de,
        ping.bai@nxp.com, ronald@innovation.ch, stefan@agner.ch,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH RESEND V5 1/5] dt-bindings: fsl: scu: add scu key binding
Message-ID: <20190917143716.GA23562@bogus>
References: <1568689939-8871-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568689939-8871-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Sep 2019 11:12:15 +0800, Anson Huang wrote:
> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
> system controller, the system controller is in charge of system
> power, clock and scu key event etc. management, Linux kernel has
> to communicate with system controller via MU (message unit) IPC
> to get scu key event, add binding doc for i.MX system controller
> key driver.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
