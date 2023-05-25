Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B513711835
	for <lists+linux-input@lfdr.de>; Thu, 25 May 2023 22:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240695AbjEYUgb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 May 2023 16:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbjEYUg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 May 2023 16:36:29 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F0512F
        for <linux-input@vger.kernel.org>; Thu, 25 May 2023 13:36:27 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3313fe59a61so77255ab.0
        for <linux-input@vger.kernel.org>; Thu, 25 May 2023 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685046986; x=1687638986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soslfsYscN0o7BQUo7VzzwQqW0dKx6g+kZ5IiQeRHRg=;
        b=DnpAG40GlW/Fn3J5pq0+EhqWklWgcwW20pxNMQxWf2Wa3viTjwomwmZEXHbg0o1Qo4
         BHvcUfcuAJuEkURhB3F/0fRlrJX9g9ADmqDnc88LiLQ8q6Ae2xhv6HOv7yNDn6cARwiL
         ZtW6dCnOPcr06kd+cU1gucsgbDOST+xdLh6xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685046986; x=1687638986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soslfsYscN0o7BQUo7VzzwQqW0dKx6g+kZ5IiQeRHRg=;
        b=MmtJxGnGBl2q2p5WYdRDErsiZc785v9dX9glGuaS+G4D2Tx2ZbfjmI7oZxt0wEhjGw
         2iRLG8/QBxLbTmvRHJkTHcXmcwdlzX4lJ0jIgrNP5H83WN1DE3itw19rsZFDQlMewDvI
         QfiAgnEkepxmzqHg8vlNA9SrNnSKekQQrCcmCZ/r1YJd6WhoYcvNGw9+UcREgtY4O+Z+
         HEYbIEInskngU2FaYA8UtBdgKY0kL+/e2x+wR7A+NecFjO/2Hse9zHm8exRpqN4KSTAS
         5f+cFzxF8ySS5p6xrBrwRRaHP6dQYwid0vHd2KB+J83xiGgE5ujJ68RB42PYRDQerX1+
         50dA==
X-Gm-Message-State: AC+VfDxJbe8F4DE85U5BJR6SzURtmhjJBTfZ7MBPCB0725FcLHt06r3b
        UJE8mJGMFNcLJtG+aOv23/xohaAy6hrDMQuuLlU=
X-Google-Smtp-Source: ACHHUZ4XYp9bO9yGukgVbMSot66gxsKKFqQqqahMpM+q7ht4aCEmuUhUGNRnla+dvETqUZOPJmMz9w==
X-Received: by 2002:a92:4b0e:0:b0:338:a648:9c8 with SMTP id m14-20020a924b0e000000b00338a64809c8mr14594672ilg.17.1685046986004;
        Thu, 25 May 2023 13:36:26 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id n6-20020a92d9c6000000b0032a8e1ba829sm540562ilq.16.2023.05.25.13.36.25
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 13:36:25 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-33164ec77ccso38685ab.0
        for <linux-input@vger.kernel.org>; Thu, 25 May 2023 13:36:25 -0700 (PDT)
X-Received: by 2002:a05:6e02:1ba3:b0:330:eb79:91ad with SMTP id
 n3-20020a056e021ba300b00330eb7991admr65214ili.9.1685046984652; Thu, 25 May
 2023 13:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230525203202.646669-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230525203202.646669-1-u.kleine-koenig@pengutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 May 2023 13:36:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VB3KTFUxe_6hx2dZqObkmP-9+Kbuz1EVFJ5uBe0mzELQ@mail.gmail.com>
Message-ID: <CAD=FV=VB3KTFUxe_6hx2dZqObkmP-9+Kbuz1EVFJ5uBe0mzELQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Switch i2c drivers back to use .probe()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, May 25, 2023 at 1:32=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() fro=
m
> struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/hid/i2c-hid/i2c-hid-acpi.c      | 2 +-
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c   | 2 +-
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 2 +-
>  drivers/hid/i2c-hid/i2c-hid-of.c        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

In case it's useful:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
