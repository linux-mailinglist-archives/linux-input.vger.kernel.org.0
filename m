Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587CC5AC608
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 21:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbiIDTQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 15:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234228AbiIDTQZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 15:16:25 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2270E2B1AD
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 12:16:24 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id u6so8836696eda.12
        for <linux-input@vger.kernel.org>; Sun, 04 Sep 2022 12:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:from:to:cc:subject:date;
        bh=KzWwCtPF94ZQ21IiD+icDAK9VxuUyMJu/F4aFFItTDI=;
        b=KxZkdZ8OKji7Q+Ilnqx8BQamQNeOJ3jcpGGQxT+Lm9cgrUpWDOb+j/T+FYC+RkQjmK
         GEM1/lJyR4MDHgyiMm14QSlNVbP7iuj5XyHUjZlAlPvPbgm8ujq05uPBueMA53Rb5vQ0
         yUY2zD0Ier4oz/6ukoD/4cgNNi/Td3ZS8C+Mlk2BOryjqYnFSdgsQ09FZmy9tfZkA/UZ
         f3w4W5aNyT68qu8e/MhYZ583Zv7AXLOcq5KmjJiXUQCMAtAONIDQx41VVBKUlZbs5KuI
         vf0UbKrVzmEphBNmzdCz/ah1KZIHmKA+V/gWlBaQZLqRFzhR4a09HEwKSP7kmI7WSnuF
         inYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=KzWwCtPF94ZQ21IiD+icDAK9VxuUyMJu/F4aFFItTDI=;
        b=Fah+VOLyVxWfcHVqEqanAEsOQM7/yCXs3YvrBHvfi+g7tE4VFfOWbzHOcvbegUGDZR
         H58eAK97LOpOAqgS2YXDD2FnwflkwYyd12OnqgBYIPWNAMZFOB3ailEnzOnOket8jZl8
         IeNuWqx3cxFzSGOFfDc/qxQSKbZWrLy/jrvGC1za/wptn3jDxa33isvb34FXc3TLk6s5
         dEM0oFAU8qnJ+eEeOEZ0Q9x3p2rPoXkGfEXF5Y4lCao2b5tYpi8pPXZI1+/Vh6IHttnj
         2qk5RijpI66khMzalnSSVg7KgxXUP22/fc9UCTPoJGYlxCdv7pFGJYebcycBUbD8dK8H
         u0AQ==
X-Gm-Message-State: ACgBeo2YMe804yKmEdc4231iTAvXMU3uS8UWd6lOekiYd4kHAaPVyhAD
        Vvu1zoR3PMsKCSuzD792PNU=
X-Google-Smtp-Source: AA6agR6pFncq1+8oWCtYxlrTho1It6q+DySjjBvO5DfPR4Foi5F5IQxzB5W2uyqPjCUKsfukIfrKNw==
X-Received: by 2002:a05:6402:35cf:b0:448:84a9:12cf with SMTP id z15-20020a05640235cf00b0044884a912cfmr27385330edc.51.1662318982614;
        Sun, 04 Sep 2022 12:16:22 -0700 (PDT)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id y4-20020aa7c244000000b004479df2ff82sm5223142edo.51.2022.09.04.12.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 12:16:21 -0700 (PDT)
Date:   Sun, 04 Sep 2022 21:16:21 +0200
To:     Hyunwoo Kim <imv4bel@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, erazor_de@users.sourceforge.net,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        imv4bel@gmail.com
Subject: Re: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20220626111330.GA59219@ubuntu> <nycvar.YFH.7.76.2207211159210.19850@cbobk.fhfr.pm> <20220904172716.GA26269@ubuntu>
In-Reply-To: <20220904172716.GA26269@ubuntu>
Message-Id: <3N6XHHINKIWO5.3FX36FY953IQ1@homearch.localdomain>
User-Agent: mblaze/1.2 (2022-06-21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

Hyunwoo Kim <imv4bel@gmail.com> wrote:
> This drivers/hid/hid-roccat.c code doesn't seem to have been patched
> for a long time.  I'd appreciate it if you could tell me how to make
> the patch I submitted above take effect.

My suggestion would be to resubmit the second version of your patch. You
admitted that your second version wasn't that easy to parse because you
sent it in a reply to another mail (quoting your mail from the 21st of
July below).

> On  Thu, 21 Jul 2022 04:01:16 -0700, Hyunwoo Kim wrote:
> > On Thu, Jul 21, 2022 at 12:00:05PM +0200, Jiri Kosina wrote:
> > Don't we actually need the mutex for much longer period during
> > roccat_report_event()? At minimum it's also manipulating cbuf_end.
> 
> I modified the mutex to protect most of the roccat_report_event()
> in the second patch above sent in reply.
> Looking again, I submitted the second patch with some confusion. Sorry.

Maybe resending the second version (with the appropriate "[PATCH v2]
HID: ..."-subject) would motivate people to have a second look (though
there is never a guarantee for that as both reviewers and maintainers
seem to be in short supply) ...

Cheers,
Silvan
