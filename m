Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA09C218A4
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 14:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfEQMz0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 08:55:26 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43080 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbfEQMz0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 08:55:26 -0400
Received: by mail-qk1-f193.google.com with SMTP id z6so4332789qkl.10
        for <linux-input@vger.kernel.org>; Fri, 17 May 2019 05:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ydvVx/ZKTfjPIX9470SKNHp1S7/gx9KTp33XYHkpnI=;
        b=mFWpSx/Lz5kW9NEt1sVGmKW6gJ0fk8IC0pfcuAtYi0s3i8yGGq154kdPcBxIqWAwIm
         IVDE2hHN2UUmY0sw2keepqguiWPZtUB46GmNnwDNXybh7H/4dhqppB0NfAShO00j7vRW
         ELkBIcx5iFpADh10yAbe8R92j1yrdlqHLaajEHTCcmaDeguWOtgLIzUQri/zva3lhk1b
         B5nrkq0TzzK/uFa0NSnXpZTayu3jaXudTrjxzTrQB/NVfA4VD8guVfolUmS0DRZ7MGEF
         hBPwi4fOEc7aK0/qFvgGqK3qyPGON/Fm9PaVNyIvPXR1dfYZk4SW1S7t8D/Za1cr6vkR
         7/zw==
X-Gm-Message-State: APjAAAUWK0BvYtwB8foI9foinj4wRkWqwHEz++sUDiz2EAYDF5TG5ZOS
        zApJz1QWzuS3j6KUOqmJaQs937S6ubphhcoMx1Vaew==
X-Google-Smtp-Source: APXvYqwbPdIz+r7dQMaASWDR8gSRIJ0ZYxYojrOpXCRI4QYHZ8Dd4f6MX0c76HNfGUqKP89lsBjCHrVByRgLGB5k9K8=
X-Received: by 2002:a37:ea16:: with SMTP id t22mr18532188qkj.337.1558097725913;
 Fri, 17 May 2019 05:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com> <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 17 May 2019 14:55:14 +0200
Message-ID: <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Aaron Armstrong Skomra <skomra@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 17, 2019 at 1:58 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:
>
> > Add support for the Inutos Pro 2nd Generation Small.
> >
> > This patch set is based on top of Jason's two existing patch
> > sets sent Apr 24th and May 7th.
>
> I don't think I've seen those two sets ... ?

I have them in my inbox at least. And it seemed you were not Cc-ed on them.
https://patchwork.kernel.org/project/linux-input/list/?series=110743
https://patchwork.kernel.org/project/linux-input/list/?series=114835

Sorry, I am catching up with fires everywhere, so didn't have much
time to apply patches.

The first series looks good and can go in for-5.1/upstream-fixes I
guess. I *think* the second series is fine too but I didn't have much
dedicated brainpower to process it yet.

Jiri, do you have time today to take care of those or should I try to
get a little bit of time later today?

Cheers,
Benjamin
