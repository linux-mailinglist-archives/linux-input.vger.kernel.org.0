Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1713C46D669
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 16:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbhLHPKD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 10:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38503 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233820AbhLHPKC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 10:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638975990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2dndCJtUozPgW/zrBQMFJSIBdDXug4fBC+xfl6GUxv4=;
        b=ILsPpDn/gwEyZ71NslLnXhJ5tnXZdvGtB38XepuvptvoVxC/4s2YDclA6cUL8jfBBv0y/w
        xumvelzSitP6KVEsvmw9/MaqXV7aQYtSJBA5SeVroEDHC5FUi0R5gECtknBs757yZIu0iY
        UChCgWO+TI1tgcWE+gZsgtuCjc22jmE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-KvhU9s-pMmOwpZpz2bOpEw-1; Wed, 08 Dec 2021 10:06:29 -0500
X-MC-Unique: KvhU9s-pMmOwpZpz2bOpEw-1
Received: by mail-pj1-f70.google.com with SMTP id r23-20020a17090a941700b001a74be6cf80so1773190pjo.2
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 07:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2dndCJtUozPgW/zrBQMFJSIBdDXug4fBC+xfl6GUxv4=;
        b=1kkgrLtDNFfiu+Ckj75BczpwoPXd+boZvyZjohOwhOoOtAq7Qg58Z4DXnUuGEVD3JJ
         uVDE3mueeY8HA/8/qzjczV9u8jV2aRiqVrn+blKtgd0q6IF9tiFFzoxjskZ5tosJ7vh7
         /2MzZIc3jz5Gv5HnrXX01QyQB8Jk9hHD3yZDb6JXYMQO+3eJ0hal3DyDLuHETJL26Tut
         B++mZ6DkVWFSBmmst6hcdCt+fQGNZoFw5KF14gy3b1FVWZasBgjGD9pCLEBmWJ8OWWR1
         g++0Q4jBl3TbjciiPsuc1zqLtwtJmvh0ZClZgPHPIbhg8goq4CqK0uRkylHmjAhW6F7Q
         tpJw==
X-Gm-Message-State: AOAM5303/xva9wXrIgPTRhqlKDpxcGKRDCoHqKMBY9G9qStpUMqra1wn
        WJWERfuDs3zkBHBlfMtBDJobLTSwMJYtTkEqXbJLpBQW6l9BbyoWV0KMOhdODTE9SG4XwNbRzt5
        PlwBdvBvMPZGEMklPPrJaBIW4JRCVxZB/1ACrOWw=
X-Received: by 2002:a63:ea51:: with SMTP id l17mr29454653pgk.363.1638975988457;
        Wed, 08 Dec 2021 07:06:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7DuI8y9TyBjj2r959snuFq9sEdNZb1u8Br24srTif6Fi8P4NVrvLCN3qex9bF7jRjbutbgEot+9EG+5IBRSc=
X-Received: by 2002:a63:ea51:: with SMTP id l17mr29454624pgk.363.1638975988150;
 Wed, 08 Dec 2021 07:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20211201164301.44653-1-tero.kristo@linux.intel.com> <20211201164301.44653-3-tero.kristo@linux.intel.com>
In-Reply-To: <20211201164301.44653-3-tero.kristo@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 8 Dec 2021 16:06:16 +0100
Message-ID: <CAO-hwJ+nrL9FD2jvkx6qngMrRQv8KmHWzYy-HOwKJ7TPHz-Xmg@mail.gmail.com>
Subject: Re: [RFCv3 2/7] HID: hid-input: Add suffix also for HID_DG_PEN
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

On Wed, Dec 1, 2021 at 5:43 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> This and HID_DG_STYLUS are pretty much the same thing so add suffix for
> HID_DG_PEN too. This makes the input device name look better.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/hid/hid-input.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 39ebedb2323b..73c2edda742e 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1737,6 +1737,7 @@ static struct hid_input *hidinput_allocate(struct hid_device *hid,
>                 case HID_GD_MOUSE:
>                         suffix = "Mouse";
>                         break;
> +               case HID_DG_PEN:

hid-multitouch overrides this in mt_input_configured() and sets
"Stylus" instead.
A common code would be best, but now I realizes that this would mean:
HID_DG_PEN -> "Stylus"
HID_DG_STYLUS -> "Pen"

This is part of the configuration API, because we can have
configuration snippets based on the device name :)

So ideally, we need:
this patch to add DG_PEN support in hid-input.c and remove the special
case from hid-multitouch, with a comment explaining the Pen/Stylus
mistake :)

Cheers,
Benjamin


>                 case HID_DG_STYLUS:
>                         suffix = "Pen";
>                         break;
> --
> 2.25.1
>

