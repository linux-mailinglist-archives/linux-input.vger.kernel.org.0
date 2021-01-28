Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149E2307637
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhA1MdV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:33:21 -0500
Received: from foss.arm.com ([217.140.110.172]:58166 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231171AbhA1MdP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:33:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65A4931B;
        Thu, 28 Jan 2021 04:32:27 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08E7D3F719;
        Thu, 28 Jan 2021 04:32:24 -0800 (PST)
Date:   Thu, 28 Jan 2021 12:31:36 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= 
        <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Lee Jones <lee.jones@linaro.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v5 05/20] Input: axp20x-pek: Bail out if AXP has no
 interrupt line connected
Message-ID: <20210128123136.417eea7c@slackpad.fritz.box>
In-Reply-To: <20210128113601.GA4537@sirena.org.uk>
References: <20210127172500.13356-1-andre.przywara@arm.com>
        <20210127172500.13356-6-andre.przywara@arm.com>
        <YBHCF2tWIX4MeMia@google.com>
        <20210128104627.76b35a5c@slackpad.fritz.box>
        <20210128113601.GA4537@sirena.org.uk>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 28 Jan 2021 11:36:01 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jan 28, 2021 at 11:11:28AM +0000, Andre Przywara wrote:
> > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:  
> > > On Wed, Jan 27, 2021 at 05:24:45PM +0000, Andre Przywara wrote:  
> 
> > > > Check for the regmap_irqc member to be not NULL before proceeding with
> > > > probe. This gets normally filled by the call to regmap_add_irq_chip(),
> > > > which we allow to skip now, when the DT node lacks an interrupt
> > > > property.    
> 
> It sounds like you're trying to register an IRQ chip with a somehow
> bogus configuration?

Quick background: Those AXP PMICs have an IRQ pin, that was always
connected to the NMI pin on Allwinner SoCs. This was used for the power
button GPIO interrupt. Now the H616 does not have this pin anymore, and
the board does not use a GPIO either.
I patched the AXP MFD driver [1] to skip the regmap-irq creation when no
interrupts DT property was found, but this NULL pointer now
understandably confuses the -pek driver, and leads to this crash:

http://lists.infradead.org/pipermail/linux-arm-kernel/2021-January/634969.html

Hence I wanted to plug this hole, which seems useful regardless of this
particular issue.

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2021-January/634971.html

> > > No, the driver is not the right place to patch this; regmap should be
> > > fixed so it does not crash instead.  
> 
> > I am not sure this is the right approach, those regmap functions look
> > more like an internal interface to me, with lots of wrapper functions
> > happily dereferencing pointers and reaching into structs. Moving
> > NULL checks into those does not sound like the right thing. CC:ing Mark
> > for more opinions on this.  
> 
> Without having seen the actual issue if you're trying to register an
> interrupt controller with a known broken hardware configuration that
> does seem like something the caller just shouldn't be doing, it's not
> something that's going to transiently happen at runtime and we're very
> much trusting that the caller got things right.
> 
> > A more general solution would be to not instantiate this driver here
> > at all, when we don't have an interrupt line.
> > However at the moment the AXP MFD driver uses a const struct to hold
> > all MFD cells, so there is no easy way of omitting the power key
> > device dynamically. And even then it would hard code the requirement
> > for an interrupt into the MFD driver, when this could be considered an
> > implementation detail of the axp20x-pek driver.  
> 
> Another approach is to just register the optional device separately.

I will have a look at how much this takes.

Thanks,
Andre
