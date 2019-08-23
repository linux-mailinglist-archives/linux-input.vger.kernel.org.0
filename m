Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC31D9B356
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 17:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405346AbfHWPch convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 23 Aug 2019 11:32:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34996 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394181AbfHWPch (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 11:32:37 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DBE2EC054C52
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 15:32:36 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id m2so9310991qkk.10
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 08:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CzTSQNQPZbM6Os80kdEUxpLn3GKCd61LRBEy94bV1tM=;
        b=VRki/9AOXRlmQxZuoHa5Z1RnbVNVwalOjCAdOj5hyu5+ELiRecjX1OsUkUK6yQ9ydg
         9T6iaDeBSFA05dAXfdGljw5OIN9CXUwwH2z7cYLVYB4RIsPKP+roJUtYHrM26PkNvHTX
         x5ugef2nv9cYCTKcUnzuyXxE+yxkuitQexjVK4iAdznTqarEbTxh8tybGbuim2RKWM97
         aJpMVDHT8Uyhs03AVElMUTOq5DOHul44EnSEuLDvyzCg4xID7RYbMwMH5HkHmsLwKgUL
         DxhtzS2CKX9TsI2vuqpYuD2rdKyQC6HnQjSRUZDPW04PYcS6ovDHf5cJB/GecyG3qj4t
         tNIA==
X-Gm-Message-State: APjAAAVTZ0dqbaBHtV3C8qM2w6WNGbVzVQX6VB7mYKgctqqjivu626P2
        k+13wuyBXQGFja3A63k8CZrwbrMdDh0O2H2ra5cq3D2OFgnqZD6tx+WE777g8DAwZkmQxkWc6Bp
        kEkbLmXwzmbcDvvU75SXj/Cu90Qr38D2Z8VV1+rw=
X-Received: by 2002:ac8:60a:: with SMTP id d10mr5192669qth.31.1566574356272;
        Fri, 23 Aug 2019 08:32:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqJK+0IGboWflSxwP9GvVCqRjZSsVtPfraXZdPGofDZ9SYXqP58SXv8qNU9ASj7ybsQZ0n8lhigHT9PPjRxQk=
X-Received: by 2002:ac8:60a:: with SMTP id d10mr5192654qth.31.1566574356106;
 Fri, 23 Aug 2019 08:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
 <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com>
 <e6014a01-1094-9ec7-9b37-2abdf70e305f@pedrovanzella.com> <CAO-hwJ+=dAyFnUfiPSmiGpzYTj=9BPDdeKQOY7UoCOvwQ5CH7Q@mail.gmail.com>
 <3c37ccc992d7979358e8472fbf52a583c6e1068f.camel@archlinux.org>
In-Reply-To: <3c37ccc992d7979358e8472fbf52a583c6e1068f.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Aug 2019 17:32:24 +0200
Message-ID: <CAO-hwJLQT6Oj2mvDTtQsOHLOTLFeB=_e6ZQZVj2tz92CZUU17A@mail.gmail.com>
Subject: Re: [Resubmit] Read battery voltage from Logitech Gaming mice
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Pedro Vanzella <pedro@pedrovanzella.com>,
        Bastien Nocera <hadess@hadess.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 23, 2019 at 4:48 PM Filipe Laíns <lains@archlinux.org> wrote:
>
> On Fri, 2019-08-23 at 16:32 +0200, Benjamin Tissoires wrote:
> > The problem I have with quirks, and that I explained to Filipe on IRC
> > is that this is kernel ABI. Even if there is a very low chance we have
> > someone using this, re-using the same drv_data bit in the future might
> > break someone's device.
>
> But we can reserve those bits. I don't expect there to be a ton of
> devices that need to be quirked, so using the remaining bits should be
> perfectly fine. Do you agree?

Nope. If the code is not ready for upstream, it should not be included.

Cheers,
Benjamin
