Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 935B55CC29
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 10:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfGBIof (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 04:44:35 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34955 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfGBIof (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 04:44:35 -0400
Received: by mail-qk1-f194.google.com with SMTP id l128so13283799qke.2
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2019 01:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRr1ICNLsP/bZydo2ESlOmbE20F/PgMFOAALZnGqKRI=;
        b=RLwqdwZrME/U6veHUnIAaUJclX9miPjJWrFeQnpaGHRX0Xt9dPXhYvD8w0TlMebzFa
         Hkflfte6l16MrTb5pUJHF2cl+DoTZMl1x9HIE/rjQwMNv3+NIQrpzJuZ4A3y3F9fHaur
         b4dMaCr8tlP5KEkDVBcjHtFDGoHmyqHkukegDiqVp3Ds/i2fA/EuuZ8kvypaXtY+7YY4
         e9EQ3Utp2mwBbsfQZw6c0AxSiMoSUzi6r1sg8OQTtZXUU7jCNqRX5sfWUSaQ8lnA2kyx
         zVMAP3uC95Koe6p9WZJr7Ryvfq1dwv4paUo8fMUUu8rZC0+P//yafU6r0O8V9xAMzggY
         tcXw==
X-Gm-Message-State: APjAAAU2qLIIZrHqcSoUPEtV8snINdQjsZFMCeAcltI2hlM1481XACyx
        bU9rESf9+gJPEgxhyrYrgoEWMou4vx16qQ0a6Brmuw==
X-Google-Smtp-Source: APXvYqzykw2KRjSeIdUtulZYvxYMEJT9/dDg7bU5axVLq04LNZK9WnGtZKlJF8kANxWrC/BEFhGBQxU0Cj9mQXBqJyM=
X-Received: by 2002:a37:a86:: with SMTP id 128mr24911948qkk.169.1562057074451;
 Tue, 02 Jul 2019 01:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190701102010.6611-1-hadess@hadess.net> <CAO-hwJ+hHKqZeOfpnWkU57RwzD4m6U9afG7iMND=OGZodzS1GQ@mail.gmail.com>
 <9171d69f51a6a197e0d554326fcedc39bfb3fbbc.camel@hadess.net>
In-Reply-To: <9171d69f51a6a197e0d554326fcedc39bfb3fbbc.camel@hadess.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 2 Jul 2019 10:44:23 +0200
Message-ID: <CAO-hwJLmewFMcFpn4X1RhjgpuYCRnDJgL5Vu5kduy8a0LUgQjA@mail.gmail.com>
Subject: Re: [PATCH v5] HID: sb0540: add support for Creative SB0540 IR receivers
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 2, 2019 at 10:39 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Tue, 2019-07-02 at 10:29 +0200, Benjamin Tissoires wrote:
> > drivers/hid/hid-creative-sb0540.c: In function
> > 'creative_sb0540_raw_event':
> > drivers/hid/hid-creative-sb0540.c:157:3: error: label 'out' used but
> > not defined
> >   157 |   goto out;
> >       |   ^~~~
> >
> > It would have been nice to at least try to compile it in a tree.
> > You don't need to compile the whole tree: just clone it, apply your
> > patch and then `make -j4 M=drivers/hid`
>
> v4 _did_ build. Don't be surprised if after 4 versions on top of the
> ones you did when the driver was out of tree, I get review fatigue, go
> for expediency and some mistakes slip through.

Right, sorry.

>
> Fixed in v6.
>

Thanks!

Cheers,
Benjamin
