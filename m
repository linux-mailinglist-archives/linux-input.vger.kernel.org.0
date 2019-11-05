Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0816FF0154
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 16:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731066AbfKEP0c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 10:26:32 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37263 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfKEP0c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 10:26:32 -0500
Received: by mail-ot1-f68.google.com with SMTP id d5so5900562otp.4;
        Tue, 05 Nov 2019 07:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIfCo+A8DoVqKAzDyaurbgPEk/FPat6dcPUzV2H14f8=;
        b=HXRxd8Y4DxmZnwFJQnvJEykEcD8djlwPPFPNej70LXXHXu/qZAAVDDvl5cz/S0nWkM
         chN0iRmyS4CmSHQTgR+5e6o0L5HLVcwxovyDVm6w/4sz0eqjd05YzpVtnOxpdUXmR7P3
         7rKVbeAeC0ISt/QOklGjm81Y4w9EA/VMeVngJVrWFHiMJJuvsSV6MqhZFmNcZ5SGK8+C
         LmeIghmfdU6m2/uU41I5/3GMn9pD7TBbNHaY48DOi6619iePOyfRA03MwhXAau3JO03s
         4Yze3rurMRv3QKef5pf5qPXoOCg6JyiHXois2+PasVg5zWB7hIYqPAxxl4KJkttfc8wa
         4lAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIfCo+A8DoVqKAzDyaurbgPEk/FPat6dcPUzV2H14f8=;
        b=oAupGnoobqWb/Vm2YkCoQIMVaswtNRktg0QTjHHwGvCHSghYDutr6zaPTWSnubUkZT
         CfehuIXu+NJAmHwTrd3o/fKE/QEKFtb7ZWc1oC5TX5Qs7Fnbn450PNM6nVug9ndt9IPe
         zuE1sEs/tQ+ODTsSnLcfpULL+Ky5OqWkz6tsvkwp/USS3Juh9Au2X8216U3MzeCzRO0x
         TLhHLYqwf6H3remVvhuJ2OrMhP+WOuoKBRctBm2xR6WjClb7A554IBzHpAuuYLmfD3r0
         rgwl15WLUkGR7Nr+26aZJGKnD/9ufrSAcCtkb2BIsNsq4vSYAvg9TaMdVshT628ec8EV
         NUDA==
X-Gm-Message-State: APjAAAULTP0nwnsIjB3w1FK/hERCrA4jgQRLe7y/QeKDucvJ1F4cpZIu
        /FAY3/NUQ8b50OrJ+7JKlnzXCuMiraIfjRfmThc=
X-Google-Smtp-Source: APXvYqzvtv1nwk8SbroF6M889lV6pjSj4nomDRn1kYxwrTjvHwyP3lsDRMEFK5hQftKyEKIoC2bi1QdOusgjL3X0nZQ=
X-Received: by 2002:a9d:6a10:: with SMTP id g16mr3046391otn.224.1572967590981;
 Tue, 05 Nov 2019 07:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com> <20191104233621.GP57214@dtor-ws>
In-Reply-To: <20191104233621.GP57214@dtor-ws>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 5 Nov 2019 10:26:19 -0500
Message-ID: <CAGngYiVkQsxF_v0w7YJnhMvhzz2gGV-_KcgJQYmz9biva==A1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 6:36 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> OK, I refreshed the branch with fixes and a couple of new patches. It is
> on top of 5.3 now. If this works for you guys I will be merging it for
> 5.5.

For the series:
Tested-by: Sven Van Asbroeck <TheSven73@gmail.com> # ILI2118A variant
