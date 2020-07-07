Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33DF3216331
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 02:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGGAzN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 20:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGGAzN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 20:55:13 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F6BC061755
        for <linux-input@vger.kernel.org>; Mon,  6 Jul 2020 17:55:12 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id a12so41412658ion.13
        for <linux-input@vger.kernel.org>; Mon, 06 Jul 2020 17:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKx1Q2FFsNXcGu6Dnc+MWRz1PNALdfyXh74NraBmG7A=;
        b=nD6r2mxzP6fLvBoOxN0V9LHFSyfeuqwj5NdKrPArBjyiJBiz3q4O0qWyzwEoW5G5GX
         hBUY0zzttYWCQ5gZTRAGvhxUqu2cpaVgIFfMIzHamK+BMB41wNBkbTYPK7dCGE9dONWG
         03tfOyHu2v6L8VF008Hg9Ta+sm1WLhZ4ANAZpeNCozoHg0Tf4BU3UwHLUqP15DbMaJ9v
         iKBVWannjhPX8RqJ+tQOzQnAXPxk4z5pwRIXIryXRm35EL2j+OM0CHFYf3wy8LgHoNRK
         a4t0sW3P0vRgyStlqMDo+va0Hew2hHTaGMTNbud99y8U/HUAE537rFcUF2I8fjc8fF1O
         OAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKx1Q2FFsNXcGu6Dnc+MWRz1PNALdfyXh74NraBmG7A=;
        b=bbjDOpJ9aDHmALdhd9+fsi0Bjbe6pBYhDrgxUpcn32nfRsPpDBfvp6Yqy1GviB5gzS
         WhPxrNgpFvkbZDKXN/67eCgI9iIuN5eW7IX017XXxG2oPDf9KU+UBWsR4UcFcg8eTdro
         ha6cgQNJpV1U3x53bijgaFCw9K/juMLPAzqO/7Rhg3DcMBZC+8lz7FKWCg5OXQHNH657
         Ny/XPH7qq3CeWmFS3ZGwbGX2zJ+Z3kxCVtb05nKAvxq1eDPG9GzU/rLvrcLPlOqBZoJd
         TWorIgBy+TbL7e+hwRxKqixHnaQHvvPdl60vjOZwbCr0btiLT0MDhlt4bBDoOxPa2ZQh
         fkvg==
X-Gm-Message-State: AOAM530QLqfB7COWCRd4cgAGjA+ewNg12cSHdrB+t/o2JhRZ3BocERwh
        b967UJVPudf/YT6v6TJ2jIABxQ2V6Qk1g9Rruk4=
X-Google-Smtp-Source: ABdhPJwKUwJCL0HMr/rkdBptPYAQRWOIqXW/POboio1v1wSmnuG2ltmTCIBVNRh3oT0cbPUQ8wn4lkPuXHjXm8iQs1o=
X-Received: by 2002:a6b:3b46:: with SMTP id i67mr27675863ioa.205.1594083312007;
 Mon, 06 Jul 2020 17:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+jURctpKw3fDCWJCi_XrNaO=thyzk=AUqq=FWXaFSWfaYaSjw@mail.gmail.com>
In-Reply-To: <CA+jURctpKw3fDCWJCi_XrNaO=thyzk=AUqq=FWXaFSWfaYaSjw@mail.gmail.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Mon, 6 Jul 2020 17:55:01 -0700
Message-ID: <CAKdAkRSdKThNqjq=_kG3uaN=SoJe9eFscgVkYWibW=JxJrF4yg@mail.gmail.com>
Subject: Re: Request to revert "Input: elants_i2c - Report resolution
 information for touch major"
To:     Harry Cutts <hcutts@chromium.org>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 26, 2020 at 10:50 AM Harry Cutts <hcutts@chromium.org> wrote:
>
> Hi,
>
> We've been seeing a lot of issues with ELAN touch screens caused by
> the patch "Input: elants_i2c - Report resolution information for touch
> major". It turns out that the resolution of 1 unit per mm was not
> correct for a number of touch screens, causing touch sizes to be
> reported as way too large (e.g. in https://crbug.com/1085648). We've
> reverted that patch in our Kernel branches, but request that it be
> reverted upstream as well until ELAN can figure out a more accurate
> way to report the touch major resolution.

Thanks for the notice Harry, I reverted the patch.

-- 
Dmitry
