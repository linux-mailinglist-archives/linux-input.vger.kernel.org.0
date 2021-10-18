Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBF04322CD
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbhJRP2o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:28:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhJRP2n (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:28:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9375660F0F;
        Mon, 18 Oct 2021 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634570791;
        bh=g01SmXPrKrf4gGXNhkcYhy6vdX7pSiVv/w2yiSK/OWc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gX/KaQMtRFzLR7TgVjiHpNtAa90oAzESOqAcI5/U8sY5PTy/K8OE6R7Uck+u4a73d
         TN+cfqwAw8lnIEZiyEYOkraK1s+NsEfC0MaHd+aj1e2vgsE/gl6bCcjFylVEgqVHEC
         YUIPDZD8/sNyz603CsvR25FGWAiXL4EC18M5W2sQ+53fAGIYebZz9J8K6Cxs4+5/gy
         mEn62N4E08gbTuhdAoRU0jZYBn/SCdxscEGd+BTYCaxeX8Gv5kHdfuwvE/5HDD7gFx
         2Y7b1bRfrAe6d6VVL9TNE8AuZGZZmq8+PCaOH1sS86AxjIGq5+Vspu/ztMvROpbmt3
         IfbocI4iQ1j+g==
Date:   Mon, 18 Oct 2021 17:26:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Aaron Skomra <skomra@gmail.com>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>, caihuoqing@baidu.com
Subject: Re: [PATCH] HID: wacom: Make use of the helper function
 devm_add_action_or_reset()
In-Reply-To: <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2110181725050.12554@cbobk.fhfr.pm>
References: <20210922125939.427-1-caihuoqing@baidu.com> <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm> <CANRwn3SZagP7uCSHVDGMPMqQiKyUQJSjq143_DA1y0UPvsmkAA@mail.gmail.com> <DB6PR07MB4278FF50AB23B9B69411CA3B9BB19@DB6PR07MB4278.eurprd07.prod.outlook.com>
 <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com> <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com> <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 17 Oct 2021, Ping Cheng wrote:

> I tested the set of two patches. I didn't see any issues with them
> applied. But, while reviewing the patches, I noticed a minor logic
> mismatch between the current patch and the original code. I'd hope at
> least one of the maintainers (Jiri, Benjamin, or Dimitry) reviews this
> patch, especially the part that I commented below, to make sure that
> we don't trigger any race condition.

I don't see any issue with that ordering, but I'd also prefer for clarity 
to keep updating the shared data structure under the mutex protection.

With that, please send me the series with both patches and the Acks / 
Review-by accumulated, and I'll apply it.

Thanks,

-- 
Jiri Kosina
SUSE Labs

