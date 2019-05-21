Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8E3E25147
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfEUN6O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 21 May 2019 09:58:14 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43744 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfEUN6O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:58:14 -0400
Received: by mail-qk1-f193.google.com with SMTP id z6so11066560qkl.10
        for <linux-input@vger.kernel.org>; Tue, 21 May 2019 06:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9O8ckb7uxVFJ//ox9IvAmefEDOvxUsseToexSnoT8pQ=;
        b=eBt97YkZF4jH2JliZ0N8ODfsXJjtYLc98t3802yyy/kWpERUrevJcIoX/OYca2v2oO
         GlWQA5f9/x63/JHPww9WeemcA4oCQWytZ2W6w31fOe+6ln9ft4gDoMED6XjR1Btl/hkR
         ABzqIe9w5ShTIlF/gbiCvb80iLlsALm141EpgjHaLH5zAkpkuH3SyjJXN3Qaf9QNKwV4
         vRcqYnmkGZUmtIGKqhhcQgcaDk2wEO/Xhy9y3iM4e2N09RpiZ3I+LVpt9y9Hc6WBfXRT
         dKzQoD7Hmsg3BWPUO39S4vGNkNjTqYBCfVdGRrxRWp7+hkfcdkzARlsdMHG1LPTCNXh+
         Qkrg==
X-Gm-Message-State: APjAAAW293c/keR1+PkfLEKO5paVcRQzb3ZB40SFw2OYlfOG9PbTXTao
        1BRpvSaed0LLii8Dao3LZpv+dLbej3abdW2NnFPGWg==
X-Google-Smtp-Source: APXvYqzMpLfnT/YGYtVzFI5EWHMlYOqg+qfnY276uGSktPVGL781p5pFOpJHltwv7KWpA0dL+Flhbm35wLZAeu70Blg=
X-Received: by 2002:a37:9085:: with SMTP id s127mr41834500qkd.352.1558447093095;
 Tue, 21 May 2019 06:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190308051117.21899-1-kai.heng.feng@canonical.com>
 <CAO-hwJLDuMZuqKiawnkq3YxL6T9SqNGqQ1Q_Vs=kMKmsx6SD0w@mail.gmail.com>
 <08CA35F5-1ADC-4C55-ACF5-04B19CC77A25@canonical.com> <nycvar.YFH.7.76.1905092130010.17054@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1905092130010.17054@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 21 May 2019 15:58:01 +0200
Message-ID: <CAO-hwJKctsp9=ZJuJB6YRtA+RHuv1NJ+9cWp9hub8oATh1MXCA@mail.gmail.com>
Subject: Re: [PATCH] HID: Increase maximum report size allowed by hid_field_extract()
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 9, 2019 at 9:30 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 26 Apr 2019, Kai-Heng Feng wrote:
>
> > >Ronald (Cc-ed) raised quite a good point:
> > >what's the benefit of removing the error message if this function (and
> > >__extract) can only report an unsigned 32 bits value?
> >
> > I didn’t spot this, sorry.
> >
> > >
> > >My take is we should revert 94a9992f7dbdfb28976b upstream and think at
> > >a better solution.
> >
> > I think using a new fix to replace it will be a better approach, as it at
> > least partially solves the issue.
>
> Guys, did this fall in between cracks? Is anyone planning to send a fixup?
>

Kai-Heng, have you been able to work on that?

Cheers,
Benjamin
