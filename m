Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA642A37A1
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 01:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgKCAS2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 19:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgKCAS2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Nov 2020 19:18:28 -0500
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51EFC0617A6
        for <linux-input@vger.kernel.org>; Mon,  2 Nov 2020 16:18:27 -0800 (PST)
Received: by mail-vk1-xa41.google.com with SMTP id r17so3351076vkf.6
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 16:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5EWBdWu8UMzj2fy/b6+R99bCZwb5PgoyCKlY/KWrK8=;
        b=GyELAh8UJAQ9j8T5R7lfyyPpYgOuleQHhkDVSzcdBjfMkVX+fb93Ww39Y+F7Z50iJa
         U99tzTx9J/3Wnk9U9gYevwzBjmRn0nn2Ld//0+WnA2lH8Em3PHSYtzIn15UUwpvgIF6T
         L0IdmplbDcEThNJBDqHEr97EUeUQ6iCkzk4cU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5EWBdWu8UMzj2fy/b6+R99bCZwb5PgoyCKlY/KWrK8=;
        b=cw4iw6mXU3xYWB1yOHw3JIsismZSavau7uVwZ/fxkrIB5y1kg7EySSEyHe+sP83zh8
         Z08qTg+BTWmi6G/p5UVBqu3JsxBcjAnnqtblYbitzhxdnPXsJKC2S4t1Bnks12ERtCfV
         BUGImNRxMC4TvAkYXcD74l+BMXRDG0CO6RvDmLr89FmGU7b6fe+AYbrsPhoXnxSlNh5g
         y15Y3SwgJAy6RP0CvLQxUdJRBPvMbPYoY9/0DBVd3AHBqsxaPB3466Ic+OHTPqmeWNc7
         nR940XfDNEkOEbqAiiED4FZX+kPqpghcgCzO6kH7rpN8jnZBLd1+oUV6WWGAsJxJvOIU
         jqqg==
X-Gm-Message-State: AOAM532D0g3F0hsgLwG0U2h86lz9WZOfWwdXqNviNv4Nv2OW/mvcjt6K
        5l9StmknUROzMIZSPY6Jmj0KV4cSLNJqvg==
X-Google-Smtp-Source: ABdhPJyTczq7+XUW3nYDwGSN+XZqDamXDwdil4BXKn/jMxBkRDbwLxnoS6Z0FHqqXV2esjOEwZz6YA==
X-Received: by 2002:a1f:a0c1:: with SMTP id j184mr14128779vke.23.1604362706467;
        Mon, 02 Nov 2020 16:18:26 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id f195sm2042611vka.21.2020.11.02.16.18.25
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 16:18:25 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id 128so5689790vso.7
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 16:18:25 -0800 (PST)
X-Received: by 2002:a67:ef98:: with SMTP id r24mr2212207vsp.37.1604362704803;
 Mon, 02 Nov 2020 16:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
 <CAO-hwJLn5XKV+cp+fCRY395uBWuX=JrxgiGSHUnJXFpTzFWu4w@mail.gmail.com>
 <20201030180042.GB3967106@bogus> <CAO-hwJK8c+BrH3u5PMCndv6Jjj6K2z=4nyKMAojD09EcHjBROA@mail.gmail.com>
In-Reply-To: <CAO-hwJK8c+BrH3u5PMCndv6Jjj6K2z=4nyKMAojD09EcHjBROA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 Nov 2020 16:18:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbXGRD8mkg6H57X=EVo8=0ptMz9s+YA0UR3Vwv-DLTDg@mail.gmail.com>
Message-ID: <CAD=FV=XbXGRD8mkg6H57X=EVo8=0ptMz9s+YA0UR3Vwv-DLTDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as deprecated
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Rob Herring <robh@kernel.org>, Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Hans De Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Oct 30, 2020 at 12:12 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> I honestly wish we could have this as a separate module that would be
> in charge of the DT folks, but already having it as a separate file
> would be a win.

I've made my best effort at splitting it into a fully separate module
in my v3.  I'm sure there will be bikeshed-type issues, but maybe it
looks OK-ish now?

-Doug
