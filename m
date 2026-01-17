Return-Path: <linux-input+bounces-17157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E159D38A74
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 01:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEC24303F7D5
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 00:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9359A500961;
	Sat, 17 Jan 2026 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnUR8yzI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFF17D2
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 00:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768608381; cv=none; b=gVQ3NPsnAHNBeDZ2T91/YFCNzV7lqXvKZrcI2J9j1u+VkyaxPfrbVrV1keWp8AisEB0FakGmcJ6FrygsMby+Fx2NWgm7wxFBNB3i4qjbOrd+t+LWvoYVaBeucsb0Mt0VEt0sSoFniFj30YAY4ogfD0Rw4RY+YBHp0iQeHN1QOaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768608381; c=relaxed/simple;
	bh=h2ln/wKX7SBUgPJweJrQtu4Q/2NKfeR1ErWvuLCA+Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuUcPfG1+FvhY5maewUPx0oSkB0wHwkv1wxYxq9/EbCzs6MCUvL9f5xf3V/H88bqz97Td2ZOMcn40Pi/Mxsufrk/zrFZGBgaG+pgl0eIPpoB0hAasj6jv5ImMhCF9PZHZvsbYl6wTONsjnOI4L+FcO7vnKsMabpovzWgTMBWzpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnUR8yzI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0bae9aca3so18071975ad.3
        for <linux-input@vger.kernel.org>; Fri, 16 Jan 2026 16:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768608379; x=1769213179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4R7MwkvY28w//a/lIqAt5KYCh6sv7mHBxNLr/F0AMTg=;
        b=cnUR8yzIhgstS/h+Off0A7KqT4k9eoLGX3DqZ3n5G/+4U7ZGGslspJHzPYHTfAmrQg
         aKuK6o7hELRJv/Fp2XQeQWDkGj4eQVhsYz/fcCC/KzzpqZXD0ToVpOaABw/L9Lb7lsEJ
         c5uMsC6iXJBLh4sVy9XgGEsfizt0E9ggYRu/pXfrk+oxWaemLgAy80jAh43V4u/5ag92
         zCmmRyBqYqYxszQGhZY6Q0B/itAMt4pQZWKoSMMuRQyUxSnE63chfbQcuHuVXCmDu2VD
         URxHZDI4G+TvVHYakWTuP7GUL2CtcK86965v7uCE7mICtIhg6gWdlMg0etjJCl8cwml1
         xHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768608379; x=1769213179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4R7MwkvY28w//a/lIqAt5KYCh6sv7mHBxNLr/F0AMTg=;
        b=qP2eYEpQWqwwWBitKfHGujI7R27m5WURlVhNkJ2raO/78Ft0sZn+bnFVdexc7fo6yv
         FM2R1xpzyFKFl2qtdYZBwG8U7k9q/Z18ChZFJhh9IqWaZoo7Bpn+3pLR5H5ujXD43pA3
         ZWiQlSflPC4IUskpeXgIFIg6dJ4/zI2UASuqGJzguGs/jFzwbrTV1yulrxaLSEogD00Q
         ICjR/yrD/yy2r3vIEvo/iGyDoqU3wdujGDq+pCqFjQHRUxR1UzQnc5qikupSudFVtDox
         zLbA/S9B300bwA+W/8aSkRMXsgMH33i2172wWNXjOylOKQxEfa0fBrCsekiJ8AoRyKSK
         QORA==
X-Forwarded-Encrypted: i=1; AJvYcCWaLDx7uuXTliKuH2UXHE61UAN6Y0qY49jWolPnhPifgaKOtU9C5xGelNlvo3VDKTsBS9cpmVrsi9wbbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6G6G5Ngawx701fXdqfa/cTLL77aToK+HoxnNwGM1iaDh+9srv
	ckDMNNke2LBppC7c3xlDKcIjfreq0l4OgfdUjzW44Qw996LeerTCXKFLhQcxndPnS/f2KxXuN6N
	tjFA80ZOGhue2/BmmOr3zp2FrytBgGH0=
X-Gm-Gg: AY/fxX4fQX84u/rKZNyE2eSN0ZwdDBj3d6SV9Rn5dtHH2WjT3S9aUxnUq6cSja7CI/f
	9ADj2XKLiHDfbrNv0VYlUZwppX3yv0+y/qyhw70CPEIgq8S0753/o4koIhkrsvlPOzfcLsbcA3Z
	GiZSdIn+sC8R/vLWT40NPifY3SxGgjxZm6Q/JXhnuMKchFZ9dOTDQFs9PZVBD+eBzQYnl4jl2yJ
	RgyhZ9WG8nvvF7ngALTkDujWG0TmfZ6iwx05m6HWo/Q/8zxh9Us2ffsXYJYWgWM9L1y42zqzxzZ
	7DsMrb+aG3g=
X-Received: by 2002:a17:903:1c2:b0:29e:940c:2cdf with SMTP id
 d9443c01a7336-2a7175be339mr44924465ad.36.1768608378836; Fri, 16 Jan 2026
 16:06:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116201700.864797-1-ihor.solodrai@linux.dev> <20260116201700.864797-6-ihor.solodrai@linux.dev>
In-Reply-To: <20260116201700.864797-6-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 16 Jan 2026 16:06:06 -0800
X-Gm-Features: AZwV_Qh51iktnNtGl5KEk_vgmlX67wbmJDnAVYb4S7SbBH-xy1X8CWy4GQT_EEo
Message-ID: <CAEf4BzbG=GMh0-1tT_2gdMtc-ZuV3X7hgoJZpt1RLCYgPMM3oQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 05/13] resolve_btfids: Support for KF_IMPLICIT_ARGS
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>, Tejun Heo <tj@kernel.org>, 
	Alan Maguire <alan.maguire@oracle.com>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Amery Hung <ameryhung@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 12:17=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux=
.dev> wrote:
>
> Implement BTF modifications in resolve_btfids to support BPF kernel
> functions with implicit arguments.
>
> For a kfunc marked with KF_IMPLICIT_ARGS flag, a new function
> prototype is added to BTF that does not have implicit arguments. The
> kfunc's prototype is then updated to a new one in BTF. This prototype
> is the intended interface for the BPF programs.
>
> A <func_name>_impl function is added to BTF to make the original kfunc
> prototype searchable for the BPF verifier. If a <func_name>_impl
> function already exists in BTF, its interpreted as a legacy case, and
> this step is skipped.
>
> Whether an argument is implicit is determined by its type:
> currently only `struct bpf_prog_aux *` is supported.
>
> As a result, the BTF associated with kfunc is changed from
>
>     __bpf_kfunc bpf_foo(int arg1, struct bpf_prog_aux *aux);
>
> into
>
>     bpf_foo_impl(int arg1, struct bpf_prog_aux *aux);
>     __bpf_kfunc bpf_foo(int arg1);
>
> For more context see previous discussions and patches [1][2].
>
> [1] https://lore.kernel.org/dwarves/ba1650aa-fafd-49a8-bea4-bdddee7c38c9@=
linux.dev/
> [2] https://lore.kernel.org/bpf/20251029190113.3323406-1-ihor.solodrai@li=
nux.dev/
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/bpf/resolve_btfids/main.c | 383 ++++++++++++++++++++++++++++++++
>  1 file changed, 383 insertions(+)
>

[...]

> +static int collect_decl_tags(struct btf2btf_context *ctx)
> +{
> +       const u32 type_cnt =3D btf__type_cnt(ctx->btf);
> +       struct btf *btf =3D ctx->btf;
> +       const struct btf_type *t;
> +       u32 *tags, *tmp;
> +       u32 nr_tags =3D 0;
> +
> +       tags =3D malloc(type_cnt * sizeof(u32));

waste of memory, really, see below

> +       if (!tags)
> +               return -ENOMEM;
> +
> +       for (u32 id =3D 1; id < type_cnt; id++) {
> +               t =3D btf__type_by_id(btf, id);
> +               if (!btf_is_decl_tag(t))
> +                       continue;
> +               tags[nr_tags++] =3D id;
> +       }
> +
> +       if (nr_tags =3D=3D 0) {
> +               ctx->decl_tags =3D NULL;
> +               free(tags);
> +               return 0;
> +       }
> +
> +       tmp =3D realloc(tags, nr_tags * sizeof(u32));
> +       if (!tmp) {
> +               free(tags);
> +               return -ENOMEM;
> +       }

This is an interesting realloc() usage pattern, it's quite
unconventional to preallocate too much memory, and then shrink (in C
world)

check libbpf's libbpf_add_mem(), that's a generic "primitive" inside
the libbpf. Do not reuse it as is, but it should give you an idea of a
common pattern: you start with NULL (empty data), when you need to add
a new element, you calculate a new array size which normally would be
some minimal value (to avoid going through 1 -> 2 -> 4 -> 8, many
small and wasteful steps; normally we just jump straight to 16 or so)
or some factor of previous size (doesn't have to be 2x,
libbpf_add_mem() expands by 25%, for instance).

This is a super common approach in C. Please utilize it here as well.

> +
> +       ctx->decl_tags =3D tmp;
> +       ctx->nr_decl_tags =3D nr_tags;
> +
> +       return 0;
> +}
> +
> +/*
> + * To find the kfunc flags having its struct btf_id (with ELF addresses)
> + * we need to find the address that is in range of a set8.
> + * If a set8 is found, then the flags are located at addr + 4 bytes.
> + * Return 0 (no flags!) if not found.
> + */
> +static u32 find_kfunc_flags(struct object *obj, struct btf_id *kfunc_id)
> +{
> +       const u32 *elf_data_ptr =3D obj->efile.idlist->d_buf;
> +       u64 set_lower_addr, set_upper_addr, addr;
> +       struct btf_id *set_id;
> +       struct rb_node *next;
> +       u32 flags;
> +       u64 idx;
> +
> +       next =3D rb_first(&obj->sets);
> +       while (next) {

for(next =3D rb_first(...); next; next =3D rb_next(next)) seems like a
good fit here, no?

> +               set_id =3D rb_entry(next, struct btf_id, rb_node);
> +               if (set_id->kind !=3D BTF_ID_KIND_SET8 || set_id->addr_cn=
t !=3D 1)
> +                       goto skip;
> +
> +               set_lower_addr =3D set_id->addr[0];
> +               set_upper_addr =3D set_lower_addr + set_id->cnt * sizeof(=
u64);
> +
> +               for (u32 i =3D 0; i < kfunc_id->addr_cnt; i++) {
> +                       addr =3D kfunc_id->addr[i];
> +                       /*
> +                        * Lower bound is exclusive to skip the 8-byte he=
ader of the set.
> +                        * Upper bound is inclusive to capture the last e=
ntry at offset 8*cnt.
> +                        */
> +                       if (set_lower_addr < addr && addr <=3D set_upper_=
addr) {
> +                               pr_debug("found kfunc %s in BTF_ID_FLAGS =
%s\n",
> +                                        kfunc_id->name, set_id->name);
> +                               goto found;

why goto, just do what needs to be done and return?

> +                       }
> +               }
> +skip:
> +               next =3D rb_next(next);
> +       }
> +
> +       return 0;
> +
> +found:
> +       idx =3D addr - obj->efile.idlist_addr;
> +       idx =3D idx / sizeof(u32) + 1;
> +       flags =3D elf_data_ptr[idx];
> +
> +       return flags;
> +}
> +
> +static s64 collect_kfuncs(struct object *obj, struct btf2btf_context *ct=
x)
> +{
> +       struct kfunc *kfunc, *kfuncs, *tmp;
> +       const char *tag_name, *func_name;
> +       struct btf *btf =3D ctx->btf;
> +       const struct btf_type *t;
> +       u32 flags, func_id;
> +       struct btf_id *id;
> +       s64 nr_kfuncs =3D 0;
> +
> +       if (ctx->nr_decl_tags =3D=3D 0)
> +               return 0;
> +
> +       kfuncs =3D malloc(ctx->nr_decl_tags * sizeof(*kfuncs));

ditto about realloc() usage pattern

> +       if (!kfuncs)
> +               return -ENOMEM;
> +

[...]

> +/*
> + * For a kfunc with KF_IMPLICIT_ARGS we do the following:
> + *   1. Add a new function with _impl suffix in the name, with the proto=
type
> + *      of the original kfunc.
> + *   2. Add all decl tags except "bpf_kfunc" for the _impl func.
> + *   3. Add a new function prototype with modified list of arguments:
> + *      omitting implicit args.
> + *   4. Change the prototype of the original kfunc to the new one.
> + *
> + * This way we transform the BTF associated with the kfunc from
> + *     __bpf_kfunc bpf_foo(int arg1, void *implicit_arg);
> + * into
> + *     bpf_foo_impl(int arg1, void *implicit_arg);
> + *     __bpf_kfunc bpf_foo(int arg1);
> + *
> + * If a kfunc with KF_IMPLICIT_ARGS already has an _impl counterpart
> + * in BTF, then it's a legacy case: an _impl function is declared in the
> + * source code. In this case, we can skip adding an _impl function, but =
we
> + * still have to add a func prototype that omits implicit args.
> + */
> +static int process_kfunc_with_implicit_args(struct btf2btf_context *ctx,=
 struct kfunc *kfunc)
> +{

this logic looks good

> +       s32 idx, new_proto_id, new_func_id, proto_id;
> +       const char *param_name, *tag_name;
> +       const struct btf_param *params;
> +       enum btf_func_linkage linkage;
> +       char tmp_name[KSYM_NAME_LEN];
> +       struct btf *btf =3D ctx->btf;
> +       int err, len, nr_params;
> +       struct btf_type *t;
> +

[...]

