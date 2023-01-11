Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49557665817
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 10:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238325AbjAKJvE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Jan 2023 04:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjAKJta (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Jan 2023 04:49:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7FB13CF4
        for <linux-input@vger.kernel.org>; Wed, 11 Jan 2023 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673430441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UE0xeHCU2bfsdgMc1zyv/Lgw7gDb0/ii1vRY0TiYYqA=;
        b=F0Qzc9pOcBHuo5Dde0ELojDlA4f5urFDt1ws+oXym06rv8eG33z9EgVqY3ASn5cGyA6ktC
        q6QYvf6FWHasKjS14G1dqiRtZQJxxBRCLqclHzmhwOkLjUeLQ9FqSGibRbLofFu8ywA/Su
        8JLKUOldYAVYoQfpgZJcigTnV6uwMqo=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-9FicrOGjPBaR5XGi0o_IUg-1; Wed, 11 Jan 2023 04:47:20 -0500
X-MC-Unique: 9FicrOGjPBaR5XGi0o_IUg-1
Received: by mail-io1-f69.google.com with SMTP id y24-20020a5ec818000000b006e2c0847835so8741571iol.12
        for <linux-input@vger.kernel.org>; Wed, 11 Jan 2023 01:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE0xeHCU2bfsdgMc1zyv/Lgw7gDb0/ii1vRY0TiYYqA=;
        b=25kLOAEuyT2mt/LtSoCxtD85txDZJeM2294PVJf+s/DAUyxLu2aZkopNAlkGmddJnf
         76a7tZQngQChH70n9ZDMVoGccc8AoysOssd22QZbzOT+QcSx87zS2GFwmDt82MRx/sye
         NlVfUiHd0kasm2i4EKE+HKtUEciH9GcpwWfoDKqrkj/Fl0z10nk8jcOx+GP6L1db9ki2
         Ek75YCp/oP3OlY3sx5M1f604SspLuqDc1q5w1BhG3sYnSo6CqWghgLaiwn5kd5du71Fu
         IcVQbyim7rYo7rnKCk76ra4lqjdhowmtJjHyO9S1ENVo+wTPVJ145YhnZaZSgbJdayIX
         NbLQ==
X-Gm-Message-State: AFqh2kp2vQ3rPdK5HCVe8G73iC2N0bibZGiXmzQjpSB2TqnIX3yg8SGD
        OnMO/HkvgvOZL9PfntslmWP/SaGgOioo3rHK6vBPfGUBNzp6Ak0bYpUC2u2c9TYgoKAEv+MXtyv
        Vjp2YjdfiAIUM/Ayaz1YtG1V/8rOHN99jyGikCYw=
X-Received: by 2002:a05:6602:449:b0:6df:bfeb:f15d with SMTP id e9-20020a056602044900b006dfbfebf15dmr5813368iov.122.1673430439237;
        Wed, 11 Jan 2023 01:47:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMGuR8Fz8YM4jgsNWownmj/QbuhKvKMrvrkynsYoffbOpUWKeQSLAK7R9clAJLj9D4yWVopYxCWeyDIqtLC0Q=
X-Received: by 2002:a05:6602:449:b0:6df:bfeb:f15d with SMTP id
 e9-20020a056602044900b006dfbfebf15dmr5813358iov.122.1673430439027; Wed, 11
 Jan 2023 01:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20230106102332.1019632-1-benjamin.tissoires@redhat.com>
 <20230106102332.1019632-7-benjamin.tissoires@redhat.com> <20230111061054.dqduab66plb6uzg2@macbook-pro-6.dhcp.thefacebook.com>
In-Reply-To: <20230111061054.dqduab66plb6uzg2@macbook-pro-6.dhcp.thefacebook.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 11 Jan 2023 10:47:07 +0100
Message-ID: <CAO-hwJLk7dNYHiharC0wR0563aTE9NfD_jE5qxdoM9m0pW__cA@mail.gmail.com>
Subject: Re: [PATCH HID for-next v1 6/9] HID: bpf: rework how programs are
 attached and stored in the kernel
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 11, 2023 at 7:11 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, Jan 06, 2023 at 11:23:29AM +0100, Benjamin Tissoires wrote:
> >
> > +static void hid_bpf_link_release(struct bpf_link *link)
> > +{
> > +     struct hid_bpf_link *hid_link =
> > +             container_of(link, struct hid_bpf_link, link);
> > +
> > +     __clear_bit(hid_link->index, jmp_table.enabled);
> > +     schedule_work(&release_work);
> > +}
>
> ...
>
> > +     link->index = prog_idx;
>
> I was super confused that you use prog_idx as a bit in jmp_table
> and had to look into your tree what hid_bpf_jmp_table.c is doing.
> Looks like it's not prog_id (which is prog->aux->id) that we know.
> It's hid specific prog idx in that jmp table.
> Maybe would be good to rename your prog_idx to something with 'hid' suffix or prefix?
> or 'table' suffix or prefix ?
> prog_table_idx ?

prog_table_idx sounds good :)

>
> Other than that the patch set looking great.

great, thanks!

> I'm assuming removing call_hid_bpf_prog_put_deferred() and everything related
> comes in the next set?
>

Yep. I'll probably send it tomorrow. I have a bunch of urgent
corporate stuff to do today so won't have time for the fun part of the
job :(

Cheers,
Benjamin

