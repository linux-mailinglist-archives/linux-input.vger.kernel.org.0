Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 860F71624BF
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 11:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgBRKk1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 05:40:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43196 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726199AbgBRKk1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 05:40:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582022426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TdO6y8AHR+AaKNMW/gc1AonKG1Co8fKJjYOLG4b+LMk=;
        b=WTRM+mexDY0DajVByEJEl9dUt0xlrWQrCuoCcYeu2WyX+wHZRyQbAV2kNkfP6+Kmqzsj/z
        Mfp19qDYIni7UWkLegiBDA5iAj4XmxjWyaqf6/bMf5C55eI4GEus11/wiVgDLXCdOTVFSg
        IqSn1j04knaKf+QkQoATW/TFjtYiOt0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-VKIeDO_lNfOuOsIvvuH76Q-1; Tue, 18 Feb 2020 05:40:20 -0500
X-MC-Unique: VKIeDO_lNfOuOsIvvuH76Q-1
Received: by mail-qv1-f72.google.com with SMTP id e26so12106676qvb.4
        for <linux-input@vger.kernel.org>; Tue, 18 Feb 2020 02:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdO6y8AHR+AaKNMW/gc1AonKG1Co8fKJjYOLG4b+LMk=;
        b=Wc6hAHY8ncnNyRuQMkbxh3AehI2JyyIMcHE41aBm0zyoA60w3pfubnJzLaNrADJRCk
         z7BZzDzp2Bi55Aft55KDHDcpflFt3p1SOvPRvn15S5p/rHpH8bTIyzoZljZoaUDeUcR8
         Kt5J0HGPYDPh3sMQORlTWDKl1hhsrTQd90lXGPQa8uZ1VayRws91MvHg8jmmk3PTYTIM
         ricmghDt1iuNXOsu2T/hPw1EZCzOPtpYK03LMER91YFFvnSjkQwPvRoIY7xciw7/yQ34
         5sNGBXcqr3/yyavmxZj1Vnk2NyvCTxTrcxz4OvDF2VGI63ghmSWKdqhAXlhZjsyiky36
         6Xiw==
X-Gm-Message-State: APjAAAUOVgBIbZSLe0JO569s/2KIl2wYyJAUU7P1Zrdi0Pk7XFmoRMn1
        NcRgUZGSN2Z5zWXU3UXHbKMRFxzRtuyflNFMcj0dPetH34M71C18XHnyWm1v5i/KWWV6Mz9AFem
        62UthoBZ1l+s2buBGWWINxPSqCi6QZzk2XjroMQI=
X-Received: by 2002:ac8:4914:: with SMTP id e20mr16568404qtq.199.1582022420169;
        Tue, 18 Feb 2020 02:40:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzop8HEVbMlqlTBReRnlW8cuV5OvmWmqddfFy0j/sJmV4q9d4HcrjMvRfW6D61qeuNc5yVz8c7y9clG60iT4W8=
X-Received: by 2002:ac8:4914:: with SMTP id e20mr16568385qtq.199.1582022419942;
 Tue, 18 Feb 2020 02:40:19 -0800 (PST)
MIME-Version: 1.0
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
In-Reply-To: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 18 Feb 2020 11:40:09 +0100
Message-ID: <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] HID: hid-bigbenff: fixing three crash bugs in a
 gamepad driver
To:     Hanno Zulla <abos@hanno.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hanno,

On Mon, Feb 17, 2020 at 4:24 PM Hanno Zulla <abos@hanno.de> wrote:
>
> Hi there,
>
> the hid-bigbenff.c had three bugs causing possible kernel crashes.
>
> The first patch fixes a double free during device removal, which was
> caused by a wrong use of input_ff_create_memless(). The
> "driver-specific data to be passed into play_effect" parameter of
> input_ff_create_memless() would later be freed automatically when the ff
> device is removed. Since the driver also uses the managed resource API,
> it would automatically free the memory of this parameter twice, causing
> a general protection fault moments later.
>
> The second patch fixes the error path after hid_hw_start(), as a call
> to hid_hw_stop() is required in case of an error.
>
> The second patch also removes the hid_hw_close() call during device
> removal, as several other hid device drivers don't call this routine,
> either.
>
> The third patch adds a flag to avoid a race condition when there is
> still scheduled work left (or newly being scheduled) during or after
> device removal, which could cause a kernel crash.
>
> Thanks in advance for your review & kind regards,
>

I think the patches are correct (have you tested them with actual HW?).
However, checkpatch complains that the From and Signed-off-by email
differ. Can you send a v2 with a fix for that?

Cheers,
Benjamin

