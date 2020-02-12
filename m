Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 403ED15A3FE
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbgBLIxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:53:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27614 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728516AbgBLIxo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581497623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vshz33cqoNP3Li2ybcZyFRa//SX9LgHvVg3Rke7RkbA=;
        b=CwIhvi2IQ8Ym9OMf+sgmPDpINRK875iGR1j2yDcQAAUyxDM8hPi3+zCDqRCSnC2Gwahc8u
        TgO1ditWMGXS5fyI+yac97xk7I7KbOqe/4sQZxXdSkQgTye3TrasOrLmPPWHhitefIpJyf
        Z+8qf/Bo3Ljfyz0WT++0RtDXps4UTr4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-oQQMT68DN1qWU7JfbIPxaA-1; Wed, 12 Feb 2020 03:53:37 -0500
X-MC-Unique: oQQMT68DN1qWU7JfbIPxaA-1
Received: by mail-qt1-f197.google.com with SMTP id r9so825688qtc.4
        for <linux-input@vger.kernel.org>; Wed, 12 Feb 2020 00:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vshz33cqoNP3Li2ybcZyFRa//SX9LgHvVg3Rke7RkbA=;
        b=dz1sDnRxgLWXk2buAjD2CONn9omvIeFrl8exmIFgv0eriTvqnI8pDgUQzlhJoOfNUi
         wdFIftlzCYTvOSIws3TaW4BxWhhBdUZaFAiwpq7mlmRHECHV6FpACbg9A+NZEIzyCWzM
         X1ldu1ofewqe7INt5HThwiepuOR4+gJQIyQ+CiOREnUl46q/AZi3HtxJl4dlEBm3UPnt
         Ir1CGSaM5uZvkndusbvIcnwRrQxn22D+y/6hyroM/janoN5WQIXCHV/nemLMghzOdfe2
         L0vUgnKkDO772NjzLYI7uMMOevP4wWF5sECpHg8R1l/BQPBYRVQj8kxewICvzk+DV7jl
         AwYQ==
X-Gm-Message-State: APjAAAXahTCEmqu6swZo6JKye3CTgTqxjALRkXE5Cetc/2l42IITlVMm
        IuxRuPqHJcR7pQtr9YgTZj0MMNWScZEhEfKcbWCtM78LSx2ixdmxwMWZA6Rdx97y+wqZXtANREB
        ajRW5FtbEj9lLviSCLJ9Yfg4YBGgaMuhzgoRm+lc=
X-Received: by 2002:ac8:10d:: with SMTP id e13mr6079465qtg.294.1581497616958;
        Wed, 12 Feb 2020 00:53:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmMGArYvhgWNDNAwE1GwUJY+IlVr92d10p1kRog4ng3A8DySIzQCPSvVKRLVvA9b9SvyFdV02EB/CuUEC5n38=
X-Received: by 2002:ac8:10d:: with SMTP id e13mr6079455qtg.294.1581497616693;
 Wed, 12 Feb 2020 00:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20200115013023.9710-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20200115013023.9710-1-benjamin.tissoires@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 12 Feb 2020 09:53:25 +0100
Message-ID: <CAO-hwJK38mpMp0yL1v+4KAhhuUuwAPrTm7kSTGhXPL2JC1F-6w@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics - remove the LEN0049 dmi id from
 topbuttonpad list
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 15, 2020 at 2:30 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> The Yoga 11e is using LEN0049, but it doesn't have a trackstick.
>
> Thus, there is no need to create a software top buttons row.
>
> However, it seems that the device works under SMBus, so keep it as part
> of the smbus_pnp_ids.
>
>
> Link: https://gitlab.freedesktop.org/libinput/libinput/issues/414
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> --
>
> Hi Dmitry,
>
> Sending the patch to the list untested (sanity only), and I'll ask
> for the reporter to provide a little bit more testing.
>
> I will keep you updated when you can merge the patch.

Hi Dmitry,

Sergej tested the patch last week and it works well. So I think we can
merge it now.
Maybe we should also add a stable@ tag here...

Cheers,
Benjamin

>
> Cheers,
> Benjamin
> ---
>  drivers/input/mouse/synaptics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 1ae6f8bba9ae..7aa84f743c48 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -146,7 +146,6 @@ static const char * const topbuttonpad_pnp_ids[] = {
>         "LEN0042", /* Yoga */
>         "LEN0045",
>         "LEN0047",
> -       "LEN0049",
>         "LEN2000", /* S540 */
>         "LEN2001", /* Edge E431 */
>         "LEN2002", /* Edge E531 */
> @@ -166,6 +165,7 @@ static const char * const smbus_pnp_ids[] = {
>         /* all of the topbuttonpad_pnp_ids are valid, we just add some extras */
>         "LEN0048", /* X1 Carbon 3 */
>         "LEN0046", /* X250 */
> +       "LEN0049", /* Yoga 11e */
>         "LEN004a", /* W541 */
>         "LEN005b", /* P50 */
>         "LEN005e", /* T560 */
> --
> 2.24.1
>

