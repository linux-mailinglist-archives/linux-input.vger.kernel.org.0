Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70C433F783
	for <lists+linux-input@lfdr.de>; Wed, 17 Mar 2021 18:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhCQRv2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Mar 2021 13:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28128 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232803AbhCQRvY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Mar 2021 13:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dEGLhiDnwMkfXyobnjzNNfxRt05nqIQ9oCfTjdxDrNk=;
        b=MxdI7pY/k9RGQpdZ2mQyxHo/DepSKO04rxcYK8dl1SnybfVKQU71YcZyCjNqg8p1WWpbEL
        WysKkag3MVROKABumd85gzx4JrodMPyiQLF0ItXTPojcKt4NxicUekHVEvQRgD8/mgz3+Q
        sFZX7mUcpBRVC5e5ibgqanRN/oQycdw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-YMGOj5YzOSiDk4t-wWI04Q-1; Wed, 17 Mar 2021 13:51:20 -0400
X-MC-Unique: YMGOj5YzOSiDk4t-wWI04Q-1
Received: by mail-ej1-f72.google.com with SMTP id gv58so15490400ejc.6
        for <linux-input@vger.kernel.org>; Wed, 17 Mar 2021 10:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dEGLhiDnwMkfXyobnjzNNfxRt05nqIQ9oCfTjdxDrNk=;
        b=oT8Du+05QaTwD4YyDtVZywA2bxD7mXubP9V48okh4Fj9NB48eOrhkIcpNcThuBSuxl
         Z5fF1Bi0JRRfypaHE8YkK+aZXzskPUpy2sQNf6T9cvSfpHTT2RcfJFxpLkTsQ8FfNgHd
         jP914Oe2z57IhN6CCfKOmk3xNbC7E1bRjgjlW2argsntpf2wXr02+i+8A2vfVd9w61/2
         T1Qr7M32Be9DVNsUJ0x1kUPBN6ZzKV9qqZpzbCuyOgHuJmpid2FiK+0TSy01b+68VhIV
         Xjwpy5zHtt/kYvZCoMTOyws/oRYsLG+siagln8/eWG+h9vDfhIiH12sYu+iZUb5hi1Xy
         Bb/Q==
X-Gm-Message-State: AOAM533TxoAyWpZIrkXPsUYYMBQn0s2/LyFM01McsjlvjThweLQ1HKBv
        FUX0hBJ5b5YSVEYCf+vIeiJnoAKrUmnHYmHNMCN/8ErfL7sUrX2jz97Fb//NMsz4vU2EoouCL5l
        9+1/V5Y9aUMurDOd1kRMv3UA=
X-Received: by 2002:a17:906:2692:: with SMTP id t18mr35995235ejc.16.1616003479178;
        Wed, 17 Mar 2021 10:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8IIqqzKi80zAS/wBgk3gjwN2BKvmk4SZApacfhOF8Scf6r4WnqZCq5KX58hhLWGPN0XiQBA==
X-Received: by 2002:a17:906:2692:: with SMTP id t18mr35995219ejc.16.1616003478982;
        Wed, 17 Mar 2021 10:51:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t12sm14026179edy.56.2021.03.17.10.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:51:18 -0700 (PDT)
Subject: Re: [PATCH 0/2] HID: Add support for Surface Aggregator Module HID
 transport
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210310225329.2393372-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a1e56ef2-e040-46b1-198e-4784765fc766@redhat.com>
Date:   Wed, 17 Mar 2021 18:51:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310225329.2393372-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/10/21 11:53 PM, Maximilian Luz wrote:
> This series adds support for the Surface System Aggregator Module (SSAM)
> HID transport subsystem.
> 
> The SSAM is an embedded controller, found on 5th- and later generation
> Microsoft Surface devices. On some of these devices (specifically
> Surface Laptops 1, 2, and 3, as well as Surface Book 3), built-in input
> devices are connected via the SSAM. These devices communicate (mostly)
> via normal HID reports, so adding support for them is (mostly) just a
> matter of implementing an HID transport driver.
> 
> SSAM actually has two different HID interfaces: One (legacy) interface
> used on Surface Laptops 1 and 2, and a newer interface for the rest. The
> newer interface allows for multiple HID devices to be addressed and is
> implemented in the first patch. The older interface only allows a single
> HID device to be connected and, furthermore, only allows a single output
> report, specifically one for the caps lock LED. This is implemented in
> the second patch.
> 
> See the commit messages of the respective patches for more details.
> 
> Regards,
> Max
> 
> Note: This patch depends on the
> 
>     platform/surface: Add Surface Aggregator device registry
> 
> series. More specifically patch
> 
>     platform/surface: Set up Surface Aggregator device registry
> 
> The full series has been merged into the for-next branch of the
> platform-drivers-x86 tree [1]. The commit in question can be found at
> [2].
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde

Jiri, I'll prepare an immutable branch with the necessary pdx86 pre-reqs for this
and I'll send you a pull-req for that IM branch, then you can merge these
through the HID tree after merging that pull-req.

Regards,

Hans



> 
> Maximilian Luz (2):
>   HID: Add support for Surface Aggregator Module HID transport
>   HID: surface-hid: Add support for legacy keyboard interface
> 
>  MAINTAINERS                                |   7 +
>  drivers/hid/Kconfig                        |   2 +
>  drivers/hid/Makefile                       |   2 +
>  drivers/hid/surface-hid/Kconfig            |  42 +++
>  drivers/hid/surface-hid/Makefile           |   7 +
>  drivers/hid/surface-hid/surface_hid.c      | 253 +++++++++++++++++
>  drivers/hid/surface-hid/surface_hid_core.c | 272 +++++++++++++++++++
>  drivers/hid/surface-hid/surface_hid_core.h |  77 ++++++
>  drivers/hid/surface-hid/surface_kbd.c      | 300 +++++++++++++++++++++
>  9 files changed, 962 insertions(+)
>  create mode 100644 drivers/hid/surface-hid/Kconfig
>  create mode 100644 drivers/hid/surface-hid/Makefile
>  create mode 100644 drivers/hid/surface-hid/surface_hid.c
>  create mode 100644 drivers/hid/surface-hid/surface_hid_core.c
>  create mode 100644 drivers/hid/surface-hid/surface_hid_core.h
>  create mode 100644 drivers/hid/surface-hid/surface_kbd.c
> 

