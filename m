Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7651516E5
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 09:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgBDIRb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 03:17:31 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23218 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726864AbgBDIRb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 03:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580804250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+FYfNRtUohHmVazhCUWaHs/bP1B6+JdFa92vhI6uTJY=;
        b=Kz7Gsccyo12ozKcCoQdXEXf6gJ5kKYSQIjuI2z5S4hDDYWZ4V6sAJr6rYq7I5toIAfgyQV
        YWizNp0PkZe4U0ZMArjpCZDAnXX53VPgo4jb+TQp76jdu1Q4mmI0ijB8U/egUsXc8ZpNC0
        dZpeF+OKHBY5VakWCd6d3d7iyXftTAc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-NOJDG6KTPOKnFMFGwKZIiw-1; Tue, 04 Feb 2020 03:17:28 -0500
X-MC-Unique: NOJDG6KTPOKnFMFGwKZIiw-1
Received: by mail-qt1-f198.google.com with SMTP id c8so11811182qte.22
        for <linux-input@vger.kernel.org>; Tue, 04 Feb 2020 00:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+FYfNRtUohHmVazhCUWaHs/bP1B6+JdFa92vhI6uTJY=;
        b=ctONV+XLeagIyt+zCahj6FH/cuM+bjqoiJWcpojjNzWZd7Mk7okv9end2CWjsSujK/
         lGWGOesuYJHV1eyXU5lfU5BPZ60hA04QLEriPdj9kRIUa9lqxxOyzn5cA7ZRktfHaaIv
         EdK/ccA9Ch2MkxT6UjL/E/2vLYy4CVmqL7SaqseF6EU/ohfaruD/nUJ2WsJ4Um82pVhq
         BN30JnoLP0Bvwy61GShmS9sikuEx6RRO8Dr3J6CFKdqd4CAVETOrM6M2R4AGu6LS027y
         LSAgyLOjzOwmkHfzd6sqBGkPRVd+WQJ7OswWED/q4qRWVhwYWKTtLiyjDjW8CFc2GdPd
         aCmA==
X-Gm-Message-State: APjAAAUh/CYjaA+HqkDQpDWN86K/2E7veE5GVbO3Y8d61NRVqSUjKOyv
        EshxksCogLWHapD/uTy5si275x1TjeYGA6foou9T0YrCuNArm4KdmMzlEBdv0jJLd6aUXM2ULC0
        5lTxQTJ0sBJK9XNjsFIYZLhqUpo3F1NhdJxRA5p0=
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr26824685qvo.46.1580804247654;
        Tue, 04 Feb 2020 00:17:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzjKwMwjxavu7NYEJjE1m0Q0ek71T0gHQF4aw6iSTCDbCwPr7eWRME0OuH8bnHqlWTp1ooYu+RR4JG6sn8rQjc=
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr26824675qvo.46.1580804247330;
 Tue, 04 Feb 2020 00:17:27 -0800 (PST)
MIME-Version: 1.0
References: <9cf20b6f-5bfa-2346-ca9f-5ca81245bfff@pp.inet.fi>
In-Reply-To: <9cf20b6f-5bfa-2346-ca9f-5ca81245bfff@pp.inet.fi>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Feb 2020 09:17:16 +0100
Message-ID: <CAO-hwJJDkFh+ZS7pCZLhfuoXeAByFLzKbPW8mHtF=N_e-hn+Dg@mail.gmail.com>
Subject: Re: USB HID fix: Retry sending timedout device commands 20 times
To:     Lauri Jakku <lauri.jakku@pp.inet.fi>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lauri,

On Tue, Feb 4, 2020 at 3:21 AM Lauri Jakku <lauri.jakku@pp.inet.fi> wrote:
>
> Hi,
> I made possible fix for USB HID devices randomly fail to operate correctly.

Can you tell us a little bit more of which devices are failing, and on
which platform? I never had such failure, so I guess it must be device
specific.

>
> Fix: If device reports timedout operation, try re-send command 20 times, 10ms apart,
> before giving up. I got 5.5-series kernel running with 5 times resending and it seems
> to be quite good, i made the patch of 20 times resending. That should be enough for
> most cases.

Ouch, very much ouch. Resending 20 times on a generic path when the
timeout can be several seconds is pretty much a bad thing. Again, this
should be limited to the device you are talking to, and not be
generic. Or maybe you are encountering a usb controller issue.

>
> Code for drivers/usb/core/message.c include error definitions with adding include:
>
> #include <linux/errno.h>
>
>
> Code for drivers/usb/core/message.c function usb_control_msg:

This code / idea should be sent to linux-usb@vger.kernel.org (Cc-ed),
not just linux-input. This code touches the USB part, and we have no
control of it in the HID or input tree.

Cheers,
Benjamin

>
> int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>    __u8 requesttype, __u16 value, __u16 index, void *data,
>    __u16 size, int timeout)
> {
>     struct usb_ctrlrequest *dr;
>     int ret = -ETIMEDOUT;
>     int retry_cnt = 20;
>
> dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
> if (!dr)
> return -ENOMEM;
>
> dr->bRequestType = requesttype;
> dr->bRequest = request;
> dr->wValue = cpu_to_le16(value);
> dr->wIndex = cpu_to_le16(index);
> dr->wLength = cpu_to_le16(size);
>
>     do
>     {
>         ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
>
>         /*
>          * Linger a bit, prior to the next control message or if return
>          * value is timeout, but do try few times before quitting.
>          */
>         if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
>             msleep(200);
>         else if (ret == -ETIMEDOUT) {
>             dev_dbg(dev,
>                     "timed out, trying %d times more.\n",
>                     retry_cnt);
>             msleep(10);
>         }
>
>     } while ( (retry_cnt-- > 0)
>                 &&
>               (ret == -ETIMEDOUT));
>
>
> kfree(dr);
>
> return ret;
> }
> EXPORT_SYMBOL_GPL(usb_control_msg);
>
>
> --
> Br,
> Lauri J.

