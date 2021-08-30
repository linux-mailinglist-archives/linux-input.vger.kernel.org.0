Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA613FB1AB
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 09:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbhH3HLw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 03:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233139AbhH3HLv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 03:11:51 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FECCC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 00:10:57 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id bk29so14578914qkb.8
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 00:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mTOPDcfIQ7GFaORfrqJc25Raav55ibC4FDlyirbRj3E=;
        b=inKKBlyMKomMB7XrHw+Y/ViFKy8Xv+bVBUZ2OR7s22M1U04hf47C2SeF3iyebEu1Wr
         +jKAw/RgQyrvTdsbC5OwxE8Rw34hKH9FHCi3BKGVl1FTHwPY+b8q+3SyaywPvBbiCW7N
         apOX6G/WcFvn8z0YHCJiAnOTRKYwHvDpUDQq4F05al65ffK7racYlAOTrEeKkGkGHXGL
         amWQKP+VRfggLs9kkw3Xuk5Szbz9HG9y07hhzht/AcMz6sO4Ff+1ecp42WRzj2LYaYS9
         vVXnU7heVwV77lB+zdZ1jKNWPcsRawWSxc81rxtRDgXNDttIB7jCBoYhCDvWZBmj+T4p
         68Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mTOPDcfIQ7GFaORfrqJc25Raav55ibC4FDlyirbRj3E=;
        b=eeIjt/TIU0P9q8wbkPdhAzuE1lNPD4zpkBZBJIK2qGqj6OnPVXNUyWLG2TmOkl0h4z
         tfS6DnrrNIjImUtEX5rhCpPV1+xqSDzue03mDfwgxPxqN3FnuGxgBH6A5tbLi0hjfQWl
         XRG82/G67r7OBUSGiR9YMtL57cQdz3ki7vqa+wWwP5sAaxoHzA9q8MjysQIbRW+csCuI
         ymolLsS2+JIPTWEV3KfKsA1EVV3wGGjzHkJojZrLgWrpNn3na+Dtlt8H/2pbe2J3vdWI
         EqB8QWYpFWRJ/zuvWqbd6WOr8GXecv63TE8Gz3YpAaRuPKq0v5kuCSKr16//M2QyFcT3
         AWOQ==
X-Gm-Message-State: AOAM5333dUprAT9GZQeYGjJ8LGgvNE229CiJfmtWBdt19BCbVehUptQx
        tmGZC8E5xcZVH1t+kHKLjPTTc6FDfipsf3fh72V2Jy0Ijcnolg==
X-Google-Smtp-Source: ABdhPJz5wFjQmwSywGhgBRVB8jwBMQJAMO4L/2oh2mBsFDaY3py11AKlsfdPQmXyynbD7AhKTbpx+KgwS/VTxfpIjGk=
X-Received: by 2002:a37:a596:: with SMTP id o144mr21578618qke.135.1630307455332;
 Mon, 30 Aug 2021 00:10:55 -0700 (PDT)
MIME-Version: 1.0
From:   fei fei <cyfei1982@gmail.com>
Date:   Mon, 30 Aug 2021 15:10:44 +0800
Message-ID: <CAGfCfjjZac9Z8X6GiSHesrQUj8_NiTPOrjCuU7P-g522pQ85Cw@mail.gmail.com>
Subject: help needed in this part of code regarding FF in hid-sony.c
To:     roderick.colenbrander@sony.com
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

4th attempt......

Hello to Mr. Roderick or to whom it may concren,

I am fei, a novice self-studied programming enthusiast, I need help
with hid-sony.c, but there is no relevant maintainer found in the
MAINTAINERS list, the closest is you, Mr. Roderick as the maintainer
of hid-playstation.c, so I just try my luck here, hope you don't mind.

The scenario as follow:

I have added a feature to make initial rumble vibrates when devices
are connected, code as follow (sony_play_effect() as reference) :

add delay.h

-----------------------------
#include <linux/delay.h>
-----------------------------





define a global variable "init_rumble"

------------------------------
......#define SONY_FF_SUPPORT (SIXAXIS_CONTROLLER | DUALSHOCK4_CONTROLLER)

bool init_rumble;
#define SONY_BT_DEVICE......
------------------------------




declare "init_rumble = true;" in sony_probe()


actual part

------------------------------
static int sony_init_ff_play(struct input_dev *dev)
{
    struct hid_device *hid = input_get_drvdata(dev);
    struct sony_sc *sc = hid_get_drvdata(hid);

    sc->left = 255;
    sc->right = 255;

/*needed for non bt connection or else won't work, reason unknown*/
    if (!(sc->quirks & SONY_BT_DEVICE))
          sony_schedule_work(sc, SONY_WORKER_STATE);

    /*length-ing magnitude above*/
    msleep(350);

    sc->left = 0;
    sc->right = 0;
    sony_schedule_work(sc, SONY_WORKER_STATE);

    init_rumble = false;

    return 0;
}
-------------------------------




and called from sony_init_ff()

--------------------------------
......input_set_capability(input_dev, EV_FF, FF_RUMBLE);

if (init_rumble == true) {
    sony_init_ff_play(input_dev);
}

return input_ff_create_memless(input_dev......
--------------------------------




it works flawlessly without any error. Since it's identical to
sony_play_effect(), so i just tried to merge them together into
sony_play_effect() to reduce redundancy as follow:

------------------------------------
static int sony_play_effect(struct input_dev *dev, void *data,
   struct ff_effect *effect)
{
    struct hid_device *hid = input_get_drvdata(dev);
    struct sony_sc *sc = hid_get_drvdata(hid);

    if (effect->type != FF_RUMBLE)
        return 0;

    if (init_rumble == true)
    {
          sc->left = 255;
          sc->right = 255;

          if (!(sc->quirks & SONY_BT_DEVICE))
              sony_schedule_work(sc, SONY_WORKER_STATE);

          msleep(400);

          sc->left = 0;
          sc->right = 0;
          sony_schedule_work(sc, SONY_WORKER_STATE);

          init_rumble = false;
          return 0;
    }

    sc->left = effect->u.rumble.strong_magnitude / 256;
    sc->right = effect->u.rumble.weak_magnitude / 256;

    sony_schedule_work(sc, SONY_WORKER_STATE);

    return 0;
}
-----------------------------------------------




called it from sony_init_ff()

----------------------------------------------
 ......input_set_capability(input_dev, EV_FF, FF_RUMBLE);

   if (init_rumble == true) {
       sony_play_effect(input_dev, NULL, NULL);
   }

return input_ff_create_memless(input_dev......
------------------------------------------------




but end up whole system being freezed up, what could possibly going
wrong here? Thx in advance.

Regards,
fei
