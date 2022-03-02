Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435B74C9ABB
	for <lists+linux-input@lfdr.de>; Wed,  2 Mar 2022 02:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbiCBBxL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 20:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235278AbiCBBxH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 20:53:07 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696D2AE43
        for <linux-input@vger.kernel.org>; Tue,  1 Mar 2022 17:52:22 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id 40-20020a9d032b000000b005b02923e2e6so423473otv.1
        for <linux-input@vger.kernel.org>; Tue, 01 Mar 2022 17:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=vdfnwRIKu5DYUDvI8aW2WNexSgzTCYhHbQI8xMj/hS8=;
        b=RHGRjO62I6jEzJ7S2dWOzyGsvSM8jOLkgGIVarLhuC6fM+/hRd/dZziqfqumiJZ4JG
         Y5CoDpz/2i0Qp+Izuhu+OE54vUjFryVAEIbvCfe/RQB2Hi2qL4vPuWfpoyhQZvHawpfn
         T4GuW8A43fdYpAzqkE48ywoMnZMJ0qP4EL0hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=vdfnwRIKu5DYUDvI8aW2WNexSgzTCYhHbQI8xMj/hS8=;
        b=eE0T+OJCV+PbHOngp3li8itfYla4THopdsdQZYyC5GDLPGGEUgSU/8ZIzwq1Cztl95
         1vdRi61WwfYY3ueAxpCqPRLUoYiH1QpRHNV/xmxFsg60k04s+X5oUwWuQdNvH+AKRZiE
         Uw25+/qwViSeloRPTKuzHGcNwsRKfFOl23KUyv3woIbc5jQphcU6mLMf0NrqryYKQ7US
         X4JHaD2uOmDlNe7azwX3Ea+llJZBAVwQuUzkaxQrMTzg6etZd/+jK3jRkLiohAbal5KV
         K2qEdZTOmH6UFdrtw35nnNawQ6Jqbn5hKgWVEMKGAXqyuNnFBRlMo00/qofuElFFW3y8
         6lWg==
X-Gm-Message-State: AOAM531NgFfAciL7y959pNxacSo/n7FxIooLkRfeoOjyvsO2rP4wNFM6
        zd3QeQ98L1JJuDVOXtBksX5NeSd+X93llMbjioUXYg==
X-Google-Smtp-Source: ABdhPJxCarNvqBKqgjFvVC2W8ARPwiZ51Z4L2xMT2xThnKfFYimPZ/tjIjqxJ5mHekjp8sNBo3V/zb+eidxXxLDfNl4=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr13921897ota.159.1646185941695; Tue, 01
 Mar 2022 17:52:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:52:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 1 Mar 2022 17:52:21 -0800
Message-ID: <CAE-0n52mSik7963VsCpBrRKE4gUyJONa9+SDNyoQsYuhWoEGuA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Input/HID: Consolidate ChromeOS Vivaldi keyboard logic
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>,
        "Sean O'Brien" <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-02-27 23:54:41)
> This is a follow-on to this thread[1] where we discussed the need to
> support the vivaldi keyboard function row keys in the google hammer
> driver. I've extracted the common code into a new vivaldi-fmap.c file
> that can be used by the various keyboard drivers used on ChromeOS
> devices to expose the function_row_physmap sysfs attribute. Then we make
> another file to keep the HID parsing logic common for the vivaldi and
> hammer keyboards. Finally, we add support for the function row physmap
> attribute to the hammer driver.
>
> NOTE: I dropped Tested-by and Acked-by as patches have been reworked,
> please give them another spin.

I tested it on a device with hid-vivaldi (coachz) and a device with
hid-google-hammer (wormdingler) and it works on both. Feel free to add

Tested-by: Stephen Boyd <swboyd@chromium.org> # coachz, wormdingler

to the patches.

>
> Changed from v4 (dtor):
> (https://lore.kernel.org/r/20220216195901.1326924-1-swboyd@chromium.org):
>  * The series is on top of [PATCH] HID: vivaldi: fix sysfs attributes
>    leak (https://lore.kernel.org/r/YhmAAjNeTjiNoLlJ@google.com)
>  * Added patch to used devm for keyboard backlight LED in hammer driver
>  * Avoid putting HID-specific stuff in input header, instead introduce
>    new private hid-vivaldi-common.h
>  * More code sharing between hid-google-hammer.c and hid-vivaldi.c by
>    mandating that vivaldi data instance should be the very first or the
>    only driver-private data.
>
