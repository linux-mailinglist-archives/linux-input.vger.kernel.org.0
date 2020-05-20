Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFE11DBB07
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgETRTS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:19:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40946 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETRTR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:19:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id d26so3094426otc.7;
        Wed, 20 May 2020 10:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DIDGZ0k2HNITwxdZwNAiFpKITQvWanJOgt4a8JrQu+0=;
        b=qlhJYxEB0SxuIbPMlYvGWAuDeXK6NUiaTVXDm367vn9mOkwhbqnYHlX9ksCA/Z4e2P
         8z7yN5QHIsBkV6YyQcBiAKX/XbK/wL7akwGlFTq4RxM8fGYkDpAF8W9cdH1zb9wyAUWn
         aULKYPUsAb+Qm4J+0UnaVk+1CTbelFUTVCGBDnPDySWJrYRt/4ii/r1vQPFWfaY8xdjn
         d5JhofCJp9O1XO6e5EahPOZi9F7CLkFGrstkbvg4YV4oIA9OzxCn88N+OSsJCasQ+Idy
         E6UN6w2y5HyQVPv7ZKqEaNJBjvQrIwdpdSKkpFBmvk/hWuWCgyFhUpz45OvDdAPCpRZQ
         gEkA==
X-Gm-Message-State: AOAM530y42BmNykpom80/+TBmff+JX584++/atB9f4DlOaV9P8t1CIt2
        K4PPStY+gD0HVzk/m1/aj4BMuYfXVfCJJqvResA=
X-Google-Smtp-Source: ABdhPJx7pYVtrGhyKxucgb/Avt+fdqrfNfSyfVlSzygMnJZZgwowBhd2IaMVkZ3QUUgihnyXpGPpYq+/kzT0cY/bvXU=
X-Received: by 2002:a9d:6356:: with SMTP id y22mr3803448otk.167.1589995156615;
 Wed, 20 May 2020 10:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200520133432.19738-1-dinghao.liu@zju.edu.cn> <CAKdAkRTyVL0uV0dGxHoEgMyB9FP6b0m60CHy7C4QXeR5WTGAJw@mail.gmail.com>
In-Reply-To: <CAKdAkRTyVL0uV0dGxHoEgMyB9FP6b0m60CHy7C4QXeR5WTGAJw@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 20 May 2020 19:19:05 +0200
Message-ID: <CAJZ5v0gruwb6sZM4qb3dTq2sPtF8Z77Jzo7orKA9JXMrAb9vcQ@mail.gmail.com>
Subject: Re: [PATCH] Input: omap-keypad - fix runtime pm imbalance on error
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Kangjie Lu <kjlu@umn.edu>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 20, 2020 at 7:02 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Dinghao,
>
> On Wed, May 20, 2020 at 6:35 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
> >
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > the call returns an error code. Thus a pairing decrement is needed
> > on the error handling path to keep the counter balanced.
>
> This is a very surprising behavior and I wonder if this should be
> fixed in the PM core (or the required cleanup steps need to be called
> out in the function description).

It has been like that forever and it's intentional, because it allows
certain pieces of code to do things like

pm_runtime_get_sync(dev);
/* do something regardless of whether or not PM-runtime is enabled for dev */
pm_runtime_put(dev);

So I wouldn't really call it surprising.

> I also see that a few drivers that
> handle this situation correctly (?) call pm_runtime_put_noidle()
> instead of pm_runtime_put_sync() in the error path.
>
> Rafael, do you have any guidance here?

Feel free to improve the kerneldoc comment of __pm_runtime_resume(),
although it is clear enough to me, and fix the callers that leak the
refcount.
