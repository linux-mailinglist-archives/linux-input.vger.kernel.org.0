Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD309184E50
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 19:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCMSFi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 14:05:38 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33438 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbgCMSFi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 14:05:38 -0400
Received: by mail-qt1-f194.google.com with SMTP id d22so8325514qtn.0
        for <linux-input@vger.kernel.org>; Fri, 13 Mar 2020 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EDlxU+1XKAxrrsgNFuO7SmcWGCGnxac2HBDzdZLOJKA=;
        b=fb7uWYOIDRZuM0lLutv+Kq/0ARim7AfCnQP88HW1imxu6xzWuwDjMG08m+4FIMKxJE
         /Vl6pThzwWkWYcNb4MZDNXtJ1UkWDKE0hm6hBOhFcOtE6sm9Lif/W0vFCFT9whB8LDQe
         jyl6t0vluYzD176kp+F4ShQkv/VQGjfFnuAXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDlxU+1XKAxrrsgNFuO7SmcWGCGnxac2HBDzdZLOJKA=;
        b=ink8i/ChO5GSeF1R0+u2m1aZAF+bjDQyqNEX3sxNqzwUV+kkS/JcMy86v6gTF8g7RO
         XYpyokh8dmN61zFija9SOSdk/KmI8ajvkl6aMHM4LkahT8mtt1S+JG4Y/ViFMyt6de6u
         u7k5RzGrqKc+x0vzILVU0femSML6PoNTCmfxg/mAUh8dBFfXRV0nSk1YPAjKyVgDAyVs
         5P3M6pxJ9HWU/z5fQuvgrLNArR3+Ba6lMM13WAPZCcd4j1/m3HHxOA8a3d2sz+vuoeh3
         zhwJ55NCDSGyIF3QC9YzfhTiT6TKatjqNW66CtzY8lt7WbvyparrYTpy8UfEh21v18j2
         fqMA==
X-Gm-Message-State: ANhLgQ2TjfDEGx/iZj0g8rT7c5bE7DN8U4MpcnvJI1f0C5PPBOfYCjGh
        0EE6pC9moPBXx3YXreLUSuEIgFF+qQ4=
X-Google-Smtp-Source: ADFU+vuichugvH9PU1en//Ft1f9F8l8s6zNv8WTxgK5y2agnilvcgIqJy+6vQtRSqCKohsFp0P1/8Q==
X-Received: by 2002:ac8:e09:: with SMTP id a9mr6154505qti.84.1584122736946;
        Fri, 13 Mar 2020 11:05:36 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id g62sm29398814qkd.25.2020.03.13.11.05.36
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:05:36 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id c28so5059716qvb.10
        for <linux-input@vger.kernel.org>; Fri, 13 Mar 2020 11:05:36 -0700 (PDT)
X-Received: by 2002:a05:6214:972:: with SMTP id do18mr13241291qvb.12.1584122735338;
 Fri, 13 Mar 2020 11:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200313180333.75011-1-rajatja@google.com>
In-Reply-To: <20200313180333.75011-1-rajatja@google.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Fri, 13 Mar 2020 11:05:24 -0700
X-Gmail-Original-Message-ID: <CA+jURctTtUCJyD0Rdd+urMiaASqyipg_mPrOBW3CEdmkVWHeOA@mail.gmail.com>
Message-ID: <CA+jURctTtUCJyD0Rdd+urMiaASqyipg_mPrOBW3CEdmkVWHeOA@mail.gmail.com>
Subject: Re: [PATCH v3] Input: Allocate keycode for "Selective Screenshot" key
To:     Rajat Jain <rajatja@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 13 Mar 2020 at 11:03, Rajat Jain <rajatja@google.com> wrote:
>
> New chromeos keyboards have a "snip" key that is basically a selective
> screenshot (allows a user to select an area of screen to be copied).
> Allocate a keycode for it.
>
> Signed-off-by: Rajat Jain <rajatja@google.com>

Reviewed-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team

> ---
> v3: Rename KEY_SNIP to KEY_SELECTIVE_SNAPSHOT
> V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.
>
>  include/uapi/linux/input-event-codes.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 0f1db1cccc3fd..c4dbe2ee9c098 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -652,6 +652,8 @@
>  /* Electronic privacy screen control */
>  #define KEY_PRIVACY_SCREEN_TOGGLE      0x279
>
> +#define KEY_SELECTIVE_SCREENSHOT       0x280
> +
>  /*
>   * Some keyboards have keys which do not have a defined meaning, these keys
>   * are intended to be programmed / bound to macros by the user. For most
> --
> 2.25.1.481.gfbce0eb801-goog
>
