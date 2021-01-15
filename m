Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64962F7239
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 06:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731785AbhAOFfC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 00:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731788AbhAOFex (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 00:34:53 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19084C061757
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 21:34:13 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id k9so1926768vke.4
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 21:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ax6mB1CqVZukWAU1tjWp4UeICbzmILWOckaiTff+GZw=;
        b=Mmtw+vEcv+96LHq4ptHZUUyiqiIgq5C9cQJcctXZ374b2ayb8Mom4B0adLtxi0/JzC
         PDOyEprhCkCrq9EBxz6EGLRSMCcykPuujhFRdP5OsGMRnsDTh/maCmyMAC6KyQtZIsCw
         rFHTzAqycEp8n/+BJ12KRio0oK2m67UjX9iV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ax6mB1CqVZukWAU1tjWp4UeICbzmILWOckaiTff+GZw=;
        b=Pzy7panQUUjJP/IdxKY9guQ2BFAdMlCey4kxxNBbHg8eulb03Ncwhon6dc1f3pkE2L
         TIaV0TOGqnnXimnfz/lwNuB+Yh7x5tait9oGrT5Oc8uV85eU/wV4ZZ29W9skAnWe1Nj+
         UcnQpGfFBNogOzWLInw2dAGhg4KSoQ1vctW0YVw1F3+mqsgthumKS42UgVn6Af1UiqeI
         B63F+S2uGuaqqNH/O6o4T//aJ3R4Zx8QzyxI5rWSe9DFYeM/Nqbn0/CTJV/mIxIPCnKW
         ftnrbsAIAZRalykthQG01Zst+ANjZjM/4mHe4Wm7CJlyu1kQB3MP53mxNn0WG6Mq1aVg
         sI1Q==
X-Gm-Message-State: AOAM533PY6N6P9ZCNK+4feh5gWBhT0ksldb69bmOLJJxRcUnnIndYqJg
        tDcWMlEPB0IyEddjZaG2RqnoSR5sCkdUZ9JjD3sz2g==
X-Google-Smtp-Source: ABdhPJwXNJSYdQjNrt7NEv4DcVveYiDrfEBOv25u+SOwBxLVCXD5muGOkDS70HOyAVKN2oIN7ef1Aim9049JarUf4T8=
X-Received: by 2002:ac5:c5b5:: with SMTP id f21mr8986198vkl.13.1610688852162;
 Thu, 14 Jan 2021 21:34:12 -0800 (PST)
MIME-Version: 1.0
References: <20201224114502.1.I41b9795e4b5bda7209eb9099aebdc6a29677391e@changeid>
 <nycvar.YFH.7.76.2101141314410.13752@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2101141314410.13752@cbobk.fhfr.pm>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 15 Jan 2021 13:34:01 +0800
Message-ID: <CANMq1KC84MykRrKROQdVUmFZerpw4okEb1dLfVhAu-JXw5=Yfg@mail.gmail.com>
Subject: Re: [PATCH] HID: google: Get HID report on probe to confirm tablet
 switch state
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 8:15 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 24 Dec 2020, Nicolas Boichat wrote:
>
> > This forces reading the base folded status anytime the device is
> > probed.
>
> Could you please provide a little bit more verbose changelog (namely what
> is the actual problem this patch is fixing)? Thanks.

Sure, I should have done this in the first place... v2 on the way.

>
> --
> Jiri Kosina
> SUSE Labs
>
