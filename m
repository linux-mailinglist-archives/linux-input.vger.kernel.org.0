Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BD845CD8C
	for <lists+linux-input@lfdr.de>; Wed, 24 Nov 2021 20:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236645AbhKXT4b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Nov 2021 14:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235076AbhKXT4b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Nov 2021 14:56:31 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E959AC061574;
        Wed, 24 Nov 2021 11:53:20 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r8so6348759wra.7;
        Wed, 24 Nov 2021 11:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jfrfq43NyMGbXbt7w7bZ1iCtfGpsFmM7TNkhuhYmJyE=;
        b=Rv09c/fYvF0EDPJ4cCrEgggM6WXLpXjNtn3EUcHuIW+ga9Vrl9NlAtEcw6OGYNzjmo
         B12agcR4URtvbUhe01QLz0ezLcdHktXxBkifBXAr+7sadwZ00qOQ6AoRRh60yQ5AmgXr
         QDa0AMdF/DOSNqfNDEwpkVHDc4eSJMpBAC1DAXTioP6c7qj4yjYWAHpV6neWsNS4ipuK
         wqCMMiwACH+ddEqRSzZ087wXtb+TNoZFT9fNzUuLM+Kf7hbsBEJxsyLV590lsaS358L0
         RvEDwdS9UJNUqjwTn1W5F/V4lXNcZl+Ez5RuJxCZlZy0dXDRwWuC5qHiPg0FcBCHh+rw
         cwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jfrfq43NyMGbXbt7w7bZ1iCtfGpsFmM7TNkhuhYmJyE=;
        b=vlH6I+z8R01rTGPE7wgXUUclsEisx0cGIpBLPJBG5jsXAOiImMH2cavXrD/gbCBmkB
         fy2nwgxzF6OKcznDGaOJUmg4dJEjG5iqx/ZEsDOxL+oOZ0GuJ6AAvNwk/NZEUvUxCoAN
         JOzV46FvqMqdCkaMOc3VCrszlz3gcdbP8rSSM0LVb0aNT2pRDImMTlU5hY/6um1UESfJ
         QAOitTygx8PBcOsUm27zV0RT2Ywzibw1zyh8+FBovOHzMBZ3gakatnPGnNJkjVp7f8P9
         YApA6Lk3R9QScUy4LGxRGzg07HgdtrHjxhXz9cYytw9HvZGqaZpjGPl0IH6Q2+tkzHJA
         IQGw==
X-Gm-Message-State: AOAM531x8sdWZDNAjJ/9fT1wpGo7/QxPcNO8pDnXUtL+B3JFdwMJHQEz
        /EoHGVynELE8j/ErhvHoywY=
X-Google-Smtp-Source: ABdhPJxCdkcv0VbrlZ3X2OmYdGI3JAntg7J3nS+IHdqnA1mNzxffEWBkgFL96/Phqu4tNRCOmdxJ6A==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr23177731wrq.397.1637783599449;
        Wed, 24 Nov 2021 11:53:19 -0800 (PST)
Received: from elementary ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id v2sm583805wmc.36.2021.11.24.11.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 11:53:19 -0800 (PST)
Date:   Wed, 24 Nov 2021 20:53:15 +0100
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] Do not map BTN_RIGHT/MIDDLE on buttonpads
Message-ID: <20211124195315.GA9441@elementary>
References: <20211123191238.12472-1-jose.exposito89@gmail.com>
 <CAO-hwJLB8h6fQRF8UjN3rER_6xS2Shi3ffEr92PhkVCijtYRpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJLB8h6fQRF8UjN3rER_6xS2Shi3ffEr92PhkVCijtYRpQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Thank you very much for your quick answer.

On Wed, Nov 24, 2021 at 10:39:02AM +0100, Benjamin Tissoires wrote:
> As long as udev intrinsic is happy with it (and it correctly tags the
> touchpad as ID_INPUT_something), I'm fine with it.

Yes, the device is still tagged correctly. For example, this is the original
output for "libinput record" (libinput issue 674):

  Supported Events:
  Event type 0 (EV_SYN)
    Event type 1 (EV_KEY)
    Event code 272 (BTN_LEFT)
    Event code 273 (BTN_RIGHT)
    Event code 325 (BTN_TOOL_FINGER)
  [...]
  udev:
    properties:
    - ID_INPUT=1
    - ID_INPUT_HEIGHT_MM=61
    - ID_INPUT_TOUCHPAD=1
    - ID_INPUT_WIDTH_MM=93

And the same output after applying the patch:

  Supported Events:
  Event type 0 (EV_SYN)
    Event type 1 (EV_KEY)
    Event code 272 (BTN_LEFT)
    Event code 325 (BTN_TOOL_FINGER)
  [...]
  udev:
    properties:
    - ID_INPUT=1
    - ID_INPUT_HEIGHT_MM=61
    - ID_INPUT_TOUCHPAD=1
    - ID_INPUT_WIDTH_MM=93

Notice that BTN_RIGHT is not present but the udev tags are the same.
I don't have access to that specific touchpad, but I own a Magic
Trackpad 1 and 2 -whose driver clears the BTN_RIGHT bit- and they
are properly tagged as well.

> I think it depends if you plan on fixing just hid-multitouch or the others.
> If you have more than one driver, then yes, adding a new symbol in
> hid-input.c makes sense. If not, then you are just exposing a new
> function we won't know if there are users and we won't be able to
> change without care.

I'd like to fix the issue on every driver. It is not a big amount of
duplicated code, just a couple of lines on drivers that don't already
clear the BTN_RIGHT/MIDDLE bit, but I agree with you, moving into a
common function is cleaner.

Also, the "input_set_property" function would allow us to add more
conditions associated with other properties in case we wanted to.

Thanks again for your input, I'll send the patchset for review as soon as
possible.

Jose
