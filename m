Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB976453667
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 16:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237664AbhKPPzQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 10:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238552AbhKPPzO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 10:55:14 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36367C061570
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 07:52:16 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 67-20020a1c1946000000b0030d4c90fa87so2750225wmz.2
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 07:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uAYOt5tLyHYqrjyb+xnuQ1/rW86iyf3y2vgU80nGWAs=;
        b=CMa1VA4PM+p6FXGZsaJeB61qSHcFz1nRMfhWU9ank2wWBgzVleaTzkescEQF28TcOo
         H02tjLhI3PwsAGRQUjgMveKZcgBAIttDi670lcrfnWJ6z3XCD2VdNXatg7V++Fm/p4gk
         aSxbgFgL/AFQhvevRt8f9biB8Its0y+o2qfLKJXriBz9C/zNNVOpklQooFW+n2r127Xh
         C3can9tZ10YLmMh5y5RHrsSqkAUNXATPbQMaOXMtTp/sTrnSoRhhzdTF+gi2gSA04k0x
         lkPO2nGEIMv2ka6GwSVudekhT8yT9WHVGKEpDPQTsZi4eEW0vHUxsBL5xLGoD7YSkcWU
         yw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uAYOt5tLyHYqrjyb+xnuQ1/rW86iyf3y2vgU80nGWAs=;
        b=BgKdcVPm28X1d59QatLZSWGJ871yg22moSRGnfHdgMd8OAuv0GIvi73l+uAo4Yr4Cr
         caSnPuntiTYOI0657a5GvFADn5Dtky2H/Dzd8dIuTyUZPn9Fj4S0atY1RDDZXKzsAoYN
         l2gZn74AD+wIrhLL08Igi7rTvTiCJb2jBLlJeXCq/6c+wkZKhvHdqWGMgMs2nKWRJ2oa
         mXn53E1xQuSvlLb4iC4kbrkJlu6Ozy/9hdMsP/0FBqE9pCf4AbXmFPqsfqLToYdeBntv
         LusxkQUlROlM25vvxIbResIy4vwgIZb/9ZWU8AnG8ZG5nQXCuHpUb1Gc1ql/6vdPsYEA
         1Jig==
X-Gm-Message-State: AOAM531wpA0y8/bDJvvWKrqbc8apT+IHlzlJ2Qk73nKHjzwpXpUjPH85
        SPXgFbBUyUa7JWSg2un/Hyg4rCzcPwgEiQ==
X-Google-Smtp-Source: ABdhPJzyXEQTvJwq+nNFVr1Pn1oAS7JZs9F3pQwPOBm04NFA6nwhYOfuDR1MUSoN5lWXL4uz50jlBQ==
X-Received: by 2002:a05:600c:2947:: with SMTP id n7mr8926778wmd.15.1637077934580;
        Tue, 16 Nov 2021 07:52:14 -0800 (PST)
Received: from rechenknecht2k11 (200116b8459a9b003f00a60854fcf5ee.dip.versatel-1u1.de. [2001:16b8:459a:9b00:3f00:a608:54fc:f5ee])
        by smtp.googlemail.com with ESMTPSA id m20sm3174492wmq.11.2021.11.16.07.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:52:14 -0800 (PST)
Date:   Tue, 16 Nov 2021 16:52:10 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: Input: xpad - add more Xbox one controller IDs
Message-ID: <20211116165210.3449a22a@rechenknecht2k11>
In-Reply-To: <74100aa9-d2aa-6bdd-46be-0d4ffb6496c8@gmail.com>
References: <20211113131734.46fbc9bf@rechenknecht2k11>
        <dd40fcf9-582f-d5fd-4eec-ef06a8ecdf3b@gmail.com>
        <20211114205122.575567c6@rechenknecht2k11>
        <20211114213731.2573be3a@rechenknecht2k11>
        <74100aa9-d2aa-6bdd-46be-0d4ffb6496c8@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 14 Nov 2021 15:14:38 -0600
Cameron Gutman <aicommander@gmail.com> wrote:

> I like this idea. There's a small risk of causing userspace breakages
> for games matching "Generic X-Box pad" by name, but we already run
> that risk each time we update xpad_devices[] anyway.

Since the button mappings already differ between the original Xbox
controller and the Xbox 360 controller, matching that string would have
always been broken.

> Can you also replace "Generic X-Box pad" with NULL in xpad_devices[]?
> I don't think it would ever be used anymore after this change.

Will do!

Best,
Benjamin
