Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEDE183AA6
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 21:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbgCLUbx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 16:31:53 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:44430 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgCLUbu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 16:31:50 -0400
Received: by mail-qv1-f67.google.com with SMTP id w5so3349905qvp.11
        for <linux-input@vger.kernel.org>; Thu, 12 Mar 2020 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSLhuIxEpdiu4IChuu+kUY7XbNTQNzxVu0kBYJHewI0=;
        b=eTGxhfXPoIRX+zZNKelilanBP2pQAgyeLUeHUq4AebBDBvuoAcOqcvK6/rL1VkDS3T
         KmZ2HJV92jzkFplHPBuV9azhiNjpj45MVNZ1V8lApj0Bd5r/q6wUmH65V3uUl5ZpIiSJ
         fdJ89S2UTfx4MI4020mmrVTAnmsWaDBO/g/so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSLhuIxEpdiu4IChuu+kUY7XbNTQNzxVu0kBYJHewI0=;
        b=GDSEy10VieeepovLOrgql/4J/Ltcemet8NemuR2HkKIQT+iMr8cEA5s6nkxtJnkLRK
         aqbIuVdws5h7jE6Er9OaeXsyu6IXgrPZe7FT7kQYv/vTsE/XLr54I6xZVA87vbdgaaIT
         sv7dnam8pPVO4isHa4ESFT6bX5ArCo+hO2LkQ+lNe2j+tOCTWdR7GlHclPfg8vuYr+jg
         jlLdagcF3vKGMlSnw0cCGPJtqAG8VWWkwSEKzLD750oERasfi8bStcOEWuwvnyfQRT1Y
         /RDAcVyaYqAQthEd4YCSj1puaWFlnwMiAz9/PUX6TJh0vITYqlumxpDVgUXtxwp8VGqH
         Vtag==
X-Gm-Message-State: ANhLgQ3SwZJH/lAHyemnw821oWgLWYaA0ZYEiXFS7m9MTixuHa96vcpz
        Kdjf7oHSuYTvHVjCZh6oN/rKxm+wF+I=
X-Google-Smtp-Source: ADFU+vs5mc8p/Wm25ZHLuoRkIcgU4ZbXiR9F5X3l/C5fKsSoJetgSOMgihgtS2kOkGoWZ/Axa/uf+w==
X-Received: by 2002:ad4:5642:: with SMTP id bl2mr9392932qvb.11.1584045108380;
        Thu, 12 Mar 2020 13:31:48 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id k4sm2856628qkc.18.2020.03.12.13.31.47
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 13:31:47 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id b5so8611577qkh.8
        for <linux-input@vger.kernel.org>; Thu, 12 Mar 2020 13:31:47 -0700 (PDT)
X-Received: by 2002:a37:a543:: with SMTP id o64mr8063320qke.460.1584045106987;
 Thu, 12 Mar 2020 13:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200304002137.83630-1-rajatja@google.com>
In-Reply-To: <20200304002137.83630-1-rajatja@google.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 12 Mar 2020 13:31:35 -0700
X-Gmail-Original-Message-ID: <CA+jURcsGvKbQi0bUs1BtAa7RC0NmtKBS=qtEzYWv=pUBqenmgQ@mail.gmail.com>
Message-ID: <CA+jURcsGvKbQi0bUs1BtAa7RC0NmtKBS=qtEzYWv=pUBqenmgQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Allocate keycode for SNIP key
To:     Rajat Jain <rajatja@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 3 Mar 2020 at 16:21, Rajat Jain <rajatja@google.com> wrote:
>
> New chromeos keyboards have a "snip" key that is basically a selective
> screenshot (allows a user to select an area of screen to be copied).
> Allocate a keyvode for it.
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

It's not very obvious to me what KEY_SNIP represents, without the
comment above. Maybe you could call it something like
KEY_SELECTIVE_SCREENSHOT, so that its purpose is more apparent to
someone seeing it in use.

Harry Cutts
Chrome OS Touch/Input team

>  /*
>   * Some keyboards have keys which do not have a defined meaning, these keys
>   * are intended to be programmed / bound to macros by the user. For most
> --
> 2.25.0.265.gbab2e86ba0-goog
>
