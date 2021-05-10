Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F694378FBA
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 15:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235286AbhEJNxa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 09:53:30 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:28394 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242857AbhEJNvD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 09:51:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620654410; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QJ0iJbD3izgNsQezT6Qq0Ijgz77uihsqTDfvq+mntmYWXyrAQDn5c1PQwn3lBvysEU
    3qQfqVLRkRmFZTnUyeEw/Yz32+FBnLhmLvzB8iLwL84vCZePdMRgDwURk+zcFQgFDauC
    /VI04GhnWc946avdXY4J7BKt+75kSPDehvIGVa4xzajt3F6tifNQUO2RCG5toMfxYjcY
    Yb0hzZwDAPx1+Unv1tTS/mdHFZ8X78zvUWYDl0BNu1J/X7N0WgkVgQU4728jejEkWoSK
    eiJq+8fN/dyClYFkO0bVcz2e2npSlDzhvMpLpbUKNd9UWYjcGXOQ73BHgcuRRji6cHlN
    1qOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620654410;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DBio9jMIQVLSgByPsSeV+q4M/TECrqr+l3YMfghTJkY=;
    b=ccApv+xRkO3gkIBj1vl9fKayK++2UtamKvmpQuCGypC8ckiPJ01XAmdZakNVweYgg5
    poay56zqYaDJVR43h+aE8oFn+NtQxlzHUWJ7NaXXPGyvNQB15nLJbRkIsSmrzEMyHcD5
    nr1nyPzqJ4JGOTA4SsqnC+7BvOs0k9R1sTRrXFCAVMiv0bAArwVXtOIwzdOuYABi3nZ3
    CmgaMOW5bJBRfUjJ+Ew/3FoZBDiuqnSIZ0F/tdeHp36/c1xuuf0WLWM6aQI80+RXWOu0
    eLI27gaF+fbXkROfnkG0KwN77WAB1V1ef4fA2p60FzgGoslucLPxWfwQkEoBtwqGdgJh
    ci/A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620654410;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DBio9jMIQVLSgByPsSeV+q4M/TECrqr+l3YMfghTJkY=;
    b=QD0Wz01mKeTZ4pdCytaqMYJDuIJodfIe6ejZeXd1Zi3pwY0SzqPRXY20rAGK7wo7uZ
    uiyUEHHnOOZQF3GT4jL4sHKxwih+azzAmaxgncZCGFn3ZEzkDhHjQmHGiTMi53ctq4a9
    LHwrR/61lSCQ/BmE9L+X76SDSBmWQoQyl0ACNhyxVsWtJTEXlf075glSoW9flLyvbmst
    EbOe/2bcTv2YKqgYMBmFzGEJs+7d6pXgC1qBwVAfEYWgPdajWm5kthZDl8XgXlutDzCT
    CXmvict8RE/c/5w3rv1tp1PrOz9OSCTXOkebnL5atPBmPEptPGMP6/RtBWM6Z1RWA3a3
    biOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMnw47pB1A="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.25.6 DYNA|AUTH)
    with ESMTPSA id y07ed9x4ADkoEEa
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 10 May 2021 15:46:50 +0200 (CEST)
Subject: Re: [PATCH] Input: tsc200x: Drop hard-coded IRQ edge
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YJk4DFCYo1fW9Vjn@atomide.com>
Date:   Mon, 10 May 2021 15:46:49 +0200
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Adam Ford <aford173@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <EABF2204-1ECD-4C58-BCDB-6BDEEBB37D07@goldelico.com>
References: <20210509233830.359134-1-linus.walleij@linaro.org> <YJh8s5rU2VE+DyQz@google.com> <CACRpkdbXuZOrKyDeBttkMzGvHJbnqVgAnQv=Z=Ui0fHQOOaUMg@mail.gmail.com> <YJk4DFCYo1fW9Vjn@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

> Am 10.05.2021 um 15:41 schrieb Tony Lindgren <tony@atomide.com>:
> 
> Hi,
> 
> * Linus Walleij <linus.walleij@linaro.org> [210510 09:29]:
>> On Mon, May 10, 2021 at 2:22 AM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>> On Mon, May 10, 2021 at 01:38:30AM +0200, Linus Walleij wrote:
>> 
>>>> This edge setting should come from the device tree not
>>>> the driver. Also, most device trees sets this to the
>>>> falling edge, which is contradictory to what is hardcoded.
>>> 
>>> I see there are 2 possibilities:
>>> 
>>> 1. The driver has never worked
>>> 2. DT interrupt annotation is wrong.
>>> 
>>> It would be nice to know if we are dealing with 1 or 2, as in case of #2
>>> we need to adjust DTSes before this patch can be applied.
>> 
>> I looked closer and unfortunately the mess and confusion
>> is bizarre.
>> 
>> The DTS files we know of are:
>> arch/arm/boot/dts/am3517-som.dtsi - rising
>> arch/arm/boot/dts/imx28-tx28.dts - falling
>> arch/arm/boot/dts/imx35-eukrea-cpuimx35.dtsi - low
>> arch/arm/boot/dts/imx51-eukrea-cpuimx51.dtsi - low
>> arch/arm/boot/dts/imx53-tx53-x03x.dts - falling
>> arch/arm/boot/dts/imx6q-dhcom-som.dtsi - falling
>> arch/arm/boot/dts/imx6qdl-tx6.dtsi - none
>> arch/arm/boot/dts/imx6ul-tx6ul.dtsi - none
>> arch/arm/boot/dts/imx7d-nitrogen7.dts - falling
>> arch/arm/boot/dts/logicpd-som-lv.dtsi - rising
>> arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi - rising
>> arch/arm/boot/dts/omap3-gta04.dtsi - falling
>> arch/arm/boot/dts/omap3-n900.dts - rising
>> arch/arm/boot/dts/omap4-var-som-om44.dtsi - low
>> arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi - falling
>> 
>> We can assume that some of this is the result of board
>> engineers introducing inverters on the board as is custom,
>> so the flags are actually correct when set to falling, just
>> that we don't model the inverter.
>> 
>> In the case of imx6qdl-tx6 and imx6ul-tx6ul with "none" IRQ
>> type I assume this flag in the driver is actually necessary
>> for the device to work at all.
>> 
>> In the cases where rising is set, the addition of the flag is
>> plain tautology, just setting what is already set.
>> 
>> In the cases where falling are set the interrupts will arrive
>> on both edges (if the hardware can provide that, which is
>> not always the case) and as a result fire twice as many
>> interrupts as they should, probably with zero effect on the
>> second IRQ, just reporting nothing.
>> 
>> The combination with active low is weird. I wonder what
>> happens there.
>> 
>> I am just confused now and have no idea what to do about
>> it...
>> 
>> But I just CC all the Freescale and OMAP people who
>> seem to maintain these DTS files so they can clarify
>> how well assigned these edges, none and active low (!)
>> IRQs are.
> 
> Maybe the GTA04 or LogicPD folks can check the interrupt edge

gt04 uses the tsc2007 which has a driver separate from tsc2004/5.

> direction for tsc2005 on the device end to see if inversion
> happens. So adding some more people to Cc.
> 
> Looks like at least the tsc2005 data sheet says:
> 
> "Interrupt output. Data available or PENIRQ depends on setting.
> Pin polarity with active low."
> 
> So it seems the dts configuration should have level active low
> for the GPIO interrupt unless the hardware inverts it somewhere.
> 
> If the edge configuration for a GPIO interrupt has been done
> for tsc2005 for PM wake purposes, there should be no longer
> need for it at least on omaps. Folks can just configure a
> dedicated wakeirq with interrupts-extended dts property and
> the i2c framework will handle that automatically :) There are
> some examples if you grep dts files for '"wakeup"'.
> 
> Regards,
> 
> Tony

BR,
Nikolaus


