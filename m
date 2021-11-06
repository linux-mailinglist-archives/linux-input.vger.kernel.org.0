Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18215446C07
	for <lists+linux-input@lfdr.de>; Sat,  6 Nov 2021 03:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhKFC1t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 22:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhKFC1s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 22:27:48 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C97C061570;
        Fri,  5 Nov 2021 19:25:08 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id p8so8473956pgh.11;
        Fri, 05 Nov 2021 19:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HS5tdtnjvtjCMr7mW88LxdLfRIjrhjbdJc8HlrChIEg=;
        b=ZLrSv+yowWNqO2SF/2PhBAyu9ur4ZKQJcEVVZI3a4W87NomWXLbhOwA4kvAydlemk/
         gHJN0Xai9afiz1Vd+CkU5S07wQI5mbxi+DXTlE5LHbIbPyMFw3eXZV/4OR9XwAWwttIC
         MiF4SRTPASsl3rs7NNE9BhOQqqLPV7Ci/kVxRB9pYVcothwp57QOy4lpAcpEDPfCMYcm
         R5xFAgOkEkIyYygCVVuDZSvqG1VmNYar2MRhFGTBKJthVu+OqzwFncZRJIf2ZZeGfIF/
         wAIzaU4xnj0NQioQ87s0nOQgqy6IHjRiHRYS663i0qYpLeWb+cyrjdaaghHw0dS8yw73
         loew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HS5tdtnjvtjCMr7mW88LxdLfRIjrhjbdJc8HlrChIEg=;
        b=kh7wlNWSKjf/9lScdaP6GKOjUCmzi/oXV4JHiFGIRh5AjU59BD2gl57Jiz3dldkRXy
         VqswE6QUifgUrd2KNcKehhPv5t9RMQWTXQIDvTOHG7BmCitVMPCJmfpQWXubbS4WWWuw
         w+dpShITElu1pqGcN3Owm/EHLoeCdnGqOWHd58BRwFx95XmLoHmVGKbLi1AssnyAI0bU
         YjiZ8b6qyzqd69bxD/UVb5YqAKfEQYsTaRoqw1Cu/Nd6N8SF1acvE4KFxtu7w9sYGwNO
         NkyfV82NhVbvc+maB2Y0nDT7WLuUM0JZmZ1awGtj6Z6S+ZhXwp6bt95OdkPiAlvP8pXm
         gUTQ==
X-Gm-Message-State: AOAM530NsBYwGz8y3CGdYP5wMljzI/88ZQwku1bp5OES3YtxxugctaYm
        kjshQmpCkpVthWyJpHMdhcI=
X-Google-Smtp-Source: ABdhPJzqz+LPA78908kez9PRo7qqfIpvJ5Vf1VtQiAQoyfpvTnE4hiu4jdgouLouIs9gqZ9yoclf+g==
X-Received: by 2002:a63:1cd:: with SMTP id 196mr47171777pgb.39.1636165507644;
        Fri, 05 Nov 2021 19:25:07 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:837c:e765:475f:22d3])
        by smtp.gmail.com with ESMTPSA id a21sm8678162pfv.67.2021.11.05.19.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 19:25:06 -0700 (PDT)
Date:   Fri, 5 Nov 2021 19:25:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        andreas@kemnade.info, rydberg@bitmath.org, robh+dt@kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v2 4/4] ARM: dts: imx7d: remarkable2: Enable the cyttsp5
Message-ID: <YYXngKCBbAkkxEKj@google.com>
References: <20211103114830.62711-1-alistair@alistair23.me>
 <20211103114830.62711-5-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103114830.62711-5-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 03, 2021 at 09:48:30PM +1000, Alistair Francis wrote:
> +	tsc@24 {
> +		compatible = "cypress,tt21000";
> +		reg = <0x24>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touch>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio1 13 0>;

Reset lines are almost universally active low. Are you sure it is active
high in your case?

Thanks.

-- 
Dmitry
