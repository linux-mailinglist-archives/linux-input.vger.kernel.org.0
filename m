Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65BB5686497
	for <lists+linux-input@lfdr.de>; Wed,  1 Feb 2023 11:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjBAKno (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Feb 2023 05:43:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjBAKnn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Feb 2023 05:43:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1992659D
        for <linux-input@vger.kernel.org>; Wed,  1 Feb 2023 02:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675248154;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bltFVBhEHfXNoDMWpukukFuhV9he/3kOb9+wG6ySsOI=;
        b=I3zeoMuRLco/1J03J2gvxlJNFjLA8bhKkCiyL5Nnj2C7Hn+7BMyRJw+NrO90LibNCeQQkd
        XGgJhiO+a0ohuMGRAXNwXTxjMZLB75HlFXGU1d4HabZI9DLEEC3+8cyxwJt+y+yMFe+Ils
        Qy0dKYDRKk90hQP+U8HYBVJFpoDiKuA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-0ErdcBI0O3GcmBWUvQ-LTg-1; Wed, 01 Feb 2023 05:42:33 -0500
X-MC-Unique: 0ErdcBI0O3GcmBWUvQ-LTg-1
Received: by mail-yb1-f198.google.com with SMTP id a9-20020a25af09000000b0083fa6f15c2fso3378686ybh.16
        for <linux-input@vger.kernel.org>; Wed, 01 Feb 2023 02:42:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bltFVBhEHfXNoDMWpukukFuhV9he/3kOb9+wG6ySsOI=;
        b=5STW8lzMNywAiJ5MLQ/dHbAEBzJxSxht17tfdR1BXXy4ZYgsaW4oeI1vRW1E1lQRAY
         5qqo+8RMouFawQLrg29splU0g4rUp7M1Vhq//rn3JCEWEeiFRawJUlg+f1fZ+PlaajrK
         088c6nulKXttqA8KqsDEZFf5nIfcCbA8f0NbWYzY5vmDbh0BU3daNI22fNVNTrY3A6VN
         hVrcYoguC6dtDKXHAaIa3gceAmJeipKGH8UoU2FSfXlCO6FyQhVw7MD5WsDGt1ldRVNF
         FjG8ArKjfwb/0frvKHA63XeeaJH3C+hBV2+1uQd3sccc69MTMa2h4C9/mAySitiMhH5w
         o0fg==
X-Gm-Message-State: AO0yUKUVwvK3Yl+qhv3uPqETfv3Tk4a3gs/9SzC3IiNAaRh2XZy4AyIA
        VFGM445jum+DMnLO8WZ5rrkcND3uVTcPtSclJqtbzsdm6EMnrEssB1iImXRQUDVXb/rPv45VA6K
        OCtv91YXEk93s0yhpmCKOYkiM27pu40hF2X9KKbM=
X-Received: by 2002:a25:e001:0:b0:735:ea17:94d9 with SMTP id x1-20020a25e001000000b00735ea1794d9mr295374ybg.378.1675248152478;
        Wed, 01 Feb 2023 02:42:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/nOQlGCejCPSeRFXJAbHnnr5nt0177Ds1BMktMEZlVCYFUQtDqgg60bZ4PhLFjfgTUgTKrUgTSQjzR+rKOoOs=
X-Received: by 2002:a25:e001:0:b0:735:ea17:94d9 with SMTP id
 x1-20020a25e001000000b00735ea1794d9mr295372ybg.378.1675248152233; Wed, 01 Feb
 2023 02:42:32 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMycsUQ3aWbAHa6fnSwmQpTt9PhagY14_k2sKGC+vGiqGg@mail.gmail.com>
 <CAEs41JBMqSCk4U4aQc08DRL5hHDteRmdt1-TGQg0-niko5MF_w@mail.gmail.com>
In-Reply-To: <CAEs41JBMqSCk4U4aQc08DRL5hHDteRmdt1-TGQg0-niko5MF_w@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 1 Feb 2023 11:42:21 +0100
Message-ID: <CAO-hwJKP7GmGXJQa_hvLO080_YyysTARsiGdGAw4p_YWtz_G2w@mail.gmail.com>
Subject: Re: Dependency on non-existing config I2C_DMI_CORE in commit
 a2f416bf062a ("HID: multitouch: Add quirks for flipped axes")
To:     Allen Ballway <ballway@chromium.org>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Allen,

On Tue, Jan 31, 2023 at 3:44 PM Allen Ballway <ballway@chromium.org> wrote:
>
> Hi Lukas,
>
> Thanks for catching this, that's definitely a mistake in my code.
> That was supposed to be CONFIG_I2C_HID_CORE.
>
> Should I send a follow-up patch for this, or another revision for the patch?
> It looks like it hasn't been pulled into the mainline branch yet and I'm not
> familiar with updating it while in a maintainer branch.

I saw that you sent a followup on the initial series, but can you
instead send a fix on top of
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=for-6.3/multitouch
(hid.git tree, branch for-6.3/multitouch)?

Cheers,
Benjamin

>
> Thanks,
> Allen
>
> On Mon, Jan 30, 2023 at 3:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Dear Allen,
> >
> > with commit a2f416bf062a ("HID: multitouch: Add quirks for flipped
> > axes"), you add code that is dependent on the CONFIG_I2C_DMI_CORE.
> > However, this config symbol has not been defined anywhere in the
> > kernel repository. Is this a mistake in your code and you intended to
> > refer to another config symbol? Is there another patch to come that
> > adds this config symbol? Or is this a config symbol that only exists
> > in some out-of-tree repository?
> >
> > Something might be odd here, because this code is effectively dead now
> > with being dependent on a non-existing config symbol.
> >
> > Best regards,
> >
> > Lukas
>

