Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 579FA1E8B9
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 09:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbfEOHDx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 03:03:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38203 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOHDx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 03:03:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id y19so1120409lfy.5
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 00:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2/EKHNDXJa3BuQ9bFHCyV8lJ3wrVHbnRrNZLxEB8g4=;
        b=Pr/ZPp7DHLtlB6sin+wwsTmZ97Kv1yQrUuGjRr4idFRL+FutF0eUsXVGOV4T7zjYbx
         OALmd2oGxN77HWGzC9XYFclwSOAb3cYmvzHc+XgZ90wxasHApa3pdbn2GW4MpdCFz4so
         3QIVgwaStjwUkC4gEye7jkLONRV2+Yh72Yjt/W2gwHZWK8WE5oapgrFMmO8QnTFk7qh2
         auo8iruKtHGDfFmfkatVIysUjt33g2ndJVSbpAWAzKY1aPIscqqrAxqotzHLiazstPIf
         SmTS0fYXdeUtuhuzsaTXGTthwRqbJ+f2493Ib+t2pHwfaVDIKhWLd4H4AugH9rXcn7iV
         C1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2/EKHNDXJa3BuQ9bFHCyV8lJ3wrVHbnRrNZLxEB8g4=;
        b=fkz/hcGpx1UdJth8kg9wzb1gEADk7JZCfzkStYzeYz17x9bD3wP+nfUIryLAF1/5SF
         MRFZHaydnc5wXsh22SeD3lRHOJ3jM0wC2flO8jtyJLy4jVR9QmJeJVtA1FqzexerybgS
         mygQs+dQtopmaj4RZ9+UAWTR9+KR+wBL0bsq0dwnDt/VUnzEIcDVjprm40gKkggHocL7
         Z1HkF8caCFwH7PWPaMgnbBm0UB1UcRgt3KeHgDCu5yuGjL2NetjIqoiogowJRJA9eXjK
         e575yF6WIl8dbyC+bPFU0MVZhyZ1MxxxXTGYi/wvJFXDkWF1jrtHy1gI8PuP24fzlNml
         vmlg==
X-Gm-Message-State: APjAAAW1cD1H/e413StD6CHvrXlzs1HhqdkibQN/E200xc/4gHUoxgPP
        cIHPXLlwNpkg6vR82zzkI0aVs1E9g6YYrhTGWEA=
X-Google-Smtp-Source: APXvYqyhn7R76fdvYGr97vXYjSTtSfwO+gHHu1iiFPLbHVzxwYPzT0eIIbv3JqJ6JAha7SGCbP0zRqyo0P2h7DGj2iQ=
X-Received: by 2002:ac2:5212:: with SMTP id a18mr19703626lfl.166.1557903831164;
 Wed, 15 May 2019 00:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190421131156.9631-1-exalm7659@gmail.com> <CAN+gG=EVcWWW5sbuN2LbQtRFCY+2eMEXq3K0-nPRU18=Kft1gQ@mail.gmail.com>
In-Reply-To: <CAN+gG=EVcWWW5sbuN2LbQtRFCY+2eMEXq3K0-nPRU18=Kft1gQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Wed, 15 May 2019 09:03:39 +0200
Message-ID: <CAN+gG=ErURu-_9dbRJWh+9go_YyqeNKRVWuKr6tzhc_2ywuxaw@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and E580
To:     Alexander Mikhaylenko <exalm7659@gmail.com>, teika@gmx.com
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[resending with proper email of Dmitry]

On Wed, May 15, 2019 at 9:02 AM Benjamin Tissoires
<benjamin.tissoires@gmail.com> wrote:
>
> On Sun, Apr 21, 2019 at 3:27 PM Alexander Mikhaylenko
> <exalm7659@gmail.com> wrote:
> >
> > They are capable of using intertouch and it works well with
> > psmouse.synaptics_intertouch=1, so add them to the list.
> >
> > Without it, scrolling and gestures are jumpy, three-finger pinch gesture
> > doesn't work and three- or four-finger swipes sometimes get stuck.
> >
> > Signed-off-by: Alexander Mikhaylenko <exalm7659@gmail.com>
> > ---
>
> Based on comments about suspend/resume in the thread:
> Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> Teika: note that you are welcome to provide a reviewed-by in any
> cases, even if you "are not a kernel developer", you know enough to
> say if this kind of patch is valid or not :)
>
> Cheers,
> Benjamin
>
> >  drivers/input/mouse/synaptics.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> > index b6da0c1267e3..8e6077d8e434 100644
> > --- a/drivers/input/mouse/synaptics.c
> > +++ b/drivers/input/mouse/synaptics.c
> > @@ -179,6 +179,8 @@ static const char * const smbus_pnp_ids[] = {
> >         "LEN0096", /* X280 */
> >         "LEN0097", /* X280 -> ALPS trackpoint */
> >         "LEN200f", /* T450s */
> > +       "LEN2054", /* E480 */
> > +       "LEN2055", /* E580 */
> >         "SYN3052", /* HP EliteBook 840 G4 */
> >         "SYN3221", /* HP 15-ay000 */
> >         NULL
> > --
> > 2.21.0
> >
