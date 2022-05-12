Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A3C5257DD
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 00:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359215AbiELWfT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 May 2022 18:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358082AbiELWfS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 May 2022 18:35:18 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AD420957E
        for <linux-input@vger.kernel.org>; Thu, 12 May 2022 15:35:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id k2so9135316wrd.5
        for <linux-input@vger.kernel.org>; Thu, 12 May 2022 15:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5J70ozAJK55smavundSTiA9hCCsVFf1ONtV3iwOfrVg=;
        b=P9+zolILQOMZs7U99ZzakK+4aGDWUi3Lmi2i6fpVgmYCuTA8kHg8wOXelmRHty0z8s
         +ujOm7PaZVFR3w0wCqoIuBZXvTTd2AgCPmZRso7Uqg5Q71KdPmqORPyzde5yrIjrLbDX
         l+so3/o0FkQy4dyS8znWzHvH6gRelszEe6BnZOHYRTsOanDv0eo/bRbmTm+ACaSKtcr+
         PRJO+xzTj9bWMfzld/Ugk8Z8tsunJZwB4xjG6fsd04zF/4N59cg1Gbzw0uoNSqwU02ZG
         3Lnd7DhycHQArN6vDrUuHFGkXwiBVmjvdYh36NvFPb4tL7z2wt7jo+o8E4mTo8bwP51N
         XRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5J70ozAJK55smavundSTiA9hCCsVFf1ONtV3iwOfrVg=;
        b=maUXn2FCNR0rk3id7k/9MYd0TkZj1dpBB4dhw5/Z9OiVSQsGjjPAGKRe97hri3RK+w
         yXVu0c77lZpbWMGEJ9vUubu4WIpEB96Y1h3c+ZCfHf6rODT3fUfTUxegFHb5mJriY5s5
         vf3kWNf6MXVcZBun3gf1V8GjY/CeHkfT75QLAEJQcqTr65Sjs5dV56cdpl645rUQ4OpW
         2b/AiHpbDVOaHYJo8y/qFhtpQndi6riBj8FO3hzlZUTOF0y8Zz444v1DCayyKHKygslT
         xy5I1Rb+swComuE0hX5XxskTGIqkKxsA36QuUMzFxvOd9Do16sLjhViCa59tcgFAIDpJ
         MzPQ==
X-Gm-Message-State: AOAM533g19YNHECeuKwlOyPAM8iUGRUMvfhkvBvIzV0VhKTPB5PHHw5+
        vKVG8hX8czZBWPs60Wkpown6Cy1bpjGoREVX7XBUIA==
X-Google-Smtp-Source: ABdhPJxtXM4Sjvv6ZxQShLu3owghnDtYvKTpEFabEa4nBpRPrdUAEkmQVXsjul/DL0vNXeegGcaKUJD15rAsAoLj3HM=
X-Received: by 2002:adf:fec2:0:b0:20c:6ffb:9598 with SMTP id
 q2-20020adffec2000000b0020c6ffb9598mr1474816wrs.418.1652394915757; Thu, 12
 May 2022 15:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220405183953.2094007-1-pceballos@google.com>
 <nycvar.YFH.7.76.2204210947590.30217@cbobk.fhfr.pm> <CAKdAkRQ7yxFFGJg41UxptxapKiP4bmHsfw7dRNE+LPzs1PRk=A@mail.gmail.com>
 <nycvar.YFH.7.76.2205121252090.28985@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2205121252090.28985@cbobk.fhfr.pm>
From:   Pablo Ceballos <pceballos@google.com>
Date:   Thu, 12 May 2022 15:35:00 -0700
Message-ID: <CAO9JgFwA5ZhwOOY0cU3HpMOV69CTumQ50zEgU6SPNAF0zDbCGg@mail.gmail.com>
Subject: Re: [PATCH] HID: Driver for Google Hangouts Meet Speakermic
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 12, 2022 at 3:53 AM Jiri Kosina <jikos@kernel.org> wrote:
> On Thu, 12 May 2022, Dmitry Torokhov wrote:
> > I am curious, could not this be achieved without a kernel driver by
> > simply using udev to map this usage code to KEY_RESERVED?
>
> Hmm, good point, using KEY_RESERVED mapping to achieve the key being
> actually ignored didn't immediately occur to me.
>
> Pablo, could you please verify that it behaves in the expected way, and
> confirm that we could drop the 'driver' in favor of udev rule?

I think I've achieved the same result by adding the following to udev
hwdb. Dmitry, is this what you had in mind, or is there a better way
of doing this?

evdev:input:b0003v18D1p8001*
 KEYBOARD_KEY_b002f=reserved

Pablo
