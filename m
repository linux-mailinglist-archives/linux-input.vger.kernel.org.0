Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCF925F423
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 09:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgIGHhR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Sep 2020 03:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgIGHhR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Sep 2020 03:37:17 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689F6C061573;
        Mon,  7 Sep 2020 00:37:16 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id q6so11654347ild.12;
        Mon, 07 Sep 2020 00:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eolZlUfohQCfZPBZcIwQSDwC/RZau21wdgFrsxtxQ/Q=;
        b=fZR+63tocruhbQ29gKa2Bsb+yu0tbqWTH49j1FJXqZ1Z5rMSngcBRjNAgFCFaVoKMN
         rVu54yIOO9RwKIk4GoOHZWQn2ACkEI2FoPDT8a2k47lY9gxs63NFJi82rqObULMOYqPQ
         +O81OzCaagBiDzLyjPBWapXkUtQm71Fr1+895TYw0ofjGLnV9Lu8Qv9NwG65Gazxj3PO
         voKSLAbW+N44NZxypxr8RCu/5CNhMkhd0Lx7YR8BFM3NAIUL8eJpH0ThD2d480ZuHzsy
         YujBT4gcfd3uYtuA8ZaNCHhfaQQwfEYQC2GjC0YtybN1ll0nz1DDBV05sw2GlmJgMNaX
         mZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eolZlUfohQCfZPBZcIwQSDwC/RZau21wdgFrsxtxQ/Q=;
        b=pQ/BfJlwyk15nPJLwUKFf8L6YyMLaEOHhrouisxSwZQfmbuc1iCvDjSBQJ+2M0yKEo
         mX/AyWrlfCShCtkt43CaHTmOSQD8J8YoymRUJX93aT+0rebAI0+xlI1wRbDVRWU+0ogi
         b4XMyBAs907YZtbiQFw64barm2/qBF75r0D64b09Cykzws8W3xC3XPZUKNO6iNOxMyXO
         V02hbnwAh0GNfS3Ncz7hqgLQaZVGMSJiOcERHNT+aFqRzo2BTWAKxPJ8twjdCk7yDaZC
         6Zy899A8z9/7JzgBOWJIJ6PCq0p9zKLtSO6aYz1aUyhWaXB6Me7pY6gB2aPuDh5xD5iW
         dxjQ==
X-Gm-Message-State: AOAM532khZNlFVbXKDCybIczrwclnPUmYuGSgBk60FLuDwtoLoXpmiX2
        d/4n6emUYhsLJHy0Cj4sGKFNxS6jbAmVkUfFAoU=
X-Google-Smtp-Source: ABdhPJxUHqVjQ7XHcZ4b0XX0BxUwUksFCnJVZiI+Ufad/nOHFQde/oYEnPwshOIkmppn5BIl7Ryzrsz5ftL92TDgcJo=
X-Received: by 2002:a92:5f04:: with SMTP id t4mr18192392ilb.299.1599464234888;
 Mon, 07 Sep 2020 00:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200904132143.9496-1-abbotti@mev.co.uk>
In-Reply-To: <20200904132143.9496-1-abbotti@mev.co.uk>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Mon, 7 Sep 2020 09:37:02 +0200
Message-ID: <CADyDSO7znNjdrXzgU8yVCy6XGbcdwPdmrbu849ZtsqoBCePWQw@mail.gmail.com>
Subject: Re: {PATCH 0/2] HID: wiimote: Minor change to spinlock usage
To:     Ian Abbott <abbotti@mev.co.uk>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Fri, 4 Sep 2020 at 15:21, Ian Abbott <abbotti@mev.co.uk> wrote:
>
> [I have posted these patches previously, but that was over a year ago.
> --IA]
>
> A couple of minor changes to the wiimote core module.  They do not
> change functionality of the driver:
>
> 1) HID: wiimote: make handlers[] const
> 2) HID: wiimote: narrow spinlock range in wiimote_hid_event()
>
>  drivers/hid/hid-wiimote-core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Looks still good ;)

Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>

Thanks!
David
