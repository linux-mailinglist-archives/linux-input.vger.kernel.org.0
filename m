Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBCB62B9D9
	for <lists+linux-input@lfdr.de>; Wed, 16 Nov 2022 11:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbiKPKpz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 05:45:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238909AbiKPKpM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 05:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FE332065
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 02:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668594734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EUFIXYNzk8yDs3KImNG3AOVj6XZ3qyNFB3i2C1O73aQ=;
        b=S0KEC+c92ZXfFv8u0m85OaibTBOaAcCExzjgG0JaK442JxYxvaH5pKmL7raKcxB0lfK3qL
        Z+OL7EjeNbQGzt6/fwyW4q18CTNyIcTCO8woTXE2hDzs8QOhqG7nLk2wvg7Mr+XNXDYOSO
        EG7VCXIgnyAmHveUwtxgBxwlpmtrXGg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-KKFF-nOlNi2FCrjpftrbFg-1; Wed, 16 Nov 2022 05:32:13 -0500
X-MC-Unique: KKFF-nOlNi2FCrjpftrbFg-1
Received: by mail-io1-f70.google.com with SMTP id c14-20020a5ea80e000000b006d6e9b05e58so8620535ioa.23
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 02:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUFIXYNzk8yDs3KImNG3AOVj6XZ3qyNFB3i2C1O73aQ=;
        b=MWajdt1DU/BCw50sLaR2/wNRsOvJ6b6Z/uzPyyNUA7mAMH7rGwYQZfCKxYyqmjzfAc
         CiE7EQdp6opyogxS6pQ0tw0tjATJDbZm8LI/469mTiixhe7lQCy7HPCYLCvFs/Lu+Le/
         95AZy1HFnX04uvvRXJVZBD6IZg/oW7+hPj3bDh6XGgvxHe4/fnn5HHZ2PSYpHFwox0RQ
         sTfXUVqgXeA+xjyJ/dR/SnXUVCf+2bDwECJ7x4kA5jfa94QSqhgQkrv3BeoJd31Semnh
         KqWnjQQb0FBl6NqHPdtxRT2VB+2N55XL4RNF4JDsQX2EZtKFyaWan0W1Lr3W5NYZAV4o
         uD/w==
X-Gm-Message-State: ANoB5pl9ISOm0AalYVUGiBBS3dDmlEiO3vbMI7YiVsq+NoN9x1yOEy1I
        ClpRl2e9DZSN8y+0vw6yLCnh5aZaUKTg5yqrmfKoLH3gVw3t4BdgZkl8/73ElsJLk27uoSzTWfc
        3J0qLz8Ezim59W3vd16sf/YPlCmUX0kNeRS2+1Yk=
X-Received: by 2002:a92:d281:0:b0:302:4a3a:f480 with SMTP id p1-20020a92d281000000b003024a3af480mr8236518ilp.61.1668594732271;
        Wed, 16 Nov 2022 02:32:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mDl6NLRXK3YUpDUDuMeH6TsB9CuSDyqczVUpHLVsgCk66OVWh+1FvOcD/MF7WRurpXNijbn91pIu0F/lzRq8=
X-Received: by 2002:a92:d281:0:b0:302:4a3a:f480 with SMTP id
 p1-20020a92d281000000b003024a3af480mr8236510ilp.61.1668594732003; Wed, 16 Nov
 2022 02:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20221116093943.597572-1-colin.i.king@gmail.com>
In-Reply-To: <20221116093943.597572-1-colin.i.king@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 16 Nov 2022 11:32:00 +0100
Message-ID: <CAO-hwJK4fn6eqMDdt7ZPe3e1tc54vQXQk9L6F7gY_QZCmGobGA@mail.gmail.com>
Subject: Re: [PATCH][next] samples/hid: Fix spelling mistake "wihout" -> "without"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Nov 16, 2022 at 10:39 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a comment and a usage message. Fix them.

Good catch

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  samples/hid/hid_surface_dial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/samples/hid/hid_surface_dial.c b/samples/hid/hid_surface_dial.c
> index bceea53d39b0..4bc97373a708 100644
> --- a/samples/hid/hid_surface_dial.c
> +++ b/samples/hid/hid_surface_dial.c
> @@ -4,7 +4,7 @@
>   * This program will morph the Microsoft Surface Dial into a mouse,
>   * and depending on the chosen resolution enable or not the haptic feedback:
>   * - a resolution (-r) of 3600 will report 3600 "ticks" in one full rotation
> - *   wihout haptic feedback
> + *   without haptic feedback
>   * - any other resolution will report N "ticks" in a full rotation with haptic
>   *   feedback
>   *
> @@ -57,7 +57,7 @@ static void usage(const char *prog)
>                 "This program will morph the Microsoft Surface Dial into a mouse,\n"
>                 "and depending on the chosen resolution enable or not the haptic feedback:\n"
>                 "- a resolution (-r) of 3600 will report 3600 'ticks' in one full rotation\n"
> -               "  wihout haptic feedback\n"
> +               "  without haptic feedback\n"
>                 "- any other resolution will report N 'ticks' in a full rotation with haptic\n"
>                 "  feedback\n"
>                 "\n"
> --
> 2.38.1
>

