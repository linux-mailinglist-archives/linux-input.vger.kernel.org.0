Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6C1139E94
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 01:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgANAtg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 19:49:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43841 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726536AbgANAtg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 19:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578962974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2l/F28QWuQvndxXiZazLaTDPrBDdV1YaH8Th1UuXAEQ=;
        b=Qs995VgtIwaXnRi+UyXEHdbXCjZCdl3ZWGmqy8obIGmhBCgXyVImFA+aF2+2Q+D+azFjsx
        YGjFbGf4xkUjXzMLWvjzWxbrdCSHCC1bMuNen46/YsrbJFD+yxGtyZIigYUnmChXGoboog
        EGQ5sGtVu5fQubaMkWuINw571VB74CE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-tyeVph6lMNmqge0fx68V0w-1; Mon, 13 Jan 2020 19:49:33 -0500
X-MC-Unique: tyeVph6lMNmqge0fx68V0w-1
Received: by mail-qk1-f200.google.com with SMTP id x127so7219998qkb.0
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 16:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2l/F28QWuQvndxXiZazLaTDPrBDdV1YaH8Th1UuXAEQ=;
        b=HdcPPemYSVVqcX+o8qI1XyqeSmBcbKoqXpdHzL5Pppd+oQ1R9+nyhyQy/AWga9x7Q5
         QITgcm8RTXccHQJO9QLjG9qkKRc1xZbKAT2o1tqibsI73etSnO4YcJ0cEAHwWiLGc79h
         3EPq5cj96Us8BRu3+1i3LKEnnUn6iEtDNfNXHlu1seLoO8/Z0q8xrSVcxTxECFcxqSl0
         9ZOWGKSrGrODNqCnJv3/AyZMY3srQGeIywllBitfGunQiUCTpoQpbU2C1N7rOeLOs12i
         t3tZcWf8fEfmNbGQc9D7BpgiB85gUUEqFn1FGLNoP3e8ndT2aHvkPtDJZT+1I3NVrnNS
         X1BA==
X-Gm-Message-State: APjAAAW3EjIhlD5NJVRFOsY4XLJ58m1DZmpwJNoCT5k/1kt53Gz624Cy
        Q1vaQnNhFHJAmBqM8rpaaecNkzLEXX1RjSd0/290upGbC9Pe+YoNgNs0JB5pPM4WIuP8/Q1sljd
        zWORFsq2Uf4HL6q6uayjhY2KFA9hUsrXghyXcNLc=
X-Received: by 2002:ac8:478a:: with SMTP id k10mr1344568qtq.260.1578962972792;
        Mon, 13 Jan 2020 16:49:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjxu5nBmZuS7sk+Evmp+4P+dIg5mfw0lvZthkPTRl3Bk9pdAQzlF5dtnuqpdGQwTqLJqW9VdkFG12KK27SFQI=
X-Received: by 2002:ac8:478a:: with SMTP id k10mr1344554qtq.260.1578962972518;
 Mon, 13 Jan 2020 16:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20200112205021.3004703-1-lains@archlinux.org> <7d49a8444ea1740444d1e9133104530731bfb30a.camel@archlinux.org>
In-Reply-To: <7d49a8444ea1740444d1e9133104530731bfb30a.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Jan 2020 20:48:17 +1000
Message-ID: <CAO-hwJ+56qUTr8HQOLyx9tgbJMuTTPbb6K40cwWnO=PzMcO+tQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for the Powerplay mat/receiver
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 14, 2020 at 1:31 AM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> On Sun, 2020-01-12 at 20:50 +0000, Filipe La=C3=ADns wrote:
> > I also marked all lightspeed devices as HID++ compatible. As the
> > internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> > REPORT_TYPE_KEYBOARD it was not being marked as HID++ compatible in
> > logi_hidpp_dev_conn_notif_equad.
>
> Actually I had another look at the code and I don't understand why we
> are manually setting |=3D HIDPP in
> logi_hidpp_dev_conn_notif_equad/logi_hidpp_dev_conn_notif_27mhz. We
> should set it in logi_dj_hidpp_event as it is triggered by receiving a
> HID++ packet.

long story short: nope :)

The whole purpose of setting the workitem->reports_supported is to be
able to create the matching report descriptor in the new virtual
device. So having this set in a callback will add an operation for
nothing every time we get an event, and will also not ensure a proper
separation of concerns.

Cheers,
Benjamin

>
> What do you think Benjamin?
>
> --
> Filipe La=C3=ADns

