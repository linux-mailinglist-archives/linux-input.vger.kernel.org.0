Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00F8253AAB
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 01:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgHZXb4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 19:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgHZXb4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 19:31:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42CCC061574
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 16:31:55 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id i14so1907469lfl.12
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 16:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S4n7a75DEM7WwquowZ4vjEREmxGQxQAr0Z1wgHvDmC4=;
        b=QKeqSWyVGgrpwdeNdrnaF+LIYbKWZvTeaoqiZzZCTt77pa6SpTDXid3Uvd7mmSNKOE
         veGlR3kJSOF3qSGgyq1FdFwh9pZj0y8eP+udIPhk+Ktz+zi8suPDfatdSDmHLcYLpTAm
         8mLQ8AfwQj2tt3j+hoIHrk7Fzf1VfnHaJc7yiUGA1eGrKfjH4hplAYInM5Ed9/QdBvcD
         JBQ55TwJhoIfeviaAlxzhJbbvDtBSE4jb7diGMtfDb16Rv/LMyDOrFmbcL+0oAw/nyY+
         4SS7uH3HM4ZvEO5ttUYXzeHYOhGIBsxIUV+TeR6E8JAqlZK+hU6f54SMysCDZLfkCdMf
         TkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S4n7a75DEM7WwquowZ4vjEREmxGQxQAr0Z1wgHvDmC4=;
        b=JkCPR5sq4JeRx1BuG5+NFplK+aSV3/wYzeaZysJ1/lvD/lLUPIlR5YNOK5PhfJdrzM
         2+0WU6e5D61sTkSelglFLkYhRZzqx3Zy2XUNVDEppbvcG3o7B3HNwzYt6tXJCrrU8x3e
         AQf7i2CLexf62/hgaycvg4lPme8LlNSK2D9GdzLb4OvTfZpyD8nCRCF50Q6XjUZMfgVc
         zXmiw85Kgd41WMyg2ibWYoTD9BCUNNxRouBUfIgSo8N05a5A9r6R76wN00q06+nQmmVv
         nzgWW6VNCd0EmVxV6TJjkAvbBBlcgyIpgnqgQk2ScKjHytUffbDjQ8g68NAPTBM7+sDy
         3zGQ==
X-Gm-Message-State: AOAM5305hs7oFKS9WM1+lJFS40nFwryaJGBbNuY5oH5PhrmxiaePPBv2
        B/aMQpqxDmE9hJlmQ4FVMq1kYyQ60WsGYVcZ0U0ewHzQWek=
X-Google-Smtp-Source: ABdhPJw8c8sJcUJT1594XBJoTQMu0eSKKfQ1H72YDDK1eTSHH6if97Pk+neJHCLD7GOoTpWULm/mjEmeDJRPguNkevg=
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr8577979lfq.89.1598484712856;
 Wed, 26 Aug 2020 16:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20171124093045.5961-1-linus.walleij@linaro.org>
 <20171125233324.afdt4netamvkrkm2@dtor-ws> <CACRpkdb6kt8Bb0FnPoixw97R9oktK9h3uTS7JfdxoCKfLo4yhA@mail.gmail.com>
 <20200826143543.GC813478@kuha.fi.intel.com> <20200826161222.GA1665100@dtor-ws>
In-Reply-To: <20200826161222.GA1665100@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Aug 2020 01:31:41 +0200
Message-ID: <CACRpkdb4YkCZFF759v1zxw10_DUiFV_PAtD0WFnRn_yLZXUCrw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Make gpio_keys accept board descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 6:12 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> my changes to improve the fwnode handling of references have landed,
> a while ago, so now I need to refresh the series of patches to gpiolib I
> was working on around Plumbers time last year. Linus seemed mostly OK
> with them, so it just a matter of finding time and picking this up
> again.

OK I'll be happy to help of course, I am fixing board files to use
GPIO descriptors a bit all over the place but then I am only fixing
the GPIO problem, and this approach is more ambitious so I am
excited if we can move it forward.

Yours,
Linus Walleij
