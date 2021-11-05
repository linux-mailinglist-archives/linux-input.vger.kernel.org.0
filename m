Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30F84464C1
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 15:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhKEOYm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 10:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbhKEOYm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 10:24:42 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DF9C061714;
        Fri,  5 Nov 2021 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HyYi72yML6OQWdSkYrfcpZ4V9EJK/wqUJrTKISMtJd0=; b=IzM84mtTW4vnuDabPKxA8fb8Vu
        Ld+rAKKycyZTtYhqJXSbRHitp27cqqvReeMucoIJA+Gv0MMI26qwDvy2nMBqCpfF/hc4f/tSDr6b5
        8EopE4euE+8te1br3JIE159Vjp5J7JQNUrZs4aKE4VexXtg5otO+vgxOR2cri6qTdu2U=;
Received: from p200300ccff0899001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:9900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mj06O-0004fE-0M; Fri, 05 Nov 2021 15:21:56 +0100
Date:   Fri, 5 Nov 2021 15:21:54 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        rydberg@bitmath.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v2 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
Message-ID: <20211105152154.20f5cbd1@aktux>
In-Reply-To: <20211103114830.62711-3-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me>
        <20211103114830.62711-3-alistair@alistair23.me>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I finally found time to test this.

On Wed,  3 Nov 2021 21:48:28 +1000
Alistair Francis <alistair@alistair23.me> wrote:

[...]
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@24 {
> +            compatible = "cypress,tt2100";
> +            reg = <0x24>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&tp_reset_ds203>;
> +            interrupt-parent = <&pio>;
> +            interrupts = <1 5 IRQ_TYPE_LEVEL_LOW>;
hmm, in the code is IRQ_TRIGGER_FALLING but here is LEVEL_LOW, hmm what
it is really?

> +            reset-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>;

hmm, if the reset gpio at the chip is active low (I guess it is) that
would indicate an inverter between SoC and gpio. So a nonstandard setup
as an example, probably not a good idea.

Regards,
Andreas
