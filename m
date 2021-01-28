Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D769307484
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 12:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhA1LM6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 06:12:58 -0500
Received: from foss.arm.com ([217.140.110.172]:56800 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhA1LM4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 06:12:56 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 102441FB;
        Thu, 28 Jan 2021 03:12:11 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0A833F7D8;
        Thu, 28 Jan 2021 03:12:08 -0800 (PST)
Date:   Thu, 28 Jan 2021 11:11:28 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Lee Jones <lee.jones@linaro.org>,
        linux-input@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 05/20] Input: axp20x-pek: Bail out if AXP has no
 interrupt line connected
Message-ID: <20210128104627.76b35a5c@slackpad.fritz.box>
In-Reply-To: <YBHCF2tWIX4MeMia@google.com>
References: <20210127172500.13356-1-andre.przywara@arm.com>
 <20210127172500.13356-6-andre.przywara@arm.com>
 <YBHCF2tWIX4MeMia@google.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 27 Jan 2021 11:42:15 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

Hi Dmitry,

thanks for your feedback!

> On Wed, Jan 27, 2021 at 05:24:45PM +0000, Andre Przywara wrote:
> > On at least one board (Orangepi Zero2) the AXP305 PMIC does not have its
> > interrupt line connected to the CPU (mostly because the H616 SoC does
> > not feature an NMI pin anymore).
> > After allowing the AXP driver to proceed without an "interrupts"
> > property [1], the axp20x-pek driver crashes with a NULL pointer
> > dereference (see below).
> > 
> > Check for the regmap_irqc member to be not NULL before proceeding with
> > probe. This gets normally filled by the call to regmap_add_irq_chip(),
> > which we allow to skip now, when the DT node lacks an interrupt
> > property.  
> 
> No, the driver is not the right place to patch this; regmap should be
> fixed so it does not crash instead.

I am not sure this is the right approach, those regmap functions look
more like an internal interface to me, with lots of wrapper functions
happily dereferencing pointers and reaching into structs. Moving
NULL checks into those does not sound like the right thing. CC:ing Mark
for more opinions on this.

A more general solution would be to not instantiate this driver here
at all, when we don't have an interrupt line.
However at the moment the AXP MFD driver uses a const struct to hold
all MFD cells, so there is no easy way of omitting the power key
device dynamically. And even then it would hard code the requirement
for an interrupt into the MFD driver, when this could be considered an
implementation detail of the axp20x-pek driver.

That's why I came up with this patch here, which was the easiest and
cleanest: This driver *requires* a valid regmap_irqc, so it should
verify this at probe time, kind of like a normal driver would bail out
if no IRQ line could be reserved.

Let me know what you think!

Cheers,
Andre
