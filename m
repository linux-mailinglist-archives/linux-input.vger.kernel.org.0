Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 561E214ED8B
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 14:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgAaNkE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 08:40:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28494 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728620AbgAaNkE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 08:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580478003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MEkoI4JkiqArqGILxksF89XIREA6WUD0gKcY4bD7Vlo=;
        b=TuX5yX0IZsIrHVU5nShqtEaL/ufUS/qM+yYKib1zCNDmu5W0XN/Hg/Pd0l13Vtw/Z5WBbX
        olnNYvjVXA8s2Kl/BA9nmRpf/Am39jub4MFYE2OzFLaIicU1Uidj+9H7sniYfktWBzcqMo
        H3TbTrxDswapgUkuYGCvHclMKjvAU6A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-tW8c3wogMUSlQZoqG8r5ow-1; Fri, 31 Jan 2020 08:40:01 -0500
X-MC-Unique: tW8c3wogMUSlQZoqG8r5ow-1
Received: by mail-qt1-f199.google.com with SMTP id l25so4648041qtu.0
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 05:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEkoI4JkiqArqGILxksF89XIREA6WUD0gKcY4bD7Vlo=;
        b=dkIiIx8x2BBc/ZSRRIY6WF7y2ZigGfK0GbTa0I0CzEMclgNV77g9x7Ios4g1SGk0rJ
         9JsPvML5B/Ydn3An8vbZfEbp7L1l8haDz3qv+N07f/BYKDDAVGC7THnutKxXBt678rgz
         RhZRy4q58oAJmB6k9EwjjtMyfVXDO2WFx5hyJ6Vd161o5vixlNFEAoTJRzPYWcJK1iLd
         /f+yD4pZ0LKyNE60R2MFFb6L1nwtTJbjDwCz9KX3pjZWx1MM67H0b52zV929IaZcUUYf
         wmI7AEYwY9e5oMH40bj/UfLvrD1oV0aVvpaojM33Wzp5ED/6BC/lAIlOBEt2AKHF4JOH
         +hVw==
X-Gm-Message-State: APjAAAUgYkOBsK9QtvUWuxNxKVK2iR/NkMcZpx1hCZeNuRuqCA5vaQgA
        SstE/b8N11jnWn7mCi8rPpuRh+mb5GCK5Ob5JPpVZOI45f4heOV97mtfklFpc/AFNT0zdzvQYIt
        PJdd8F0WtVf6tEXJDkf1vzG35yPLJe8Axar2xnqA=
X-Received: by 2002:a05:6214:6aa:: with SMTP id s10mr10396345qvz.138.1580478001081;
        Fri, 31 Jan 2020 05:40:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQxryDG+ZrnGEncy569OMXpj6seyfoY9JCQdBgC/cTbNkmTi+yZP1GApZ35+idDtEBxWIzVvKJTA5T/2zcij4=
X-Received: by 2002:a05:6214:6aa:: with SMTP id s10mr10396331qvz.138.1580478000842;
 Fri, 31 Jan 2020 05:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20200131124615.27849-1-hdegoede@redhat.com>
In-Reply-To: <20200131124615.27849-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 31 Jan 2020 14:39:49 +0100
Message-ID: <CAO-hwJL_5JKGjoKFyybfpA=89eK4C3nJtZMb5_8oxnzf9EJGaQ@mail.gmail.com>
Subject: Re: [PATCH] HID: generic: Check other drivers match callback from __check_hid_generic
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> __check_hid_generic is used to check if there is a driver, other then
> the hid-generic driver, which wants to handle the hid-device, in which
> case hid_generic_match() will return false so that the other driver can
> bind.
>
> But what if the other driver also has a match callback and that indicates
> it does not want to handle the device? Then hid-generic should bind to it
> and thus hid_generic_match() should NOT return false in that case.
>
> This commit makes __check_hid_generic check if a matching driver has
> a match callback and if it does makes its check this, so that
> hid-generic will bind to devices which have a matching other driver,
> but that other driver's match callback rejects the device.

I get that part, but I am not sure I'll remember this in 2 months time
when/if we need to extend the .match() in another driver.
I am especially worried about the potential circular calls where an
other driver decides to check on all the other drivers having a match
callback...

Could you add a little blurb either in hid-generic.c explaining the
logic, or (and) in hid.h where .match is defined?

Because now, we have 2 callers for .match(): hid-core and hid-generic
(and 2 is usually one too many :-/).

Cheers,
Benjamin




>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> This patch was written while fixing the issues with hid-ite on the
> Acer SW5-012, where we only want to bind to one interface. In that
> specific case this change is not necessary because hid-multitouch will
> pick the hid-device which hid-ite's match callback is rejecting.
> ---
>  drivers/hid/hid-generic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-generic.c b/drivers/hid/hid-generic.c
> index f9db991d3c5a..fe3ca7612750 100644
> --- a/drivers/hid/hid-generic.c
> +++ b/drivers/hid/hid-generic.c
> @@ -31,7 +31,13 @@ static int __check_hid_generic(struct device_driver *drv, void *data)
>         if (hdrv == &hid_generic)
>                 return 0;
>
> -       return hid_match_device(hdev, hdrv) != NULL;
> +       if (!hid_match_device(hdev, hdrv))
> +               return 0;
> +
> +       if (!hdrv->match)
> +               return 1;
> +
> +       return hdrv->match(hdev, false);
>  }
>
>  static bool hid_generic_match(struct hid_device *hdev,
> --
> 2.23.0
>

