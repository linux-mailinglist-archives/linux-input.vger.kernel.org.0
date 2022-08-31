Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9848A5A7BF2
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 13:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiHaLHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 07:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiHaLHT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 07:07:19 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4D7CE461;
        Wed, 31 Aug 2022 04:07:13 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id l16so7407277ilj.2;
        Wed, 31 Aug 2022 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3+Y19qbqOfOKCdO6satr64KYp8FSt0WdCJXly/Kr6V4=;
        b=oQehFaiXCrprvH1Av4ny354sfuI4solNkKcCw4+krks/gwHOxw6ae/X4zbLVXBtvbH
         4pDoGQ32uYoN+3sQO3AC60syNtyT/ixbwjgcosomogrm6qwReGu5UwiOgGpIEezYkL0j
         M6qbdi/kuVbpvaLC5wrBMkm6ySHvpZHnbhUScrE3vQz8jGdekRPKtsytutep7auBG5k6
         iDWMLbEc1cvdEERXRAl+2HHjcfijSRF3eQR1J8dwnhFglYtBuxuslqo8ZsCJwAzXOJnY
         DHgGFQKa+w8b79hvXzcVjkegfHn/2AC+d8HVSh2WQfuVf6Aeb3HpRYEsebzXzRpLT2Nq
         32ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3+Y19qbqOfOKCdO6satr64KYp8FSt0WdCJXly/Kr6V4=;
        b=nsDQAnYWBNCWIb4G63A5INaAOIHxOSB48ilD2CJ30b58b09QxsSBNCJXyx9hwDWOCA
         tFgfhJwxSyBF+jbdZh3RLVS6Ytxh7W34P2KWsMZHvS8mi0XzScN5eRx/9WLdnpwde//v
         tKFQCYI6wEqCtOvbF/ZPcfrCkmq/eGMN1sxo8UhD662pP67v2iLUUylRAsRzlOJs7rNa
         kvtjfsCZlr9uqChQX23kogUWEwZOtcSX5wcwOjsRNPqDOq5uL7ohjxGcliRxV7G59xJu
         t2LJWNB4tIxB956sYrjfNYI0gA+wW7GR5L7oFboCgy4d/f3GWYxpH1NLVa86Ok3BY5Yh
         yeSw==
X-Gm-Message-State: ACgBeo0AAZC3Q/rgExMH+GMXsxneCy0ZMjtm4eaY48zSDdESMCnIE9yk
        CQNECfcyCTpcUZ/0piDtq+4cVXceILK7C4AZYds=
X-Google-Smtp-Source: AA6agR4Eai9xmwbXn8E/Gh36RQ3nEE4HqyvSrJg4QuyYYbjKphFEKK/5z3YFnOzU8zFDEx4C4bnRSBqDvigq9wEqG4w=
X-Received: by 2002:a05:6e02:661:b0:2e2:be22:67f0 with SMTP id
 l1-20020a056e02066100b002e2be2267f0mr14238315ilt.91.1661944032433; Wed, 31
 Aug 2022 04:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220824134055.1328882-1-benjamin.tissoires@redhat.com>
 <20220824134055.1328882-5-benjamin.tissoires@redhat.com> <CAP01T74ZmvoYtG=8wiDm0_X3hrMN8s55CkSzurphDrZ3b86UZQ@mail.gmail.com>
 <CAO-hwJ+Xk=93oCXTp7vWVx_oXmx5=PPwWoAgahLSZBTcD9XQmg@mail.gmail.com>
In-Reply-To: <CAO-hwJ+Xk=93oCXTp7vWVx_oXmx5=PPwWoAgahLSZBTcD9XQmg@mail.gmail.com>
From:   Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date:   Wed, 31 Aug 2022 13:06:34 +0200
Message-ID: <CAP01T74KGSwYfCOdy7F_zk2CN5=ts01SSrPYUSAcDtL1zOB-Ug@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 04/23] bpf/verifier: allow kfunc to return an
 allocated mem
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 31 Aug 2022 at 07:50, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, Aug 26, 2022 at 3:25 AM Kumar Kartikeya Dwivedi
> <memxor@gmail.com> wrote:
> >
> > On Wed, 24 Aug 2022 at 15:41, Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > For drivers (outside of network), the incoming data is not statically
> > > defined in a struct. Most of the time the data buffer is kzalloc-ed
> > > and thus we can not rely on eBPF and BTF to explore the data.
> > >
> > > This commit allows to return an arbitrary memory, previously allocated by
> > > the driver.
> > > An interesting extra point is that the kfunc can mark the exported
> > > memory region as read only or read/write.
> > >
> > > So, when a kfunc is not returning a pointer to a struct but to a plain
> > > type, we can consider it is a valid allocated memory assuming that:
> > > - one of the arguments is either called rdonly_buf_size or
> > >   rdwr_buf_size
> > > - and this argument is a const from the caller point of view
> > >
> > > We can then use this parameter as the size of the allocated memory.
> > >
> > > The memory is either read-only or read-write based on the name
> > > of the size parameter.
> > >
> > > Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > >
> > > ---
> > >
> > > changes in v9:
> > > - updated to match upstream (replaced kfunc_flag by a field in
> > >   kfunc_meta)
> > >
> > > no changes in v8
> > >
> > > changes in v7:
> > > - ensures btf_type_is_struct_ptr() checks for a ptr first
> > >   (squashed from next commit)
> > > - remove multiple_ref_obj_id need
> > > - use btf_type_skip_modifiers instead of manually doing it in
> > >   btf_type_is_struct_ptr()
> > > - s/strncmp/strcmp/ in btf_is_kfunc_arg_mem_size()
> > > - check for tnum_is_const when retrieving the size value
> > > - have only one check for "Ensure only one argument is referenced
> > >   PTR_TO_BTF_ID"
> > > - add some more context to the commit message
> > >
> > > changes in v6:
> > > - code review from Kartikeya:
> > >   - remove comment change that had no reasons to be
> > >   - remove handling of PTR_TO_MEM with kfunc releases
> > >   - introduce struct bpf_kfunc_arg_meta
> > >   - do rdonly/rdwr_buf_size check in btf_check_kfunc_arg_match
> > >   - reverted most of the changes in verifier.c
> > >   - make sure kfunc acquire is using a struct pointer, not just a plain
> > >     pointer
> > >   - also forward ref_obj_id to PTR_TO_MEM in kfunc to not use after free
> > >     the allocated memory
> > >
> > > changes in v5:
> > > - updated PTR_TO_MEM comment in btf.c to match upstream
> > > - make it read-only or read-write based on the name of size
> > >
> > > new in v4
> > >
> > > change btf.h
> > >
> > > fix allow kfunc to return an allocated mem
> > > ---
> > >  include/linux/bpf.h   |  9 +++-
> > >  include/linux/btf.h   | 10 +++++
> > >  kernel/bpf/btf.c      | 98 ++++++++++++++++++++++++++++++++++---------
> > >  kernel/bpf/verifier.c | 43 +++++++++++++------
> > >  4 files changed, 128 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > > index 39bd36359c1e..90dd218e0199 100644
> > > --- a/include/linux/bpf.h
> > > +++ b/include/linux/bpf.h
> > > @@ -1932,13 +1932,20 @@ int btf_distill_func_proto(struct bpf_verifier_log *log,
> > >                            const char *func_name,
> > >                            struct btf_func_model *m);
> > > [...]
> > > +
> > >  static int btf_check_func_arg_match(struct bpf_verifier_env *env,
> > >                                     const struct btf *btf, u32 func_id,
> > >                                     struct bpf_reg_state *regs,
> > >                                     bool ptr_to_mem_ok,
> > > -                                   u32 kfunc_flags)
> > > +                                   struct bpf_kfunc_arg_meta *kfunc_meta)
> > >  {
> > >         enum bpf_prog_type prog_type = resolve_prog_type(env->prog);
> > >         bool rel = false, kptr_get = false, trusted_arg = false;
> > > @@ -6207,12 +6232,12 @@ static int btf_check_func_arg_match(struct bpf_verifier_env *env,
> > >                 return -EINVAL;
> > >         }
> > >
> > > -       if (is_kfunc) {
> > > +       if (is_kfunc && kfunc_meta) {
> > >                 /* Only kfunc can be release func */
> > > -               rel = kfunc_flags & KF_RELEASE;
> > > -               kptr_get = kfunc_flags & KF_KPTR_GET;
> > > -               trusted_arg = kfunc_flags & KF_TRUSTED_ARGS;
> > > -               sleepable = kfunc_flags & KF_SLEEPABLE;
> > > +               rel = kfunc_meta->flags & KF_RELEASE;
> > > +               kptr_get = kfunc_meta->flags & KF_KPTR_GET;
> > > +               trusted_arg = kfunc_meta->flags & KF_TRUSTED_ARGS;
> > > +               sleepable = kfunc_meta->flags & KF_SLEEPABLE;
> > >         }
> > >
> > >         /* check that BTF function arguments match actual types that the
> > > @@ -6225,6 +6250,35 @@ static int btf_check_func_arg_match(struct bpf_verifier_env *env,
> > >
> > >                 t = btf_type_skip_modifiers(btf, args[i].type, NULL);
> > >                 if (btf_type_is_scalar(t)) {
> > > +                       if (is_kfunc && kfunc_meta) {
> > > +                               bool is_buf_size = false;
> > > +
> > > +                               /* check for any const scalar parameter of name "rdonly_buf_size"
> > > +                                * or "rdwr_buf_size"
> > > +                                */
> > > +                               if (btf_is_kfunc_arg_mem_size(btf, &args[i], reg,
> > > +                                                             "rdonly_buf_size")) {
> > > +                                       kfunc_meta->r0_rdonly = true;
> > > +                                       is_buf_size = true;
> > > +                               } else if (btf_is_kfunc_arg_mem_size(btf, &args[i], reg,
> > > +                                                                    "rdwr_buf_size"))
> > > +                                       is_buf_size = true;
> > > +
> > > +                               if (is_buf_size) {
> > > +                                       if (kfunc_meta->r0_size) {
> > > +                                               bpf_log(log, "2 or more rdonly/rdwr_buf_size parameters for kfunc");
> > > +                                               return -EINVAL;
> > > +                                       }
> > > +
> > > +                                       if (!tnum_is_const(reg->var_off)) {
> > > +                                               bpf_log(log, "R%d is not a const\n", regno);
> > > +                                               return -EINVAL;
> > > +                                       }
> > > +
> > > +                                       kfunc_meta->r0_size = reg->var_off.value;
> >
> > Sorry for not pointing it out before, but you will need a call to
> > mark_chain_precision here after this, since the value of the scalar is
> > being used to decide the size of the returned pointer.
>
> No worries.
>
> I do however have a couple of questions (I have strictly no idea what
> mark_chain_precision does):

See this patch for some background:
https://lore.kernel.org/bpf/20220823185300.406-2-memxor@gmail.com
Same case here, it is setting the size of r0 PTR_TO_MEM.

> - which register number should I call mark_chain_precision() as
> parameter? r0 or regno (the one with the constant)?

Yes, regno, i.e. the one with the constant.

> - mark_chain_precision() is declared static in verifier.c. Should I
> export it so btf.c can have access to it, or can I delay the call to
> mark_chain_precision() in verifier.c when I set
> regs[BPF_REG_0].mem_size?
>

Yes, but then you have to remember the regno you have to call it for.
So it might be easier to just make it non-static and call in btf.c.

>
> >
> > > +                               }
> > > +                       }
> > > +
> > >                         if (reg->type == SCALAR_VALUE)
> > >                                 continue;
> > >                         bpf_log(log, "R%d is not a scalar\n", regno);
> > > @@ -6255,6 +6309,19 @@ static int btf_check_func_arg_match(struct bpf_verifier_env *env,
> > >                 if (ret < 0)
> > >                         return ret;
> > >
> > > +               if (is_kfunc && reg->type == PTR_TO_BTF_ID) {
> >
> > I think you can drop this extra check 'reg->type == PTR_TO_BTF_ID),
> > this condition of only one ref_obj_id should hold regardless of the
> > type.
>
> Ack.
>
> Cheers,
> Benjamin
>
> >
> > > [...]
> >
>
