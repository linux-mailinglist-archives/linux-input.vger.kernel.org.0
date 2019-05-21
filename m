Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB5042557D
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 18:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfEUQYg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 21 May 2019 12:24:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47262 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728055AbfEUQYe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 12:24:34 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hT7Z1-0001a2-1g
        for linux-input@vger.kernel.org; Tue, 21 May 2019 16:24:31 +0000
Received: by mail-pg1-f198.google.com with SMTP id y27so8750679pgk.15
        for <linux-input@vger.kernel.org>; Tue, 21 May 2019 09:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=f4cWlqI1jUt2yNrVL6MD7H0kVA2/rVI2x02kwXGnxEI=;
        b=C6vmFQtVc8kNPYAJO2cpso7LgKzy5JCnXHRnY204xheSyGVNev/ILtrdP7fKt/vSZH
         ZU/PRugA5zJlg2vuv+ccTP73EgwlN3Mn2kmHgBvdVQjP7hlhq1lrdDCIY19oe+8BRKZF
         Q9TzZa5ewnnVXfovTyGi78HFWxi1AppbhIdaxnbihC7BYHQzqMmDw9/iEaAweBDk4bOb
         Y244HO/dzoW89SZQJ/maqTeATDBemJKoHsn88d5GraH9SDL2ThLuIo1emhEQ/tYZEyv2
         Uo3JcoU1A7vnm2ppWuAaLNBJV+vXLVWCUvxNcvqoYXp0fi2xTjFlX92pyt+31ek+buWt
         Iz4g==
X-Gm-Message-State: APjAAAX3vNVq7sIFHb1xnOIqS8pXpBkNNgeGmU2Q2tsh0yRwsPpHETUi
        A8QkCZWGBtTJoWYJENOw+V4yNvjK9d0g7Uo1sU6h5caPIt4rZVTPLBS5uKm/funS33Bdotd618i
        a6g/ABSZpBG/zUyY93XwEJNgt093oQciz9o88v3rw
X-Received: by 2002:a62:14d6:: with SMTP id 205mr88663377pfu.4.1558455869557;
        Tue, 21 May 2019 09:24:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0icQMTSNtq9BqYzHs17GjjnPoz2+R7usA4YqD3bB20+3eE7xxYWkuGE+Tly2KDyXI6Dt6Cg==
X-Received: by 2002:a62:14d6:: with SMTP id 205mr88663344pfu.4.1558455869288;
        Tue, 21 May 2019 09:24:29 -0700 (PDT)
Received: from [192.168.1.220] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id g83sm38252903pfb.158.2019.05.21.09.24.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:24:27 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] HID: Increase maximum report size allowed by
 hid_field_extract()
From:   Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CAO-hwJKctsp9=ZJuJB6YRtA+RHuv1NJ+9cWp9hub8oATh1MXCA@mail.gmail.com>
Date:   Wed, 22 May 2019 00:24:24 +0800
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        =?utf-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>
Content-Transfer-Encoding: 8BIT
Message-Id: <1B225693-9307-46E2-B468-1529B1FF03CD@canonical.com>
References: <20190308051117.21899-1-kai.heng.feng@canonical.com>
 <CAO-hwJLDuMZuqKiawnkq3YxL6T9SqNGqQ1Q_Vs=kMKmsx6SD0w@mail.gmail.com>
 <08CA35F5-1ADC-4C55-ACF5-04B19CC77A25@canonical.com>
 <nycvar.YFH.7.76.1905092130010.17054@cbobk.fhfr.pm>
 <CAO-hwJKctsp9=ZJuJB6YRtA+RHuv1NJ+9cWp9hub8oATh1MXCA@mail.gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> On May 21, 2019, at 9:58 PM, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> 
> On Thu, May 9, 2019 at 9:30 PM Jiri Kosina <jikos@kernel.org> wrote:
>> 
>> On Fri, 26 Apr 2019, Kai-Heng Feng wrote:
>> 
>>>> Ronald (Cc-ed) raised quite a good point:
>>>> what's the benefit of removing the error message if this function (and
>>>> __extract) can only report an unsigned 32 bits value?
>>> 
>>> I didn’t spot this, sorry.
>>> 
>>>> 
>>>> My take is we should revert 94a9992f7dbdfb28976b upstream and think at
>>>> a better solution.
>>> 
>>> I think using a new fix to replace it will be a better approach, as it at
>>> least partially solves the issue.
>> 
>> Guys, did this fall in between cracks? Is anyone planning to send a fixup?
>> 
> 
> Kai-Heng, have you been able to work on that?

Sorry, I haven’t been able to work on this.

Please revert the commit and possibly use *_once() macro to reduce the noise.

Kai-Heng

> 
> Cheers,
> Benjamin

