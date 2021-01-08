Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7057F2EF650
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 18:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbhAHROC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 12:14:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbhAHROC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 12:14:02 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0342C061380
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 09:13:21 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id 11so10287210oty.9
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 09:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=76OGBe3dZYi0gzesVrz9n0FvbapNYw6Vx6s82iHrZAM=;
        b=nENFogNEnFCKd8fYyW4J/G4t9Fbt4N5+qUvtIQdhL9K509aCMaxeBxafCZYdShspLi
         3K2H2ATGwSiAyRCUF1dFCQ2wYXl21FwD1XlQEkAvy90DWZlJwv8uKG0KTrRWlBYEy2fC
         KM5ttasWH1WHNv33MHAJrj2myjJwz91zrL03ZL2jmcU2fwlZZYWIqJde60csjPiJrsqk
         dT41T/Zz5kttN01aTxXLdls5pK5VVouwr2Q7YRDizChY1E45gYpHdY0Ge7Nod9KP3uc3
         ThgfjORl4N97B1i4FqCwo+EaELJgkh2T6RejTc053qJPxNluq6lSffD9plR9y/SxcHZ8
         MURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76OGBe3dZYi0gzesVrz9n0FvbapNYw6Vx6s82iHrZAM=;
        b=o1fgoD5GGC59cRsZbDVnLlcG4eSzoyKhM8WgPgRld6h2dh1qR/vUWE/yg2zKGZnu5t
         I2nSzHRMcGr6IQUE5SsMJCxTFHPSwStIL4Lp+fTGS2NqBH5OK7ZDpGM/JkrkCBqmzGBv
         KgLhzCiGnenPuBku6+tq63X4VFgEpQMTYnLiH42WHF/mNm3DOWzyuvQd7i0i/S1+eLSe
         /XFRuWPdSDSJNql/EXT4MawEx2soknLH7fXRBTfP5keTpByTDxr8u97g1NJeFK/WQpQP
         q3NgYVUdDkc+vDfyZ0Y41KWGCViEkw3LECumRFM9qJDyZXLyQ64guYti0R6JdiMmdJco
         I0SQ==
X-Gm-Message-State: AOAM531e9jdKzhz2EMbBrFQ7NyUk/nHj5eA0LtxTX9hKJGUra3h3DJ+4
        mqgvzo/HY8XyUl+aZuN5JCimjTch3crtRS5l40I=
X-Google-Smtp-Source: ABdhPJw3xNABx7wW7udMci8u5+Srb5hfZIVGohKHwhM2nYgFS8X+csUMzwa6NpEFNGOrPBffP3ihpglKzL7i2IO9mFA=
X-Received: by 2002:a05:6830:10:: with SMTP id c16mr3228341otp.162.1610126001288;
 Fri, 08 Jan 2021 09:13:21 -0800 (PST)
MIME-Version: 1.0
References: <CAMh5ckdy=z8j7X5BXLtpnOz2-Ha7MZqN-DvJS0e1w4CdiLJ4EQ@mail.gmail.com>
 <nycvar.YFH.7.76.2101081552560.13752@cbobk.fhfr.pm> <be49cd57e53368062a5de07dcb7af2da0954771d.camel@gmail.com>
 <nycvar.YFH.7.76.2101081652560.13752@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2101081652560.13752@cbobk.fhfr.pm>
From:   Seth Miller <miller.seth@gmail.com>
Date:   Fri, 8 Jan 2021 11:13:10 -0600
Message-ID: <CAMh5ckdWQnWV=DAszLnjSCzkQzJxxA10_-Qmtk_Z+TRxRe2aVg@mail.gmail.com>
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on ASUS UX550
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the patience. I'm sure I'll get the next one right ;)

-Seth

On Fri, Jan 8, 2021 at 9:53 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 8 Jan 2021, Seth Miller wrote:
>
> > Jiri,
>
> > My apologies for the formatting issues. I wasn't aware Gmail's client
> > silently inserted line breaks in plain text emails. Hopefully Evolution
> > can do a bit better.
> >
> > Signed-off-by: Seth Miller <miller.seth@gmail.com>
>
> Thanks. This one didn't have proper changelog :) but I've combined the two
> and applied.
>
> --
> Jiri Kosina
> SUSE Labs
>
