Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CE52B95D8
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgKSPKS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33205 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726712AbgKSPKS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605798617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+RJKTO3LLeWJ35cji5GJd241XrLTB6VhxCJrTgqCnj0=;
        b=QAjZS/rq7G5CPKgJrFIizeSrQ/Zvyp8JbM9joZvjTcDEJU57kSZuIzmQZXmEdvNeghhBCq
        8djfQgX+THeu2sCZrZFfrSF+Y48cW6pBTsjGM174t/TYv5BLvSFi3KF8cMFLC9aRM5D6mQ
        lIB0oYZHgmEerO+3hAhahBHFeikvkyY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-UpSCAcCWMt2fJLziapy50g-1; Thu, 19 Nov 2020 10:10:15 -0500
X-MC-Unique: UpSCAcCWMt2fJLziapy50g-1
Received: by mail-pl1-f200.google.com with SMTP id c8so3090781plo.13
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:10:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+RJKTO3LLeWJ35cji5GJd241XrLTB6VhxCJrTgqCnj0=;
        b=CQCHQuSO8e2zUcl82q6g/yBjrJwEdkMc8qSHm5e5BIDFqiazib10PCSf1ON+Dkm4YN
         IjGaiix5ci8Cu1k1OzRo7olxiXxqzDiYZ/DzTw4oZuywC1Qpypv3a6318BtBkKOIAF/U
         yk9a5G4c8JtWQzQToXO+CAHzQlKW4fczp5BbvAE6mPCMQvaO5+bmG26SvK60SYy9ApaQ
         kwN0LXfxbrBgHeMkwt3u/aODJRJf0afoVOPt25+l4upWmAX1QJHqachCBeDVgITwBExq
         CRHeih6uZAnmiNqkUVRnY+xM6yVycqGwve1hyKzWmYnJEXJWCh/2Xvc8Zuh0HvTCj5sS
         MB+A==
X-Gm-Message-State: AOAM530M0xLwhpfkIg8CQIfFF8zSoBze94KKKdYSrHLVhqdx0pcPisND
        tTzETacM3RFdNBWJCHUHwhS3m0E7oSRjlpWILOzPEIeBHvhNcVebH3rNLcsL63CFiMTnJ7B6NKl
        y4zWOKMm7FYGNvEq2DlP+wVu2SzqqiVkIU51oytI=
X-Received: by 2002:a17:90a:e00d:: with SMTP id u13mr3473195pjy.56.1605798613987;
        Thu, 19 Nov 2020 07:10:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQW6Bx8opEzGEKS4vgZ+raJBWZ4KZO4/6K7aYRpjVuNat3jvPHEyHKe/KaR7sPbgzYEoPbS297QILMnmsLWAY=
X-Received: by 2002:a17:90a:e00d:: with SMTP id u13mr3473174pjy.56.1605798613741;
 Thu, 19 Nov 2020 07:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20201114094531.8285-1-hdegoede@redhat.com>
In-Reply-To: <20201114094531.8285-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 Nov 2020 16:10:02 +0100
Message-ID: <CAO-hwJKamLL0j8AfcFYbFeRpLxDRswGxJ3=TC=GABoSHOu=Yjw@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: Fix an error in mse_bluetooth_descriptor
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

[sorry for taking long to get to this, I wanted to conduct some tests
with the Dinovo Mini with this patch and the series after]

On Sat, Nov 14, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Fix an error in the mouse / INPUT(2) descriptor used for quad/bt2.0 combo
> receivers. Replace INPUT with INPUT (Data,Var,Abs) for the field for the
> 4 extra buttons which share their report-byte with the low-res hwheel.
>
> This is likely a copy and paste error. I've verified that the new
> 0x81, 0x02 value matches both the mouse descriptor for the currently
> supported MX5000 / MX5500 receivers, as well as the INPUT(2) mouse
> descriptors for the Dinovo receivers for which support is being
> worked on.
>
> Fixes: f2113c3020ef ("HID: logitech-dj: add support for Logitech Bluetooth Mini-Receiver")

I suppose you also want a cc:stable tag here too?

I have added the patch to my local tests, and if you are happy with
it, I can push it upstream.

Cheers,
Benjamin

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-dj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index d3471d655ab4..7706454de88f 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -330,7 +330,7 @@ static const char mse_bluetooth_descriptor[] = {
>         0x25, 0x01,             /*      LOGICAL_MAX (1)                 */
>         0x75, 0x01,             /*      REPORT_SIZE (1)                 */
>         0x95, 0x04,             /*      REPORT_COUNT (4)                */
> -       0x81, 0x06,             /*      INPUT                           */
> +       0x81, 0x02,             /*      INPUT (Data,Var,Abs)            */
>         0xC0,                   /*    END_COLLECTION                    */
>         0xC0,                   /*  END_COLLECTION                      */
>  };
> --
> 2.28.0
>

