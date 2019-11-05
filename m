Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F73EF333
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 03:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbfKECEZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 21:04:25 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:44238 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbfKECEZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 21:04:25 -0500
Received: by mail-oi1-f170.google.com with SMTP id s71so16078113oih.11;
        Mon, 04 Nov 2019 18:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADhHQyzzzWn62AhgjPBGjZ8RKk/lIEHw/9dcMO6+pCk=;
        b=lh+taqpro3T1ItQODcyPB3kJNsKkTG9wg7JPqeRouX9H+IDJbvGh3xl/krrLLUGcKD
         g6tjmweAkkVbxMWeRF6OKnvvhZ3Mps5JQcs4uGMCOgBcQbtSuLWHClnbJLki94kkiPfF
         sBrJQdETsXyOwtXkffzRQf1bqoUfcfS604LCBI/V6rr/OK9qWj93jeks784jnZmVkFBt
         9L51/MVqilrrvg3qaZLJG9MD67gv4CQfEgSqAW2w4Hj5b4zLwEyT7MYyJVTdH4fY35hO
         54yklCViHM4UeTEotJ/E/RQFJ91RU+ROAFc40K5D0xtLlxj5MHeOEsSGbLnPoba4S/gW
         nkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADhHQyzzzWn62AhgjPBGjZ8RKk/lIEHw/9dcMO6+pCk=;
        b=rCeLLLz/ehkhzirqkiyoPfIxN1ohZg8Vzjdy+VuTDdwPfsU2C3HHQZi8+xA5XTHu81
         UoFkyDFqlhW1Eo7+p2N+fNA4jzjd0uzT/VqRayu7MatCmyuyxNlp2LJ9SHKHa/zB9lhP
         tnHZiBiRxbOQsC+C98nZhpNYu9nyNsRSlDLSUMpNezbgsUe+dXqNdBExC3ZqEC74CTZf
         MsAB3MU2um/jUVFKc6PYEvdzWL1IpZPEfUes8lUR/i4o7nH2RFUwxs7y9eHHKw29aH2a
         rhVNE3z6gslzk7zy2uCFUtwGDavu0oqZGPjwxKewfoTkv3oxjSA8xXL5Wh5Qj+QW2x2h
         DJQA==
X-Gm-Message-State: APjAAAU2B5//5DKfqWhbCRb9Xb5hiphVb9T0Sme5EsbhajTTGseI/zHf
        icIjBSfOWqsKnuYuMGhJ0kEew9N1DI6TSKNkUq3ajA==
X-Google-Smtp-Source: APXvYqzQGIxisFpxPq6yZRZ1LuLxkXbVelLMLIpWXHzlIySh5ijOD0lSqbLfxkb7ZpV3CqbjgwCHs7NOUJQ48sEM7hw=
X-Received: by 2002:a05:6808:7d0:: with SMTP id f16mr1769719oij.86.1572919463689;
 Mon, 04 Nov 2019 18:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
 <20191104233621.GP57214@dtor-ws> <CAHCN7x+=_FM32JTEKAb=5pPJNvim88cUFuEXgdGhMG9gdr0Emg@mail.gmail.com>
In-Reply-To: <CAHCN7x+=_FM32JTEKAb=5pPJNvim88cUFuEXgdGhMG9gdr0Emg@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 4 Nov 2019 21:04:11 -0500
Message-ID: <CAGngYiX1JP8NZBU+wRzdsLBMN7hhsbmfaD5o4PGPX27Q-6J4xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Adam Ford <aford173@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 4, 2019 at 6:40 PM Adam Ford <aford173@gmail.com> wrote:
>
> I will test it tomorrow on a 2117a and reply with results.  I am very
> excited to see this integrated.
>

I will do the same. That should give us confidence that 211x works
ok.

Dmitry, should someone retest 251x and 210x after such a significant
change? Unfortunately I don't have access to these chips.
