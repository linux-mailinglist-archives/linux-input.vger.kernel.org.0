Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3A215A97D
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 13:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLMxQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 07:53:16 -0500
Received: from mail-io1-f54.google.com ([209.85.166.54]:32989 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLMxQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 07:53:16 -0500
Received: by mail-io1-f54.google.com with SMTP id z8so2116132ioh.0;
        Wed, 12 Feb 2020 04:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8uUbtIUDOW9ebVPssPKku+drjcOUJo/uTJ9SaDOnJuw=;
        b=lHYm9cVGTtyA8EiT1D0sqLSb/jKtkCxagH9ASKv9owFIoKOYqhwIWFFOTeEeC8uBVy
         46hUmqQq+PkyS/mU/NByGdrVF9AFXzjiP0hWR2h1B1K2eASskBK587/8MMKVcLJGPcSA
         tsbJ7Ll2fMVmKkwxkifsb0uyWU7MvL+7fOEuz9t7w09ht+c1jCJ6+tk3sTBZWUttVe7X
         2sn2nTuSMetpweeqhPSMNF9eMmF3mvAF29dZcXa3O+TPZUXvvRu3AObjEpfZAy/kjOKa
         U+ORlpik+ZuI5VYmeps5yTXx0PWjNTSnwod/KQU9UIdyjxikqILCeP+UVFcrwlnIaVSz
         ++Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8uUbtIUDOW9ebVPssPKku+drjcOUJo/uTJ9SaDOnJuw=;
        b=CskD1aAmMAqfhE7AUlqLjXKryUrogUgdHHXKzj6Q4xqoYz8h0L/y/8Ly/TkoT/Lxe1
         mHj9fRoU9Wnbr1vbhon1/RPym1HGFxtXMMpW3ns1swI/UzlzpY32eYeyDl8XBZmxYsu3
         fABB9UM0uuSSxLdHdFq/MsrAkgfmy1+zlfE+v7l8qpoLn19S/YKURu+IG0qR6zEwUCMN
         s4cGhPIVMFIFjbaBlNw+gZMOORg2c0RavqqsWReWHi5NYUT4LY9e996aDKxp+ZbICKHI
         hseomwn70QNCyXDzeHADQnz+Ex3iKOPsmUvD+zAVf8/s8PbkVSDYBVQwp73okpMgQevc
         XHfg==
X-Gm-Message-State: APjAAAXOj0ZhKIvc6ruGJBhAe0oqtJezgmdvI6zuodTOyoSmULDqyBVT
        hKGS6sDd+6LOPo/wIULonsVUuJustzdOOlr4evQ=
X-Google-Smtp-Source: APXvYqwenciTJqmwlFW6J+SzmV88Taxk40rh0SJ/KvqEvhgKlj/Xxm/QR6ynx3a5PYe6nSlUw1F3G3nRefDQUE1y3/U=
X-Received: by 2002:a6b:8e51:: with SMTP id q78mr16467343iod.179.1581511995705;
 Wed, 12 Feb 2020 04:53:15 -0800 (PST)
MIME-Version: 1.0
References: <CABXGCsMfzj+mpjvuZifzWEKbX7X36v7iMVPampSS6kOc2Hzoow@mail.gmail.com>
 <2405a741abf0d5fe8f55b5d3de8488e3054cc5e1.camel@archlinux.org>
In-Reply-To: <2405a741abf0d5fe8f55b5d3de8488e3054cc5e1.camel@archlinux.org>
From:   Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Wed, 12 Feb 2020 17:53:04 +0500
Message-ID: <CABXGCsPYaXYFqQfnYWeeOKYq-SCjBvixo-Mme-fGLSB8Kw5H+g@mail.gmail.com>
Subject: Re: [BUG] Kernel log flooded by message "logitech-djreceiver
 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid device index:7"
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 10 Feb 2020 at 17:38, Filipe La=C3=ADns <lains@archlinux.org> wrote=
:
>
> On Mon, 2020-02-10 at 13:21 +0500, Mikhail Gavrilov wrote:
> > Kernel log flooded by message
> > logitech-djreceiver 0003:046D:C53A.000C: logi_dj_hidpp_event: invalid
> > device index:7
> > This happens when the mouse is idle.
> > And it started since I begin using the mouse pad with Power Play
> > technology.
> >
> >
> > Kernel ver: 5.6 pre RC
> > --
> > Best Regards,
> > Mike Gavrilov.
>
> Hello Mike,
>
> Yes, the Powerplay mat exports a static HID++ 2.0 device with index 7
> to configure the led on the mat. The current code expects devices to
> have a maximum index of 6, which is the maximum index of pairable
> devices.
>
> I already submitted a patch adding support for the Logitech G Powerplay
> mat but it wasn't been upstreamed it. I will attach it in case you want
> to try it.
>


Thanks, I tested the patch for a day and "logitech-djreceiver"
messages was not appear anymore and no other regressions are noted.
Why this patch wasn't been upstreamed?

Also would be good if "logitech-djreceiver" provides information for
upower daemon as how did it happening with unifying receiver and my
previous mouse Logitech Zone Touch Mouse T400.

For example:

$ upower --dump
Device: /org/freedesktop/UPower/devices/mouse_hidpp_battery_0
  native-path:          hidpp_battery_0
  model:                Zone Touch Mouse T400
  serial:               4026-cf-15-61-0d
  power supply:         no
  updated:              Sun 22 Dec 2019 02:41:30 PM +05 (89 seconds ago)
  has history:          yes
  has statistics:       yes
  mouse
    present:             yes
    rechargeable:        yes
    state:               discharging
    warning-level:       none
    battery-level:       normal
    percentage:          55% (should be ignored)
    icon-name:          'battery-low-symbolic'

Device: /org/freedesktop/UPower/devices/DisplayDevice
  power supply:         no
  updated:              Sun 22 Dec 2019 10:58:54 AM +05 (13445 seconds ago)
  has history:          no
  has statistics:       no
  unknown
    warning-level:       none
    icon-name:          'battery-missing-symbolic'

Daemon:
  daemon-version:  0.99.11
  on-battery:      no
  lid-is-closed:   no
  lid-is-present:  no
  critical-action: HybridSleep

https://user-images.githubusercontent.com/200750/71320201-d8a5ea80-24c9-11e=
a-9ea9-97100545d294.png

Currently, only sensors show the power charge level, but without
"upower" daemon user-friendly indication not available in DE.

$ sensors
hidpp_battery_0-hid-3-9
Adapter: HID adapter
in0:           4.08 V



--
Best Regards,
Mike Gavrilov.
