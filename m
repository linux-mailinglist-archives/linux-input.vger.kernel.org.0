Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD64514637
	for <lists+linux-input@lfdr.de>; Fri, 29 Apr 2022 12:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237588AbiD2KJ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Apr 2022 06:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238829AbiD2KJ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Apr 2022 06:09:27 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3178C86AEC;
        Fri, 29 Apr 2022 03:06:09 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C46851063;
        Fri, 29 Apr 2022 03:06:08 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881C23F73B;
        Fri, 29 Apr 2022 03:06:07 -0700 (PDT)
Date:   Fri, 29 Apr 2022 11:06:03 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 05/11] dt-bindings: serio: add Arm PL050 DT schema
Message-ID: <20220429110603.7bd31c13@donnerap.cambridge.arm.com>
In-Reply-To: <54dc7bc6-2849-157b-1245-75df2392a2cf@linaro.org>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
        <20220427112528.4097815-6-andre.przywara@arm.com>
        <55574426-df20-cdd7-c97d-092726981a42@linaro.org>
        <20220428182708.0c1065f8@donnerap.cambridge.arm.com>
        <993d74fa-be5b-6db2-6bba-2323de7757f3@linaro.org>
        <54dc7bc6-2849-157b-1245-75df2392a2cf@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 29 Apr 2022 08:35:02 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi Krzysztof,

> On 29/04/2022 08:29, Krzysztof Kozlowski wrote:
> > The driver is coming from ancient times, so it is understandable it has
> > some old coding style. But it definitely not sailed away. :)

What I meant with this was: there are DTs and drivers out there, for years
now, and this binding is just documenting that state.

I understand that in an ideal world you start with the binding, then write
drivers and DT based on that, but we missed that opportunity years ago.
It actually looks like this uppercase clock name predates the git history,
so this was probably the internal board file clock name twenty years ago,
and just got converted into the DT clock name.

> >> So by
> >> changing this we would break both the existing DT's compliance and also
> >> existing Linux kernels.
> >> So is lowercase something that is mandated by DT schema, or can we just
> >> make an exception here?  
> > 
> > This uppercase clock name affects even ARM64 devices, so it seems the
> > device is still being used. Therefore I propose to add new clock name,
> > old as deprecated and support both in the driver:
> > 
> > 	kmi->clk = clk_get(&dev->dev, "kmirefclk");
> > 	if (IS_ERR(kmi->clk)) {
> > 		kmi->clk = clk_get(&dev->dev, "KMIREFCLK");
> > 
> > and convert the DTS as well later on.  
> 
> On the other hand, I don't find this as that important if you do not
> have time for it, so I am fine with the exception and uppercase name.

Thanks, and yeah, I would really like to not change that. For once, this
device really doesn't have a big future (it's a PS/2 keyboard/mouse
controller after all), and the most prominent users are the fast models /
FVPs, where I wouldn't be aware of anyone actually using that device
there. (I don't even know how to do that). Other than that there is the
Juno board, but I need to disable the KMI driver there because it
electrically interferes with the USB PHY, so is not really usable there as
well, unless you sacrifice USB altogether.

So it would just create a lot of churn, for no real benefit.

Thanks!
Andre
