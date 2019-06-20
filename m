Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386994C6EA
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 07:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfFTFxR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 01:53:17 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:39986 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfFTFxR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 01:53:17 -0400
Received: by mail-pl1-f177.google.com with SMTP id a93so923025pla.7;
        Wed, 19 Jun 2019 22:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GCWIu+pKgfVWcOGFQteSuVLw0jZjzlfHNzkQ2wuwzGQ=;
        b=O92/TWMC2x0RmONVUUz/lsKvv4Je9F81ANSUEbndRVi/zs7d+aCvOgfgz2FOg8k5xO
         Gh9npPp0gy5xaAJaZKyTTgRxYrR5vJm2KntyyHv/q3GtfCE5dEJ3l7xYsyUFBu4oXpIG
         7zSSZzD+qYHRy+gZXyFZXjA9Lwtk3nHM2Gj1RDwcHb94XVV8lhzitHLtIWMJNRejPisO
         3v8kWs6Ze6y52ueHz7X5WhF4TXX+TAn15AQMQLnhurjhX9AKhkC7FF3eaPr45/RzlgsC
         P/WkHPPb/h4h9p0W0xqMc1g8/uIXUf5zML+UTt3T2gYEnFKZ1NsZ0/lZcXlfW346U4vh
         zZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GCWIu+pKgfVWcOGFQteSuVLw0jZjzlfHNzkQ2wuwzGQ=;
        b=j3CMwyn0FI9QcbOvXgeiXc0QnFoCV/ImCmOL/MwP2onrSyfvr9IFpWXjbOZCCjL4z4
         raW55YuYTN8xXJvsEc/8h9N0YocqwybFC9d+w42IrZ4fQPskclN3aHSiFB9jhYzHzHzk
         xNFc4MpHG+R4GLsMvu/0LyDJnb03eKn4jhNVS+e5g5jBTo/HPTYG+l/9Aka0vHFbHmJD
         AuEkRUoCsd/HsqLeLCZelxWeQPzyPxw5a1w090ALsFLf+mCuZzppXnSnRNU3FVNuYi6A
         6XnRN5U5S0kyoio9y19pQbwAqH662KTb4Zdeeyv3SA/kcusBw6P5oZS15Y3+rJy7mFha
         hroA==
X-Gm-Message-State: APjAAAVnoIMfIwuut88bz7Xd4zqhv8edwd2H5ZsiGP9qSaiFzsQKy1DQ
        3/M+qS5TC2BzNza6pJqQBf66DWsXRCzdgN7Ri+Y=
X-Google-Smtp-Source: APXvYqxZOTiC/uQeY5uXx+EXtxpwTtxGmGlw39NsLAYnsIzZi8HQBg4UrDQSLUkbdppg3XGixy6IU4vRBGlqteo8JZQ=
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr113660318plp.18.1561009996329;
 Wed, 19 Jun 2019 22:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190516142523.117978-1-luzmaximilian@gmail.com>
 <a0f93af3-c587-40d5-2a85-fdc0f9e6b79f@gmail.com> <e8bb212c-9894-d244-4ee1-617df3952a53@gmail.com>
In-Reply-To: <e8bb212c-9894-d244-4ee1-617df3952a53@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jun 2019 08:53:03 +0300
Message-ID: <CAHp75Vcf79a2_3VGfju237omDjmnhCYN18u+=m_n-tjxZUxt4A@mail.gmail.com>
Subject: Re: [RFC 0/2] Support for buttons on newer MS Surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 12, 2019 at 2:06 AM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>
> Since there are no comments on this, should I simply submit this as patch?

No top post, please.

And yes, submit it as a series. Also Cc to Benjamin Tissoires.

> On 6/1/19 9:07 PM, Maximilian Luz wrote:
> > Hi,
> >
> > any comments on this?
> >
> > I should also mention that this has been tested via
> > https://github.com/jakeday/linux-surface.
> >
> > Maximilian



-- 
With Best Regards,
Andy Shevchenko
