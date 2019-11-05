Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85577EFE53
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 14:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389028AbfKEN12 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 08:27:28 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:42478 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387784AbfKEN12 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 08:27:28 -0500
Received: by mail-io1-f68.google.com with SMTP id g15so1171894iob.9;
        Tue, 05 Nov 2019 05:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jX4jX2W6i3k9/KOC23QBwkTtx9VcQVu8C6L8SnDZRqw=;
        b=jTMMLgfkVnBPSeUJQ71tgTsoCo4o4YN1CptDSMFclU8DBIlW12Ty45UjiagKL5c+qL
         XVomoETpYMsmrJODUaxcJaEptSFbg6XxIn4+4jRAkqfUbJ45uVHWxoXtU8Ct+E666Yxn
         WnXDOEy/b6s8GKdBcCyoN4GjqB7QDFuQs7jiaLF+0awAty55TLy91HXi+0AX8FMovLgI
         CwuD4Q9k3rdNpYs/YWS7KmcPDDOekoSnnOeuxa8hViG8oes3GUYkbpSKM5zdRgBD51cS
         i7gDBRTPnDzMEK94Bi280/OEAKGGI51swoP/xkjuUvfp7YDQt5iEXHttGent5KEsdzYk
         QWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jX4jX2W6i3k9/KOC23QBwkTtx9VcQVu8C6L8SnDZRqw=;
        b=gNjQNZOzn+iMCII8+NQVDQE0UuGSHMzYZ9kAD3P9XuG0skNcPt3tJ9NEaJTWMFBYL5
         12y/WpOMHV27LOBR0ExtKZfxgLErfaragrbrkb2Adz+SdextglEF3mRkOmUQnUFTRhdg
         aemY/DEDdujsagNYbDDBdS/N7Z2AuL22gcSHd0I1b5DrBcbZCqZpTHfNErwHmN3ckCDB
         CSRtOFIMhTNAtMd05Gqwoaf16ZXFt0rtYvPDRJu8Aekdn6wrzkNsDYVQqQ7B0o8W1zYj
         JfN01kkUPsqYnyOsI+xNQkDpalLcKB3jRofh7U+OvN1ZHFT8SaCVC1u7HlnA1Af0zE4C
         yd5w==
X-Gm-Message-State: APjAAAXqLJbfST7trQiQ6kWEsX0xfGbZAuxqDd4IB2iI5+mFbXm2vMgd
        JX7C/hrVw+3jdEu2lA8N1z9ILk5fm57nwN41zEk=
X-Google-Smtp-Source: APXvYqwd+rrCQZ+m8JTRHbAGCc6LLI8WMSbho0o8PAroiVlxjxb3uKt++eYqFQbO6mC6Ekx5mw+iKj9H4ovx4jW2jrI=
X-Received: by 2002:a6b:2c89:: with SMTP id s131mr27329413ios.276.1572960447143;
 Tue, 05 Nov 2019 05:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
 <20191104233621.GP57214@dtor-ws> <CAHCN7x+=_FM32JTEKAb=5pPJNvim88cUFuEXgdGhMG9gdr0Emg@mail.gmail.com>
 <CAGngYiX1JP8NZBU+wRzdsLBMN7hhsbmfaD5o4PGPX27Q-6J4xw@mail.gmail.com>
In-Reply-To: <CAGngYiX1JP8NZBU+wRzdsLBMN7hhsbmfaD5o4PGPX27Q-6J4xw@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 5 Nov 2019 07:27:15 -0600
Message-ID: <CAHCN7xJ501UHTRRi-fdi7cFH_Bhz07hpa9wRaP1D0MGWrDmbkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 8:04 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> On Mon, Nov 4, 2019 at 6:40 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > I will test it tomorrow on a 2117a and reply with results.  I am very
> > excited to see this integrated.

For the series:  Tested-by: Adam Ford <aford173@gmail.com> #imx6q-logicpd

adam
> >
>
> I will do the same. That should give us confidence that 211x works
> ok.
>
> Dmitry, should someone retest 251x and 210x after such a significant
> change? Unfortunately I don't have access to these chips.
