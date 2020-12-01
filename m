Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DD22C9797
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 07:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgLAGkL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 01:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbgLAGkK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 01:40:10 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BBCC0613CF;
        Mon, 30 Nov 2020 22:39:30 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id iq13so618798pjb.3;
        Mon, 30 Nov 2020 22:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/ne6Cpwt3KfxILuDv4MKwR/4P8WmgZmGmpAEbbHp2gk=;
        b=sQCbn1hxOSeNFGdy45v1t7aoEqyc4J+wHdw799j686OOrKeCIqxNzRxtwg9MV6CBGq
         5eDUXU8P+nxb/ACKDi9hzKOJX5aBQVjvmZJsdOr2xbvqKa6ab8l4L2ZO7U0pBSjOdGTd
         JPSbsLIO8UbA21RoBprnGIcbeI66nLiM9qNnyoTahoLIdYDBWBnJXwI1np9pSdSPeQsv
         gcyPw6C+NByHSucWq21HevS+AvFhZrk78GeWdxXjgsRuCamlperZsmloCLiSbIxOW1bF
         kgkrCrtufSYpVR88KdIzpAt5SGersLBrv9KgW0kFnBf5oGyRDas4ReeuXyA2YNFtEpt2
         0Mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/ne6Cpwt3KfxILuDv4MKwR/4P8WmgZmGmpAEbbHp2gk=;
        b=AbNzy3KPGHMfG63aH3sFs0X/D7a8TLUPymikLKAajbMv84+r/OWOCQyA6elGgynzuU
         qP5PoEZfPxqoO/JhaFRXq2BigmGyijL5PuVt2itUTccNQBxIwRl4/IC+AnM5wFYmgVr7
         RqxVh6295+UrjjiStqoLf9tZKat7A0r4qVjEm8RpQkUqzjI5bbqcHYUvWER42ROTg0aE
         lppWkhgtMGjeusK6Cgwn7Gc6oLQ8MhlefdPBQGZR/a140azXfclTc2SMlS9Rfdq1Hx/u
         FWbeM8r7vg0sgSK1YPgfxSOymTBhh56cdbNLsTRyLBe/vU0m4baufQ9/HBU8uXXEzES7
         GY8g==
X-Gm-Message-State: AOAM532P32KTO0DhJuCW5c7zmU/qENqiTV93eKEb2kwoddGpzzC/8C5Y
        4hdxNzDh0ImJhoPk7fOSw8/WuohXDco=
X-Google-Smtp-Source: ABdhPJz0XDBXISnxlpw+GuQqXmx0N3amhXnuTxtpqhOiNW98+lMQ/GSQk8OIq1S0cqUb7HpKyRQLvg==
X-Received: by 2002:a17:902:b717:b029:d9:e816:fd0b with SMTP id d23-20020a170902b717b02900d9e816fd0bmr1456690pls.50.1606804770090;
        Mon, 30 Nov 2020 22:39:30 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e31sm1132897pgb.16.2020.11.30.22.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 22:39:29 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:39:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sanjay Govind <sanjay.govind9@gmail.com>
Cc:     Cameron Gutman <aicommander@gmail.com>,
        =?utf-8?Q?=C5=81ukasz?= Patron <priv.luk@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] INPUT: xpad: support Ardwiino Controllers
Message-ID: <20201201063926.GQ2034289@dtor-ws>
References: <CALQgdA3Yh1XjENpFRAaqQ3AXNfp10R-52j77xK=fM2ZPkUJZtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALQgdA3Yh1XjENpFRAaqQ3AXNfp10R-52j77xK=fM2ZPkUJZtA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sanjay,

On Thu, Nov 26, 2020 at 10:25:40PM +1300, Sanjay Govind wrote:
> This commit adds support for Ardwiino Controllers

Unfortunately the patch is line-wrapped, with tabs removed, and
therefore can not be applied. It is also sent as HTML so most mailing
lists dropped it. I guess you sent it through gmail's web interface,
which is known not to work for patch submission. Could you please resend
via "git send-email" which will ensure that it is formatted properly.

> 
> Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
> ---
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index c77cdb3b62b5..c9d78e2acb38 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -418,6 +418,7 @@ static const struct usb_device_id xpad_table[] = {
>         XPAD_XBOXONE_VENDOR(0x0f0d),            /* Hori Controllers */
>         XPAD_XBOX360_VENDOR(0x1038),            /* SteelSeries Controllers
> */
>         XPAD_XBOX360_VENDOR(0x11c9),            /* Nacon GC100XF */
> +       XPAD_XBOX360_VENDOR(0x1209),            /* Ardwiino Controllers */
>         XPAD_XBOX360_VENDOR(0x12ab),            /* X-Box 360 dance pads */
>         XPAD_XBOX360_VENDOR(0x1430),            /* RedOctane X-Box 360
> controllers */
>         XPAD_XBOX360_VENDOR(0x146b),            /* BigBen Interactive
> Controllers */

Thanks.

-- 
Dmitry
