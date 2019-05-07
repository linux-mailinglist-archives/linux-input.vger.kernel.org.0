Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D3B15DD4
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 09:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfEGHFF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 03:05:05 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:41020 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfEGHFF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 May 2019 03:05:05 -0400
Received: by mail-qk1-f194.google.com with SMTP id g190so498081qkf.8
        for <linux-input@vger.kernel.org>; Tue, 07 May 2019 00:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TWiAWNDuxMoa7BnWbstcQAwxTlS5yxqis7kCQjsT23I=;
        b=pfu7dKOjEXzp+IkhOA69c3602TFYSZ3UT5SvspyJ/HyJanlX6102rlKld3jLlzu9E6
         4cANojtOECBrVcFiNxAqglF9CzBNvFzN/Uv2GP3EgQ9oO+JS7JbGPFQh+Fm7YgnZUWhO
         hVDwi7e+x/i7mCF2fWT7eEet8b40WCeHhW6ZsoVo/ZJb6f+TOr8V3/C4mibHqnZYuygl
         RcKFyhplgkneIV18mctJ2xCTl5S4LptDahRYEWUSb6AKzh//K0Gi0QaegYqcJ4SgjWoc
         nMJg0mwsw/K0T6varTZArVvHnkCDf9CD9hDSe4V2fKE7mM7biZE5b98OWRiMj8uwY9g3
         HLzw==
X-Gm-Message-State: APjAAAWbofJ3iY8tcOsFGcuL7OLE0X7YBh+HMzvOmfiDjyhDo6Cbr7VZ
        ipKOn7BodQwX5+QaRENPud+bgzj5mwcZ6HZD1GzfSg==
X-Google-Smtp-Source: APXvYqz4HUHY0unSxfyqKVfzthJ4zVbpJ5xgmf3KDTNskB7uJbYHco/MM7pyk5JZEfU+J7rzIPlS71SU9loEQKjgEUw=
X-Received: by 2002:ae9:e418:: with SMTP id q24mr23566715qkc.134.1557212704629;
 Tue, 07 May 2019 00:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <e2154a13-0ec5-d39c-52cf-db98867b0496@infradead.org>
In-Reply-To: <e2154a13-0ec5-d39c-52cf-db98867b0496@infradead.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 7 May 2019 09:04:53 +0200
Message-ID: <CAO-hwJKueMUp=4ioCNhgkX2+HWsd9GV4bkKi_+uvzpOV_UED8A@mail.gmail.com>
Subject: Re: [PATCH -next] hid: fix hid-logitech-dj build error
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Randy,

On Tue, May 7, 2019 at 3:12 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix build error in hid-logitech-dj by making it depend on
> USB_HID, like several other HID drivers do.
>
> Fixes this build error:
>
> ERROR: "usb_hid_driver" [drivers/hid/hid-logitech-dj.ko] undefined!
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  drivers/hid/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- mmotm-2019-0425-1630.orig/drivers/hid/Kconfig
> +++ mmotm-2019-0425-1630/drivers/hid/Kconfig
> @@ -522,6 +522,7 @@ config HID_LOGITECH
>  config HID_LOGITECH_DJ
>         tristate "Logitech Unifying receivers full support"
>         depends on HIDRAW
> +       depends on USB_HID

this is already scheduled in the HID PR:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-linus&id=c08f38e9fd0b5486957ed42438ec8fa9b6ebbf4f

Cheers,
Benjamin

>         depends on HID_LOGITECH
>         select HID_LOGITECH_HIDPP
>         ---help---
>
>
