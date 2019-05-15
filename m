Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF0B1E8B7
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 09:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfEOHCr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 03:02:47 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38136 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOHCr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 03:02:47 -0400
Received: by mail-lf1-f65.google.com with SMTP id y19so1118120lfy.5
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8E50xa7JxoMbQL8zYje/0xoHvRwvzr0zLxQ/g+yeHls=;
        b=YGbAvCfr5S+DvvpeXlOqhR30m37XHm8XCS+Y3YX8dyGGGTgIpSUWsUdqlJ1FhZ2c7y
         nD3eLMSr8X4aj1CKg10qKDkRvJZvi53RW+esQ+GrsswNNV/Z5Dgc9u4hhIMzC6Wn0/8q
         Yc6UkgPgrmoWK7Czn9jo4F8pKXSECAs9VVlN6FWA11VW+jhmZvT5S65LMljK5ErlOnK8
         pOjRq5t/16U6XFgfMcY6CGKL8tXK0ay/ZNDr0CKkE9o1epMhDinQ9CyeDFCAMh9IoOK9
         Wg8CrlZQTafZeSkfpB/28QEo85+bqXY4zhTOi7vjwtQIlfKQVlKzSm4LG4+1WefeHbPr
         ks3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8E50xa7JxoMbQL8zYje/0xoHvRwvzr0zLxQ/g+yeHls=;
        b=n7pX1sM71iMAhGovIo3zMQcvKoA6TPrmWWz222vy7RK1W8Gmtibdog3bGRbZiQ7PCX
         OtjKVK/z6hHyeh4l3Ii5llzZOzFGEiklnA/EDJeYevozF10lq0vZg2z8r9g7hbHFyrFb
         sku05Jjt0iHMxISlORthNRYUzgEOa4O8W5p6/ds70zWX5qRHNK0t9HxxRhAPdk7R+gR5
         yKAMm8nbzBqCuXALtpsN2Hjw2yIbKTedmEEiTNn+qaY9v8B51EbCoQEP8rAMpsbw6YXx
         HyyWkz5WBuqfasFYxxmnjkR8MZ9H+zRkTTP9KIOpafUA/lVxIgcGWb6p066LW/A48dFk
         xksA==
X-Gm-Message-State: APjAAAVcADUxgS17ewxMkOkP8eXGHn5EZMvvthjNrNYAscPsCTDkmTQY
        4gHBWYc9d50Mz/vdL5saBCU/rBvTMYnQ3kqzuCo=
X-Google-Smtp-Source: APXvYqxMH3OO8tOedJwCampAmMdvcUwTi79yM3uMMfFqEwU4QGN3hJ7zblFIpcGE0S4ML8Dhw3N7M+tw4yvDRTynGGA=
X-Received: by 2002:a19:29c4:: with SMTP id p187mr19183131lfp.69.1557903765257;
 Wed, 15 May 2019 00:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190421131156.9631-1-exalm7659@gmail.com>
In-Reply-To: <20190421131156.9631-1-exalm7659@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Wed, 15 May 2019 09:02:33 +0200
Message-ID: <CAN+gG=EVcWWW5sbuN2LbQtRFCY+2eMEXq3K0-nPRU18=Kft1gQ@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and E580
To:     Alexander Mikhaylenko <exalm7659@gmail.com>, teika@gmx.com
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.co>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 21, 2019 at 3:27 PM Alexander Mikhaylenko
<exalm7659@gmail.com> wrote:
>
> They are capable of using intertouch and it works well with
> psmouse.synaptics_intertouch=1, so add them to the list.
>
> Without it, scrolling and gestures are jumpy, three-finger pinch gesture
> doesn't work and three- or four-finger swipes sometimes get stuck.
>
> Signed-off-by: Alexander Mikhaylenko <exalm7659@gmail.com>
> ---

Based on comments about suspend/resume in the thread:
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Teika: note that you are welcome to provide a reviewed-by in any
cases, even if you "are not a kernel developer", you know enough to
say if this kind of patch is valid or not :)

Cheers,
Benjamin

>  drivers/input/mouse/synaptics.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index b6da0c1267e3..8e6077d8e434 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -179,6 +179,8 @@ static const char * const smbus_pnp_ids[] = {
>         "LEN0096", /* X280 */
>         "LEN0097", /* X280 -> ALPS trackpoint */
>         "LEN200f", /* T450s */
> +       "LEN2054", /* E480 */
> +       "LEN2055", /* E580 */
>         "SYN3052", /* HP EliteBook 840 G4 */
>         "SYN3221", /* HP 15-ay000 */
>         NULL
> --
> 2.21.0
>
