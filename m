Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB18A373BFF
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbhEENI6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:08:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232395AbhEENI6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:08:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 831E061222;
        Wed,  5 May 2021 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620220081;
        bh=bRfAkupBJgozVoyOgxID1RAP6YZOhwy1dGOwnklAX/I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ffLTyrM3c5n6cnPGpQtSyq8t8pbxatS5LEuMBbL4sx4emCVRI2Z3XezBACnr7f5fs
         ms+dSpM2F+8OytT8bq1stKWq/fEQ5ozR2V4N+9gSmbzpggMbz7VAzeAIvp18S05l2x
         xIHv8aDdM5aLhoD4WotUIQE9XNyR9c6zWd1Kg0G95SH1XQQOiccc3sHHoBEjIThH+D
         QRh3rMssyMmcIblUPGMfj/mXkxihUvCTRkHd/h4i7jlRme+b24YktbaAfu+LZANXHJ
         uqXC3Hr8RAkVVnsuvotifrM1iI39FQJ7JpzLw3IekhZUPuwTVO0V843ePG+dQp8SxN
         p4mJAUp+E7UuQ==
Date:   Wed, 5 May 2021 15:07:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     =?KOI8-R?B?zsHC?= <nabijaczleweli@nabijaczleweli.xyz>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] Stylus-on-touchscreen device support
In-Reply-To: <CAO-hwJKLYTqQ9qZ8LZGabze_NjNfwAq2_V-28LFewjOC=EK8rw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051504400.28378@cbobk.fhfr.pm>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz> <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz> <nycvar.YFH.7.76.2105031110480.28378@cbobk.fhfr.pm> <CAO-hwJ+HhKU7EzPZGOtPePT_h7OUaJ=QfWi7eAcxsfRaDtQuvg@mail.gmail.com>
 <CAO-hwJKLYTqQ9qZ8LZGabze_NjNfwAq2_V-28LFewjOC=EK8rw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 3 May 2021, Benjamin Tissoires wrote:

> So I did a quick pass at the patches:
> - 1/4 -> I think this one is safe and could go as it is, maybe with
> CC: stable on it. Any regressions should have been caught by the
> testsuite, so that's a good one.

Added stable tag and applied to hid.git#for-5.13/upstream-fixes

> - 2/4 and 3/4 -> Ack on those 2 too, note stable material, but not
> necessary v5.13 material

I have queued 2/4 for to hid.git#for-5.13/upstream-fixes as well, while 
3/4 to hid.git#for-5.14/core.

Thanks,

-- 
Jiri Kosina
SUSE Labs

