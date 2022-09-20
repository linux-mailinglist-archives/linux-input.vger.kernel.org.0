Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E511F5BE729
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 15:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbiITNeg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 09:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiITNef (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 09:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E2DD4E
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663680870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qRfnqkDRjPiW51IVNT2CYsNbJcFu0UYEn+De3QAv12Y=;
        b=D8hdi3S4vhcu2HcvT5VtkJDVt8IciRJhAOiRNO/BdXsTy5fiNuRhDO+DfGCMWODxtZUAYV
        92BdxbVGOEW3fX8OLGyO/MGlwiI34Fgt3frNkX6Ust4SNpRTUEKmT6gRBPrAQJfLo53vLz
        FYiwFKFjVr6UzlfsDK0HmO4BpRLzwgw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-379-5VncwwHrOHWHPCk0EbtOJQ-1; Tue, 20 Sep 2022 09:34:29 -0400
X-MC-Unique: 5VncwwHrOHWHPCk0EbtOJQ-1
Received: by mail-pj1-f72.google.com with SMTP id a24-20020a17090a8c1800b0020266349974so6455276pjo.8
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qRfnqkDRjPiW51IVNT2CYsNbJcFu0UYEn+De3QAv12Y=;
        b=3izIhkKvD6Km5s/0a+hZjLLxiF1KGgUW0Wn+yy7zXdud7ENEC4NfpcCV5o5EOC9wBC
         6kcQ8wKrts0G83erX6a5rs3PJuhnjdCSnBQuwjc+Tcvvbbf2jXzDfWXiToSf5PM5OkFV
         9ycITN2ZSF8Qmc0gZ3dk9Sv7P6LIeNKBgIq5W9uNXz3zf+HFH3qGuqywgp0ek0vg4RAg
         vs3dUCm34+dolGFWdU24UU+kbQMVlhRB3ETETcBcPXegEZjGznGjrY1HRGkg1nroreZj
         iSrB3LBRuLXZ9OfyyVrQP0YOofbChubes5Lhhwxa6q3GU7N6dXb0YfGbSeo+dyPiHDhQ
         Fnvw==
X-Gm-Message-State: ACrzQf29YdDNYCZHZkBBBRoJm28SZZUesEO+CMFoKH9DDPGvQTb0EWSY
        VI1uTMJRag90mJ3GlA8fPtKx1mU36GvuWz/X1wRlAsGEdLs+EFeK52FUo/WjFh9ockAIJVIH0Hm
        +26g8qBka/B6aWoQGcuj/zJaqmDTfCdtvXxkZRwY=
X-Received: by 2002:a62:170b:0:b0:53b:93dc:966b with SMTP id 11-20020a62170b000000b0053b93dc966bmr24215335pfx.29.1663680867898;
        Tue, 20 Sep 2022 06:34:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4I2IHbtf+VWtaQDWpdFJU7QPz9b7nLewLG7wC2Kp914b2qQx/FgrcYfx3HEOvG9rrO71Az0D2Tpje4Knoijak=
X-Received: by 2002:a62:170b:0:b0:53b:93dc:966b with SMTP id
 11-20020a62170b000000b0053b93dc966bmr24215316pfx.29.1663680867659; Tue, 20
 Sep 2022 06:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220902082552.2433744-1-marcus.folkesson@gmail.com>
In-Reply-To: <20220902082552.2433744-1-marcus.folkesson@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Sep 2022 15:34:15 +0200
Message-ID: <CAO-hwJLOcFkts2wuMvr79w81XENEb9XyAXESciOgUiqSwG2pBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] VRC-2 Car Controller
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 2, 2022 at 10:20 AM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
> Hi,
>
> The device creates two USB endpoints where on of those represent the X/Y
> axis as 16 buttons which is not.. quite right.
> So get rid of that endpoint.
>
> Also fix the report descriptor for the other endpoint.
>
> Output from hid-recorder:
> #  X:     32 | Y:   1001 | #
> E: 000105.808008 7 20 00 e9 03 00 00 00
>
> Link to previous discussion:
> https://lore.kernel.org/all/CAO-hwJL-3vAzywjeUsopsRSJX6j-maC5R75ekxZg-W_oKDqYYw@mail.gmail.com/
>
>
> v2:
> - Remove .remove
> - Change help text in Kconfig
> - Remove redundant check for USB endpoint in vrc2_report_fixup
>
> Marcus Folkesson (1):
>   HID: Add driver for VRC-2 Car Controller
>
>  MAINTAINERS            |  6 +++
>  drivers/hid/Kconfig    | 10 +++++
>  drivers/hid/Makefile   |  1 +
>  drivers/hid/hid-vrc2.c | 91 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 drivers/hid/hid-vrc2.c
>

Applied to for-6.1/rc-controllers in hid.git

Thanks a lot for this work!

Cheers,
Benjamin

