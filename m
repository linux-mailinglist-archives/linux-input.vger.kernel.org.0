Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7765A64BE
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 15:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiH3Nap (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 09:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbiH3Nao (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 09:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C9A9E6AE
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661866240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C071C0Fu4zpnzqm2GxjZqFKUf2VQ3Uu+K+WnKl/q7NU=;
        b=IBDmdwXFM/V+JIyeI33OUXW7PkahaX50KQSHtI2CP4e6Ub5x+hfw2BVwosiRAcK95+7STm
        SSuALVL18huFHZ7TZtLcDdwK26l2ClIeTWKEWqM0FXOogsrQ0aMy9H5LD2MebKt/ZeaDZZ
        Nla5zk75gkZmsvxREQbBXGcA+tP2Lzw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-vGI17nJ1M6OZc1Jx2yDkcw-1; Tue, 30 Aug 2022 09:30:39 -0400
X-MC-Unique: vGI17nJ1M6OZc1Jx2yDkcw-1
Received: by mail-pl1-f197.google.com with SMTP id o12-20020a170902d4cc00b0016e81c62cc8so8040309plg.13
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 06:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=C071C0Fu4zpnzqm2GxjZqFKUf2VQ3Uu+K+WnKl/q7NU=;
        b=wftYAe4KUZllWpY33v8vBH3aqiNv2NlGYrIMbUtZFoCD2QT84b+bKEpMD7qnfyIs3M
         7hzU4x5VuwU8C9SrC8VpYs9RQ89SBjfEc3CMGZh+XomBpfBXqYC7nrsnBozV2aio3EDa
         wYAOea/F9Yh298LqcYc2PtTIM2h5U7KB/JSdqwG7RJwXEWV6fOt3eUQAHbPA1cM5/49b
         /TU5vZoAoshxpNyXVPDHp9deIXxBdwYjpMrbpUyM/wZu84DlfAEcNuHehKyzZY+Ci1zi
         iOq2tdANI787T0DE+7OpXM+i9U7S70hpY9UosjhuVKmbAIeR1uVtp1HBLqROJolMKZRV
         BVcA==
X-Gm-Message-State: ACgBeo2NJb2gv/452G5W3kWFWtA55o5BbaTbBZoBT8eypKJFvqxhLaLx
        i3k85HAjKn9PqIetydWuIrnQuwPmd04Zs6Aqu1iE1Ldu0Gi1pOX7lQEsK78syt2o6aC+rxCN4Iu
        Lk4iNPGSSLSQuKyGeHxxkQi6W9YqpSIBB6a6peWE=
X-Received: by 2002:a63:d10b:0:b0:41d:bd7d:7759 with SMTP id k11-20020a63d10b000000b0041dbd7d7759mr17929694pgg.196.1661866237882;
        Tue, 30 Aug 2022 06:30:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7CO92TZNx1/ZDyoq+lGXimNNYaqY6rNHmUopJlR2o2q6TOwVRYYUayx8+y1zHvUDGFjESrSTgnSoi2AHd+NLQ=
X-Received: by 2002:a63:d10b:0:b0:41d:bd7d:7759 with SMTP id
 k11-20020a63d10b000000b0041dbd7d7759mr17929681pgg.196.1661866237660; Tue, 30
 Aug 2022 06:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220721153625.1282007-1-benjamin.tissoires@redhat.com>
 <20220721153625.1282007-25-benjamin.tissoires@redhat.com> <YwbkC9v83gk0Eq/d@debian.me>
In-Reply-To: <YwbkC9v83gk0Eq/d@debian.me>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 30 Aug 2022 15:30:26 +0200
Message-ID: <CAO-hwJ+zJZzRXaj3ZGSaz9N3p7hE0mdcbsxTK04L-ep7_podFw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 24/24] Documentation: add HID-BPF docs
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 25, 2022 at 4:53 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Thu, Jul 21, 2022 at 05:36:25PM +0200, Benjamin Tissoires wrote:
> > +When (and why) to use HID-BPF
> > +=============================
> > +
> > +We can enumerate several use cases for when using HID-BPF is better than
> > +using a standard kernel driver fix:
> > +
>
> Better say "There are several use cases when using HID-BPF is better
> than standard kernel driver fix:"

OK, included locally, and will send it in v10.

>
> > +When a BPF program needs to emit input events, it needs to talk HID, and rely
> > +on the HID kernel processing to translate the HID data into input events.
> > +
>
> talk to HID?

Replaced with "it needs to talk with the HID protocol".

>
> Otherwise the documentation LGTM (no new warnings caused by the doc).

Great, thanks a lot for the review :)

Cheers,
Benjamin

>
> --
> An old man doll... just what I always wanted! - Clara

