Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE977DC7C5
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 16:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393809AbfJROwI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 10:52:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31519 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389365AbfJROwI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 10:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571410327;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C2xaVN1YDGZt57Fg4Tueyvg0ge8B6IjieBOqiv9q4PA=;
        b=HNIkPwHsLABypCbTYNqn7XzroqCsfn3Nm6jonWUVa/gc6YjA/TjnvnkcEfLPR20trZK6Sf
        CD/+FqhpKwfjDNiVADkzxzuIhoqnhR0iSdQV9P7Ydc9gcuizghYswOt3swC3FZTxQSffJH
        MNRvGH0e0ZzldS2lFKCbQk4qCl+jV7A=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-4f-DSXygMDOyjvVgPN17qw-1; Fri, 18 Oct 2019 10:52:06 -0400
Received: by mail-qk1-f200.google.com with SMTP id c5so5827638qkm.0
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 07:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9cZq0CqcH8ZytwOHkNWIPhdJk6m17gLp4seEgaN+hk=;
        b=un3q3GWDitayRgabs1U0YWrsC/KDnpWY109L1oInG72+gpKUT8IrkhklhY7GWJlyAd
         9vn/phyE0ILEaqBnEu5U8xTvLna56xoKVi1Vu+qD8I6JB3XjLe8dyapdCli6e0v/h6JL
         2BTQPdMXrRdK+Qi39pWcLPNSeYLNU/zBsuvBERB2uyOlvhZgpUqQfEEYsJ5k3kT1l4sO
         03KdR0gw5Alh0c1Yw+2XpFBD1Q2VYCJLXHX1HI01Oei9v6QmedxDUsJkhDEkvlPWmNKa
         4PdAtrV5/meQmVoz+4DmzB3KC+wwH6QJ7vIe3ZsZtnb/iDc3Udp/5JMRIlJmZFUSCHqp
         C6Vg==
X-Gm-Message-State: APjAAAVdgxAhTdScIJw2DiU/9T0ThP8rwAP6L6ACvS+vPBOwhfM+5bXU
        KWqg4Sbr2ktjB6w8K1L13NfiVPyG+o2mbdfUE+tItZZz6oFrE5hWQOXewNy7TgpD8YHUmQszLtq
        KFUgltxqD6X3JvVShHXfAu8m03RUPR/EhwR11BMo=
X-Received: by 2002:ac8:461a:: with SMTP id p26mr5295321qtn.31.1571410325642;
        Fri, 18 Oct 2019 07:52:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/VKFQ8LK5JCkS1ha/lieFjDpyY6JvHw1fBr+RScJtNeuXXfa383meU/jv5V/KO30Vio7RVa3CTNDIRb2LNaU=
X-Received: by 2002:ac8:461a:: with SMTP id p26mr5295297qtn.31.1571410325296;
 Fri, 18 Oct 2019 07:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191018044517.6430-1-andrew.smirnov@gmail.com>
In-Reply-To: <20191018044517.6430-1-andrew.smirnov@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 18 Oct 2019 16:51:54 +0200
Message-ID: <CAO-hwJLDSaDko1pgOybQ3B7dUjg7boarob2xU+7EhwsjeuYayw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Logitech G920 fixes
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Bazely <sambazley@fastmail.com>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: 4f-DSXygMDOyjvVgPN17qw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 6:45 AM Andrey Smirnov <andrew.smirnov@gmail.com> w=
rote:
>
> Everyone:
>
> This series contains patches to fix a couple of regressions in G920
> wheel support by hid-logitech-hidpp driver. Without the patches the
> wheel remains stuck in autocentering mode ("resisting" any attempt to
> trun) as well as missing support for any FF action.
>
> Thanks,
> Andrey Smirnov
>
> Changes since [v2]:
>
>      - Fixes a buggy validity check "HID: logitech-hidpp: rework
>        device validation" as pointed out by Benjamin Tissoires
>
>      - Marked "HID: logitech-hidpp: do all FF cleanup in
>        hidpp_ff_destroy()" as 5.2+ for stable
>
> Changes since [v1]:
>
>      - "HID: logitech-hidpp: split g920_get_config()" is changed to
>        not rely on devres and be a self contained patch
>
>      - Quirk driven behaviour of "HID: logitech-hidpp: add G920 device
>        validation quirk" is replaced with generic validation algorithm
>        of "HID: logitech-hidpp: rework device validation"
>
>      - Fix for a poteintial race condition is added in
>        "HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()"
>        as per suggestion by Benjamin Tissoires
>
>      - Collected Tested-by from Sam Bazely for "HID: logitech-hidpp:
>        split g920_get_config()" since that patch didn't change
>        significantly since [v1]
>
>      - Specified stable kernel versions I think the patches should
>        apply to (hopefully I got that right)
>
> [v2] lore.kernel.org/lkml/20191016182935.5616-1-andrew.smirnov@gmail.com
> [v1] lore.kernel.org/lkml/20191007051240.4410-1-andrew.smirnov@gmail.com
>
> Andrey Smirnov (3):
>   HID: logitech-hidpp: split g920_get_config()
>   HID: logitech-hidpp: rework device validation
>   HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()
>
>  drivers/hid/hid-logitech-hidpp.c | 237 +++++++++++++++++--------------
>  1 file changed, 131 insertions(+), 106 deletions(-)
>

Thanks a lot for the work on this series.

I gave a slight test of the series with a bunch of devices handled by
hid-logitech-hidpp without regressions.

Applied to for-5.4/upstream-fixes

Cheers,
Benjamin

> --
> 2.21.0
>

