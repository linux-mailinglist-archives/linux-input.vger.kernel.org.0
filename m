Return-Path: <linux-input+bounces-3766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A18CBD80
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 11:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9FF81C20A36
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 09:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68497D408;
	Wed, 22 May 2024 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFh+HHpY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2FA18EB1;
	Wed, 22 May 2024 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716368835; cv=none; b=B/8aPF5RqBC2Qds9l/RaXqhtD7jTsb9DQDfPOFsPC3LxJGY6IAnNZcHcE+cReJnjkleJVtef54S0rkAunnwZ+wqBJFJsAXp7XrGRF3TKlXccsghiToSjmbm5wCNMlvvyJI2Lyk7537fY/XEW6MXzpbtbLJe6DstbNM4VQnZ22VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716368835; c=relaxed/simple;
	bh=zBhPEMTX9PqsDzmc16INt/86nouiClw6matfGDgSYaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imrV4x/2DpZuhMw4BOZGEeowRrunDgGkgQyJ5aIX+POFfb+U0z0v0tRGgxMUwN57Dv4jzH7zluvEmHgp/EXZJ4B9b9YzQlJkkZGvHoW+z0WX8oiT3xnuHUw34fkgJXLlswQq1iEb6VxvF9z2GoMam0SiTtYkpufhYTorSpE60Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFh+HHpY; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4df7ba13412so484978e0c.1;
        Wed, 22 May 2024 02:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716368833; x=1716973633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5psOd7hqWo3hW5Wok4H3VyQGZrxQz6I71Ugb4vpAtk=;
        b=fFh+HHpYNrvwg0U0Nz/WWJLRit4gV2RFNis6r52RMpeZTMhrm5q8/YlN8N718ZCsvp
         YFfI6sBlXHnD7/J+gtl4mVQaeJLqk1CJxRE3qKUCqAh7hyhRo54G7RrS0VGwrZ7XklzO
         JYiLu5rZb+CHujhbws/qazF6QZ8XA+bpq6gBqnwkloKz9Womi/fERY6x+aJ//oYHjAZ6
         rv+gI/VUu+sX7MFUuAXg/ckqWfCbf5kQdwS7plSaBBSa01lUdTiFVW9FxO2PaST8b1iP
         slbyyHKjhk01Vc8DzF6UF1PVlzh3GHyeHDqMvG4OAq0EqDwKPkGE4GQq02QLEM3y4dw2
         mJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716368833; x=1716973633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5psOd7hqWo3hW5Wok4H3VyQGZrxQz6I71Ugb4vpAtk=;
        b=FdfGh9E6YoatbNz2YTgQXv5wLHXHQ4kW3/n3+WxZbqHjLilkIez50d1Wn6t7/87zl9
         9LW649Lp5bYjgQvQJ5PQPehczgcsJIA5CZY5OD77UKola2bS0o+HsyDURmxwvdHpUzi6
         VaaJJXfjcLXJYSqrEiu/PrSr8CxEfNI8shl9x+koXgBBSXNp1z5GQgPQ8K4XN/j2gWEa
         Tm8Xyxtv14Y3rDEZC0RCatmFMYb8z2WS7heHzy9H1ajjTCTE4NuW4w6/pnve0ESUstsO
         u5meHXOb6wGZwQbArjeTGrB+rBV7W2gg2XDNPTCW161zfc64rjJTCgMDeB7iBZ5nI3J2
         PoOw==
X-Forwarded-Encrypted: i=1; AJvYcCUHKozZEtIzeRq9RIIbDFacjWk2pz04PemWEggInBmrLaRXxFsoI4nO7LTO6Zv/CO02ZGoS4JVNG+BeBNAl4VTqDVBUa0xL5+EmUFX4kFta58A1yeSv7iUW33vNkUfik8s/P2lF0+NxEqs=
X-Gm-Message-State: AOJu0YzzSH7ClImfXNPrPqk+E75je5qF/3KfJ8tg81yCQqW4Dz5J5Dt8
	dJBVjxfHQnkcrbdWu4BWgY80//xzX8hyZ2inh2mRWtEbybbqujpcTKvGN67Lw1LAkTvTAPpsCV9
	hMnQRxN0bJ1a6HPIPxKe2cisDvN4=
X-Google-Smtp-Source: AGHT+IHWP3MmjoOtnyvnQoUUEcrGB2wSLMPSY+M/zLIx0wOHUD+dTDFGH27T6R7kVWXEu0ETk5OswpL6IJwvjhLXwLo=
X-Received: by 2002:a05:6122:d9b:b0:4d4:4ff8:c367 with SMTP id
 71dfb90a1353d-4e1d5b1cbc9mr751694e0c.6.1716368833118; Wed, 22 May 2024
 02:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522080328.12317-1-hailong.liu@oppo.com>
In-Reply-To: <20240522080328.12317-1-hailong.liu@oppo.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 May 2024 21:07:01 +1200
Message-ID: <CAGsJ_4xJ3-_=vzJR8FKwLo5DydOzusqpL3eT8q84M_SdbCUfJA@mail.gmail.com>
Subject: Re: [PATCH] HID: Use kvzalloc instead of kzalloc in hid_register_field()
To: hailong.liu@oppo.com
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 8:03=E2=80=AFPM <hailong.liu@oppo.com> wrote:
>
> From: "Hailong.Liu" <hailong.liu@oppo.com>
>
> The function hid_register_field() might allocate more than 32k, which
> would use order-4 contiguous memory if the parameter usage exceeds
> 1024. However, after the system runs for a while, the memory can
> become heavily fragmented. This increases the likelihood of order-4 page
> allocation failure. Here=E2=80=99s the relevant log.
>
> [71553.093623]kworker/1: 0: page allocation failure: order:4, mode:0x40dc=
0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), nodemask=3D(null),cpuset=3D/,mems_allo=
wed=3D0
> [71553.093669]Workqueue: events uhid_device_add_worker
> [71553.093683]Call trace:
> [71553.093687]: dump_backtrace+0xf4/0x118
> [71553.093696]: show_stack+0x18/0x24
> [71553.093702]: dump_stack_lvl+0x60/0x7c
> [71553.093710]: dump_stack+0x18/0x3c
> [71553.093717]: warn_alloc+0xf4/0x174
> [71553.093725]: __alloc_pages_slowpath+0x1ba0/0x1cac
> [71553.093732]: __alloc_pages+0x460/0x560
> [71553.093738]: __kmalloc_large_node+0xbc/0x1f8
> [71553.093746]: __kmalloc+0x144/0x254
> [71553.093752]: hid_add_field+0x13c/0x308
> [71553.093758]: hid_parser_main+0x250/0x298
> [71553.093765]: hid_open_report+0x214/0x30c
> [71553.093771]: mt_probe+0x130/0x258
> [71553.093778]: hid_device_probe+0x11c/0x1e4
> [71553.093784]: really_probe+0xe4/0x388
> [71553.093791]: __driver_probe_device+0xa0/0x12c
> [71553.093798]: driver_probe_device+0x44/0x214
> [71553.093804]: __device_attach_driver+0xdc/0x124
> [71553.093812]: bus_for_each_drv+0x88/0xec
> [71553.093818]: __device_attach+0x84/0x170
> [71553.093824]: device_initial_probe+0x14/0x20
> [71553.093831]: bus_probe_device+0x48/0xd0
> [71553.093836]: device_add+0x248/0x928
> [71553.093844]: hid_add_device+0xf8/0x1a4
> [71553.093850]: uhid_device_add_worker+0x24/0x144
> [71553.093857]: process_one_work+0x158/0x804
> [71553.093865]: worker_thread+0x15c/0x494
> [71553.093872]: kthread+0xf4/0x1e4
> [71553.093880]: ret_from_fork+0x10/0x20
>
> To fix the allocation failure, use kvzalloc() instead of kzalloc().
>
> Signed-off-by: Hailong.Liu <hailong.liu@oppo.com>

This makes a lot of sense from the perspective of mm.

Acked-by: Barry Song <baohua@kernel.org>

> ---
>  drivers/hid/hid-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index de7a477d6665..574ec4873f41 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -95,9 +95,9 @@ static struct hid_field *hid_register_field(struct hid_=
report *report, unsigned
>                 return NULL;
>         }
>
> -       field =3D kzalloc((sizeof(struct hid_field) +
> -                        usages * sizeof(struct hid_usage) +
> -                        3 * usages * sizeof(unsigned int)), GFP_KERNEL);
> +       field =3D kvzalloc((sizeof(struct hid_field) +
> +                         usages * sizeof(struct hid_usage) +
> +                         3 * usages * sizeof(unsigned int)), GFP_KERNEL)=
;
>         if (!field)
>                 return NULL;
>
> @@ -661,7 +661,7 @@ static void hid_free_report(struct hid_report *report=
)
>         kfree(report->field_entries);
>
>         for (n =3D 0; n < report->maxfield; n++)
> -               kfree(report->field[n]);
> +               kvfree(report->field[n]);
>         kfree(report);
>  }
>
> --
> 2.34.1
>

Thanks
Barry

