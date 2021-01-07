Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0372EC80D
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 03:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbhAGCWn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 21:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbhAGCWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 21:22:43 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F0DC0612EF;
        Wed,  6 Jan 2021 18:22:02 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id n7so3739344pgg.2;
        Wed, 06 Jan 2021 18:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NGIGzRN3zCMPGV5whylX6uiTJgaykYphIv1TBJIWg4k=;
        b=ZY2QY37skaxbTmULnKLebDqP1thXAaMW6TGEU6e9TRpFVX9DFV9F6IvRFICAqIMou+
         ydz9QWoBBCMvmJYinuXjST8wyhEDKktlSYxKVQLzTQDQpLoxv/ENoL2Za3Us7+5dNJ+e
         CQmS8ZhsFTkppbnjyAN14IykGPC13sCzxUEjt9zd5TG82L5YLG9EkRhpo25Lw0Z5bC8t
         5e+0zFiqUpwPO6tTxKju1Wt5VDMwUcM7EIutp3JhNv4/joYlXokapYFo3S+986ebLWob
         AbmmscMLChcvFUpZwfxc2L4dWNxBnfERpfkvgldKHXp2tTQFemZ4XrNKlKhzoK4ENR+R
         iUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NGIGzRN3zCMPGV5whylX6uiTJgaykYphIv1TBJIWg4k=;
        b=gOTlNQV6YoOoRfsrqSnFR/WNaQxIu7PHzFMFkPsqo3NGd7Ao6vKhXURxzRKp+f6z5I
         GoIwUpK4PpKMTz0zbsk7tg2Fk+rAo8ALNsjmCo0wyhVOgMd6xX+H6WLzBpRi2nbO5GkY
         ZHtBbhi9/DwR77JRYhNftO29JI/HrIsgKARgQakZcUQ7BueA4ABoJZ/LElai/Y/xHhdV
         xNqNdm/Sn8Zukp3qfkocjxC6BmV4PpQLBZAFs1G2Rts3dt58LgDc7b/SZ9xK4iuiGbtG
         FZQPlJp9K/xUdmjO+IlHzJCeRhZXt0crMNqqqQhx5wX8AV80ornNsbo0X+rMU0QnvSI3
         h18w==
X-Gm-Message-State: AOAM530qws22i+p+5JZtUMEHGMayIxzPo+eotN+EEOx0N0TxXvNAb/CG
        tHpL8atUvUOG8Rb8CZgmebA=
X-Google-Smtp-Source: ABdhPJydc3QeiS3r7yd5ZvoeO2TIri1EsKXT1t6ETz/uM+7MkkBOjqMOOF/qYkfvuICbyIhN1Mk2tQ==
X-Received: by 2002:a63:2347:: with SMTP id u7mr7394981pgm.189.1609986122127;
        Wed, 06 Jan 2021 18:22:02 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z13sm284380pjt.45.2021.01.06.18.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 18:22:01 -0800 (PST)
Date:   Wed, 6 Jan 2021 18:21:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add support for a front proximity
 switch
Message-ID: <X/ZwRqJFJ9BY4Z3z@google.com>
References: <20201205004709.3126266-1-swboyd@chromium.org>
 <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Doug, Stephen,

On Wed, Jan 06, 2021 at 05:16:10PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Dec 4, 2020 at 4:48 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Some cros ECs support a front proximity MKBP event via
> > 'EC_MKBP_FRONT_PROXIMITY'. Map this to the 'SW_FRONT_PROXIMITY' input
> > event code so it can be reported up to userspace.
> >
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Benson Leung <bleung@chromium.org>
> > Cc: Guenter Roeck <groeck@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c          | 5 +++++
> >  include/linux/platform_data/cros_ec_commands.h | 1 +
> >  2 files changed, 6 insertions(+)
> 
> This seems really straightforward.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> Given that it touches a header file owned by the Chrome OS maintainers
> and a driver owned by input, how should it land?  One maintainer Acks
> and the other lands?

Sorry about missing this one, however the "front proximity" switch has
been introduced for the benefit of phone devices, to be emitted when a
device is raised to user's ear, and I do not think we should be using
this here.

We have just recently had similar discussion with regard to palm- and
lap-mode sensors and whether they should be reported over input or IIO
as true proximity sensors:

https://lore.kernel.org/linux-iio/9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com/

Based on what we are doing for other Chrome OS devices that expose
proximity sensors (for example trogdor) we have decided that we all
should be using IIO as it will allow not only on/off, but true proximity
reporting with potential of implementing smarter policies by userspace.

Because of that we should do the same here and export this as IIO
proximity sensor as well.

Thanks.

-- 
Dmitry
