Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED2C496223
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 16:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381600AbiAUPbo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 10:31:44 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52308 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381585AbiAUPbo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 10:31:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 11A2BB81EDB
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 15:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E708C340E3;
        Fri, 21 Jan 2022 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642779101;
        bh=+GC4jWnPI7NIWoygwKnVdsMsQ9tBgdmkjyvPpZc/ZS4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=bQ4Zt4n19CEKhu3Pfa2ntgLUYRLNELwrH/COTUhKZd2CYiI01+8Rp7e2hf1SUt8Gk
         XndWfaKOP8/D1I6ytH9DtLeCsTT/gEVTbu7ntp3uZWOCySiwQZaWLfTi1keoypKhaV
         GOIRqPxF07dUyJeLwz7G4xMjyoV6hiCmX5Ta7LL1XqboIgZJ2ln9jwpjD59u5DW7wS
         KUU2PVLjeg3552ShNcyosmytYlR3RJb6Fhs02anGGlnTq3Fb5u/5FKozYAgif65ecN
         R4AIFG/wsdjuapTsQLtWC4gQJr+Pr/rbgwL98C1YcJDwG+vM7GSXHGnVGgi6v3/+fv
         keqzAEh0iCN+g==
Date:   Fri, 21 Jan 2022 16:31:37 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Florian Klink <flokli@flokli.de>
cc:     ValdikSS <iam@valdikss.org.ru>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
In-Reply-To: <20220121152848.knyggraeu5w7xqkb@tp>
Message-ID: <nycvar.YFH.7.76.2201211631010.28059@cbobk.fhfr.pm>
References: <20211216224611.440397-1-iam@valdikss.org.ru> <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm> <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru> <20220121124116.cj6xtxvzw7rbkcs6@tp> <nycvar.YFH.7.76.2201211624150.28059@cbobk.fhfr.pm>
 <20220121152848.knyggraeu5w7xqkb@tp>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 21 Jan 2022, Florian Klink wrote:

> >> I tested the driver and it's a big improvement. I just sent a v3 with my
> >> name in the Signed-Off-By field.
> >
> >Thanks. Where did you send it to? :) I don't seem to have it in my inbox.
> 
> Message-Id 20220121123206.36978-1-flokli@flokli.de and following, it's
> also visible on
> https://lore.kernel.org/all/20220121123206.36978-1-flokli@flokli.de/

I see; please always CC the maintainers of the code directly as well, 
otherwise the patch might fall in between cracks easily.

Thanks,

-- 
Jiri Kosina
SUSE Labs

