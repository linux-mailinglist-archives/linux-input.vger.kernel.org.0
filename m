Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96411C650E
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 02:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgEFA1u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 20:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgEFA1u (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 20:27:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C29C061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 17:27:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h12so1782236pjz.1
        for <linux-input@vger.kernel.org>; Tue, 05 May 2020 17:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+h7dhtm1dIcm+XL/E2colsrYAsoON6/v5DxKj2lyMAA=;
        b=MTqG4YCuXp6P1JdA7neL9Szy7wBydvzh18Ux603m0ga0yN4XaZIa7qQhYwodyHFxY3
         K7bf0JUvqrwNLhJ2GyU4Kn/EEL6opS04i6tsyH4SeFjfxhN5q5vClMR7HgQB6udGLqFh
         7SOAYlB5GDGkBvfunokcTS1EuhXGY4DaZQ35x2JO90IeYl7/ESEdW2Sie5A8YsPLGRBo
         MskeIq7dJjNDrQxkgUN6hEAusfr4gfn+rplu3jEm/C2E8r4VopjyGvrBFZ9mM0/gOSvr
         UrLtC40x63d8QWLJFxQkbgMqRWpkIfWKK/rYwOYEvJJuGPDKzLCD7raW7gfQq0udNiD8
         j3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+h7dhtm1dIcm+XL/E2colsrYAsoON6/v5DxKj2lyMAA=;
        b=N/loLhBvS6JuURaO+2OoCAFJvuqkrIOnUNBMLHyDObmtAhOdY1NRan5gOTjTxGv7np
         obwAPZU+7ZYqszfEWQS3HzaKSXJ9htn2446dhfdUynBHd9x4w14OgsClq4oGA+uzr71d
         kztTnbQ9y9UPK6HemxzjMoT2cnNHBuxo2Zra47HIty1IMXrwp4OsQhvSop0MwPD1tzE6
         kZ8dS1QCURrXuNBF+nvAxHsh44BJd9AscPXD/zfFx6LrLfJhARkONeo3nNTsonNfj+2O
         bfcCA8729xJjEEXAdwW91DlWkLSBRq3TgUGyinCYOhEIc7Axb2WfWOOyPprjC87YAgHJ
         PUOw==
X-Gm-Message-State: AGi0PuY1G4zZI+H5wzxv+Kpko8MqdxxqUsyN0xFWo4o/oTchhveDmkWN
        NH9eRTckkceO8NKaewWcFSo=
X-Google-Smtp-Source: APiQypInORWk62PCFgR6vZnYHancK31xXSHwj/ICvXhoOF+KM282ejp0kVUILEw0AaWvKFfaDmR4Bw==
X-Received: by 2002:a17:902:549:: with SMTP id 67mr5522789plf.115.1588724869617;
        Tue, 05 May 2020 17:27:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id fu12sm3099704pjb.20.2020.05.05.17.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:27:48 -0700 (PDT)
Date:   Tue, 5 May 2020 17:27:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, kernel@collabora.com,
        Patrik Fimml <patrikf@chromium.org>
Subject: Re: [PATCH 1/2] Input: Add "inhibited" property
Message-ID: <20200506002746.GB89269@dtor-ws>
References: <20200430161641.24503-1-andrzej.p@collabora.com>
 <20200430161641.24503-2-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430161641.24503-2-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrzej,

On Thu, Apr 30, 2020 at 06:16:40PM +0200, Andrzej Pietrasiewicz wrote:
> From: Patrik Fimml <patrikf@chromium.org>
> 
> Userspace might want to implement a policy to temporarily disregard input
> from certain devices, including not treating them as wakeup sources.
> 
> An example use case is a laptop, whose keyboard can be folded under the
> screen to create tablet-like experience. The user then must hold the laptop
> in such a way that it is difficult to avoid pressing the keyboard keys. It
> is therefore desirable to temporarily disregard input from the keyboard,
> until it is folded back. This obviously is a policy which should be kept
> out of the kernel, but the kernel must provide suitable means to implement
> such a policy.
> 
> This patch adds a sysfs interface for exactly this purpose.
> 
> To implement the said interface it adds an "inhibited" property to struct
> input_dev and two optional methods - inhibit() and uninhibit(), and
> effectively creates four states a device can be in: closed uninhibited,
> closed inhibited, open uninhibited, open inhibited. It also defers calling
> driver's ->open() and ->close() to until they are actually needed, e.g. it
> makes no sense to prepare the underlying device for generating events
> (->open()) if the device is inhibited.
> 
>               uninhibit
> closed      <------------ closed
> uninhibited ------------> inhibited
>       | ^     inhibit        | ^
>  1st  | |               1st  | |
>  open | |               open | |
>       | |                    | |
>       | | last               | | last
>       | | close              | | close
>       v |     uninhibit      v |
> open        <------------ open
> uninhibited ------------> inhibited
> 
> The top inhibit/uninhibit transition happens when users == 0.
> The bottom inhibit/uninhibit transition happens when users > 0.
> The left open/close transition happens when !inhibited.
> The right open/close transition happens when inhibited.
> Due to all transitions being serialized with dev->mutex, it is impossible
> to have "diagonal" transitions between closed uninhibited and open
> inhibited or between open uninhibited and closed inhibited.
> 
> While open()/close() could be used in place of uninhibit()/inhibit(),
> underlying driver implementations have very different ideas of what it
> means to open/close, to suspend/resume or to pm runtime suspend/resume.
> On top of that close() does not return a code, so using close() there be
> no way to actually fail inhibiting.

While I totally agree that we want to allow drivers to have flexibility
in implementing open/close/inhibit/uninhibit, I believe for majority of
devices using close() in place of inhibit and open() in place of
uninhibit is a very viable solution and will allow us to realize most of
the power savings.

Can we try to fall back on open/close when uninhibit/inhbit is not
present?

I think this will also require some preliminary work in the drivers with
regard to suspend/resume, as they tend to directly check
input_dev->users when deciding whether they need to power up the
hardware/take it out of sleep. With inhibit in place we need to beef up
this condition, I'd like to have something


bool input_device_enabled(struct input_dev *dev)
{
	lockdep_assert_held(&dev->mutex);
	return !dev->inhibited && dev->users != 0;
}

or something similar.

Thanks.

-- 
Dmitry
