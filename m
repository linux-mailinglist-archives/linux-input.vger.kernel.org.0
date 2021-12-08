Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455F146D701
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 16:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhLHPeP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 10:34:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26843 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhLHPeO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 10:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638977442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rzCUQTQHixCkOFTrQyJFzqAE5wDab4E7u78+a05/gN0=;
        b=fPLCex9woVTqT4fATViJxotXR7/lns6BATMI0bPWEat5C5wrBI9Guac4dTiuJ6cGS9qGU+
        gyDgZkoh0bzJUF/pPk4/xI/4KKHONSjGOzrSsA4nkxuSDktjqWlMLAx800reUH9mSJ+ZkV
        wxsuxHnhkTZ2ClACCVSPxPBJFWgOnoM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-sli8fhsVP1OS8FoNYEeCyg-1; Wed, 08 Dec 2021 10:30:40 -0500
X-MC-Unique: sli8fhsVP1OS8FoNYEeCyg-1
Received: by mail-pf1-f198.google.com with SMTP id e7-20020aa798c7000000b004a254db7946so1744666pfm.17
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 07:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzCUQTQHixCkOFTrQyJFzqAE5wDab4E7u78+a05/gN0=;
        b=vIqm2ienvEddsfZ7PEmX/rkHfyuKoSoFZrh4CI93ACQ6I1WaD7SNt7phTXP9jm+IQm
         Vw6VbA1aQ42huO/hVFLu8oMf3WOq7p2yVVx0OyWhelhQOTtyk8LMH+wISyRNSuX+lyqN
         U1ankF6QEaFg7NpJ/43YWLgJHjzbXhvMPSj2AvoDHAbmmNAMt0LPoZX8vhuyHY087T3p
         D4LOR+7Ii6BwyIyBvFL40W91sJhFe8EdmTMhXpjyW4fC2TtpBtLRMn5g6YigDdR7fYW9
         GkC+ahjK3iuEWGed0HhYgSrebudt08gFAa7GkG/ddcfyNNu6xG3cSF283HJcw0wnoyEM
         2pRw==
X-Gm-Message-State: AOAM533HHjH6EpNfvSjLr6P6DcNEly67e26t2SZuw8RkhpZJSMkALRhr
        IZG1FAP+PJozNXY1tW/QiU6DisqBe6OG2GDVrE4+bCj4lKBK+RIexJyrg3lmQKO1kKYsLCLAb7R
        b/55f7XZk0zIoGYAMYwZemVgGZtLPw6Re72VwiMo=
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id e7-20020a17090301c700b00141e630130cmr60620978plh.80.1638977439728;
        Wed, 08 Dec 2021 07:30:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyixfuggonvjhI2fbihDrgrNo0uHWJ2S5UbH6Tm5PzAKbFkHDDWpqgfjt6m65mYCqwZhBbOM27jqpCWVe311Zs=
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id
 e7-20020a17090301c700b00141e630130cmr60620949plh.80.1638977439492; Wed, 08
 Dec 2021 07:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20211201164301.44653-1-tero.kristo@linux.intel.com>
In-Reply-To: <20211201164301.44653-1-tero.kristo@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 8 Dec 2021 16:30:28 +0100
Message-ID: <CAO-hwJJRXrMAxi_cWng=vuQv4Ej7_AFweZTxVqu9_uy+C6sfzg@mail.gmail.com>
Subject: Re: [RFCv3 0/7] USI stylus support series
To:     Tero Kristo <tero.kristo@linux.intel.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tero,

On Wed, Dec 1, 2021 at 5:43 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
> Hi,
>
> Another update here based on received feedback. Main change compared to v2:

If that's OK with you, I'd like to cherry-pick some patches from the
series: 1/7, 2/7 (the version from v4 because I requested changes),
4/7 and a lighter 5/7 where we don't have the MSC events we are still
discussing.

So Ideally, can you post a v4 based on top of hid.git/for-next
(without my hid-bpf changes) with those 4 patches?

Patch 3 is still up for discussion, and patches 6 and 7 are obviously RFC.

Actually, Patch 3 could be split into a part where you add the HID
usages and a part with the mapping of them. The HID usages part can be
integrated now too, and we'll have the USI mapping that would require
Dmitry's ack in a separate patch.

But if you prefer having everything in one series, that's fine by me too.

Cheers,
Benjamin

>
> - Dropped patch #5 : HID: core: map USI pen style reports directly
>   This is not needed anymore, as the same result can be reached by
>   modifying the flags of the relevant field in rdesc. This is done now
>   as part of patch #7 in the BPF code.
>
> I also dropped one of the fixes from my test branch [1] as pointed out
> by Benjamin, it is not needed if the BPF program is executed with the
> modalias link.
>
> Updated test branch can be found from [2].
>
> -Tero
>
> [1]
> https://github.com/t-kristo/linux/commit/81b27fd46780ce67c2706d586c0f4a437e87dbf6
> (HID: bpf: fix file mapping)
> [2] https://github.com/t-kristo/linux/commits/usi-5.16-rfc-v3-bpf
>
>

