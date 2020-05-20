Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB421DBA79
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgETRCk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETRCk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:02:40 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1264DC061A0E;
        Wed, 20 May 2020 10:02:39 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id k18so3992288ion.0;
        Wed, 20 May 2020 10:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RbtzaMFf7pW30QhNWNbIkxxpmi1TRj00OoVA+lD+dhA=;
        b=mOFVaX5s6qRcKV+xyGlQ+sem0KZHuFDf6yrDBqunG9GQx49qCsmRUnOxqST+G9zs/v
         dWKZ0Or5tmWZ0DDQ5brjtO8bCgt+6Wnuy+HuauNql4aORz75kO6Q7aBCNi3xyUfSVQ8B
         DcKZaQlPeRyQrCCQa7sqheRa7UD50evYDZDeDdMYd96YNSYTbIloxqt+GtIIxcH6/df6
         6krSZioMagemxcgUYvw/KZUNoM19B1W7S6Lk56nh1SEk+e/4WTNHaEOycmxYRQyMVd5L
         Yet4SJ4g9oijUwKGmSMHD0lbBn+0nJeBJvsvolrdN59x7zEHrKvrWU+ZNf+EuxDozLv7
         i5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RbtzaMFf7pW30QhNWNbIkxxpmi1TRj00OoVA+lD+dhA=;
        b=TsJHGMe6/p4FAlAo21FAZ2mOkZDF9H+KKXK8QA0AYWLJLzXIE3EAHChuUAk16Tkgj8
         YooolQPOwLrzIGwKza2FngD/ZPZjtk6WKd2nMUQYe9OwOBWPFHDYULVomaB1A0ZLQpyX
         VojctcgAwR+Z2fLQv2nqsZM1qJFmtRVTdHaKaemeTymBBIT7bRPpGY1GyQH4jU7bYR5b
         +BlPBVc4X8XqwhzO/A7Uwq//WADumJY91HoVZuNd0sPJm/UOCThzOCruz45Co/MCZmts
         OAPofzqJ+AN/I9Wl6/h+tkLXUTFvnnhPyxmii6C8NHhFTvgtvTr7yGma8nWmTBOJqjHb
         Ecvg==
X-Gm-Message-State: AOAM531Km7S31AI+kE5PPkBxGAdjk9QA7afgo80ZNhHbZeuSUDtQ9UrS
        +o7xWugfnvLlzhbzQUI5OBt1cAgV4ac05XZLyDQ=
X-Google-Smtp-Source: ABdhPJxCR1b4ZKgHAom8aTqNjNn7M3DNQKrWMjyk9IkbFxxqQZgfhaAbfsBle2YAKgxNo403mCsuKgoiDSW/Rlun5mc=
X-Received: by 2002:a5d:824c:: with SMTP id n12mr4275005ioo.15.1589994158239;
 Wed, 20 May 2020 10:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200520133432.19738-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200520133432.19738-1-dinghao.liu@zju.edu.cn>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed, 20 May 2020 10:02:27 -0700
Message-ID: <CAKdAkRTyVL0uV0dGxHoEgMyB9FP6b0m60CHy7C4QXeR5WTGAJw@mail.gmail.com>
Subject: Re: [PATCH] Input: omap-keypad - fix runtime pm imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Kangjie Lu <kjlu@umn.edu>, Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dinghao,

On Wed, May 20, 2020 at 6:35 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.

This is a very surprising behavior and I wonder if this should be
fixed in the PM core (or the required cleanup steps need to be called
out in the function description). I also see that a few drivers that
handle this situation correctly (?) call pm_runtime_put_noidle()
instead of pm_runtime_put_sync() in the error path.

Rafael, do you have any guidance here?

Thanks.

-- 
Dmitry
