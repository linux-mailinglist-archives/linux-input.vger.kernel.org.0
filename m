Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48718487F41
	for <lists+linux-input@lfdr.de>; Sat,  8 Jan 2022 00:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiAGXN7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 18:13:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiAGXN6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 18:13:58 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58830C061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 15:13:58 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id q15-20020a4a6c0f000000b002dc415427d3so1398858ooc.2
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 15:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=F+nj6othnUl9TqkvFEAN8QCl9928qsii1lcVa7kLyO0=;
        b=S5SV+VQAkuTKHO5/FvAxca/8OBYi/ti1oNsqiSj5mMReOmQXTwpD+mb6ZbIa9bnUoM
         5Kw8fCPhmeh4cIwqZSe82B+V3viliBaHr6RnsFjK2pPD0aeyYN4xjXDLL/TEtN183wA5
         0AaPrE9uYu6HT+fcqIw+LDE/VaaGM3ik5K34o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=F+nj6othnUl9TqkvFEAN8QCl9928qsii1lcVa7kLyO0=;
        b=CkjSoMOCkuppkmQV90rO9pFfuG412i7cAWUpbrHMGUNtjsYGhT9S4dlwo73/cK4h7f
         Mb97unK9JSrhScMp1l0RvX750sS+2CiiNoTkd+n6Cs+dk6HmD8Os2c09dlTQXQyCSOx8
         yV5QdTmV2r72T43HWOhR0RYqk0HKTz+vkX/eHSYu7V/fnkVZNphXPpD2ELFJJlgnnGO7
         resmBxC3aYLLHw07jVQ0F4sQbiD2vslRG9XhQG6D3oByVNwTv/I6vS2IrNXHG6UR94sR
         i0WuwcleddMazq1OjfD+vj5LDe8tJp2h/d+hYURvWtWYbaBby2fnfDwtcIfrCeaZS+eD
         KnBg==
X-Gm-Message-State: AOAM533t/SS8DO8ZKcoOUWsQ10oV990Jvwr9g8kK2syk3m6cYpUZX4o0
        5BApGms36SRQbSXMWWMQ/c5fJnq5FsASB4URem/FAQ==
X-Google-Smtp-Source: ABdhPJzO7C3fHocXirj1DvzWKV0S4KZ3cR6JfxhqaPd87TiYoV4N8oaQI2EINw2KgSOIzZIvRPVbNpXH5frEH5M8MWU=
X-Received: by 2002:a05:6820:411:: with SMTP id o17mr41624593oou.8.1641597237623;
 Fri, 07 Jan 2022 15:13:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Jan 2022 15:13:57 -0800
MIME-Version: 1.0
In-Reply-To: <YdieAFj0ppmAtQxS@google.com>
References: <YdieAFj0ppmAtQxS@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 7 Jan 2022 15:13:57 -0800
Message-ID: <CAE-0n52HCrp+-7BxsEku0ifmC4P=Rw0SxE4BJ6j1iMd1b7_pNw@mail.gmail.com>
Subject: Re: [PATCH] HID: vivaldi: fix handling devices not using numbered reports
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     "Sean O'Brien" <seobrien@chromium.org>,
        Ting Shen <phoenixshen@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2022-01-07 12:09:36)
> Unfortunately details of USB HID transport bled into HID core and
> handling of numbered/unnumbered reports is quite a mess, with
> hid_report_len() calculating the length according to USB rules,
> and hid_hw_raw_request() adding report ID to the buffer for both
> numbered and unnumbered reports.
>
> Untangling it all requres a lot of changes in HID, so for now let's
> handle this in the driver.
>
> Fixes: 14c9c014babe ("HID: add vivaldi HID driver")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

This silences a warning I see printed from this driver

  hid-vivaldi 0003:18D1:504C.0002: failed to fetch feature 0

and then I see the 'function_row_physmap' attribute in sysfs is non-zero
now. Thanks!

Tested-by: Stephen Boyd <swboyd@chromium.org> # CoachZ
