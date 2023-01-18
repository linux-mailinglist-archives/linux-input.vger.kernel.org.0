Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B209672749
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 19:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjARSnH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 13:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjARSnG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 13:43:06 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65938144A3
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 10:43:05 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 188so39238398ybi.9
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 10:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U1ot/boOrStdfQDJKyWwrcadp/Yz1XZ5rkEYGiiNBok=;
        b=c6oLYMnNv+yOUlKUI8NVBiEKst2YRh1V8xncJcN2hgHUWuZ3irUxHTI91PP6BlM6ff
         5dBqeHx2FnMoUWzNa0IZwFXd8LmPZJxSmfixj8DrlfLQfOrwEsTEPpOXQCPrb81JfBTn
         y155I4C1uwaEC0U/R02dpFnuet/B00uaDSN/GETDMcgyqg3/V53prdP3G1zhJ2i6GvJB
         liFuYz9AKjA8SJSYf/n/jZQlou9aljCbRfEBJ8kC6Jeee8wmgUKw7gkGRMBEsdQ0oyYb
         7ZHgFVJB54CkGZA+9SNKalhq9nB4XfulSOg0FobJUW7DA0dA6q0f/o7mPH2PQToJPfJD
         PRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1ot/boOrStdfQDJKyWwrcadp/Yz1XZ5rkEYGiiNBok=;
        b=A0+JdJVlnRVnZBqyGbcXZZmKsdJQn3KahsASEMoqeUvH8/ETqYfh5+oxdjPeuEeJ3c
         3N5I/0HL6bCYzeEQMspmggfqEcYHr5B9hHoABQsj4/0HyIL8NaCZIHEGl7hLNNS1HGlI
         o+ZPj3d+fp4vdFTSqrUXA4mbfSfh141jZEsD5oK7mfCMAYXPZ8/wK9wXkz6hHCSA5/ii
         Mn4xCvEbT8Ej9gYKNfsAN6AZQUiKmOt5KLdS/TsbpbET7u1pg3yYi1aa5xKjTgn0E2qL
         P2IorrA8zTkYmGFWYc6UPDDhsp5jHHXqJDCzQAl5h8K8Mg4mtUxfiaYkz8zatAV5TTVM
         mwjA==
X-Gm-Message-State: AFqh2kpfQxnxOcutWFY6djg7hHjDibsuYRanMnU9NtWlF3qN9+xI0p3b
        z/p3AYNizF128hOTv+NO1wZwhBYtYfsgrUZMIWg=
X-Google-Smtp-Source: AMrXdXtg4lj38zesLrLcj9fJhzEzCFJPkCHHfZxu3K03be7486OJ/4W/+hg2O+MPcscQy5nW2/nJaFiR3X96ggI/wDo=
X-Received: by 2002:a25:d57:0:b0:76c:f1a:8a81 with SMTP id 84-20020a250d57000000b0076c0f1a8a81mr130177ybn.479.1674067384591;
 Wed, 18 Jan 2023 10:43:04 -0800 (PST)
MIME-Version: 1.0
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2301181013030.1734@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2301181013030.1734@cbobk.fhfr.pm>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Wed, 18 Jan 2023 10:42:53 -0800
Message-ID: <CAEc3jaAJRy+jWpYn7gDpo6KXuyhn6sR4w9mhF=uhOqFSKmmyVQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] HID: playstation: various DS4 and DualSense fixes
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 18, 2023 at 2:12 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 5 Jan 2023, Roderick Colenbrander wrote:
>
> > Hi,
> >
> > This patch set contains a number of small fixes and stability improvements.
> >
> > The stability patches are most critical as they prevent kernel crashes.
> > Over the years there have been various buggy devices usually clone devices,
> > but now apparently some official devices with wiped calibration data.
> > It is hard to handle all permutations of devices as some have constants,
> > some have broken constants (e.g. wrong sign of a coefficient). We disable
> > calibration when we see an invalid 0 denominator. The patch adds the same
> > logic to both the DualShock4 and DualSense code.
> >
> > As part of the calibration stability improvements, a thorough review was
> > performed of the calibration code as it was suspected it was potentially
> > incorrect. It was found to be only slightly wrong for the handling of the
> > bias of the gyroscopes. Two patches fix this for both DualShock4 and DualSense.
> > There is only a marginal impact on practical values as the bias values
> > tend to be quite small.
> >
> > Thanks,
> > Roderick Colenbrander
> > Sony Interactive Entertainment, LLC
>
> I am splitting the stability ones (for 6.2) from the small improvements /
> cleanups (for 6.3).
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Thanks, that's how the patches were kind of set up. I wasn't sure due
to timing where they would land, but thanks for pulling in the
stability fixes!

Thanks,
Roderick
