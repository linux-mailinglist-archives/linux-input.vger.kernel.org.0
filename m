Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD7A642964
	for <lists+linux-input@lfdr.de>; Mon,  5 Dec 2022 14:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbiLEN3F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Dec 2022 08:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbiLEN24 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Dec 2022 08:28:56 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B36E0A5
        for <linux-input@vger.kernel.org>; Mon,  5 Dec 2022 05:28:54 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id o5so18601430wrm.1
        for <linux-input@vger.kernel.org>; Mon, 05 Dec 2022 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6J+5H0KWEWYqjfx5EbQcfYsdjvKQnnhpjVdr0SMdxo=;
        b=KajtrDYkbGXekCAhlvBExpgniFq8X1oDyJALi1+eg+V7l2f/ImbF6FdsgoBk3rqrlW
         I5hqw4k2BmO6BBlttVXW/TDdiCK90mBsqe6AxSn3/kiyGOFYLKPPz5WMIRWo9W17uBt5
         Gjv+AUM0J8GhAONtLiyMwfQsZVniEShDX7PzSR5klCzqiskjBf0bV5kUplydwMhit5Kl
         8LTbJYOf64NAXABAhxHl5yHv2KoKu5outTvAs/LRCiN7tqNeQ2J0ij/shUlutXV/dImR
         O6RG/U7CASUyoE1c600wvJneN74tNMM/l7CLtICFQRPkqe/SG0rfge9o21v16H07HhRd
         gc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6J+5H0KWEWYqjfx5EbQcfYsdjvKQnnhpjVdr0SMdxo=;
        b=fELEAb+chLkt6lDRFovskF346L1Bz7vob83Ct4yYHMFdTW7Bn4X9ppXa1JsIS6I3ga
         6JVpqjYtLAq89xlkLeK9rT1bbWq7BiT3W7MoE8zsur1mO54EUpp3DjhDYaeMO2/sM9kJ
         7Zy9K1PvuCFmnUPKGQknjoCeFbevxEdqstI00Twk/uaG1616rRHmeNo55Yl1Er9+wnUv
         lAjiQ7NMFcpoum0L68hhmDNaKKYV6De272gtZIGVG4uF8mEcrJTYAMA0b+zR2SYyBSoI
         5Htto6YQVbuSWNPbg/JgLvLPdBnUm9aHpeliQaceI06MFsOsIra73BjSYKqzg4umrwms
         qqng==
X-Gm-Message-State: ANoB5plL4BWi0SlXiuf2M/pMICi6SN0k+mGSIIFi0K7X3GGcLM9FxvZR
        jDAwJY9tOyEyAcrJuEhhyiAV+w==
X-Google-Smtp-Source: AA0mqf5oN5IoGcH2Dda7EcklO+hxEGRSsULwk9da/QmVIVa2SIRbH1iJO1nCE6ZTZl0bT6vFV+fNxA==
X-Received: by 2002:adf:b610:0:b0:231:9b9f:652b with SMTP id f16-20020adfb610000000b002319b9f652bmr42911196wre.421.1670246933335;
        Mon, 05 Dec 2022 05:28:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h130-20020a1c2188000000b003b4fdbb6319sm21294013wmh.21.2022.12.05.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:28:52 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Eirin Nya <nyanpasu256@gmail.com>, phoenix <phoenix@emc.com.tw>
Cc:     'Dmitry Torokhov' <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "'Josh.Chen'" <josh.chen@emc.com.tw>
Subject: Re: [PATCH V2 3/3] Input: elantech - Fix incorrectly halved
 touchpad range on ELAN v3 touchpads
In-Reply-To: <20221202234206.6527835a.nyanpasu256@gmail.com>
References: <20221014111533.908-1-nyanpasu256@gmail.com>
 <20221014111533.908-4-nyanpasu256@gmail.com> <Y4T2nygbxkhAQRvM@google.com>
 <Y4T21vl0mJocdpdV@google.com> <003201d904ae$05d38870$117a9950$@emc.com.tw>
 <20221202234206.6527835a.nyanpasu256@gmail.com>
Date:   Mon, 05 Dec 2022 14:28:51 +0100
Message-ID: <877cz6rncc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Eirin,

On Fri, Dec 02, 2022 at 23:42, Eirin Nya <nyanpasu256@gmail.com> wrote:

>> If the setting is indeed double resolution, can we simply multiply 
>> x_max and y_max by 2 instead of re-querying it?
>
> Perhaps in some laptops, x_max or y_max is odd when resolution is
> doubled, and rounded up or down in half-resolution mode, so multiplying
> the half-resolution size by 2 results in a slightly incorrect full
> size. I don't know if that's the case in other touchpads, but my
> laptop's touchpad has even size in full-resolution (doubled) mode,
> meaning it doesn't round its size in half-resolution mode (so
> multiplying both values by 2 would work on my machine).
>
> On Wed, 30 Nov 2022 19:22:25 +0800
> "phoenix" <phoenix@emc.com.tw> wrote:
>
>> Consulted with FW team, we suggest re-querying x/y resolution after
>> setting absolute mode.
>
> My current patch re-queries x/y resolution after setting absolute mode.
> If this is the process that Elan's FW team recommends, should the patch
> be kept as-is?

Yes, I think you can keep it the way it is. Dmitry will either pick it
up or suggest additional changes.

