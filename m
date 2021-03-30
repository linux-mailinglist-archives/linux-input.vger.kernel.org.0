Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA5234E5F5
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhC3LAT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbhC3LAO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:00:14 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD97C061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:00:14 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id e8so15961413iok.5
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZnWeqsJEans0YTdMhZnmpFmsb5C5XfPWgjlsQP7g7A=;
        b=eW+U5K1jhqCDtUAF7O/hfH679QVvSw9AMuPibfppsCpz2rRduZA4XJbi82Jm9Oo6lY
         blTnQmuFNWOz5CsWbXDkrpdWrSNgZRN32TIVXF/OVuXJ5EpFNSxnw6L5Slpp+SZWF0jP
         /AFNLZG3eNpUtqkytcdaXbB34cNf0a8b+LaiNNc1F/g+z+heJL/zla2jHXXvnZ+lmuBR
         xHt0A3v8ElJi1m8FUlzs2rxtMDkk4Pvq/1CS3EFbZCYfNiOFO4xXnM2K+kUUHhgkga92
         7oo4ykNdngbQVK0LygxNaATeuhzcHMTC/dsS0W5us2IZhecY1R2qWlMOP2puicrtzcdb
         5lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZnWeqsJEans0YTdMhZnmpFmsb5C5XfPWgjlsQP7g7A=;
        b=eOZciAKU5iklcTzNnZ1dgnDa35ACO3hfE3GypakyB4yVUmHzMtKUzMt9leVoh0/w04
         O51jdY6lhXxeLbBIcOGVovJJMNJMPMI3vO7DOUns+6LpeCIq/ZyIwCTWkSC/sj4AoXg9
         3rUoNCEr6UE09QWhBbjio0+DF2TLVrYlK6WFvFmER///BXkGlLyCGGZbnAO7IlX3UL3Q
         FBruffE6/KY6hzhoBry1a0XzyZxBsyg8R7xEkEnmv0ISxe/BYm63kxJnHjMSxHwBte+7
         WG9/oIE69CrTLOQpi3wQ9nDe66eoUaJKexNpZhasGOFvEyfARWYIU2T/0qV1HfnFs1Ia
         1lhQ==
X-Gm-Message-State: AOAM530TzFeAJqktr5PvIP8rb0/NtbkeGHO5WwnWOE2s5sDPt12A2oHG
        KjGGp5qLumBLqv5nVhNb3rRTEBWyHy4F3Rv54HDj6w==
X-Google-Smtp-Source: ABdhPJwjvw9LNddgFuwklLALtg9pSGuOBQMRjijZunBKozcGhXwMZN9ATNf0d0tteFCcur6Jd4DP3Z3UBP5mcsPAL/s=
X-Received: by 2002:a05:6638:35ab:: with SMTP id v43mr28505930jal.65.1617102013796;
 Tue, 30 Mar 2021 04:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-6-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-6-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 13:00:03 +0200
Message-ID: <CABxcv==YnDJmh-ONztK-ofpGDSmzAUwfDk8VqbH1cjNW8CNmqw@mail.gmail.com>
Subject: Re: [PATCH 5/7] Input: cyttsp - Drop the phys path
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 10:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> When I test to use the CY8CTMA340 with PostmarketOS I don't
> have any problem whatsoever in dropping this phys path,
> it finds and uses the touchscreen just as well. I suppose
> it is because userspace is using modern input libraries.
>
> I challenge the maintainers to point out a valid and still
> used userspace that actually need this. I say we drop it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Agreed. Let's just drop it and if someone needs this then can bring it
back from the git history.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
