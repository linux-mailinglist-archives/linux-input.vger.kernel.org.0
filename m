Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0997277EE2
	for <lists+linux-input@lfdr.de>; Sun, 28 Jul 2019 11:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfG1J5d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Jul 2019 05:57:33 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46672 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfG1J5d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Jul 2019 05:57:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so55693767ljg.13;
        Sun, 28 Jul 2019 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I5U5P2OB+CW1lAAzC/g4JOE6432qGwFP+/JSwm0jSHU=;
        b=ZV53OTCsHDfSi2msA8fBNToBiGv1qSMCKgBQXDYU2lDS7+Vh64l0Pb6wOlXEw+vUT5
         BrQdMuTWRPTsPW9wJ0fUQINwtKQjCoc1c1RqPp5JAz8SmrW/rBha8mnJF7LR1GERrUaj
         LjesFwNlFmzF84GiwhpjettdBknui1n0kO2MLU+Pc6SsbafRJ7ApvOMJWe8kWYFTdI+Y
         hNoTTnVK5r9Wr1aXZ9tiPSGv8QzT6eiCNYW/EN+iJxYX0YL2hhnUYbqDWsMd+T84+4Gi
         sQ94QOp1j2tk3Wq36Uonm35FoGLlhHtqwNgvSFIP4KQWRJkQpeHazVQYN1crYcniSP/J
         o7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I5U5P2OB+CW1lAAzC/g4JOE6432qGwFP+/JSwm0jSHU=;
        b=EzzNnF7J2CIxGuapku4kwbt3M5nAsr1d7cdMuAAxqXCnuJHdR1R1NLlFCE/9gm502d
         tnQX6QjfGFB7xEYc+MI6VoIJaC/CNLSLrOIUP1+IBR1XDGPAYBahOSLZB2WFjo0sbdyW
         iwa3fLNZ0kTuX23LY3BY7iluBORseHvwkbRXkXbDBah5162SeJIb5a86R0X+mfCdRBMc
         IndeOYA0qKccZ2mnxhYA8tEMhXcFGpcC36H+QczVYA4S2eo4P2muHBJyEoC7QyE4P3iA
         468GbfXTiFk50LQ9Br4LG77NlR4S1jBg4GrfZRqIQ6P6ySePJNfPttUE3VbMKTZsqjLZ
         SBLQ==
X-Gm-Message-State: APjAAAX3xC6fwKr74lRf/1/bQ4p7rDtU206dGWs1f9PJvE3J+jxC7xOo
        naNCSg3OqPLw7aFUA5Jweh0=
X-Google-Smtp-Source: APXvYqwhw6OvM5th7He13Ewrm1ZQ2dCdDBT/HVP2qOAnliTHa6FW6BpkBP/nC5rQ9AHjO0hV9V2/2Q==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr54145925ljj.113.1564307850821;
        Sun, 28 Jul 2019 02:57:30 -0700 (PDT)
Received: from localhost ([178.155.13.240])
        by smtp.gmail.com with ESMTPSA id n187sm9919522lfa.30.2019.07.28.02.57.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jul 2019 02:57:29 -0700 (PDT)
Date:   Sun, 28 Jul 2019 12:57:26 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v3 1/2] platform/x86: surfacepro3_button: Fix device check
Message-ID: <20190728095726.GA775@penguin>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-2-luzmaximilian@gmail.com>
 <CAHp75Ve+3c-TFeN3Dh-DB75Rjft8mY2DA8vNkrFyp7JK-ZOjDA@mail.gmail.com>
 <20190727091541.GD795@penguin>
 <CAHp75VdsL+-bhAUcxLKFKLZedN3gFD3jxnhELD1RtKGSHdagjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdsL+-bhAUcxLKFKLZedN3gFD3jxnhELD1RtKGSHdagjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 27, 2019 at 03:26:41PM +0300, Andy Shevchenko wrote:
> On Sat, Jul 27, 2019 at 12:15 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, Jul 25, 2019 at 08:57:53PM +0300, Andy Shevchenko wrote:
> > > On Sat, Jul 20, 2019 at 6:05 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> > > >
> > > > Do not use the surfacepro3_button driver on newer Microsoft Surface
> > > > models, only use it on the Surface Pro 3 and 4. Newer models (5th, 6th
> > > > and possibly future generations) use the same device as the Surface Pro
> > > > 4 to represent their volume and power buttons (MSHW0040), but their
> > > > actual implementation is significantly different. This patch ensures
> > > > that the surfacepro3_button driver is only used on the Pro 3 and 4
> > > > models, allowing a different driver to bind on other models.
> > > >
> > >
> > > Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > >
> > > assuming it will go thru Input subsystem.
> >
> > I can take it, but I do not think it is dependent on the other change
> > and thus can go through platform tree as well.
> 
> Pkease, take it. I do not expect any changes to the driver this cycle.

OK, applied, thank you.

-- 
Dmitry
