Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5B41F9C76
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 18:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgFOQAg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 12:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgFOQAg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 12:00:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D75C061A0E
        for <linux-input@vger.kernel.org>; Mon, 15 Jun 2020 09:00:34 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so17983749ejm.12
        for <linux-input@vger.kernel.org>; Mon, 15 Jun 2020 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAqvecXPrf1yJKO+DlwSPUFdM71Hv2RMZZJr56wj83E=;
        b=HArfivP/gYlf1X2Ft2s326FMFrvUB96YksKggufzKaudFKasW7RigK/tqAeWd/DN8T
         2JH9NEXeCofvu9WGmbd+kAmeophLx1mjHrkpo/T84j7GvC/0UGGwOkU62N80/S1yQJQx
         DswBXQMGEsTZaeQ8E0T0hpt13vwlyiDAtiBK/pcIAVAG0I/DweuPoiwO7D5Tv85qSJ1g
         QLhWjP/VeqoMfJ3cljjDDGRxVIb8uGMBP2Z/p8LipWqGcLj5+T1qubz4mdohAMUASm4H
         95s9p8jNWM20MPjoyE1QTDfR64LE/h9o0TEyt+75/xIL3Wh9kP4RxVtlneE3sRKm+vPj
         kpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAqvecXPrf1yJKO+DlwSPUFdM71Hv2RMZZJr56wj83E=;
        b=qsVwDDHkTDD3WUPkRoVLQ8jG6Se1/H+JXmvVdXduWagxqOyhfOZXrrndf8hkXizKV2
         Ie8b+dyb5BepcoWU2Fs1s/jiXrM8UZO8Z3dWTYx2yD75DlKwbeP6mvy+3gm6Pxd63/oy
         J1xFqZRgThgHHnoz9anZSkEHSJhjbKiN4oLq/AlmLQ3vyqcPU5B2p0zgCh1s27eVHlUk
         JmX8ufXiLy1kRp9j5igAB8ibwtLnPKAAoULqB4HcZHF66jPLKJ0Xkv4fitq5g+GpewKA
         7ImAAP3CbhKwMCDX8Y7Q+ROpmomYnW3aCgZfUBi1RI8wreK2zwmMv4XMnF5CMRbP4NIq
         2WFQ==
X-Gm-Message-State: AOAM532cCLLrj8j+/o832opAX/VSdTJYu0NxDS3/hBozXaSHQThrUltv
        +iYgVf3M2notviqBisEqQ6KWyv7qWVNalcGQyhJySg==
X-Google-Smtp-Source: ABdhPJxo1kAVp+0jjnteItva8GaLMxkpWoXLmdiTdH/6SpRIia7IZFRLgEy9t/qvt6SlckGtVb64a9uB8iIedg6JDl8=
X-Received: by 2002:a17:906:d9dc:: with SMTP id qk28mr25400022ejb.6.1592236833462;
 Mon, 15 Jun 2020 09:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAKF84v0xsK2d+XEEnNC+SnE987fDaD=RyvZzZW3ew8L4K0JHzg@mail.gmail.com>
 <20200613122235.GA11175@casa>
In-Reply-To: <20200613122235.GA11175@casa>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Mon, 15 Jun 2020 11:00:21 -0500
Message-ID: <CAKF84v05UjZg-7ZrVcwExk7Jkux=siR4Y8UnMt7KV0-9BrRfzg@mail.gmail.com>
Subject: Re: Kasan crash in hid-steam
To:     Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Rodrigo,

I ran the test 50 times with your patch, and no crashes.

Tested-by: Siarhei Vishniakou <svv@google.com>

Side question, is there any plan to support the beta bluetooth mode
for this controller?
Currently, the controller permanently stays in the lizard mode when
connected via bluetooth.

On Sat, Jun 13, 2020 at 7:22 AM Rodrigo Rivas Costa
<rodrigorivascosta@gmail.com> wrote:
>
> Hi, thank you for the report.
>
> It looks like using uhid you exercised some codepath that are never seen
> using the real HW. And that exposes some race handling the list of
> devices.
>
> Please, see if the following patch fixes the issue.
> Best regards.
>
> ---
>  drivers/hid/hid-steam.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index 6286204d4c56..a3b151b29bd7 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -526,7 +526,8 @@ static int steam_register(struct steam_device *steam)
>                         steam_battery_register(steam);
>
>                 mutex_lock(&steam_devices_lock);
> -               list_add(&steam->list, &steam_devices);
> +               if (list_empty(&steam->list))
> +                       list_add(&steam->list, &steam_devices);
>                 mutex_unlock(&steam_devices_lock);
>         }
>
> @@ -552,7 +553,7 @@ static void steam_unregister(struct steam_device *steam)
>                 hid_info(steam->hdev, "Steam Controller '%s' disconnected",
>                                 steam->serial_no);
>                 mutex_lock(&steam_devices_lock);
> -               list_del(&steam->list);
> +               list_del_init(&steam->list);
>                 mutex_unlock(&steam_devices_lock);
>                 steam->serial_no[0] = 0;
>         }
> @@ -738,6 +739,7 @@ static int steam_probe(struct hid_device *hdev,
>         mutex_init(&steam->mutex);
>         steam->quirks = id->driver_data;
>         INIT_WORK(&steam->work_connect, steam_work_connect_cb);
> +       INIT_LIST_HEAD(&steam->list);
>
>         steam->client_hdev = steam_create_client_hid(hdev);
>         if (IS_ERR(steam->client_hdev)) {
> --
> 2.27.0
>
