Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EDF4C7569
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 18:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239088AbiB1Ryz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 12:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240334AbiB1RyM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 12:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F0E65B16D3
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646070110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+pMff1CjJQQtrDDYhTBw5IeTxg6x2wxXAOITJ3SlaQg=;
        b=J9LrjVsAN4ouFSeGgP2M+Dk6Gqo/XuWeMEZfuEKVW1tbLLzf7H3kpaz01Z3mVPm8VYIHzQ
        5ay1oMIvYKGag6z7t42qrv0sreNxm7FD+AbP5VpRfCKV4nOSRunh23Kxb63elbE6zovtgd
        RJDBETUG3f88xZrZp9Wgi4wLlxU59SY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-SqXTGDdmMTKrB-pZf7A9uQ-1; Mon, 28 Feb 2022 12:41:49 -0500
X-MC-Unique: SqXTGDdmMTKrB-pZf7A9uQ-1
Received: by mail-pj1-f72.google.com with SMTP id c15-20020a17090a674f00b001bc9019ce17so9215029pjm.8
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 09:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+pMff1CjJQQtrDDYhTBw5IeTxg6x2wxXAOITJ3SlaQg=;
        b=PkYRqII4qeks8idHopgmefMqlPy/a8yeH/NNEwQbqW5iidt9R++Fn1ycH3v3fbE3/s
         zWMa69Av8mQqtXN51feVW8KdDmXJuyYPiICUXBKVsODXF1I73wzk0jP8f58i1v+FVr27
         Te8/F/KnJnrsz6Q2WVQTU35xAGXOUYMd647UMk9En1Cg7Sez1XzdfC5x+/OrCz1vP/1E
         4hzpSA4yl07jJFx26R5yBISeMJu7SPE+rALIZah3U1EmfV5+63lpeKpTA/Yh40zY4RSr
         50ZMTRmnXno9XQ/xtD4FcB7wanEdSbzqJfPEb9qEzrwXlVhlGPubPjlcsQlfnyUBdLAI
         d99w==
X-Gm-Message-State: AOAM531flhhO4OmhOtcAjvYWSDbtRU2/YyC8kg0LJdwCv2/e7AD5cCBk
        wckuF3a7jzIXP+/esafdG4CijQ/JQKh5aGJ6WPPivAhXGMvmXecmeNUsRXzS6dG0Mnm9X9qK2Uf
        Kr7LB73NgWR9YsssCOPpDDjdgqttKxxrguSWymaA=
X-Received: by 2002:a05:6a00:1c4c:b0:4f4:236b:4382 with SMTP id s12-20020a056a001c4c00b004f4236b4382mr1298672pfw.29.1646070108102;
        Mon, 28 Feb 2022 09:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhNSW6RN5nrKEatCvn7DkBEzajnGbEnhX4158KlrGGVvwRKbmMoUbrvuMj891xUnUhZdN02WQep+maI+2Mpfw=
X-Received: by 2002:a05:6a00:1c4c:b0:4f4:236b:4382 with SMTP id
 s12-20020a056a001c4c00b004f4236b4382mr1298642pfw.29.1646070107819; Mon, 28
 Feb 2022 09:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20220224110828.2168231-1-benjamin.tissoires@redhat.com>
 <20220224110828.2168231-3-benjamin.tissoires@redhat.com> <CAPhsuW6m-HpfKLke1b7ni1j5Je3b3J0fa+MfJNnq2C9baOry1A@mail.gmail.com>
In-Reply-To: <CAPhsuW6m-HpfKLke1b7ni1j5Je3b3J0fa+MfJNnq2C9baOry1A@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 28 Feb 2022 18:41:36 +0100
Message-ID: <CAO-hwJKCEtQi-VHikw_tLxa5to0Y40KO7HSQrQtzcth_MawQ5A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 2/6] HID: bpf: allow to change the report
 descriptor from an eBPF program
To:     Song Liu <song@kernel.org>
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
        open list <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Feb 26, 2022 at 8:31 AM Song Liu <song@kernel.org> wrote:
>
> On Thu, Feb 24, 2022 at 3:09 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > The report descriptor is the dictionary of the HID protocol specific
> > to the given device.
> > Changing it is a common habit in the HID world, and making that feature
> > accessible from eBPF allows to fix devices without having to install a
> > new kernel.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> [...]
>
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 8fd79011f461..66d949d10b78 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -1213,10 +1213,16 @@ do {                                                                    \
> >
> >  #ifdef CONFIG_BPF
> >  u8 *hid_bpf_raw_event(struct hid_device *hdev, u8 *rd, int *size);
> > +u8 *hid_bpf_report_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *size);
> >  int hid_bpf_module_init(void);
> >  void hid_bpf_module_exit(void);
> >  #else
> >  static inline u8 *hid_bpf_raw_event(struct hid_device *hdev, u8 *rd, int *size) { return rd; }
> > +static inline u8 *hid_bpf_report_fixup(struct hid_device *hdev, u8 *rdesc,
> > +                                      unsigned int *size)
> > +{
> > +       return kmemdup(rdesc, *size, GFP_KERNEL);
> > +}
> >  static inline int hid_bpf_module_init(void) { return 0; }
> >  static inline void hid_bpf_module_exit(void) {}
> >  #endif
> > diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> > index 5978b92cacd3..a7a8d9cfcf24 100644
> > --- a/include/uapi/linux/bpf.h
> > +++ b/include/uapi/linux/bpf.h
> > @@ -999,6 +999,7 @@ enum bpf_attach_type {
> >         BPF_SK_REUSEPORT_SELECT_OR_MIGRATE,
> >         BPF_PERF_EVENT,
> >         BPF_HID_DEVICE_EVENT,
> > +       BPF_HID_RDESC_FIXUP,
> >         __MAX_BPF_ATTACH_TYPE
> >  };
> >
> > diff --git a/include/uapi/linux/bpf_hid.h b/include/uapi/linux/bpf_hid.h
> > index 243ac45a253f..c0801d7174c3 100644
> > --- a/include/uapi/linux/bpf_hid.h
> > +++ b/include/uapi/linux/bpf_hid.h
> > @@ -18,6 +18,7 @@ struct hid_device;
> >  enum hid_bpf_event {
> >         HID_BPF_UNDEF = 0,
> >         HID_BPF_DEVICE_EVENT,
> > +       HID_BPF_RDESC_FIXUP,
> >  };
> >
> >  /* type is HID_BPF_DEVICE_EVENT */
> > @@ -26,12 +27,19 @@ struct hid_bpf_ctx_device_event {
> >         unsigned long size;
> >  };
> >
> > +/* type is HID_BPF_RDESC_FIXUP */
> > +struct hid_bpf_ctx_rdesc_fixup {
> > +       __u8 data[HID_BPF_MAX_BUFFER_SIZE];
> > +       unsigned long size;
> > +};
>
> This looks same as HID_BPF_DEVICE_EVENT, do we really need to
> separate the two?

I wanted to separate them because the other types have other requirements.

However, they all need a "data" with "size" associated. So I'll add
data and size to the common definition of the struct, leaving only the
specifics in the union (which means that DEVICE_EVENT and RDESC_FIXUP
won't have a definition in the union). I'll see the look of it before
submitting v2.

Cheers,
Benjamin

