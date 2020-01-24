Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB97A1476C2
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2020 02:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729246AbgAXBfU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 20:35:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:38144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729232AbgAXBfU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 20:35:20 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12A6621835;
        Fri, 24 Jan 2020 01:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579829720;
        bh=lUsFFBFubN7Kqpvdox2ZHVN9k/+SRSmDmco21YUHlT0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fJGIqwnm+83w9/Z3tvCVyJw/iIoQ3IyH0LMQ0AjizzV1aRCUHlJRjLuU4/elr0Z66
         AqaKafVNr/c0yDqSYUO3DtNB7uCmGEpnejoE7J0P8SVZe+2AnChRyuAS7tmAmHaEq4
         tds06GLUmekYADSWHjttwVLyqK5TQvkR/Y/bhRi0=
Received: by mail-qk1-f180.google.com with SMTP id d10so593081qke.1;
        Thu, 23 Jan 2020 17:35:20 -0800 (PST)
X-Gm-Message-State: APjAAAWhhnus1HuF51ukuPrjwydNWk1xKpi3xk+hg7z1k1hQ9qqWJvLQ
        5ftCRqtK5kCZSfLzfccriRJrNgDUcYzQR5s2Sg==
X-Google-Smtp-Source: APXvYqxRHpYVFGcIL4i71kh6oc0W0k4a0comvWJnL6kSgDqnS2kTF9WUsAbtJyhtQ0hO3c3qE5aWPmYJxDTVfrFdT9o=
X-Received: by 2002:a05:620a:135b:: with SMTP id c27mr336288qkl.119.1579829719256;
 Thu, 23 Jan 2020 17:35:19 -0800 (PST)
MIME-Version: 1.0
References: <20200123214222.17897-1-robh@kernel.org> <20200123222508.GB184237@dtor-ws>
In-Reply-To: <20200123222508.GB184237@dtor-ws>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 23 Jan 2020 19:35:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLNG0i9QbRiueXAZ6LjAGN7Mx0vaoUM43np8Jn4qOuiZg@mail.gmail.com>
Message-ID: <CAL_JsqLNG0i9QbRiueXAZ6LjAGN7Mx0vaoUM43np8Jn4qOuiZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Convert gpio-keys bindings to schema
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 23, 2020 at 4:25 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rob,
>
> On Thu, Jan 23, 2020 at 03:42:22PM -0600, Rob Herring wrote:
> > Convert the gpio-keys and gpio-keys-polled bindings to a DT schema. As
> > both bindings are almost the same, combine them into a single schema.
> >
> > The binding said 'interrupts' was required, but testing on dts files
> > showed that it isn't required.
> >
> > 'linux,input-value' was only documented for gpio-keys-polled, but there
> > doesn't seem to be any reason for it to be specific to that.
>
> Actually, there is: with gpio-keys-polled we take a "snapshot" of the
> entire device state, so we know when to generate a 0 event (the example
> we have a device with several GPIOs with values assigned 1, 2, 3, 4, 5..
> values, when one of the gpios is active we generate event with given
> value, when all are inactive we generate 0 event). This does not work
> for interrupt-only driven device.

Okay, it wasn't clear to me reading the binding doc. I'll make it conditional.


> > +      properties:
> > +        gpios:
> > +          maxItems: 1

> > +
> > +        interrupts:
> > +          maxItems: 1
>
> We support "interrupt-only" mode where we do not have GPIO, so for
> "gpio-keys" we need either interrupts or gpios or both, and for polled
> we must have gpios (and I guess we simply ignore interrupts if they are
> specified).
>
> Does this binding manages to enforce this?

Yes, this hunk does that:

+      anyOf:
+        - required:
+            - interrupts
+        - required:
+            - gpios

Rob
