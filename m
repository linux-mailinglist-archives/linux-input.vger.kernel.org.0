Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB934CE431
	for <lists+linux-input@lfdr.de>; Sat,  5 Mar 2022 11:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiCEKeO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Mar 2022 05:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiCEKeN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Mar 2022 05:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22F871D67D8
        for <linux-input@vger.kernel.org>; Sat,  5 Mar 2022 02:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646476402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WaB48QPXvxyorCNEAfGOqCQhNyQCx5tsNaq3iOR1gLs=;
        b=ANo2qHAzTOKj60pnGNwYYpUJZp5H2rYji4CLRrm+TthhIA1CygqbM+h66Bs/J76sh+6yM8
        GOWpor6NA0sEjoqe5MaNE2Flaydd8wdnlNsEVXKZq2EvuM9eTQU0bSaqbjY/zzgpF+oKD5
        RvfuGtaZOSK1SEyrh4Q+pTM86ZytToE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-JXYAmGE8O1iXsuaY61BEOg-1; Sat, 05 Mar 2022 05:33:20 -0500
X-MC-Unique: JXYAmGE8O1iXsuaY61BEOg-1
Received: by mail-pj1-f70.google.com with SMTP id e3-20020a17090a4a0300b001bd4aa4cfbaso4697390pjh.6
        for <linux-input@vger.kernel.org>; Sat, 05 Mar 2022 02:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WaB48QPXvxyorCNEAfGOqCQhNyQCx5tsNaq3iOR1gLs=;
        b=rjos2Q94ozCd/eWgIrI5KCBV7Rba8OABCmhwFTmfSoNMHPx8avIj0NqMae31w6ZyfQ
         n05NcmaxlrCPkkmMeAAashrhBRuU2QqevRFamR9tO0wM+LqsuFluFtOX+TQ4/uJIuFan
         /JwEhV9AQ+Fseu2ovGwQ3E8tm2OfQxpd8M0LcnTj1b2L4C70g/KxcQWZ1tmnncOEAqxn
         I6dUuPdOpQKGGOBrl0SJ1PeQDaW1nNR88E6KFWyvsLKNaPt+zCuq9qM0Gvour1kKKBN2
         RZM913MgZd64lwUIVjE5mN8D2YW3ugFGKDPsrtQUrPoShwVrdH2WSjD6lFg/hxAzjwnl
         tjVg==
X-Gm-Message-State: AOAM531LFdUD7+MxjTEjDxK8IGRYUgRZXNnoCUh/Oq2j4fU6c45ASxFK
        e9VourfMLp4/KZ9tiIgF/jyK43Z/ECDGXe7vtztG5JujH/o1vGR7X35IuXvhozqSyoC1Hg7Y11S
        4X2W6VWeXdMmdxGRVKARcMfF4EAXku6efvEwy50I=
X-Received: by 2002:a17:902:e051:b0:151:b485:3453 with SMTP id x17-20020a170902e05100b00151b4853453mr2939338plx.116.1646476399595;
        Sat, 05 Mar 2022 02:33:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvMDMUSIapPGQR4vWL/oj2loykrWmm3QH2dbQIs2qPbGiLM6oj2RR6sBZVongKZSYwpL44WrYmtyNHa5g2bns=
X-Received: by 2002:a17:902:e051:b0:151:b485:3453 with SMTP id
 x17-20020a170902e05100b00151b4853453mr2939309plx.116.1646476399238; Sat, 05
 Mar 2022 02:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20220304172852.274126-1-benjamin.tissoires@redhat.com>
 <20220304172852.274126-13-benjamin.tissoires@redhat.com> <YiJdRQxYzfncfTR5@kroah.com>
In-Reply-To: <YiJdRQxYzfncfTR5@kroah.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Sat, 5 Mar 2022 11:33:07 +0100
Message-ID: <CAO-hwJJ3Yi+JLr40J8nXccjF8PrjiQw1w0Bskz8QHXdNVh1n+A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 12/28] bpf/hid: add hid_{get|set}_data helpers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 4, 2022 at 7:41 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 04, 2022 at 06:28:36PM +0100, Benjamin Tissoires wrote:
> > When we process an incoming HID report, it is common to have to account
> > for fields that are not aligned in the report. HID is using 2 helpers
> > hid_field_extract() and implement() to pick up any data at any offset
> > within the report.
> >
> > Export those 2 helpers in BPF programs so users can also rely on them.
> > The second net worth advantage of those helpers is that now we can
> > fetch data anywhere in the report without knowing at compile time the
> > location of it. The boundary checks are done in hid-bpf.c, to prevent
> > a memory leak.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > ---
> >
> > changes in v2:
> > - split the patch with libbpf and HID left outside.
> > ---
> >  include/linux/bpf-hid.h        |  4 +++
> >  include/uapi/linux/bpf.h       | 32 ++++++++++++++++++++
> >  kernel/bpf/hid.c               | 53 ++++++++++++++++++++++++++++++++++
> >  tools/include/uapi/linux/bpf.h | 32 ++++++++++++++++++++
> >  4 files changed, 121 insertions(+)
> >
> > diff --git a/include/linux/bpf-hid.h b/include/linux/bpf-hid.h
> > index 0c5000b28b20..69bb28523ceb 100644
> > --- a/include/linux/bpf-hid.h
> > +++ b/include/linux/bpf-hid.h
> > @@ -93,6 +93,10 @@ struct bpf_hid_hooks {
> >       int (*link_attach)(struct hid_device *hdev, enum bpf_hid_attach_type type);
> >       void (*link_attached)(struct hid_device *hdev, enum bpf_hid_attach_type type);
> >       void (*array_detached)(struct hid_device *hdev, enum bpf_hid_attach_type type);
> > +     int (*hid_get_data)(struct hid_device *hdev, u8 *buf, size_t buf_size,
> > +                         u64 offset, u32 n, u8 *data, u64 data_size);
> > +     int (*hid_set_data)(struct hid_device *hdev, u8 *buf, size_t buf_size,
> > +                         u64 offset, u32 n, u8 *data, u64 data_size);
> >  };
> >
> >  #ifdef CONFIG_BPF
> > diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> > index a7a8d9cfcf24..4845a20e6f96 100644
> > --- a/include/uapi/linux/bpf.h
> > +++ b/include/uapi/linux/bpf.h
> > @@ -5090,6 +5090,36 @@ union bpf_attr {
> >   *   Return
> >   *           0 on success, or a negative error in case of failure. On error
> >   *           *dst* buffer is zeroed out.
> > + *
> > + * int bpf_hid_get_data(void *ctx, u64 offset, u32 n, u8 *data, u64 size)
> > + *   Description
> > + *           Get the data of size n (in bits) at the given offset (bits) in the
> > + *           ctx->event.data field and store it into data.
> > + *
> > + *           if n is less or equal than 32, we can address with bit precision,
> > + *           the value in the buffer. However, data must be a pointer to a u32
> > + *           and size must be 4.
> > + *
> > + *           if n is greater than 32, offset and n must be a multiple of 8
> > + *           and the result is working with a memcpy internally.
> > + *   Return
> > + *           The length of data copied into data. On error, a negative value
> > + *           is returned.
> > + *
> > + * int bpf_hid_set_data(void *ctx, u64 offset, u32 n, u8 *data, u64 size)
> > + *   Description
> > + *           Set the data of size n (in bits) at the given offset (bits) in the
> > + *           ctx->event.data field.
> > + *
> > + *           if n is less or equal than 32, we can address with bit precision,
> > + *           the value in the buffer. However, data must be a pointer to a u32
> > + *           and size must be 4.
> > + *
> > + *           if n is greater than 32, offset and n must be a multiple of 8
> > + *           and the result is working with a memcpy internally.
> > + *   Return
> > + *           The length of data copied into ctx->event.data. On error, a negative
> > + *           value is returned.
>

Quick answer on this one (before going deeper with the other remarks next week):

> Wait, nevermind my reviewed-by previously, see my comment about how this
> might be split into 4:
>         bpf_hid_set_bytes()
>         bpf_hid_get_bytes()
>         bpf_hid_set_bits()
>         bpf_hid_get_bits()
>
> Should be easier to understand and maintain over time, right?

Yes, definitively. I thought about adding a `bytes` suffix to the
function name for n > 32, but not the `bits` one, meaning the API was
still bunkers in my head.

And as I mentioned in the commit notes, I knew the API proposed in
this patch was not correct, simply because while working on the
selftests it was completely wrong :)

In terms of API usage, does it feel wrong for you to have only a
subset of the array available "for free" and enforce the rest to be
used through these helpers?
That's the point I am not sure but I feel like 1024 (or slightly more)
would be enough for most use cases, and when we are dealing with
bigger data sets the helpers can be justified.

Thanks for the suggestion.

Cheers,
Benjamin

>
> thanks,
>
> greg k-h
>

