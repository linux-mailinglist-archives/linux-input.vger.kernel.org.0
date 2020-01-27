Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9CEA149E41
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 03:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgA0CaX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jan 2020 21:30:23 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38562 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgA0CaX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jan 2020 21:30:23 -0500
Received: by mail-pf1-f194.google.com with SMTP id x185so4187649pfc.5;
        Sun, 26 Jan 2020 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=w5Xw3EKEbqNBNmrKWt/CTp/k6lti3wtCtoGq3QSZhTo=;
        b=Y98BhlfLvsW7RKEPcFzvbPbG/yffnmdVuE0gXNSTDp/q38bUIMq3VOn3IrB6a7rHOe
         kLDo+FZnBIy2iS520tTTdMfUYVyzX8p71a4R41RmmldCWyDukBm7ePh5S+DnMzgKwdqE
         lC0SghAMv7Jn+fEu7tbhnU+o4D+RxgsKuwyjaFj9G84W1DpjMNUt0dDbOruFu1PxlJgU
         v9SlZViDBnGttSlGyWguELo/QjQFy96Dxn/qC1zBo0TjYTDnbADPRISKHOMs1mnpGzGk
         45+h8VsGia0cA1nFcsnVuuqKTTj9WluiTlOub0HTd939hPbW8suXv/qg8hFy1ePc07b0
         ZE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=w5Xw3EKEbqNBNmrKWt/CTp/k6lti3wtCtoGq3QSZhTo=;
        b=df9wgye3wvVTZi41tcFjQLmSQORxzJWIsho1xBnIZfYWmbUNhK5b9yE4vQVQWY6LuW
         YNCJIW6WcJji0cLCWq7iYKQdv/qKUSZ5XunD7qFaqsMJfdhIvZPigYrTuxWWVW9GuqoN
         49iK3Wr5fqd9FG0/QEkHAyQKgqp1G10jRTWyuvTNuxqyDs1KgwVwZW2wXQOM0M34msx/
         QmOmVOVFfwh8KaUBdwE51PobjiEw3FhLAd73hpXStUrZlhvveX+CCNGgh4rCdA/Mm4lg
         w5+yPkDWf+md7MG+p01opkp93JhOHLaqzaGWAnD/q2A+5GnAv1xlLSFFwl7RhVFgIE2U
         +70Q==
X-Gm-Message-State: APjAAAU0ZHEksiZT3R/Vm2ocDpWwqOj+XOFH2/KFVhLMNpOmiNMYPXw8
        vFYCK2+WkZ9+iWIRf/I5n8kL3PCJ
X-Google-Smtp-Source: APXvYqxQAVkVPtZlboJwPrEyrh1/zM//7vfMSYoMQby264TDJGJMaMchJFSGYZtuTNEJgBbkPVpc9Q==
X-Received: by 2002:a63:184d:: with SMTP id 13mr16888243pgy.132.1580092222214;
        Sun, 26 Jan 2020 18:30:22 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k12sm13122188pgm.65.2020.01.26.18.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2020 18:30:21 -0800 (PST)
Date:   Sun, 26 Jan 2020 18:30:19 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Convert gpio-keys bindings to schema
Message-ID: <20200127023019.GD184237@dtor-ws>
References: <20200123214222.17897-1-robh@kernel.org>
 <20200123222508.GB184237@dtor-ws>
 <CAL_JsqLNG0i9QbRiueXAZ6LjAGN7Mx0vaoUM43np8Jn4qOuiZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLNG0i9QbRiueXAZ6LjAGN7Mx0vaoUM43np8Jn4qOuiZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 23, 2020 at 07:35:06PM -0600, Rob Herring wrote:
> On Thu, Jan 23, 2020 at 4:25 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Rob,
> >
> > On Thu, Jan 23, 2020 at 03:42:22PM -0600, Rob Herring wrote:
> > > Convert the gpio-keys and gpio-keys-polled bindings to a DT schema. As
> > > both bindings are almost the same, combine them into a single schema.
> > >
> > > The binding said 'interrupts' was required, but testing on dts files
> > > showed that it isn't required.
> > >
> > > 'linux,input-value' was only documented for gpio-keys-polled, but there
> > > doesn't seem to be any reason for it to be specific to that.
> >
> > Actually, there is: with gpio-keys-polled we take a "snapshot" of the
> > entire device state, so we know when to generate a 0 event (the example
> > we have a device with several GPIOs with values assigned 1, 2, 3, 4, 5..
> > values, when one of the gpios is active we generate event with given
> > value, when all are inactive we generate 0 event). This does not work
> > for interrupt-only driven device.
> 
> Okay, it wasn't clear to me reading the binding doc. I'll make it conditional.

Actually, I think we can make it usable in interrupt-driver driver. For
EV_REL events we do not need to "go back to 0", and for EV_ABS, if
desired, we could allow specifying an option to scan all GPIOs
on any interrupt. This obviously will not work for pure interrupt
devices (where we do not have GPIOs).

Thanks.

-- 
Dmitry
