Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED98757DCAF
	for <lists+linux-input@lfdr.de>; Fri, 22 Jul 2022 10:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiGVIoQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 04:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234467AbiGVIoN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 04:44:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A2AA9E7B3
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658479451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KPJ7NU0SBJ5IGQBa0MGzAB99cv4bRZOacuI2wl8M0yY=;
        b=USK83oURTp0W0v5rwxxMYiLJMedPR+yyi8VtVxehBjvtZ4EB7CmnUQwQ6Mz31qOzYiXJHg
        n1IBbmzak0yZxDTko6McIcS4JcQrs9vHGgjdeoAr8KWzt+C6W0rjS+i0AmIZCLi6Nq/6Ec
        HzefHtRpdI2T1hOHbphhyIyN7adLS6Q=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-yvpS3Cy9PHuPVtCuHb56Vw-1; Fri, 22 Jul 2022 04:44:09 -0400
X-MC-Unique: yvpS3Cy9PHuPVtCuHb56Vw-1
Received: by mail-pl1-f199.google.com with SMTP id n2-20020a170902e54200b0016c16832828so2427040plf.5
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 01:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KPJ7NU0SBJ5IGQBa0MGzAB99cv4bRZOacuI2wl8M0yY=;
        b=P6IzQzXgEa++vrIc8/E2Nz0uvk2lbVhiutM7GOWHzoVgtgEmUJ+pupgYdAHWkj0wc3
         mFYIlTzgBaiIa0XpYhmVdnCViTWno4EVMvQwsvzxNqVwG4m3VbkFXXpw58eo4zY9pAUd
         7MeCVvUjhJxbSbTrHqWuom3NJXTVhK4jwHHr5VQu4DDrDtjJUBI3Z3HvhqMoIkOFPUcB
         RgLZ9UuZylyVLVpfXxYrnMslHr3H5ejRvPKiCrMsFi3fZQVqfHaFsCu/Svm1CtHVpz4s
         fe2vk6x9D31/bTf3iHW6v824i8J5ilXvJWulMv5nKqc+RQGppj5ZvKfv2A/Ucdy1mA20
         YkFw==
X-Gm-Message-State: AJIora+6g/UUIXO+smnI7Kzjy1lBGB5Zw85DViTShjjF0h7w2LfDtHPe
        BREh3wjxTsr88q14vZaEpeTWJnZJ0Z/3qH7Xz8l6jLvhE8TWv98UWYKu8p/LIdQ0jW4q8xGpMKX
        7fFcQG1UNUuWoggmrE+x6RvAAB9GEXAUYawKsKhY=
X-Received: by 2002:a17:90b:4a08:b0:1ef:f36b:18e1 with SMTP id kk8-20020a17090b4a0800b001eff36b18e1mr16127735pjb.246.1658479448529;
        Fri, 22 Jul 2022 01:44:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vucvEYBhga7xRfvmO+fpAe+UxKmxIBDDjvW8ENwrZs/TTzp86GPuJSg32bCOVL9jphN7Wm13VUw34PY+/PHI4=
X-Received: by 2002:a17:90b:4a08:b0:1ef:f36b:18e1 with SMTP id
 kk8-20020a17090b4a0800b001eff36b18e1mr16127693pjb.246.1658479448127; Fri, 22
 Jul 2022 01:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220721153625.1282007-1-benjamin.tissoires@redhat.com>
 <20220721153625.1282007-3-benjamin.tissoires@redhat.com> <CAP01T746d18QjJH1pRaq5Wy2QtrXXKhaJge8sB=q1rNtqjTntA@mail.gmail.com>
In-Reply-To: <CAP01T746d18QjJH1pRaq5Wy2QtrXXKhaJge8sB=q1rNtqjTntA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 22 Jul 2022 10:43:57 +0200
Message-ID: <CAO-hwJJ+SgP4US26qUFAoXxVk00BbT0Ct-3ax5B6XwQ=_vDLLg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 02/24] bpf/verifier: allow kfunc to read user
 provided context
To:     Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 21, 2022 at 10:15 PM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Thu, 21 Jul 2022 at 17:36, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > When a kfunc was trying to access data from context in a syscall eBPF
> > program, the verifier was rejecting the call.
> > This is because the syscall context is not known at compile time, and
> > so we need to check this when actually accessing it.
> >
> > Check for the valid memory access and allow such situation to happen.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > ---
> >
>
> LGTM, with just a couple more nits.
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Thanks a lot for the quick review.

Sending the new version of just this patch now.

Cheers,
Benjamin

>
> > changes in v7:
> > - renamed access_t into atype
> > - allow zero-byte read
> > - check_mem_access() to the correct offset/size
> >
> > new in v6
> > ---
> >  kernel/bpf/verifier.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 7c1e056624f9..d5fe7e618c52 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -248,6 +248,7 @@ struct bpf_call_arg_meta {
> >         struct bpf_map *map_ptr;
> >         bool raw_mode;
> >         bool pkt_access;
> > +       bool is_kfunc;
> >         u8 release_regno;
> >         int regno;
> >         int access_size;
> > @@ -5170,6 +5171,7 @@ static int check_helper_mem_access(struct bpf_verifier_env *env, int regno,
> >                                    struct bpf_call_arg_meta *meta)
> >  {
> >         struct bpf_reg_state *regs = cur_regs(env), *reg = &regs[regno];
> > +       enum bpf_prog_type prog_type = resolve_prog_type(env->prog);
> >         u32 *max_access;
> >
> >         switch (base_type(reg->type)) {
> > @@ -5223,6 +5225,24 @@ static int check_helper_mem_access(struct bpf_verifier_env *env, int regno,
> >                                 env,
> >                                 regno, reg->off, access_size,
> >                                 zero_size_allowed, ACCESS_HELPER, meta);
> > +       case PTR_TO_CTX:
> > +               /* in case of a kfunc called in a program of type SYSCALL, the context is
> > +                * user supplied, so not computed statically.
> > +                * Dynamically check it now
> > +                */
> > +               if (prog_type == BPF_PROG_TYPE_SYSCALL && meta && meta->is_kfunc) {
> > +                       enum bpf_access_type atype = meta->raw_mode ? BPF_WRITE : BPF_READ;
> > +                       int offset = access_size - 1;
> > +
> > +                       /* Allow zero-byte read from NULL or PTR_TO_CTX */
>
> This will not be handling the case for NULL, only for kfunc(ptr_to_ctx, 0)
> A null pointer has its reg->type as scalar, so it will be handled by
> the default case.
>
> > +                       if (access_size == 0)
> > +                               return zero_size_allowed ? 0 : -EINVAL;
>
> We should use -EACCES, just to be consistent.
>
> > +
> > +                       return check_mem_access(env, env->insn_idx, regno, offset, BPF_B,
> > +                                               atype, -1, false);
> > +               }
> > +
> > +               fallthrough;
> >         default: /* scalar_value or invalid ptr */
> >                 /* Allow zero-byte read from NULL, regardless of pointer type */
> >                 if (zero_size_allowed && access_size == 0 &&
> > @@ -5335,6 +5355,7 @@ int check_kfunc_mem_size_reg(struct bpf_verifier_env *env, struct bpf_reg_state
> >         WARN_ON_ONCE(regno < BPF_REG_2 || regno > BPF_REG_5);
> >
> >         memset(&meta, 0, sizeof(meta));
> > +       meta.is_kfunc = true;
> >
> >         if (may_be_null) {
> >                 saved_reg = *mem_reg;
> > --
> > 2.36.1
> >
>

