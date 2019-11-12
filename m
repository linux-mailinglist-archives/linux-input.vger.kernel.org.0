Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 247D8F93DF
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 16:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfKLPSJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 10:18:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29745 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726645AbfKLPSJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 10:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573571887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eZ/w3v+fPJjhA64sYOvAJQuD2CMUO2/OwSEb5d125yo=;
        b=ZMObrlJNLsei28gQLtegPUo6Ez89xFNemyZSZwmXrMBzLGf/HOvVUVL9wmKLTKURi0Anqf
        8d97EETTmD3BrfpPEhHY9Em08EFJiUOnowzM5rfXNgBB3nKBu11gEJfytMx5MZq4huYaQ9
        eH7FNlpafQphIGb44xl8Dmxaux1CV+k=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-9oN74-2DPnyR9Yp9zuWJlA-1; Tue, 12 Nov 2019 10:18:03 -0500
Received: by mail-qv1-f72.google.com with SMTP id g30so8773398qvb.11
        for <linux-input@vger.kernel.org>; Tue, 12 Nov 2019 07:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZ/w3v+fPJjhA64sYOvAJQuD2CMUO2/OwSEb5d125yo=;
        b=ZXVHAjLm1g1ny5STkPEZzXMbNq5cbJMJ0DXwKQFbq/9cQ2VVOzR7gFo7mStSeafuAA
         AlFdoOkJ2I7hpXjjdQwJ8+CQf3f44TanYWCI/RTM2f4BVfyMn3QxeDclVPpZcNhXtgw8
         mIf3i7iReVYMHAz+i3pCBy/odtBOieWwMJS30e588QiAWrl8v0Q6DfZUpWs5U9CNzWWw
         b05F8/EUgbZ4JtmxSV/UyP4s+lSwyX2THlevt6xHDISSaWq9rfp+YoFsf1KcZL6a/Kzv
         WpHhsHnOIP4o3DpIzNsUlhZiFQJ6Q5IAfFT0/5Cs6CNeuphg8EH7FCmTDaVuvLl1v0VZ
         fnzg==
X-Gm-Message-State: APjAAAVxZZ4DcD1OFemxlsWi6ff8dePc5UURDMTqpAClWWQ+ygg/4aSK
        MD1ZtOhflXQtnjcFEvEZllkBjHKyg+u4G45Kfar6LRKA8IzFbZ+ajWKdaqr12DdO6cRWWJMzIDJ
        yWbN53hJu5XQ8yVF6nvHyPLNiPei7G2jhBQL895Y=
X-Received: by 2002:aed:36a1:: with SMTP id f30mr31845825qtb.154.1573571883385;
        Tue, 12 Nov 2019 07:18:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7AbbV1sBdcbkwhkfsRZEBGRTP+DLdA6rmDz1e1+QvpJX8xRc4WuS8rs8usu0+cQAGd2L1t3PkGc0c/ma7Qx8=
X-Received: by 2002:aed:36a1:: with SMTP id f30mr31845786qtb.154.1573571883103;
 Tue, 12 Nov 2019 07:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20191022142139.16789-1-candlesea@gmail.com> <nycvar.YFH.7.76.1911121457050.1799@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1911121457050.1799@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 12 Nov 2019 16:17:51 +0100
Message-ID: <CAO-hwJKO5u6xUrBe_ne0OqFAHM9dpwtTOWtYW+3z-LxSFT6VWQ@mail.gmail.com>
Subject: Re: [PATCH v4] HID: core: check whether Usage Page item is after
 Usage ID items
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Candle Sun <candlesea@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?B?57+f5LqsIChPcnNvbiBaaGFpKQ==?= <orson.zhai@unisoc.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
X-MC-Unique: 9oN74-2DPnyR9Yp9zuWJlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

On Tue, Nov 12, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 22 Oct 2019, Candle Sun wrote:
>
> > From: Candle Sun <candle.sun@unisoc.com>
> >
> > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> > to Main item") adds support for Usage Page item after Usage ID items
> > (such as keyboards manufactured by Primax).
> [ ... snip ... ]
>
> Benjamin,
>
> are you planning to run this through your testsuite against regressions?
>
> I believe that's the last missing step, otherwise I'd be fine merging
> this.

Sorry I had to deal with family issues 2 weeks ago, and now RHEL is
coming back at me and eating all my time.

The kernel patch is now OK, so we can grab it now (either you take it
Jiri, and add my acked-by or I'll push it later...)

Candle, can you rework
https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/58 so
that it mirrors the kernel code (and get rid of the
self.local.usage_page_last logic)?

Cheers,
Benjamin

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

