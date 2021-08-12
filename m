Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4B33EA940
	for <lists+linux-input@lfdr.de>; Thu, 12 Aug 2021 19:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbhHLRQe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Aug 2021 13:16:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235145AbhHLRQe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Aug 2021 13:16:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 932F660724;
        Thu, 12 Aug 2021 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628788569;
        bh=sHX4qBcmCYhbjDDgndlNnTF9gGHZbxz0PG3V/wKq/Q4=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=hiUXL9akozYVPbfnzoP2ecDzZDRhN3C7Gj6Ixl+LejK0FM9HPRzn5VoJRvkuCBdNl
         rcGMq/FkXxsNlfo8qx4lmt41uyR8PT864my7sJKwHXxjo3v9JvHYNJq9IPKHEw3S2t
         a3GSV2L1bJPWwppnUOh7t47Hb93wflJi+jV141yU0gYTMVuXs8P6JDMA6RNBOgxPRF
         LfHWvXp0XPP/2WSCvNdO0AZHu/jQNHzz5rEK1CCmJ0wwNLwXgi47dDGQXtO9KlyuXY
         oq8/O7FyIdsOL8GlWykKruzxoWt1pm2EcygyTalTq8ptn6atmKfSDONDTC9TjNX5aB
         WH73WTT8tgCMQ==
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Antipov <daantipov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
Date:   Thu, 12 Aug 2021 20:13:23 +0300
In-reply-to: <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
Message-ID: <87lf56inxm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi Benjamin,

Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
> Hi Dmitry,
>
> On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>>
>> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
>> and presents itself as a HID device. This patch contains the changes needed
>> for the driver to work as a module: HID Core affordances for SPI devices,
>> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
>> itself is being prepared for a submission in the near future.
>>
>> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
>
> Though I really appreciate seeing a microsoft.com submission, the
> commit description makes me wonder if we should not postpone the
> inclusion of this patch with the "submission in the near future".
>
> AFAIK, HID is not SPI aware. So basically, we are introducing dead
> code in the upstream kernel if we take this patch.

Right, unfortunately spec isn't public yet (albeit having products
shipped using it and a driver available in a public tree somewhere I
couldn't find).

I _do_ have one question though:

Is there a way to tell hid core that $this device wants hidraw? If we
remove the hid-microsoft changes, hid-generic will pick the device as
expected, but this really needs hidraw. Any hints?

-- 
balbi
