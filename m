Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6BD124C45
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 16:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfLRPyG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 10:54:06 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48198 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726922AbfLRPyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 10:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576684444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/8QWVKJz3niyu5c4AXbE1BpzOZZ7WX1gym21S5VvzNw=;
        b=jMpxybdoQaROA/lFiPR+6FczO0V33DOTIjxvLsx98U0yNuDWrHYTsSe//4J67iC+fW+JFh
        scpSVMDxhWbRNbZ551O0B5koz2cVciArnlyAppMOVgvvpqUhpVNk9Y8b00mrjd34pOx5qA
        1NZzVMoK5qpr8Xj+tLsCjICO8zRz1tc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-i0v2l7ZEPoC4yRqKWetjLQ-1; Wed, 18 Dec 2019 10:53:59 -0500
X-MC-Unique: i0v2l7ZEPoC4yRqKWetjLQ-1
Received: by mail-qv1-f70.google.com with SMTP id c1so1576914qvw.17
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 07:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/8QWVKJz3niyu5c4AXbE1BpzOZZ7WX1gym21S5VvzNw=;
        b=hxeujPaK7sjXDS9J+6uYarkS6q7/fkc6ArpZVPG2CXY4k9MXXLehsKAz9aaoZAUVJI
         6xpW6r7ikTjy6L9qOKUteqCZ52+dbdSkLcgAq63f7BaEVP0bKD0Dj/rhf/StMibcL8Ay
         OJiVVvncTO7rthrceDo/KYi/C/D4xIXCg8b6vgCuvg2EvmximPJhW8F2R7Y9pVwzp7yj
         EdmYNsMDuxLmcPPxJwXtmER/6C46Uei7SBg3+MeT5pyeeCUN3Mh9Wqv+0XiSpgTN1d21
         gkVcCtJRMOBja3ixOofy4ouPxHh6wIt+XQzKj3I9JGJ98WH2TcUJXE1lMAOeFEr7cThM
         1odg==
X-Gm-Message-State: APjAAAW/0GNp/RqJed5bxpGaMLobyHMBn5lYHW8owO/j8iQ5csZkpHdq
        idjx9r+kSHTzf55oo0X2HDHaBlBdUkE1SH7U9Q70rU3Dy3W8YB2RoPIIeLzqb1JL2um/u0qFTY+
        bs/Cwak9cg0AA9qiriGND/YjscZCD4rXoPDN2ytA=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr3178397qki.170.1576684438646;
        Wed, 18 Dec 2019 07:53:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0Zmrim4R89/lwbaonocUgn+VwgOcSXvBNRoQY9E6Xd518UpGZ7yVzgLL0IujYYHXN5Vff1sKPm7QdN/rfTzw=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr3178373qki.170.1576684438416;
 Wed, 18 Dec 2019 07:53:58 -0800 (PST)
MIME-Version: 1.0
References: <1576545078-17316-1-git-send-email-even.xu@intel.com>
In-Reply-To: <1576545078-17316-1-git-send-email-even.xu@intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 16:53:47 +0100
Message-ID: <CAO-hwJ+CWPNpV+gJNjpm1+h4rer6FY4L56VbrmHf1YOKOOWyFg@mail.gmail.com>
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: add CMP device id
To:     Even Xu <even.xu@intel.com>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 17, 2019 at 2:12 AM Even Xu <even.xu@intel.com> wrote:
>
> Add Comet Lake H into ishtp support list.
>
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---

Thanks!

Applied to for-5.5/upstream-fixes

Cheers,
Benjamin

>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> index 6c1e611..905e1bc 100644
> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
> @@ -24,6 +24,7 @@
>  #define ICL_MOBILE_DEVICE_ID   0x34FC
>  #define SPT_H_DEVICE_ID                0xA135
>  #define CML_LP_DEVICE_ID       0x02FC
> +#define CMP_H_DEVICE_ID                0x06FC
>  #define EHL_Ax_DEVICE_ID       0x4BB3
>
>  #define        REVISION_ID_CHT_A0      0x6
> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> index 784dcc8..9c8cefe 100644
> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
> @@ -34,6 +34,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
>         {PCI_DEVICE(PCI_VENDOR_ID_INTEL, ICL_MOBILE_DEVICE_ID)},
>         {PCI_DEVICE(PCI_VENDOR_ID_INTEL, SPT_H_DEVICE_ID)},
>         {PCI_DEVICE(PCI_VENDOR_ID_INTEL, CML_LP_DEVICE_ID)},
> +       {PCI_DEVICE(PCI_VENDOR_ID_INTEL, CMP_H_DEVICE_ID)},
>         {PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
>         {0, }
>  };
> --
> 2.7.4
>

