Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 810BD577DEF
	for <lists+linux-input@lfdr.de>; Mon, 18 Jul 2022 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbiGRItb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jul 2022 04:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiGRIta (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jul 2022 04:49:30 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14412959F
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 01:49:22 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31e0d4ad6caso39146777b3.10
        for <linux-input@vger.kernel.org>; Mon, 18 Jul 2022 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uf2fE/0hDuLDszn4pybySk9+4Rh+IzBbKY4HkaaPWzM=;
        b=BHT4SeiR6w5gEJkDvg4jjRln0tNDdY+q/W2KIJMB4PSAqfeMuhwlhLgRK969iajt+Z
         ivZIOjMaeTMU9tznWox0N/ahMYg7PkECRPHqrJ68OvgT34jEplkglLLAfLiNTLoXcmfN
         fJsE9RynCvOjnyCsbiw54KXftqos/mfR6+2e9FfzWJY3Fu8HrAIbEtTQZxs72nqAsO/1
         LjJ4xrSBFbu9SpU892LMUHEfrvA2qMDKxdYUK4aqm8rsORnLR1di+ogs0IOu4Xjw8MYw
         J4L4+IRebhWKM6/bnEn2w7ICp+9TZa+iCFBdWI3PB7gk2UW66+1mS1sk5GEZQvOsHVfK
         9/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uf2fE/0hDuLDszn4pybySk9+4Rh+IzBbKY4HkaaPWzM=;
        b=z2ZV+iLsFrHiw7ajomrxdGfbBpD6Hbp71b3H27UKOTHv7COArttViz6CestYRWVSbW
         /x5aCC7Y9tJx+HbkDCWpQ3A+69s5wYljXrWxtbrGIMgG40ufqTfsM6+63LBMJR70uELE
         5l3hBtfxGKqcs8XT0/61Wd41W2KPFwU32Bj4Hy60jdj/wYKqUFpFm1fsvotGMM8opy1a
         vi29ky9kjBr5mHsSF96YZz0uedV4h2W8AREDBmsI4PEzzUIKupGPBlG+h6jTpkOD+f5l
         Uk1R94XztT5G2oKL9KIh8u0Uo6SvBdcdq0vs+YoZqSUj344FaWQIjFRJQvcLJpmyL40K
         NTDQ==
X-Gm-Message-State: AJIora9mlk7Nd9jlTwzcm6lKe7mmGySZXlkAfTxoUQz5gihZOde5WdZa
        NO2zgUvw0Tyjcy/I/IrcjHSLE01dAmdTs2mHfrn+FQ==
X-Google-Smtp-Source: AGRyM1sNxkyqmrpQniN+UyiWr/GH0KrKltDOCe2UD8gHB0PUK83teOyK5euq7Wy7U1nSca88Z1JM4fzTuaFxHGj9lSA=
X-Received: by 2002:a81:645:0:b0:31c:c8e2:1c5d with SMTP id
 66-20020a810645000000b0031cc8e21c5dmr28456360ywg.282.1658134161337; Mon, 18
 Jul 2022 01:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <YszNfq4b6MkeoCJC@google.com>
In-Reply-To: <YszNfq4b6MkeoCJC@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 18 Jul 2022 10:49:10 +0200
Message-ID: <CAB4aORWRWBj8a5d=0Jy8-+xARNuStH5R1AZrvhLuG5T6_5DVDg@mail.gmail.com>
Subject: Re: [PATCH] Input: properly queue synthetic events
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 12, 2022 at 3:25 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> We should not be passing synthetic events (such as autorepeat events)
> out of order with the events coming from the hardware device, but rather
> add them to pending events and flush them all at once.
>
> This also fixes an issue with timestamps for key release events carrying
> stale data from the previous autorepeat event.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Angela Czubak <acz@semihalf.com>

Regards,
Angela Czubak
