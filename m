Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5519E187870
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 05:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgCQEXC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 17 Mar 2020 00:23:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33509 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgCQEXC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 00:23:02 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1jE3kq-0006l4-36
        for linux-input@vger.kernel.org; Tue, 17 Mar 2020 04:23:00 +0000
Received: by mail-wm1-f69.google.com with SMTP id 20so5304310wmk.1
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 21:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LR2lWYgIayYbanKxoGsZXWtRIFq/icnuafwUCJSqlBY=;
        b=YTR4VqxOD79MuxvuiXxfjJzZmvENE6KKnW+OMzdxgNZeaj66JYMnlQgmOIYPjliE65
         C7k5Hc6vXJLWCK6QsZnA3o7wL9gmGNPbUZbJR7A8ejdP30MaCq4HGosh9/UzefT/UFGE
         SkTMQB+uUYFaS3LO4zJXH9fOEMN3EVBHHeiMLyGnRTZ+So7PhW33LZVLecEoD/SUxsho
         ZK/ClkrQmbuRf9LHe+q4NUjUs8PIWUJFD9yzFqIwkRSMvwqA8Mu7q2S34st6BEaOz3uW
         75W0oCbv55Xu3eO8BWj+2FV+EtdcsCKbvoJFsH6xDvtQ78qJK6xY7vKvBTHVlL6qn1AO
         Umsw==
X-Gm-Message-State: ANhLgQ0O3M/E59xqVuty0vNw015ZZMsOrqX3QrVkhgJhhjqGG2823xG3
        xY8cjzbXGl/8ydyyZlb6RUavbeRPc7N2L17qGete6VyYBT7I+NccjbxTPo3sOVWg8E+BWXH+JHI
        aR2SBmxiJFns/yAmf103bjvA/cHv9Mu5zYrvI9SU8Qmv3A3N2G0e40D4Y
X-Received: by 2002:a5d:480a:: with SMTP id l10mr3446129wrq.178.1584418979798;
        Mon, 16 Mar 2020 21:22:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtS9xGu/clE7LssO/c1MTX7szfSJuHMsj9Z3gBuclu0wafunqLHCm+rn+msLWfL6mk91VyTZm7sdG3II1XWvOY=
X-Received: by 2002:a5d:480a:: with SMTP id l10mr3446094wrq.178.1584418979572;
 Mon, 16 Mar 2020 21:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <501e8224-e334-0aa8-41c0-8f67552e7069@gmail.com> <20200310033640.14440-1-vicamo@gmail.com>
In-Reply-To: <20200310033640.14440-1-vicamo@gmail.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Tue, 17 Mar 2020 12:22:48 +0800
Message-ID: <CAFv23Q=q2N7gyvKrgJZJN04+1YqV=VxP2smm6gxn4oAwx2=QNA@mail.gmail.com>
Subject: Re: [PATCH v2] Input: i8042 - fix the selftest retry logic
To:     You-Sheng Yang <vicamo@gmail.com>
Cc:     Allison Randal <allison@lohutok.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enrico Weigelt <info@metux.net>, linux-input@vger.kernel.org,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        You-Sheng Yang <vicamo.yang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This v2 fix my issue, too.
Please consider to merge this patch.
Thanks.

You-Sheng Yang <vicamo@gmail.com> 於 2020年3月10日 週二 上午11:37寫道：
>
> From: You-Sheng Yang <vicamo.yang@canonical.com>
>
> It returns -NODEV at the first selftest timeout, so the retry logic
> doesn't work. Move the return outside of the while loop to make it real
> retry 5 times before returns -ENODEV.
>
> BTW, the origin loop will retry 6 times, also fix this.
>
> Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
> ---
>  drivers/input/serio/i8042.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 20ff2bed3917..e8f2004071d4 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -937,25 +937,28 @@ static int i8042_controller_selftest(void)
>  {
>         unsigned char param;
>         int i = 0;
> +       int ret;
>
>         /*
>          * We try this 5 times; on some really fragile systems this does not
>          * take the first time...
>          */
> -       do {
> -
> -               if (i8042_command(&param, I8042_CMD_CTL_TEST)) {
> -                       pr_err("i8042 controller selftest timeout\n");
> -                       return -ENODEV;
> -               }
> +       while (i++ < 5) {
>
> -               if (param == I8042_RET_CTL_TEST)
> +               ret = i8042_command(&param, I8042_CMD_CTL_TEST);
> +               if (ret)
> +                       pr_err("i8042 controller selftest timeout (%d/5)\n", i);
> +               else if (param == I8042_RET_CTL_TEST)
>                         return 0;
> +               else
> +                       dbg("i8042 controller selftest: %#x != %#x\n",
> +                           param, I8042_RET_CTL_TEST);
>
> -               dbg("i8042 controller selftest: %#x != %#x\n",
> -                   param, I8042_RET_CTL_TEST);
>                 msleep(50);
> -       } while (i++ < 5);
> +       }
> +
> +       if (ret)
> +               return -ENODEV;
>
>  #ifdef CONFIG_X86
>         /*
> --
> 2.25.0
>
