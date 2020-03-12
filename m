Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2999B183981
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 20:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgCLTdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 15:33:24 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45385 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgCLTdY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 15:33:24 -0400
Received: by mail-lj1-f196.google.com with SMTP id e18so7847989ljn.12
        for <linux-input@vger.kernel.org>; Thu, 12 Mar 2020 12:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=CzwX3JhIDPjn8Zf/b6fbGBesCy+eZsCppQlTq8HkhYg=;
        b=QayA64qNRNU0xH2o43FSdFi17MC1VTw0kY/pBfJsjBmYlPISlqtpekl7jTiNx8x3hE
         55R1wq+qpLpzNqeLXWdpY4gPPcyBEye7AGwxG4Zcve0CY2L+DGtVnKF2YybmxaNT8duv
         nD+1885Owz9j04pPDu+yUhYEBwyunOV0Gi5q9OTwgv85DHsGANsNhsxHwrfMr8eNx51w
         dVnp3JT2f0h0SZ3YoyMKSFItFngKk7Kuw+LW0E99wFWjzdBkZANK7SRPC9H55F7CwCoa
         plU3fXfEhKh/AKwk8wn9KIFAWEEg4ICZxnRlYQC7RlNxzpNjjE+R0SHcq0ODuhPunjkP
         FKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=CzwX3JhIDPjn8Zf/b6fbGBesCy+eZsCppQlTq8HkhYg=;
        b=VOgxdAfm1G28blBPHXJr+cmxgu1vvavWmvkq/pjvYvUeGdg96iYgx8uUtGy0nFXYeG
         YCpt+gtdJoOB7todCMS7i7YXAzNi+pceREiS4OOH+oymn5Ljz7e4BCwOAgLI7MJCWO+8
         c8+uekwU0mF/h4WGymcO2/04SOZChBI/moq23At6BQK+cLwShMPIidigCldQli/NRMJF
         b18dYJf1vkNV0vkUxZyEOTxpS2jKr4pkuWCqZOmVI9xWssdg8OzTIodGPe8xPLWPP3A3
         7gIwN/kjSVpY3xEtG86QMPD1jJreEyiHj74sEDKpcY5dYTbuD6BzrCAwnZXOINrdZED4
         Jd8w==
X-Gm-Message-State: ANhLgQ13iM+5bR5NxwqNsXCnRGtW3OD6o8352FLuYpnin623vXRnhdYf
        jAvSnU/HpuKM86uo+VLO+L7V6Fj/i0kwksrh9LycVb2C
X-Google-Smtp-Source: ADFU+vsyPcIWcQDYaioXlz7FWZjzsE68UJXRIDHTYfF+ewOuSZoHHX7h5fQh44mivCxhpzdWLwkm0r/7qTrNw5LJPsM=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr5766672ljp.66.1584041602698;
 Thu, 12 Mar 2020 12:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200304002137.83630-1-rajatja@google.com>
In-Reply-To: <20200304002137.83630-1-rajatja@google.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Thu, 12 Mar 2020 12:32:46 -0700
Message-ID: <CACK8Z6FNmZFW9c=1tY4Q4rn4ZyUu--CUTuLk0SHZsuYb1-H7Og@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Allocate keycode for SNIP key
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,


On Tue, Mar 3, 2020 at 4:21 PM Rajat Jain <rajatja@google.com> wrote:
>
> New chromeos keyboards have a "snip" key that is basically a selective
> screenshot (allows a user to select an area of screen to be copied).
> Allocate a keyvode for it.

Any comments on this patch?

Thanks & Best Regards,

Rajat

>
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> V2: Drop patch [1/2] and instead rebase this on top of Linus' tree.
>
>  include/uapi/linux/input-event-codes.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 0f1db1cccc3fd..08c8572891efb 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -652,6 +652,9 @@
>  /* Electronic privacy screen control */
>  #define KEY_PRIVACY_SCREEN_TOGGLE      0x279
>
> +/* Selective Screenshot */
> +#define KEY_SNIP                        0x280
> +
>  /*
>   * Some keyboards have keys which do not have a defined meaning, these keys
>   * are intended to be programmed / bound to macros by the user. For most
> --
> 2.25.0.265.gbab2e86ba0-goog
>
