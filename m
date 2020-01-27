Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1774E14A789
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 16:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgA0PvS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 10:51:18 -0500
Received: from mail-qk1-f181.google.com ([209.85.222.181]:39134 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbgA0PvS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 10:51:18 -0500
Received: by mail-qk1-f181.google.com with SMTP id w15so8335407qkf.6
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2020 07:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bynkYO/VfrflNCUOpdCEBQtWE9uevrxves93+nkBNg=;
        b=QKQOioEPrUVeKSj7Lk3b6riyhYFvcUoN9UrIRxyVKhPk6si/ExnvFLr7SfVnfG+0eT
         kdPIDRiseXehUgtuwLNOJ6RdynHXa2HPOYPta2ivqOmnLIfiU7TcYg0x352BSMaCnQd5
         jKFnCxrXe3lDYI5TNtiiVmDkqOP++3c0nHBwczGhJ/0ce6lTDNgy6wzwSklyT9f8iOMy
         euLEQ8YyP4vtpI4Xi72cQ5ZJvIU6qvaE2ijgo68//OrnzIVFfxMw4VH14ZaeX1DgLY4J
         Y7HQhL72QaEbY66iRVcma/UtbK3Kw6HxA8AiT2tXwRN/Qwu2wFE25usgOpDILFlrCnqW
         OUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bynkYO/VfrflNCUOpdCEBQtWE9uevrxves93+nkBNg=;
        b=AhsPL9PQNgqFYiR6VfQ+x169RUCLxKoU7ERuLQ9qNnIRxK7YYqxFs+B8hB0NI92ufb
         KPiCxx08tRcvmlUB2vBDbxC2y69v0Nb5bBokZDWI9Xdp9RpOZ2V3rCSQ5cLEqv1ly0pF
         J9VVwZ52/CZBdWfgsw4KFdJR2vUwp5KkLpv0Q1X6aq+Fgt0HOQ1Sr5ApnsfeEb04tQi/
         epOtAPYn20Lm91Oq5S9xxnsIJjFRGmCtCHcGUMeSDZsUuh8Kq5bHHMKMUrEF0Kn3EboP
         EC6WCfM9gRqBOnIeIHzLAbS2FQjQWT1sb/bw237Cl3em1Aht2KLHL9lmWXIaVX5Rnx4b
         nnBw==
X-Gm-Message-State: APjAAAW9GcMhZBJW7g7u09jal370KSSf3EzFJ+c4x9EWfNCnIWECE/Av
        irFHZ6EPxW728FomT4SVryd65/hV6hEbusUQNcjPsA==
X-Google-Smtp-Source: APXvYqyW/Dv+r7IzLVHyn5vKXp9eLH03u8Oq1EucWp83Jstsj4ATT35HA7fr3z/q5ImHk9D4Fcu5s28HtcVbBYCRrgs=
X-Received: by 2002:ae9:e50c:: with SMTP id w12mr15641083qkf.407.1580140276809;
 Mon, 27 Jan 2020 07:51:16 -0800 (PST)
MIME-Version: 1.0
References: <0000000000004dbaf2059c193a36@google.com> <20200126024957.11392-1-hdanton@sina.com>
 <20200127092850.GX1847@kadam> <CACT4Y+ag59G4p=DO3Dg7jnFt3wQb=dtjzBujADtGHKn-97O8_g@mail.gmail.com>
 <20200127151135.GM1870@kadam>
In-Reply-To: <20200127151135.GM1870@kadam>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 27 Jan 2020 16:51:05 +0100
Message-ID: <CACT4Y+Ya-GEPAezCceKadsXGD0WdAHMeNH=hkkGaM50nP7S6ww@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in hiddev_disconnect
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+106b378813251e52fc5e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 27, 2020 at 4:12 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> One possible option would be to list the similar bugs at the start of
> the bug report.
>
> See also:
>
>         KASAN: use-after-free Write in hiddev_disconnect
>         https://syzkaller.appspot.com/bug?extid=784ccb935f9900cc7c9e
>
> Then we could just copy and paste to the "#syz dup:" command.  The
> bitmap_port_list() stuff was reported something like 15 times so it was
> really complicated to track.  Hopefully if it were easier to mark things
> as duplicate that would help.
>
> regards,
> dan carpenter

Interesting. This should be doable. I've filed
https://github.com/google/syzkaller/issues/1575 to keep track of this.
If it detects potential dups, then it could auto-dup as well, but it's
not completely trivial (some things are mentioned on the issue).
But note it won't help if the bug happens in different functions (e.g.
I think lots of bitmap_port_list were actually in different
functions). And this is also common for racy bugs -- a racy free
catches use in another thread at different locations.
