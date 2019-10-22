Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE314E01F0
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 12:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfJVKUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 06:20:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45844 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731834AbfJVKUd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 06:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571739632;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=82pDg4TYDcRM9OsvqQXlQIO9hPNcI7qG+xYGFBtQJWg=;
        b=Zs3wIApJax0RDhJrUY4YzPnB5ijddgM5mrZn6wlrg4ocsUbY1Nixu7e8yfL8B/7rELiZ7r
        PvZAVj60THCAI7h/qNBn7ex1coN+OSruYthFunDlkTLYBi/g17VwxNQzRxvTAdVB6yo/1a
        ozbh9Tqk4id22Lhk0MQW0MqkUIVTaMY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-APNfODBBMUevyWtecwz6ZA-1; Tue, 22 Oct 2019 06:20:31 -0400
Received: by mail-qt1-f200.google.com with SMTP id f2so176289qtv.21
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 03:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AVxKx3T/EDAaG269H73B/aoeOhwkt3dQ3dmDZquXpuo=;
        b=pNJBUEb4JLzq0JU58gD7EoFJVU36ZAQM2jdIZY31X/+tetzQ15ppCta3t1sf4j5zLJ
         pJ//IGTBlgWvQlQ+P4FAMCYEU6AnOUTML1A2p6uCdsquz6bbxrsXu4sjedbiuroTx1le
         TEThvz4ZjKE+G5mZ0/EWmY7Jk83tEQ0EBVDMvwkmExMQ+2cyQi73H6zF7ezDwjcBzVwv
         JtwoLtRlBljSxwXUvUX73qKfWEtw0EY5B3E02pghuE3FebZFjZR/xqwVKZMEXCODNOP1
         v3UzN8ehAgCEYA173bhvm5+tc4FOvuZ0zuCcNdZS59M/03xVpchX4/IAcbjlnjt7qQia
         t9Eg==
X-Gm-Message-State: APjAAAVouZAL8WiT0QtFt/jVY1sB6I4mnnfMz6whPEUAhxO8ByClccLm
        8LkKp1K0MSGcNUFUlw6jJqsC2YA9bHrOLGhyMTFXoTVFtAPdD5Guo91gd+Rohb8S9/6FaCyt9yq
        cxDn950ohDCGyBxKkc5gvHCkJRnQI3ilblsUKys0=
X-Received: by 2002:ad4:50c2:: with SMTP id e2mr2323991qvq.67.1571739630721;
        Tue, 22 Oct 2019 03:20:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzn5zsEA3UPVsMqusCIi9G5MwfKgdMcukwLuMTs0wd3w8wwlPh9EQZnDWiCQaLBYuEnG0V+TK3eLwW/86lnZAM=
X-Received: by 2002:ad4:50c2:: with SMTP id e2mr2323970qvq.67.1571739630466;
 Tue, 22 Oct 2019 03:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191020213307.217228-1-adrian@freund.io>
In-Reply-To: <20191020213307.217228-1-adrian@freund.io>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Oct 2019 12:20:19 +0200
Message-ID: <CAO-hwJLg1DQe0gAq-JHEcLBnq0hAmVeTN_T0SdrBHXLW0ArM7A@mail.gmail.com>
Subject: Re: [PATCH v2] HID: logitech: Add MX Master 3 Mouse
To:     Adrian Freund <adrian@freund.io>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-MC-Unique: APNfODBBMUevyWtecwz6ZA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Adrian,

On Sun, Oct 20, 2019 at 11:33 PM Adrian Freund <adrian@freund.io> wrote:
>
> Adds support for the Logitech MX Master 3 Mouse to the HID++ driver when
> connected by the Logitech Unifying Receiver.
> This doesn't yet add support for using the mouse over bluetooth.

well, patch looks good, but can you also add the BLE ID by rebasing on
top of https://patchwork.kernel.org/project/linux-input/list/?series=3D1904=
45
?
I just requested a few changes on this series, but there should not be
major ones.

Cheers,
Benjamin

>
> Signed-off-by: Adrian Freund <adrian@freund.io>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 0179f7ed77e5..e263085a0b82 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3717,6 +3717,8 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
>         { LDJ_DEVICE(0x4071), .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_=
X2121 },
>         { /* Mouse Logitech MX Master 2S */
>           LDJ_DEVICE(0x4069), .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_=
X2121 },
> +       { /* Mouse Logitech MX Master 3 */
> +         LDJ_DEVICE(0x4082), .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_=
X2121 },
>         { /* Mouse Logitech Performance MX */
>           LDJ_DEVICE(0x101a), .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_=
1P0 },
>         { /* Keyboard logitech K400 */
> --
> 2.23.0
>

