Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D611144B045
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 16:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbhKIPZ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Nov 2021 10:25:58 -0500
Received: from box.trvn.ru ([194.87.146.52]:48189 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231176AbhKIPZ6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Nov 2021 10:25:58 -0500
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id ECB0A40067;
        Tue,  9 Nov 2021 20:23:03 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1636471388; bh=lS5UJLDxpoH+oMoziJHGViXF/4huuu/aCph+647Nv4s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UZjFIatjcBXYl0sPS22SdCvnEGTZkIe1idspEHBqcRGIYgpq6/N39asga8MknX8yj
         JtINUyNBPuz5u5yl9KmplRVGeW/eaEm9yaYPUfafKIm6tddHegRSuk1Rnsm6g0ad0M
         6SqRGw/pE+VXA5uN6JskCQWLAzjuuyOXNR5k1q8egk4jsMsS+CDOvH0Hmd0rzi3Hqt
         iZlQCdRU4use3yIZKrFDfEzKDtqii4GftiOoAkj1vrWZiWMlJecxng9gOGgSse049G
         DeIxuYlSiUrFY+co6MDnxcQX1fE6N9LJqgNH2ycw4Bub5E92Z0jxQ0OfwOK9Z5FzuF
         WraZG+Y1CKwOg==
MIME-Version: 1.0
Date:   Tue, 09 Nov 2021 20:23:02 +0500
From:   Nikita Travkin <nikita@trvn.ru>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
In-Reply-To: <CACRpkda_EM9mXuJdrZcpFaJCKF1UDgXkfdxkaniyXFHFd_7+Pw@mail.gmail.com>
References: <20211027181350.91630-1-nikita@trvn.ru>
 <CACRpkda_EM9mXuJdrZcpFaJCKF1UDgXkfdxkaniyXFHFd_7+Pw@mail.gmail.com>
Message-ID: <ec9185459dbc0e95dc2f2cdf27baa0f6@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Linus Walleij писал(а) 09.11.2021 09:45:
> Hi Nikita,
> 
> On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:
> 
>> This series adds support for the touch-keys that can be present on 
>> some
>> touchscreen configurations, adds the compatible for bt532 and fixes a
>> small race condition bug in the driver probe function.
>> 
>> I also pick up the series that converts the dt bindings to yaml
>> initially submitted by Linus Walleij in [1].
>> I made some minor changes to those patches:
>>  - Fixed dt_schema_check error
>>  - Adressed the review comments from Dmitry on the original series
> 
> Thanks for picking this up!
> 
> Have you notices some behaviour like surplus touch events
> (like many press/release events fall through to the UI)
> when using this driver? I think it might need some z fuzzing
> but I am not sure.
> 

On my device (8 inch tablet with BT532) I saw no problems with touch
so far. However another person with a different tablet (10 inch with 
ZT7554)
indeed says that they notice "multiplied" touches that make typing hard
so maybe that depends on controller model/firmware...

And speaking of that ZT7554: Seems like it's works with the driver
and I'd like to add the compatible for it in v2 but I'd also have to add 
it
to the bindings. Looking at how you add all other similar names for BT* 
there
does it make sense to add ZT* as well? Maybe you have some hints where 
to look
for a list of the models?

I was planning to send a v2 with all the review fixes near the end of 
the week
but I've noticed a yet another quirky issue with the touch controller:
At least on my device, for some reason enabling touchkeys changes the 
way the
controller reports the finger touch events which breaks multi-touch...
Assuming that *not* enabling the touchkeys leads to calibration being 
wrong
(controller assigns the touchkey sense lines to the touch area in that 
case)
I now have to resolve this quirk as well...

Thanks,
Nikita

> Yours,
> Linus Walleij
