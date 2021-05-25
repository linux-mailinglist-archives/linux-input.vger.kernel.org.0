Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7F638F917
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 05:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhEYEAM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 00:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhEYEAL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 00:00:11 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F90C061756
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 20:58:41 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a4so21523722ljd.5
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KoZfY47+etg0JP/Zz64TPz3Kh9vNJ9gmPx9fA+UJ1E=;
        b=MxlRbsAP5XolN9Xtt4upLjkysqnimbidG9E+iMvEmgCbftg63e/XEdqCpyuPZfrVUA
         QA2l3vhNcIFqj4HNE42ZEbL/uFGumbqsslVmEGXswlQ+rvDQsIOflEwBRDh7BDLmYYQx
         zqbNyDQhbXxbAdoaUdjkNxS2JYIOv3EKWmVPuly4UkJz9i69TS5it3svyDEaXZrdts7c
         hWJ5mp3SH+XRk67TJRT78qoIx+kuPhtjlMYuXoVYEAi918zQl2qEfXBmfI7gQxqJKcD2
         OzdwX9W2PxA52705hVgtJqEchVFRyJxfoCTx5JUQmR0Y/EPgTNUyt8vB89ZMG7/WFEe4
         YAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KoZfY47+etg0JP/Zz64TPz3Kh9vNJ9gmPx9fA+UJ1E=;
        b=C9l0AzjIMsFeAW08Oilt2t9Q+kvEAzhy3dVE70b3Ef7QxBlFhQ9XbqE+rXbkHJt2cH
         ur3aKEbbuyuAsTZUnnPeEjwB5TDfNQPys8uaOa5PpjRTuDxmUEkynk3VEk/jftL6XezD
         /xfuh7qvYXwQoQfd9SXBR5SNfrHZhPj3lhLO/SRfkXXThqQl45vCnS7TdZhR2GOZeN64
         /aJk736N85SrANw/oVn0dRy/kQBEXnX07GdJZ4FrdQGFc+PWkjp+3iVXMWWEJqNpMxJn
         JxbnRhOF1Wnc2twf0ANHuakm0Q+gMUThpiJHaqfSRc8jvF5VDEZ6QyslW3wIAIc0JMrY
         SXVg==
X-Gm-Message-State: AOAM5315EheG+8P3dueXiP62+eukC0kzPOdx5h/FOAq88CStodU5wGIq
        YLYaTjcx2cR29QRaHadlu1h0yECRfMvHsgsqsg58tw==
X-Google-Smtp-Source: ABdhPJzgkqXi2jDaDd2wVgppJTYoSj+ULr9eNjF0ZZo/RbUD+tja8vY5AcD9358BV5ekoMFZhpKeYI/gIK9KtD+Cg4Y=
X-Received: by 2002:a2e:b601:: with SMTP id r1mr18761487ljn.203.1621915119234;
 Mon, 24 May 2021 20:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210414021201.2462114-1-lzye@google.com> <YKx0v9K/1TUZrlbD@google.com>
In-Reply-To: <YKx0v9K/1TUZrlbD@google.com>
From:   Chris Ye <lzye@google.com>
Date:   Mon, 24 May 2021 20:58:28 -0700
Message-ID: <CAFFudd+1+mOsZAc855jFeYkpbKh70Jt9iVYb0F0DQHrUDjbPBg@mail.gmail.com>
Subject: Re: [PATCH] [v5] Input: Add "Select" button to Microsoft Xbox One controller.
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks a lot Dmitry!

Regards,
Chris


On Mon, May 24, 2021 at 8:53 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Apr 14, 2021 at 02:12:01AM +0000, Chris Ye wrote:
> > Add "Select" button input capability and input event mapping for
> > Microsoft Xbox One controller. From product site this is also referred as
> > "Share" button.
> > Fixed Microsoft Xbox One controller select button not working under USB
> > connection.
> >
> > Signed-off-by: Chris Ye <lzye@google.com>
>
> Applied, thank you.
>
> --
> Dmitry
