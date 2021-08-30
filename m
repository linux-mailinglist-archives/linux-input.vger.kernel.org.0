Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7AA3FB6C0
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhH3NKN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 09:10:13 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:16287 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhH3NKM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 09:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1630328952;
    s=strato-dkim-0002; d=inhub.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=7u4+dLIth4MJJoQ7RqHhFrry1Ihr3XgfV/ExDR5p9cc=;
    b=PW0N8blPofG/LWrxawc6N8y6mcdIVSE4UXRdA5KALAfsirtWybftJjV1/bi85bmkYa
    05OvnsDNzTQxR7izbg/bvesaognTOivwVBusY6wqj9UIrNwV0ZRutn/sWVUKJP/Y/d0g
    mQgA/Dcuau/hfsmoL9e5Uc0YNTOyw60p6xrh45kJg0F1BhRr1ctJZ+jHEjcFwlkXzSx7
    rIT7lOZDufYp1Oy3wOJ6h8RS6A2EyqbCxsnWLE14+gbZMbLw/6EWQj7RB8UPdszJa5yq
    UNyPvD9wPIVuP4j67ATmDsovAG6vCOwVkAbX2IfPr4AMsJbPl/WNGZ29o8+MbgrfvISh
    apfw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgaKe3jg5kqErmuuTsxxnmJ1DWc546Eg=="
X-RZG-CLASS-ID: mo00
Received: from crypto.localnet
    by smtp.strato.de (RZmta 47.32.1 AUTH)
    with ESMTPSA id 2023a9x7UD9CHpe
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 30 Aug 2021 15:09:12 +0200 (CEST)
From:   Tobias Junghans <tobias.junghans@inhub.de>
To:     rishi gupta <gupt21@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] HID: mcp2221: configure GP pins for GPIO function
Date:   Mon, 30 Aug 2021 15:09:12 +0200
Message-ID: <3382390.V25eIC5XRa@306e6e011c15>
Organization: in.hub GmbH
In-Reply-To: <CALUj-gt65tjukmJpuqQL5_L7MgewUmstp68MhuSa53FCaf1Few@mail.gmail.com>
References: <20210818152743.163929-1-tobias.junghans@inhub.de> <3135482.aeNJFYEL58@306e6e011c15> <CALUj-gt65tjukmJpuqQL5_L7MgewUmstp68MhuSa53FCaf1Few@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rishi,

thank you for your questions. I agree with you that one usually would 
reprogram the flash when manufacturing commercial products. However there's not 
always the need to do so if things can be done in software as well. The code 
will do no harm since a GPIO line initially is configured as input 
(MCP2221_GP_GPIO_DIR_IN) when being requested. Like with any other GPIO 
(driver), it's up to the user to take care of not configuring both ends as 
outputs with conflicting pull downs/ups or logic levels. Also the driver's 
default behaviour remains unchanged, i.e. it will not change the GP pin config 
unless requested explicitly.

So all the proposed patch does it is to make the GPIO functions work as 
expected OOTB when explicitly controlling them with the appropriate tools or 
interfaces (libgpiod/sysfs).

Best regards

Tobias


> Hi Tobias,
> 
> To me it sounds like we are discussing about commercial product
> (predefined internal flash fw) v/s prototype (we want to play with
> settings at runtime with ease).
> 
> Let us assume a GPx pin is configured as input and pulled up in
> hardware board originally. A microcontroller's GPIO is configured as
> output and connected to this GPx on MCP2221.
> MCP2221 (GPx, input, pulled up) <----------- (output, no pull up/down)
> STM32 Microcontroller
> 
> 1. The STM32 Microcontroller drives this pin and set it to logic low
> 2. Driver using this patch configure this GPIO on mcp2221 end as
> output and drives it to logic high
> It is like two devices trying to drive same (physical wire) GPIO pin
> at the same time. How we plan to handle this.
> 
> Will the GPx side will fuse or malfunction because of infinite current flow
> ?
> 
> Regards,
> Rishi


