Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 824629AA43
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 10:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732096AbfHWIZ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 04:25:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58244 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731428AbfHWIZ6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 04:25:58 -0400
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8970F10A1B
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 08:25:58 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id b13so8362761qkk.20
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 01:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjFqKkU/rr1wSVqQW2FjKWVFmd3zU0NlYrJ5LLeu7CA=;
        b=aVXTOlGVgbCxJpfdMcq3pgGN48VfWUXZOu/Et3G3wrqiq4v/Di+Nyud3iDttlihnOI
         WPOAujNEd41CXYw4KPmdzcgyXW2V8CIP2rWxhs6basTUWrmL7HN82q4K6CQHYEUoPxVQ
         mphtf//MWpEiqDiUsCl16a1MHwxIEmZ/9ClZbwhvrQtlrIfS0EsaALem+LarRcIf384E
         iuGK9jiG3eYaNUdU+o0EBf+8kWj4k0w1X5eHfkz1m6K44U9qW4IH9EUMv/7OGCMOwSlG
         BT4RzEto9bdva9oy9RoVAsFnOBTlEFJtsbJgcKsLI2rxIEoyBO2vKHgmwRKzf986By/U
         K2EQ==
X-Gm-Message-State: APjAAAWOANs/1waUnf3/6U7qZpqF2QB3y8kyYi3GW0JVK0134TgAXBkU
        zM2jJRb9NyGUWiy11X9xEAIl+YVmj5pT5YlxlF/eTzjY/CRMFy+Aup6ll3L5ARdaFQBLfrYUwrE
        At+4Z0f5qxWq0YtYamYdtkzSbblxHzv1C/GyqiO4=
X-Received: by 2002:a37:7cc3:: with SMTP id x186mr2952753qkc.169.1566548757933;
        Fri, 23 Aug 2019 01:25:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNX4lU3xyrEi8AXJCSV1OukASjVTtdoDCQ51j+nsk2GbCz5NAdQVvXyjy2qAxcjjN6hawR5X8aynRxBKBw8WM=
X-Received: by 2002:a37:7cc3:: with SMTP id x186mr2952739qkc.169.1566548757737;
 Fri, 23 Aug 2019 01:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190822201849.28924-1-pedro@pedrovanzella.com>
In-Reply-To: <20190822201849.28924-1-pedro@pedrovanzella.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Aug 2019 10:25:46 +0200
Message-ID: <CAO-hwJKQcTpmk8cVf-YmKu2awXv_53=qfpy2yfmy2rgMu_DEug@mail.gmail.com>
Subject: Re: [Resubmit] Read battery voltage from Logitech Gaming mice
To:     Pedro Vanzella <pedro@pedrovanzella.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pedro,

On Thu, Aug 22, 2019 at 10:19 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>
> Resumitting this after having rebased it against the latest changes.

thanks for resubmitting. Sorry I wasn't able to provide feedback on
the last revision

>
> The gaming line of Logitech devices doesn't use the old hidpp20
> feature for battery level reporting. Instead, they report the
> current voltage of the battery, in millivolts.
>
> This patch set handles this case by adding a quirk to the
> devices we know to have this new feature, in both wired
> and wireless mode.

So the quirk is in the end a bad idea after all. I had some chats with
Filipe that made me realize this.
Re-reading our previous exchanges also made me understood why I wasn't
happy with the initial submission: for every request the code was
checking both features 0x1000 and 0x1001 when we can remember this
once and for all during hidpp_initialize_battery().

So I think we should remove the useless quirk in the end (bad idea
from me, I concede), and instead during hidpp_initialize_battery() set
the correct HIDPP_CAPABILITY_*.
Not entirely sure if we should try to call 0x1000, or 0x1001 or if we
should rely on the 0x0001 feature to know which feature is available,
but this should be implementation detail.

>
> This version of the patch set is better split, as well as adding the
> quirk to make sure we don't needlessly probe every device connected.

It is for sure easy to review, but doesn't make much sense in the end.
I think we should squash all the patches together as you are just
adding one feature in the driver, and it is a little bit disturbing to
first add the quirk that has no use, then set up the structs when they
are not used, and so on, so forth.

Cheers,
Benjamin

>
>
