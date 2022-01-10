Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0079A48A055
	for <lists+linux-input@lfdr.de>; Mon, 10 Jan 2022 20:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243926AbiAJToD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jan 2022 14:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243901AbiAJToB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jan 2022 14:44:01 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440FBC06173F
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:44:01 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id g81so13733037ybg.10
        for <linux-input@vger.kernel.org>; Mon, 10 Jan 2022 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/3jf8hC/gwmPJqfx5q/fR3Rkr3lZPIjHVZetM0a+L/I=;
        b=NdObs5yYBMv1vBkXgqt/lSh+Tcx4wlkOdiV1DSjEytTsWBCjs5dQ3IrT0t3p3LbQdL
         e98pMLzPqaANVubonDJBj1RCTMMLDW4W9Xs6/jq8H0yxDdW7k/KXxGn/tgiLD3XYqW3z
         N7UQzTdD591TwruzZlEGG9lceq0JGnCEmsfBpeHYMjzi4zsUwr/lw1WWe0zgwcecBX05
         Q8oydUW3yi0JBUCjEH8gOWTOa1intD8uiD+znCsRGfckptB2xV7/WdCOtNMu0+f1Y7ih
         KwxlBaE86v1BX7rSZEDJjiKD7AR2zYFHGu5vOSfWtnhh4Q5X2br67UGK6RXHUNQi75sU
         SKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/3jf8hC/gwmPJqfx5q/fR3Rkr3lZPIjHVZetM0a+L/I=;
        b=t/7ATn054e1D3N5rrrcx1uWJfWuGpybdqdoGUvGU3yqgMAIsDAu12ktpaVoE0FV46k
         vycVu2QOyABGE9a+Ua06dln+gLCdqadlWbbm0q3x+8hlsbhr0bEUpYvSvZu2lC1Aj1VR
         1wNofmjivTctPN/cVHGie1cu0LyjdnhFBMTuQFpjUcJHROlcD3C9KZKfa29XxNO5ulVB
         mzOIUW9/ClnN+KNCCIsFwdEpiCWO4yVBylcM6MFpritYnuBiNPcqrJhPND+7+SpHOszW
         tVfuYTIWuHRNv/KuZhPqFd1f+zu4X8b5RQ/I4sxvionR5U3XnebEkfxgmN/wt1hShuIT
         ThjQ==
X-Gm-Message-State: AOAM532uQ4lFn1g7JnewyrxhllhodBT9LwJSxyo3nsLCVmHSK4jXCZpk
        RMOoKTl/xPWlSQVnAP4/vyO9OBs/W29gf2jh+bGfHg==
X-Google-Smtp-Source: ABdhPJzc+IHVSPWQhszdFegp016RGA+ZHCX9WcU29TEVuQdykpB1gv03CtgdbOJMu54tkTYoNcJTpSS2nLE1JcRjczc=
X-Received: by 2002:a25:287:: with SMTP id 129mr1552567ybc.670.1641843840575;
 Mon, 10 Jan 2022 11:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-19-acz@semihalf.com>
 <YdkzLZzDIgWrel0O@google.com>
In-Reply-To: <YdkzLZzDIgWrel0O@google.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 10 Jan 2022 20:43:48 +0100
Message-ID: <CAB4aORUguAdRwfRVPSjabNsOB7pjApcQ7u7KnmxHpUp0W6XPWg@mail.gmail.com>
Subject: Re: [PATCH 18/18] HID: i2c-hid: fix i2c_hid_set_or_send_report
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I tested the patch and it works fine.
What is more, I like your design better.
Thanks!

Regards,
Angela
