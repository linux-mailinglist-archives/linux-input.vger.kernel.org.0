Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0D56B2AB8
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 17:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjCIQ2s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 11:28:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjCIQ2Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 11:28:25 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F81030B1E
        for <linux-input@vger.kernel.org>; Thu,  9 Mar 2023 08:19:43 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id k10so9074222edk.13
        for <linux-input@vger.kernel.org>; Thu, 09 Mar 2023 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678378715;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pU1OTBYl8ElxfZaqjfIJsMTqsKjO/PQMi+tQNnzKT4Q=;
        b=Y5iOhApeaOqysVtMq3H6OyW1ab6LE1/SB56phCySXGyIsJMKcg/3OImcHfR9Hp+Wtz
         WzpBaVqLYwul4amz7Cc9gvp7lR3c+Ih5n6+njJjqv8Ddw55K4FKBjjsf6mXb4HyURtJn
         rU3pbCrhFlPTNaOdPuavZeU06vVbZ43InkAalX4iE/5VCHExo1ZLnbISsaCJnp8Kf9D9
         vbELMINZnrCj/SZ07dIXE/g8hjgAzKY4S8Ut6Mx0ehuC0gtffZSyJOGkAJfFe/QDUg1V
         WBiCDkhuevn2gBh7qz3kT3Ah91pwCuyug6A0/4TNYdxJXc1cStygOvwH7vNy/nsjkWIN
         Rs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678378715;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pU1OTBYl8ElxfZaqjfIJsMTqsKjO/PQMi+tQNnzKT4Q=;
        b=AEB5YY7tJrOn8Kg8c6oeK7am8c4f/HgsYbasvk878ucTLBHTgiBtxu+gvidLsIk69A
         Ox+8zXt1EJmf3dAFJL0Z+H/3Hf3g+LHFdRRhQguJaMIeSF0E1yRga0qSsfK6OcYXDE70
         6N16xSi19xqDRINH0CTS04K/8qVCrBsAoLcCb+KdyZ3KgEIG1qR64fwbNA2ZHgnYlWgJ
         DSOzH/Hc5oscONPUkS7909MTwj6wN+txGwqbhFZEpU+BYhqNRZQm1O7cqMzhTTC3UMvq
         pujWZbaOSHIcDc2kCHy5SahZ4Zoz38mxt468lZbn4eSUU6Z1fs+IHmjZL5oos03qNmzT
         CvrQ==
X-Gm-Message-State: AO0yUKUiK8NtQWsL8zn1r1QoTTgQl5fO6NzH3AQRNFl+bdqUM/gPY819
        FHNYvfxhsK/ZPFrfr9UFMGoT3n28GmXzV9K4yG0=
X-Google-Smtp-Source: AK7set/uDxSQX6guni2q9LjuMZgDKvnwtVPDVc/y4ZwVZTtKpMFGC+aDylsQfmADZ8cH166t4rv0qg==
X-Received: by 2002:a05:600c:1906:b0:3eb:3c76:c23c with SMTP id j6-20020a05600c190600b003eb3c76c23cmr20444802wmq.3.1678378147773;
        Thu, 09 Mar 2023 08:09:07 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id z18-20020a1c4c12000000b003e876122dc1sm216880wmf.47.2023.03.09.08.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 08:09:07 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jason Andryuk <jandryuk@gmail.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: xen-kbdfront - drop keys to shrink modalias
In-Reply-To: <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
References: <20221209142615.33574-1-jandryuk@gmail.com>
 <87359gkc1d.fsf@baylibre.com>
 <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
Date:   Thu, 09 Mar 2023 17:09:05 +0100
Message-ID: <87o7p1dhzy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jason,

On mer., mars 08, 2023 at 11:26, Jason Andryuk <jandryuk@gmail.com> wrote:

> On Thu, Dec 15, 2022 at 8:54=E2=80=AFAM Mattijs Korpershoek
> <mkorpershoek@baylibre.com> wrote:
>>
>> On Fri, Dec 09, 2022 at 09:26, Jason Andryuk <jandryuk@gmail.com> wrote:
>>
>> > xen kbdfront registers itself as being able to deliver *any* key since
>> > it doesn't know what keys the backend may produce.
>> >
>> > Unfortunately, the generated modalias gets too large and uevent creati=
on
>> > fails with -ENOMEM.
>> >
>> > This can lead to gdm not using the keyboard since there is no seat
>> > associated [1] and the debian installer crashing [2].
>> >
>> > Trim the ranges of key capabilities by removing some BTN_* ranges.
>> > While doing this, some neighboring undefined ranges are removed to trim
>> > it further.
>> >
>> > An upper limit of KEY_KBD_LCD_MENU5 is still too large.  Use an upper
>> > limit of KEY_BRIGHTNESS_MENU.
>> >
>> > This removes:
>> > BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
>> > Empty space 0x224..0x229
>> >
>> > Empty space 0x28a..0x28f
>> > KEY_MACRO1(0x290)..KEY_MACRO30(0x2ad)
>> > KEY_MACRO_RECORD_START          0x2b0
>> > KEY_MACRO_RECORD_STOP           0x2b1
>> > KEY_MACRO_PRESET_CYCLE          0x2b2
>> > KEY_MACRO_PRESET1(0x2b3)..KEY_MACRO_PRESET3(0xb5)
>> > Empty space 0x2b6..0x2b7
>> > KEY_KBD_LCD_MENU1(0x2b8)..KEY_KBD_LCD_MENU5(0x2bc)
>> > Empty space 0x2bd..0x2bf
>> > BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
>> > Empty space 0x2e8..0x2ff
>> >
>> > The modalias shrinks from 2082 to 1550 bytes.
>> >
>> > A chunk of keys need to be removed to allow the keyboard to be used.
>> > This may break some functionality, but the hope is these macro keys are
>> > uncommon and don't affect any users.
>> >
>> > [1] https://github.com/systemd/systemd/issues/22944
>> > [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/=
T/
>> >
>> > Cc: Phillip Susi <phill@thesusis.net>
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>
> Thank you, Mattjis.
>
> Any other thoughts?  Can this patch be applied?

That's not up to to decide, Dmitry might pick this up or give you a
review whenever he has time.

>
> Thanks,
> Jason
