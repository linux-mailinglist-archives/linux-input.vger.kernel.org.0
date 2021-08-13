Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825803EAF88
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 07:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhHMFNe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 01:13:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhHMFNe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 01:13:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ECA3610CF;
        Fri, 13 Aug 2021 05:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628831588;
        bh=JTtuwr3DyQlOnewg5DkEEBqxo86jA0DaZuFpM3Exu4M=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=cKP5o9irl2mWf15M7iP41J+dQlbZey4dsr48xIqUibiq29lYDvpbu6JkSUWlK/Ep4
         xvIXKQf4U73/mdq+TYzS1c2LYraKQ0QFy5vi8eXJO3d6Bq1/ltaCKZ+rqmd6nQgR6E
         7guRgcIdZbRTUkHCo1JbEWniPfPFdPleSRLGhAWfhak/UJWWhCC6v1JMVE0jZDv1VB
         LJTQQYIs8sKsEoIW6hG2y34U/9aQhFjwUkJZ5D/0lfGbUOjk8LGKi7FOoXvuGQPkL5
         Q31UnsXpjouuj+yWdUrePhaixe5Rf/FUyC8WRXA3OJOnxbuwrK46d4had1RnszyRRq
         KmMuSsIDvECGQ==
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
 <87lf56inxm.fsf@kernel.org>
 <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
Date:   Fri, 13 Aug 2021 08:09:02 +0300
In-reply-to: <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
Message-ID: <87eeayj5b3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi,

Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>> > On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>> >>
>> >> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
>> >> and presents itself as a HID device. This patch contains the changes needed
>> >> for the driver to work as a module: HID Core affordances for SPI devices,
>> >> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
>> >> itself is being prepared for a submission in the near future.
>> >>
>> >> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
>> >
>> > Though I really appreciate seeing a microsoft.com submission, the
>> > commit description makes me wonder if we should not postpone the
>> > inclusion of this patch with the "submission in the near future".
>> >
>> > AFAIK, HID is not SPI aware. So basically, we are introducing dead
>> > code in the upstream kernel if we take this patch.
>>
>> Right, unfortunately spec isn't public yet (albeit having products
>> shipped using it and a driver available in a public tree somewhere I
>> couldn't find).
>>
>> I _do_ have one question though:
>>
>> Is there a way to tell hid core that $this device wants hidraw? If we
>
> Depending on what you want and can do I can think of several solutions:
> - add a quirk for this device (either at boot time, either in
> hid-quirks.c) There must be one that tells to only bind to hidraw
> - provide an out of the tree driver that declares the BUS:VID:PID, and
> start the HID device with HIDRAW only.

sounds good

>> remove the hid-microsoft changes, hid-generic will pick the device as
>> expected, but this really needs hidraw. Any hints?
>
> I am fine with the hid-microsoft changes, I just want them in a
> separate commit. But I don't see why we would take only the first one
> without the SPI transport and the hid-microsoft code...
>
> Basically: not sure why you need hidraw for it.

Yeah, the touch controller is "peculiar". It sends to the host raw
frames which needs to be processed by a userspace application. We don't
get coordinates, pressure, etc. We get raw values from the touch
digitizer; these are passed to a daemon which runs your usual filters
(palm rejection, denoising, yada yada yada) and produces the actual
touch inputs. Those are, in turn, given to uinput.

-- 
balbi
