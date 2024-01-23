Return-Path: <linux-input+bounces-1412-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8E83962E
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 18:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E11B2881E4
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 17:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E5C7FBCA;
	Tue, 23 Jan 2024 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cns14YxC"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15A17F7D5
	for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 17:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706030407; cv=none; b=dlSBiEmXEIcpcG8TrgPGS/gB7ARGGB4Quw7G9VxGj8/NAXZ56rch8zU9QdgX/ce2YcnX+Nm3OH1DBKVwA5mvqoybB73NvxUB8DaXNET8wXjlFlY5BDXSFDxvV7GU35mRFSeffD3Krd0zzN1bNvq3eUjfJ/PRC7sBFsY/8v+MR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706030407; c=relaxed/simple;
	bh=GqymZgwTked5+XNhT6X0WKV3KEZw+S/QGN2w+C+BhhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwm+Du4/m5uuI7hN0nXU+g1GiEVVJXSQSGOjD8JQ6FBXwErIIZfHOmJUEhXvwkYYlvt7PVHLLvpxCv5v5sHVIGSpNAucXh9TqKoSBwIHtYrPkhwUVkLF38ExFq5SH9AfqrZ9nkVgJlZ54uDXbEmri4DF3i/x+N3stKW3bM0EJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cns14YxC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706030405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvMnjthq+Awy01sI4P4BVpc1Pmq9uYsd26Z4T84XqXs=;
	b=Cns14YxCQmfOrs5knx2uF6OwvXrh6S5JmkP+WdKy564WFRk1khV/5lIPVMiyX3LAkwKVNi
	YmekF6KywOEaSga5xySr4dKZMLa+cmjsPdclJ3xtNcropzpHmKF2Rr3ZjHRkssfofyujkw
	q+hWbs+trYUukF1POsfrhOzIlpd04Wc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-dyOvrXgbOJiq8qNN8laVyA-1; Tue, 23 Jan 2024 12:20:02 -0500
X-MC-Unique: dyOvrXgbOJiq8qNN8laVyA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a301f12fc5dso119752266b.0
        for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 09:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706030400; x=1706635200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvMnjthq+Awy01sI4P4BVpc1Pmq9uYsd26Z4T84XqXs=;
        b=eiEMGgJnuI+TD4SIB5NmjZ1DedCZZLWCq90/O9WS9cM4do5czTi/5aKH7yNsTZtlGQ
         DRP5WfmANTcBCmbU12CFsA6mNmBVu3BVJyliQsI3t2rRoB5wP+rsMO+p4mX4gcpS6wON
         ujCJRpyO4i0djGlCC80ZwT2DIDdGTPWAw1qQP0kJBLwLNpq9pDMIESf+pa328oa6XrT6
         Fn9Gb3+rHuGUXaP7KO3LIQS3yYORbYGupYarfnxviZjIkS1+lv3ihbwje7/iG/o9dpX8
         9eI+x2Ua4nidik8omyqLxmtdXV8jHFKzbqxUOmTaGS9ROooSlug+8n+eKxWiERTho1HI
         S9kw==
X-Gm-Message-State: AOJu0YxUlOREfgwXj8blgxdst8A1r6JvzSEgwBM3UT7UZKJom0UdWKki
	PqtnsUoJpsKG+MUBzn0fN12BiV+5kzEvTk5cXm+6WRs006oSvGr53wyADUaxPxp4E1ZIddOSHcc
	DVeO1r+AdbBJe9gJ8ap9bcsbKcHi8y4o47qgZ2rTyjQlarzGsQ4FanmpAZf50+kdQuG1KlkLRsX
	EqGPpUMDJbJAd51JC7zg6JTMdwxO/y74YBJMN+lWTLt8nOmw==
X-Received: by 2002:a17:906:1188:b0:a28:fa54:ff4a with SMTP id n8-20020a170906118800b00a28fa54ff4amr118353eja.22.1706030400514;
        Tue, 23 Jan 2024 09:20:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPOZl83YA2N8qsXe+qnAtEJFZwHFDV6hE8rnu3gGAIBnZ2b7P9KgV8ewZkza2RLuFLKFPszeLOMUaeUTluRPg=
X-Received: by 2002:a17:906:1188:b0:a28:fa54:ff4a with SMTP id
 n8-20020a170906118800b00a28fa54ff4amr118344eja.22.1706030400161; Tue, 23 Jan
 2024 09:20:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123-b4-hid-bpf-fixes-v1-0-aa1fac734377@kernel.org> <20240123-b4-hid-bpf-fixes-v1-1-aa1fac734377@kernel.org>
In-Reply-To: <20240123-b4-hid-bpf-fixes-v1-1-aa1fac734377@kernel.org>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 23 Jan 2024 18:19:48 +0100
Message-ID: <CAO-hwJJcYuJ18rfRHCy4UH5_A=dSZCWKwo3YwvAgs+RqEP88Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: bpf: remove double fdget()
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 5:41=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> When the kfunc hid_bpf_attach_prog() is called, we called twice fdget():
> one for fetching the type of the bpf program, and one for actually
> attaching the program to the device.
>
> The problem is that between those two calls, we have no guarantees that
> the prog_fd is still the same file descriptor for the given program.
>
> Solve this by calling bpf_prog_get() earlier, and use this to fetch the
> program type.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/bpf/CAO-hwJJ8vh8JD3-P43L-_CLNmPx0hWj44aom0O=
838vfP4=3D_1CA@mail.gmail.com/T/#t
> Cc: stable@vger.kernel.org

Sigh, I forgot:

Fixes: f5c27da4e3c8 ("HID: initial BPF implementation")

Cheers,
Benjamin

> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
>  drivers/hid/bpf/hid_bpf_dispatch.c  | 66 ++++++++++++++++++++++++-------=
------
>  drivers/hid/bpf/hid_bpf_dispatch.h  |  4 +--
>  drivers/hid/bpf/hid_bpf_jmp_table.c | 20 ++---------
>  3 files changed, 49 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.c b/drivers/hid/bpf/hid_bpf=
_dispatch.c
> index d9ef45fcaeab..5111d1fef0d3 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.c
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.c
> @@ -241,6 +241,39 @@ int hid_bpf_reconnect(struct hid_device *hdev)
>         return 0;
>  }
>
> +static int do_hid_bpf_attach_prog(struct hid_device *hdev, int prog_fd, =
struct bpf_prog *prog,
> +                                 __u32 flags)
> +{
> +       int fd, err, prog_type;
> +
> +       prog_type =3D hid_bpf_get_prog_attach_type(prog);
> +       if (prog_type < 0)
> +               return prog_type;
> +
> +       if (prog_type >=3D HID_BPF_PROG_TYPE_MAX)
> +               return -EINVAL;
> +
> +       if (prog_type =3D=3D HID_BPF_PROG_TYPE_DEVICE_EVENT) {
> +               err =3D hid_bpf_allocate_event_data(hdev);
> +               if (err)
> +                       return err;
> +       }
> +
> +       fd =3D __hid_bpf_attach_prog(hdev, prog_type, prog_fd, prog, flag=
s);
> +       if (fd < 0)
> +               return fd;
> +
> +       if (prog_type =3D=3D HID_BPF_PROG_TYPE_RDESC_FIXUP) {
> +               err =3D hid_bpf_reconnect(hdev);
> +               if (err) {
> +                       close_fd(fd);
> +                       return err;
> +               }
> +       }
> +
> +       return fd;
> +}
> +
>  /**
>   * hid_bpf_attach_prog - Attach the given @prog_fd to the given HID devi=
ce
>   *
> @@ -257,18 +290,13 @@ noinline int
>  hid_bpf_attach_prog(unsigned int hid_id, int prog_fd, __u32 flags)
>  {
>         struct hid_device *hdev;
> +       struct bpf_prog *prog;
>         struct device *dev;
> -       int fd, err, prog_type =3D hid_bpf_get_prog_attach_type(prog_fd);
> +       int fd;
>
>         if (!hid_bpf_ops)
>                 return -EINVAL;
>
> -       if (prog_type < 0)
> -               return prog_type;
> -
> -       if (prog_type >=3D HID_BPF_PROG_TYPE_MAX)
> -               return -EINVAL;
> -
>         if ((flags & ~HID_BPF_FLAG_MASK))
>                 return -EINVAL;
>
> @@ -278,23 +306,17 @@ hid_bpf_attach_prog(unsigned int hid_id, int prog_f=
d, __u32 flags)
>
>         hdev =3D to_hid_device(dev);
>
> -       if (prog_type =3D=3D HID_BPF_PROG_TYPE_DEVICE_EVENT) {
> -               err =3D hid_bpf_allocate_event_data(hdev);
> -               if (err)
> -                       return err;
> -       }
> +       /*
> +        * take a ref on the prog itself, it will be released
> +        * on errors or when it'll be detached
> +        */
> +       prog =3D bpf_prog_get(prog_fd);
> +       if (IS_ERR(prog))
> +               return PTR_ERR(prog);
>
> -       fd =3D __hid_bpf_attach_prog(hdev, prog_type, prog_fd, flags);
> +       fd =3D do_hid_bpf_attach_prog(hdev, prog_fd, prog, flags);
>         if (fd < 0)
> -               return fd;
> -
> -       if (prog_type =3D=3D HID_BPF_PROG_TYPE_RDESC_FIXUP) {
> -               err =3D hid_bpf_reconnect(hdev);
> -               if (err) {
> -                       close_fd(fd);
> -                       return err;
> -               }
> -       }
> +               bpf_prog_put(prog);
>
>         return fd;
>  }
> diff --git a/drivers/hid/bpf/hid_bpf_dispatch.h b/drivers/hid/bpf/hid_bpf=
_dispatch.h
> index 63dfc8605cd2..fbe0639d09f2 100644
> --- a/drivers/hid/bpf/hid_bpf_dispatch.h
> +++ b/drivers/hid/bpf/hid_bpf_dispatch.h
> @@ -12,9 +12,9 @@ struct hid_bpf_ctx_kern {
>
>  int hid_bpf_preload_skel(void);
>  void hid_bpf_free_links_and_skel(void);
> -int hid_bpf_get_prog_attach_type(int prog_fd);
> +int hid_bpf_get_prog_attach_type(struct bpf_prog *prog);
>  int __hid_bpf_attach_prog(struct hid_device *hdev, enum hid_bpf_prog_typ=
e prog_type, int prog_fd,
> -                         __u32 flags);
> +                         struct bpf_prog *prog, __u32 flags);
>  void __hid_bpf_destroy_device(struct hid_device *hdev);
>  int hid_bpf_prog_run(struct hid_device *hdev, enum hid_bpf_prog_type typ=
e,
>                      struct hid_bpf_ctx_kern *ctx_kern);
> diff --git a/drivers/hid/bpf/hid_bpf_jmp_table.c b/drivers/hid/bpf/hid_bp=
f_jmp_table.c
> index eca34b7372f9..12f7cebddd73 100644
> --- a/drivers/hid/bpf/hid_bpf_jmp_table.c
> +++ b/drivers/hid/bpf/hid_bpf_jmp_table.c
> @@ -333,15 +333,10 @@ static int hid_bpf_insert_prog(int prog_fd, struct =
bpf_prog *prog)
>         return err;
>  }
>
> -int hid_bpf_get_prog_attach_type(int prog_fd)
> +int hid_bpf_get_prog_attach_type(struct bpf_prog *prog)
>  {
> -       struct bpf_prog *prog =3D NULL;
> -       int i;
>         int prog_type =3D HID_BPF_PROG_TYPE_UNDEF;
> -
> -       prog =3D bpf_prog_get(prog_fd);
> -       if (IS_ERR(prog))
> -               return PTR_ERR(prog);
> +       int i;
>
>         for (i =3D 0; i < HID_BPF_PROG_TYPE_MAX; i++) {
>                 if (hid_bpf_btf_ids[i] =3D=3D prog->aux->attach_btf_id) {
> @@ -350,8 +345,6 @@ int hid_bpf_get_prog_attach_type(int prog_fd)
>                 }
>         }
>
> -       bpf_prog_put(prog);
> -
>         return prog_type;
>  }
>
> @@ -388,19 +381,13 @@ static const struct bpf_link_ops hid_bpf_link_lops =
=3D {
>  /* called from syscall */
>  noinline int
>  __hid_bpf_attach_prog(struct hid_device *hdev, enum hid_bpf_prog_type pr=
og_type,
> -                     int prog_fd, __u32 flags)
> +                     int prog_fd, struct bpf_prog *prog, __u32 flags)
>  {
>         struct bpf_link_primer link_primer;
>         struct hid_bpf_link *link;
> -       struct bpf_prog *prog =3D NULL;
>         struct hid_bpf_prog_entry *prog_entry;
>         int cnt, err =3D -EINVAL, prog_table_idx =3D -1;
>
> -       /* take a ref on the prog itself */
> -       prog =3D bpf_prog_get(prog_fd);
> -       if (IS_ERR(prog))
> -               return PTR_ERR(prog);
> -
>         mutex_lock(&hid_bpf_attach_lock);
>
>         link =3D kzalloc(sizeof(*link), GFP_USER);
> @@ -467,7 +454,6 @@ __hid_bpf_attach_prog(struct hid_device *hdev, enum h=
id_bpf_prog_type prog_type,
>   err_unlock:
>         mutex_unlock(&hid_bpf_attach_lock);
>
> -       bpf_prog_put(prog);
>         kfree(link);
>
>         return err;
>
> --
> 2.43.0
>


