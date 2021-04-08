Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00980357CEE
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 09:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhDHHFs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 03:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhDHHFr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 03:05:47 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD4D5C061760
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 00:05:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id dd20so1064590edb.12
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 00:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XL6pmCtw0aisCTAx5Q6WwykJOY4mYuR7CXn8H4btvug=;
        b=Owl162V8kudYfYtPsncmax2C072JwylJVebGsB5rQAL30MnnWhGh+T6LGVUq5bi39X
         SR8kXtUf+vxCFUEfQ8wjV8yEbgyLgGCbr+iQVlJ/HQHQ712zlbNtzUqfcX8ssd/MJQkD
         ZpXpCoJ+18sSgLABWd4LOPyKeDaJw7l6g3iSqKf9zLkIWhKZ+BaE0Fj8nDU7vT5+fXOW
         q3vPfsFZjy6sSexu0gmxEErXXQRMI5Mr4gGTCSFUryxpjn76rAS8YzBTwirCqvMfC4tT
         9/LhSa6e12LHLr4brEF2Z10xkMta7BYvJlKoSvbe9GWQef6eK+I7I3BgcRE4LT8/aUN9
         acgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XL6pmCtw0aisCTAx5Q6WwykJOY4mYuR7CXn8H4btvug=;
        b=iDj3flW46VpdosHjkmNYzSlvwgWBCcc0Or1a735He0c8Z+qVDAiOFk54PikTuGoJvg
         XhGcblziQerJSssSIl+hWtE2LXnX7Wc/NGgBDG8OFWzGzITUneA1mppC8z1gu0WztCPC
         o3C58UpngEUp84AZrB+/3juda49VMzrh/QL36YojKrKFXvY9IgR8dsBo0wDiNh5JHeUx
         AbHIUpeot1LA/6R4Q10DsOxPtX8hxyrIAgQYGKk2oIolowKbsIybpTRFx9b4QAwS/Hbe
         ytjZKArg8WXCYASg7/3MZh15nva5a49Ym+jA1u9eqEVCB1cxGSFpiudqrNkcmtr2aZGR
         cB4Q==
X-Gm-Message-State: AOAM530JWsYz5ij9NDBXrF7pHU/dC7HHJOr3rdr09jjpJ5v+OwMsHKZw
        HZdvKbMPihD7kdYupzO1aw8n9Q==
X-Google-Smtp-Source: ABdhPJx8S1/cfXx06iS59ZXxOeX0+0ye0uZDtA0so3LsG7W52/duDSZFCJrS89Ki1+SDvYEJm3X/0w==
X-Received: by 2002:a05:6402:b0e:: with SMTP id bm14mr9307439edb.148.1617865535369;
        Thu, 08 Apr 2021 00:05:35 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id q20sm13598289ejs.41.2021.04.08.00.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 00:05:34 -0700 (PDT)
Date:   Thu, 8 Apr 2021 08:05:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, message to <vojtech@ucw.cz>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [PATCH 06/25] HID: usbhid: Repair a formatting issue in a struct
 description
Message-ID: <20210408070533.GB2961413@dell>
References: <20210326143458.508959-1-lee.jones@linaro.org>
 <20210326143458.508959-8-lee.jones@linaro.org>
 <CAO-hwJLD9bUJAx6E4HF9VGu20Ddyo=ZyZ=DdSWj__Gp9rG486w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-hwJLD9bUJAx6E4HF9VGu20Ddyo=ZyZ=DdSWj__Gp9rG486w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 07 Apr 2021, Benjamin Tissoires wrote:

> On Fri, Mar 26, 2021 at 3:35 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/hid/usbhid/usbkbd.c:66: warning: bad line:                 should be on
> >
> > Cc: Jiri Kosina <jikos@kernel.org>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: message to <vojtech@ucw.cz>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/hid/usbhid/usbkbd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
> > index d5b7a696a68c5..d0c640be8a885 100644
> > --- a/drivers/hid/usbhid/usbkbd.c
> > +++ b/drivers/hid/usbhid/usbkbd.c
> > @@ -63,7 +63,7 @@ static const unsigned char usb_kbd_keycode[256] = {
> >   *             new key is pressed or a key that was pressed is released.
> >   * @led:       URB for sending LEDs (e.g. numlock, ...)
> >   * @newleds:   data that will be sent with the @led URB representing which LEDs
> > -               should be on
> > + *             should be on
> 
> nitpick: checkpatch complains about spaces before tabs here.
> 
> I amended locally and will push the fixed version.

Those are usually highlighted in my editor.

I wonder how I missed them.

Thanks for cleaning it up though.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
