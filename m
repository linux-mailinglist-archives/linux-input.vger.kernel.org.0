Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04893434369
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 04:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhJTCRV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 22:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhJTCRG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 22:17:06 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84385C061749;
        Tue, 19 Oct 2021 19:14:51 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id h193so5728161pgc.1;
        Tue, 19 Oct 2021 19:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BeLefvFYaaRNCXybpBNbetJ8KPidcgjmt2FIlG8JLGU=;
        b=g2kvxFPQF0NKcFZdcxoOMWcur0VCSL5wdxGZLs3mlkcAkYUcSmvP9Af8ZAStymqLs0
         tHAM0eeyBmCxRmMskpNA5XC/UuUkOL42EK7ejN4a2nK85+pGdX8bBQgBC+Y5C8aOuw9v
         f2kPwbFVcmDHyCf38qj5zBBrhHvIulPdmtayqXLxfelVYJmAn9YRFpDeeh8bV14bX69W
         HtjKu7YdKH5WFTSZgd94BqDCs/ESo+Gg7g1GAGOLdTtIoaY/jMiUknWIW9FYqClpfGb4
         NKwnkkAlwzIDQ5+kLk6WDGqQdfXPssBhqpLl7KLAaWDeuTceVn7nl69zNgwSUqhQnv3p
         +mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BeLefvFYaaRNCXybpBNbetJ8KPidcgjmt2FIlG8JLGU=;
        b=fh09+zwK+Zy93AfUTfw8yB056DtrnpMl6Ui0PVzoqAiMtXQ79xMN9QcA+CbqvNqvJm
         7GQa+udbaoiGf9pHdK81WdU69+g/0Xen6D5KQobWp38GRyClFyNVpOlwK/NEFJkqIBv8
         VKoizQaAHtRLq8wcj2+0MX84znZi/Tj1surfLAw7eIopPBMF8uB/UKo3Xr+XJcOWUcaH
         0VjltdQFu+B6I7jslmRQ3v+9nWYdpuYzq2Y5GX5SwSvWqHnqeEtLNjFoHy2ufs4HfO/m
         NQCowwrQsQ78iFcdnEjGwoKD5wdZchi/rrHwj0zxYzsDvXVI3RSAvb8Q9v6NFBYuYnfN
         BqSQ==
X-Gm-Message-State: AOAM533OIUBTdx622fpnQ+FvJHFoxrmBSQ4stL0a3BR1ZjH2n2amVPiV
        8m3Kpg+3LpR3kAcNhMQzBMc=
X-Google-Smtp-Source: ABdhPJyR9L42ItJdgeY8OFVEuB+bR+EEDRXjgA+Rvzo7tbV8YJlnkPhWyOmMetzWesvDsvBeGVKbUw==
X-Received: by 2002:a05:6a00:88e:b0:44c:c40:9279 with SMTP id q14-20020a056a00088e00b0044c0c409279mr3335225pfj.85.1634696090862;
        Tue, 19 Oct 2021 19:14:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4814:8c29:ba96:983d])
        by smtp.gmail.com with ESMTPSA id k14sm422679pji.45.2021.10.19.19.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 19:14:49 -0700 (PDT)
Date:   Tue, 19 Oct 2021 19:14:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair23@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Alistair Francis <alistair@alistair23.me>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the
 data values
Message-ID: <YW97lwsMrLHetJGy@google.com>
References: <20211009114313.17967-1-alistair@alistair23.me>
 <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
 <YW4kgnI0DQHj4sw4@google.com>
 <CAKmqyKMrb=Uz0+-ycj0HkAKJYdRU11Dc+24+KJw_j3MHT=2+yw@mail.gmail.com>
 <YW9rRUsxPHTjeOGT@google.com>
 <CAKmqyKMpMCb4gLyp94rCgVBU3eccjafD8nF7y6o+oU6D-OHvTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKMpMCb4gLyp94rCgVBU3eccjafD8nF7y6o+oU6D-OHvTQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 20, 2021 at 11:44:50AM +1000, Alistair Francis wrote:
> On Wed, Oct 20, 2021 at 11:05 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Oct 20, 2021 at 09:33:13AM +1000, Alistair Francis wrote:
> > > On Tue, Oct 19, 2021 at 11:51 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > >
> > > > We already have touchscreen-inverted-x/y defined in
> > > > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
> > > > why are they not sufficient?
> > >
> > > The touchscreen-* properties aren't applied to HID devices though, at
> > > least not that I can tell.
> >
> > No, they are not currently, but that does not mean we need to establish
> > a new set of properties (property names) for HID case.
> 
> I can update the names to use the existing touchscreen ones.
> 
> Do you have a hint of where this should be implemented though?
> 
> Right now (without "HID: wacom: Add support for the AG14 Wacom
> device") the wacom touchscreen is just registered as a generic HID
> device. I don't see any good place in hid-core, hid-input or
> hid-generic to invert the input values for this.

I think the transformation should happen in
hid-multitouch.c::mt_process_slot() using helpers from
include/linux/input/touchscreen.h

I think the more challenging question is to how pass/attach struct
touchscreen_properties * to the hid device (i expect the properties will
be attached to i2c-hid device, but maybe we could create a sub-node of
it and attach properties there.

Thanks.

-- 
Dmitry
