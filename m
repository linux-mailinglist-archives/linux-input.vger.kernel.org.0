Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8C37E2054
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 18:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407113AbfJWQQD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 12:16:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40176 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404354AbfJWQQD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 12:16:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so13231393pfb.7;
        Wed, 23 Oct 2019 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=155/QxUF6qgeEAYz3lRl/oRaqE0lMi1snnV0Pk0VWM0=;
        b=uKPuihvCgrEyLu4l4MALt611wJIIy2FO7N4cKIedi1NdsW27a6e7hXEcH2tG2yWYyO
         aFukq1bZ188G3eL3sDsZRQre1PaHQRwSlturJTqqdZe7b4DGrQl2vy2hf2gk2sv7EgSQ
         J17qRv52GxN4W8MYC53zDC8fBBcWyCikXRfH5ZuxUwUsUi9r8/bddltFwSno3F85M625
         Pps4L7NrnDFRWKwZmBZ/CCs+7haADH4Vwv03eAT+w+GehguTRNoUoxNnAW59hrluRoz9
         s+K6NUed1AU5qQ9AZETm+J0OmgOnqVdODl7Ix6X5aWnT2SCCu7K/uDX1bIOhZpH092Mv
         IqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=155/QxUF6qgeEAYz3lRl/oRaqE0lMi1snnV0Pk0VWM0=;
        b=cYMZZa4VkRg3/pFAwzsEtOMfuFe/MCwy531YxOTZnYXNCy5eNk4+j3v+NzoDq8muDi
         13VwmxvWoW6inDwnM+aB+HKeMSHD3UhAwWyBJ3kEsIQ/UGFXHXTrVrZqrNHkL9Sm/8Pl
         5cmBEAPg8RcgXMhTzJ55jognojEI4LYeHse5PDeMa+fYConmiJjyIWYv4dRAjlsSH5Gt
         TmMvJX5FYGIPK7WEcEhodvXjwNMSlTAltXZ8S+neUhmM5j7YEI//CVsyYQNoo+Ozo8jm
         ErNrenZv8iEqthsrKnP4R+4OBgoIJZtst4Zyx5AS8fKFvVKg53+S13t9sOenEAnrdHb2
         mTaA==
X-Gm-Message-State: APjAAAUlFGjxPMrO53e/uToRLiV4k5ZArKaJanLYnP117F7FRoGbHMI3
        TpTaVYi6wiFhwMYodc44SCfhDL+/VTH+i+VxS+Q=
X-Google-Smtp-Source: APXvYqyXi8WW3l3HAiNUfRWMkZBbYHzwGNjDk/4lEEDr7iKRRfbZ9ru/KK8fVRr3Ab7mqkJ02RcH3xrJTcFKd+sqc/0=
X-Received: by 2002:aa7:8b02:: with SMTP id f2mr12119995pfd.151.1571847362826;
 Wed, 23 Oct 2019 09:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
 <05eec4e5-927c-fdd6-037b-71520e149d5b@redhat.com>
In-Reply-To: <05eec4e5-927c-fdd6-037b-71520e149d5b@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Oct 2019 19:15:51 +0300
Message-ID: <CAHp75VeoUCxLt9YFPBpS3d8zOpXb7B4UbpPaiNLWAv0tm4zPHA@mail.gmail.com>
Subject: Re: [PATCH] Add touchscreen platform data for the Schneider SCT101CTM tablet
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Gorbea Ainz <danielgorbea@hotmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 23, 2019 at 7:08 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 23-10-2019 17:23, Daniel Gorbea Ainz wrote:
> > Add touchscreen platform data for the Schneider SCT101CTM tablet
> >
> > Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>
>
> Patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Daniel, I received your patch just fine, shall I resend
> it to the list for you ?

What list? Everything seems okay to me.
I don't see it in patchwork, though.

-- 
With Best Regards,
Andy Shevchenko
