Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702FC3D410A
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 21:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhGWTDV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 15:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhGWTDU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 15:03:20 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3046C061757
        for <linux-input@vger.kernel.org>; Fri, 23 Jul 2021 12:43:53 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so3125968oth.7
        for <linux-input@vger.kernel.org>; Fri, 23 Jul 2021 12:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=QNZENHO+dKLQGyNSvg/QhBqsuG8rka7B9Jc327gNXJ8=;
        b=CSNnsWrOFG1ZAcdGGRrgOLzEMCaNMWwKz0MzVZd4uW2ixO8KgOX7KWYOKeIUp3lzAZ
         iDrsJU9Qa01k3fjKieGNzsdnbu4RAPYIdcxeQFjm/rXPXMJweZF8NpOmBhxtSOzfwScX
         4Vus3o25vEr5CDCVJ9KSKM2OTbTiQPMSKSYT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=QNZENHO+dKLQGyNSvg/QhBqsuG8rka7B9Jc327gNXJ8=;
        b=WaK/UecNS06B2WltyqyG34cm/sOd53yrHvP5ex/hK+4KajEDdvOOybzMDDqMrWA01A
         OeGmsiZYoanvi0WYovntOHKTLBmxUgxDfCRw3Jt7lQyUjo4aoFKOatnez7nWL5qHUR1Z
         CDWdfgsaSCrCp1N7nTTBjz7xp7WDdq24gYVNdQfyIJvMbh8arGcGmxljPVIYXDqQQF1l
         OL50ysVJp1wBdxXGY8vj2HvBSJ2tF8r95I/8WSNX49Z8PVBMeBLFUROlMcEN+8zhr0PF
         oFzkSQJyX15xkhdS4rLZ0dIMICFWiPk9Rw+fr9iktaoRkAJ2XN3lXLihj3XugD1MeS+8
         0VgQ==
X-Gm-Message-State: AOAM532DYYNumYFzzZU3h3Zg7vJxnqSXCV130z6Vk3g0BQVkuYONrf5v
        zvfm3CvXepipwx5lPPSNzgLmpHt1eWn80w8XyrP3LA==
X-Google-Smtp-Source: ABdhPJyJw0X7sgO5YFPGbIoQspf53Y3uWYvU+kcCqW1C12GCjYoNt/WALDXwdFGZSITulJdtesHgrrI0WwJgrAcaIt8=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr4107722otl.34.1627069433207;
 Fri, 23 Jul 2021 12:43:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 19:43:52 +0000
MIME-Version: 1.0
In-Reply-To: <YPsa1qCBn/SAmE5x@google.com>
References: <YPsa1qCBn/SAmE5x@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 19:43:52 +0000
Message-ID: <CAE-0n51y=o+8SZTL_==GPXrDa2OP8fhh98Amv+L4M63rLQVGZg@mail.gmail.com>
Subject: Re: [PATCH] Input: pm8941-pwrkey - fix comma vs semicolon issue
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        satya priya <skakit@codeaurora.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2021-07-23 12:39:02)
> There is absolutely no reason to use comma operator in this code, 2
> separate statements make much more sense.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Fixes: 2fcbda9a822d ("Input: pm8941-pwrkey - add support for PMK8350
PON_HLOS PMIC peripheral")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
