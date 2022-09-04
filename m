Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4365AC62F
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 21:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbiIDTdy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 15:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbiIDTdx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 15:33:53 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E40B2F012
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 12:33:52 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id q3so6583533pjg.3
        for <linux-input@vger.kernel.org>; Sun, 04 Sep 2022 12:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=w5fl12S2ZW3VypbIFgHFO8NxSKpTZNWQ0fqpBVv6W1M=;
        b=PMUbz6JWboILZB7oRZjaylzWfMBU1I1X1gR6Vd/XXN9HlMRl7TD5E7rxElh5fpHPuP
         quoUFRpNRq+l5YkRahtbkjBnstOZYnO1f0o8GV+7llBkdXPPLh3/zi8Rg9lf14ipWj1U
         FErQo4ebi3WOOmNJIujgCYlTGZsRDjtlvnICTu0TPQ7T1ZxfqdZuWPhUttVcWWV+Eztu
         zOa6FdQCJyTLtalDkN322A6+wf/bTDt+TkrhVYzjCVGl42i0oBIqyZUjR8td2pOp01bP
         xuQuQjDZU6Kub0Q5brEbnBsyt/Vvw7VC7hyYbcrxhZoM+MsxLRu0WbZYaOZibcPecW0s
         HVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=w5fl12S2ZW3VypbIFgHFO8NxSKpTZNWQ0fqpBVv6W1M=;
        b=wDOYjHPVW8zE/KWBAIcj7eZTExn+r7qjQ7Umir8G7D3x+CIZKwiV0TnM2JxIR9D7T/
         Co2m69YuimlE5U7N+M8l1Z7RVcC2h9JJeKq4UzhlBoGvM67PJzDgzQQsOnlmQr1G0oMQ
         PZ2Bt9yRXV3qEfvaGHUnAjvv163VH+KIcLBX6EV7MJCuf4HBPIJAwjCNX5jtLDDEaIUH
         rh9Fbdjyt9Wh5eSciAKEH02c0LUB4nzxqoh0ce+gVKMUz9pRVm5/xvxtLpXgbw1egxPi
         kuBGRe2FFVw4JqhGtiYe6E0BIBCAHHlpx4lmtetqeg4k7VOYypvj9GhkRquQvx/00oWQ
         B7eg==
X-Gm-Message-State: ACgBeo1R09HNH32L1MH6/rz4gmB3C7TY0rBg7o1fhZQk7UMtlaqU4Igk
        fBNJcxFlzOlhkMsp1kPq3Rs=
X-Google-Smtp-Source: AA6agR45lYQQ0E4719M8rqpMcKxaWdoHe/dyhLaduDACvV9+pDv58Ck79lCaMPFfuNbDESOXiVeEbQ==
X-Received: by 2002:a17:90a:4d8d:b0:1fa:9cc6:3408 with SMTP id m13-20020a17090a4d8d00b001fa9cc63408mr15301870pjh.245.1662320031957;
        Sun, 04 Sep 2022 12:33:51 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id r12-20020aa7988c000000b0053612ec8859sm5931665pfl.209.2022.09.04.12.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 12:33:51 -0700 (PDT)
Date:   Sun, 4 Sep 2022 12:33:47 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     Silvan Jegen <s.jegen@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, erazor_de@users.sourceforge.net,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
Message-ID: <20220904193347.GA28255@ubuntu>
References: <20220626111330.GA59219@ubuntu>
 <nycvar.YFH.7.76.2207211159210.19850@cbobk.fhfr.pm>
 <20220904172716.GA26269@ubuntu>
 <3N6XHHINKIWO5.3FX36FY953IQ1@homearch.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3N6XHHINKIWO5.3FX36FY953IQ1@homearch.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Sep 04, 2022 at 09:16:21PM +0200, Silvan Jegen wrote:
> Maybe resending the second version (with the appropriate "[PATCH v2]
> HID: ..."-subject) would motivate people to have a second look (though
> there is never a guarantee for that as both reviewers and maintainers
> seem to be in short supply) ...

Thank you for telling me.
I will resubmit the v2 patch.

Regards,
Hyunwoo Kim.
