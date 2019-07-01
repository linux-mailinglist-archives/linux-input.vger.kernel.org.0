Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2934C5B617
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 09:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfGAHwP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 03:52:15 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45626 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfGAHwP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 03:52:15 -0400
Received: by mail-pl1-f194.google.com with SMTP id bi6so6894312plb.12
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2019 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YQmwWiD1iJTzbTUw6iw3lbst9yLH7IwikHGNzcGoELQ=;
        b=KL0L+ZDNvnOCNk4ThuwjEt381fgRN3LGyST9ObTKaNDrbk/OsHTpL7yfcXpweu8Lkx
         Ukl9sBOpQxJ7yXM9Mg7RfYHZfN+RXigqrGbDLsByvSrklLvuN3v103zvgsdqwtI6oc4h
         iRDtIk5Jkky0pPM2DWnj1vRU7jvtPAjmf074WpWbS343pqokGV1A7cn+LK8a9/1NQULO
         OGiRvtGx/kpzR6on2SyT/yxxWuBUSyD3Lnb8+Vi2YHObqZsSp6JfNaqitHOveA8I0d5s
         iq+j6+6BY9siC8ggnkJPDDjMpB9gu7uHlpoRor5YSosC3/EZNonpexvZ65T23kxoxdNh
         9cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YQmwWiD1iJTzbTUw6iw3lbst9yLH7IwikHGNzcGoELQ=;
        b=g4efvS4uZS6orGze1pegOCbUrfpLWhGXdJ6qD9FyDbaDvSYhL8ZYWI2xdR0IXvwwXz
         h5NU53968xyW27pvP5n4fpl8paCsGphMbTIRO6g223OGYK1Ocn9mDzzjYPa4/DjyGCtw
         Eq0v87gSztwA7WwryxRifx8v5J9hrTrc2t6lxyojkDkcHFHqv1rvduC5Rhji2mjPpiVc
         Szj0ydAs4YHziuHCk7mIbSrBHV5sgkS9NMOUJsZERPEqKU06yrkZWlhvrOveGIcE/BA3
         mEu9wVO44XqNFeepGk9RJYRad3HNZGE9bDVISqvn0ZJ/2hJ1buWAWdvY4vdTPET8ThSf
         zGyg==
X-Gm-Message-State: APjAAAUCD67BUYkKjbyUUweLSz/3Hzs0l46Quq9lagqf/1/awHuqGjUK
        qQ0tRmDgkhtDe59uk8GuQsA=
X-Google-Smtp-Source: APXvYqzWEq4cVk+mGtRQI0e4cDjzNAorPxGtuCa5LmEZrTNvC1UxrRjeFrtSVnPHPqnyzeYkeWFbsg==
X-Received: by 2002:a17:902:d88e:: with SMTP id b14mr26952653plz.153.1561967534011;
        Mon, 01 Jul 2019 00:52:14 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c26sm10020926pfr.172.2019.07.01.00.52.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 00:52:13 -0700 (PDT)
Date:   Mon, 1 Jul 2019 00:52:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     colerogers@disroot.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Input: synaptics: enable SMBUS on T480 thinkpad trackpad
Message-ID: <20190701075211.GC172968@dtor-ws>
References: <deaf38687dd8e9a970bc60bfd838ed62@disroot.org>
 <CAO-hwJ+rnGVeK7AxKitVwtnAVNn2A8ohLoGx02M50JYKE8Er8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+rnGVeK7AxKitVwtnAVNn2A8ohLoGx02M50JYKE8Er8g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 01, 2019 at 09:43:35AM +0200, Benjamin Tissoires wrote:
> On Mon, Jul 1, 2019 at 2:28 AM <colerogers@disroot.org> wrote:
> >
> > From: Cole Rogers <colerogers@disroot.org>
> >
> > Thinkpad t480 laptops had some touchpad features disabled, resulting in the
> > loss of pinch to activities in GNOME, on wayland, and other touch gestures
> > being slower. This patch adds the touchpad of the t480 to the smbus_pnp_ids
> > whitelist to enable the extra features. In my testing this does not break
> > suspend (on fedora, with wayland, and GNOME, using the rc-6 kernel), while
> > also fixing the feature on a T480.
> >
> > Signed-off-by: Cole Rogers <colerogers@disroot.org>
> >
> 
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Applied, thank you (but moved the entry so that the list is sorted).

> 
> > ---
> >  drivers/input/mouse/synaptics.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> > index b8ec30102..c8d0f5795 100644
> > --- a/drivers/input/mouse/synaptics.c
> > +++ b/drivers/input/mouse/synaptics.c
> > @@ -170,6 +170,7 @@ static const char * const smbus_pnp_ids[] = {
> >         "LEN005b", /* P50 */
> >         "LEN005e", /* T560 */
> >         "LEN0071", /* T480 */
> > +       "LEN0093", /* T480 */
> >         "LEN0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */
> >         "LEN0073", /* X1 Carbon G5 (Elantech) */
> >         "LEN0092", /* X1 Carbon 6 */
> > --
> > 2.21.0

Thanks.

-- 
Dmitry
