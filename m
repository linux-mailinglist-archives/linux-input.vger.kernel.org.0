Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2002C4252E4
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 14:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbhJGMWg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 08:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241229AbhJGMWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Oct 2021 08:22:36 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31B7C061755
        for <linux-input@vger.kernel.org>; Thu,  7 Oct 2021 05:20:42 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id e144so6531936iof.3
        for <linux-input@vger.kernel.org>; Thu, 07 Oct 2021 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUwBi7p2IIzyFnQbSlK/hVI6tUn2bXnu7tf0tYD6aHQ=;
        b=Fon4liYnpexUcFj4VsaWiC8kfFDXKRlmx811i46p5UTvAPCY6faWAiuiEg2z/l8QHF
         UCKWVmXkP1pQvDJJjGliJ0kypms2lplrXZbxi5T9snoasjTbWjDig4EVOMEXlH3nN/M6
         C7xgdu1gO18XV8VTt8LlzobWCqLP/ktk4nBCpULGnHYmQDJviAZlSIn1wB8Ly9TS7NPS
         0uXW+a97T2r1N4oghguXWRQjawmtw4Xv++Gu2uoioCzZ+9wMi0Wk9LFdmk3VJW7Bjip/
         575AKM5QFlF0o/iUx98lmS8gVx6icHrdHkAXEC9WdRTFVVxlS3iV8pG5kO/G/tiT3tb9
         Gb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUwBi7p2IIzyFnQbSlK/hVI6tUn2bXnu7tf0tYD6aHQ=;
        b=VPsewW0So5Ef+pWjDSAi0nesC4it79dBZl6oTA8FEOP0Fosu5umgqKUiBYXd1sWn1Q
         N4JOAwxRL2qG6t1err3ePBIkDWB+oTTWcuCsniYYJmCbAFX9eqzOQ9kvn8vz/1PTODkI
         QLvB1tXtwXSS/O/mhjw+08f2nSPxPms73n+Ex0l5qwbbqFJTZ2D7i/ZWXEHUfsQ1LxB6
         vrcyPRcxF9hJgshqTPCbCWq5xp7jlaH/J0KfIuYiNKVWh7avbcPFOkVUlvOxTnkTjOvm
         NLhq+fSYcox6WrLOEPO3YZCX7OZYaM1SNjxAtm0+qHlDjfLXFxb1F3DnXAjRNCbg2SdT
         N24Q==
X-Gm-Message-State: AOAM532dDEbwqshbfjzXwtYIQntY2mHXTnXPbO84Evqzm8UyaTtzOwv7
        8oZZe3hzIBcSE+v3GScHexl+CtgRbJZHLOf7cNdOeHymePlSWg==
X-Google-Smtp-Source: ABdhPJylbWyGYvH1YQrUCHmuNAgqzIUYPj1I25aVu2Ixf8Z9C7B2atBYcyvsFqj2BLh7OUmBXO55FSEF65j1mUhqbqA=
X-Received: by 2002:a05:6602:490:: with SMTP id y16mr2806953iov.169.1633609242251;
 Thu, 07 Oct 2021 05:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210926151847.337767-1-angelo.dureghello@timesys.com> <YV4BKqLSVhMuxOeP@google.com>
In-Reply-To: <YV4BKqLSVhMuxOeP@google.com>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Thu, 7 Oct 2021 14:17:59 +0200
Message-ID: <CALJHbkBH1osQzufgjPE9dpKM=dV5BgVT-nBxoJiq3c7bmdLXqw@mail.gmail.com>
Subject: Re: [PATCH] input: keyboard-matrix: add a function to reset input states
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dimitry,

On Wed, Oct 6, 2021 at 10:03 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Angelo,
>
> On Sun, Sep 26, 2021 at 05:18:47PM +0200, Angelo Dureghello wrote:
> > In some cases, at open(), when matrix_keypad_start() schedules
> > matrix_keypad_scan(), some events may be fired, but they can't be
> > grabbed from the event queue by evtest later on, since this
> > condition causes a continuous event triggered.
>
> I am not quite sure what you mean by "continuous event triggered". Could
> you please explain in more detail?
>

sure, mainly, without this fix, by using evtest, i get
continuously the same key event (last key of the keypad),
even if evtest is supposed to remove the event from the queue,
the event is always there. Then, pressing a key of the matrix
keypad, things get fixed, i get the key press event, then events
stop, queue is now empty, no other events are detected.

Honestly couldn't go much deeper, but the behavior described above
is originated from calling:
matrix_keypad_start() ->
  scheduled_delayed_work() ->
     matrix_keypad_scan(), that detects some initial key pressed state
        and fires an event, and interrupts are not enabled still.

Cleaning key states before enabling them solved the issue (i am on
a sun8i H2+).

>
> Thanks.
>

YW, available for any test in case.

Regards,
angelo


>
> --
> Dmitry



-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
