Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89FFB3D8A94
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhG1J2h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:28:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231494AbhG1J2g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:28:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4991D60F9D;
        Wed, 28 Jul 2021 09:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464515;
        bh=2W2LNe1jkHzjS893KoKMyl7L/dyoD2G7d8WEJOlt+eE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=RLBd+xvYiNXLo7dS9Amo4mhPgoY3fLQ/nFFhzPmE4E8AgBbjUSuG9t3sfyC/D2yH8
         LWIhlcUH3//nzU1QG7m3Puomhyj2sehSxI9OUXF47fSl+MjOANLjumpuXJsgAhiJFM
         +LfZXGzGMsozKriUyX+4lqiR059LQZmzvNZzGal5cyKI+fI/FKVYHoIuD1WHz1l02s
         0Y9XAADagLV0KELL6Y1xeo84vxCKmandybatf8OyAvjaqs4ukmS3f+R0By64OBq8iP
         3DHbIRp7vtMdG08r0U4VJ6sM1LsZhH6m5AEynmP0FM9fP3RvU0DX/4h5dsUpjZfLUL
         iW5m6hndmfbhA==
Date:   Wed, 28 Jul 2021 11:28:32 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dylan MacKenzie <ecstaticmorse@gmail.com>
cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: amd_sfh: Minor DMA mapping bugfixes
In-Reply-To: <20210622001503.47541-1-ecstaticmorse@gmail.com>
Message-ID: <nycvar.YFH.7.76.2107281128140.8253@cbobk.fhfr.pm>
References: <20210622001503.47541-1-ecstaticmorse@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 21 Jun 2021, Dylan MacKenzie wrote:

> While preparing to investigate
> https://bugzilla.kernel.org/show_bug.cgi?id=212615, I read through the amd_sfh
> driver and saw two (unrelated) bugs in the logic that sets the DMA mask.
> Ultimately these are harmless, but they should probably get fixed.
> 
> FYI, this is my first time submitting a kernel patch. If I've done something
> wrong in formatting this email, it is likely due to incompetence rather than
> malice.
> 
> Dylan MacKenzie (2):
>   HID: amd_sfh: Set correct DMA mask
>   HID: amd_sfh: Continue if fallback DMA mask is accepted
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Nehal, Sandeep, could you please provide your Ack to this series? Thanks,

-- 
Jiri Kosina
SUSE Labs

