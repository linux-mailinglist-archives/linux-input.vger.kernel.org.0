Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4426939154F
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhEZKtn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234178AbhEZKtm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:49:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B985610A8;
        Wed, 26 May 2021 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622026091;
        bh=HCgkqlnwl/zSdIilasJBroxPUaXntN8wNt8TSfh69C0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iChGp/qFL9U4PWgNSe48GX1KM+Z4IFrKOD5qdXMb/WKYJfD/5kv0z4+FNGrn15hfo
         YKAMa76g1BptETneV2WJClx7A9m+XuzilNYC9sBXFufFXr14etCdsD2JeCOxpDWy3t
         gAyarHg9Svi7HxpVdCe28S6QOu7R2Dr96ZEjVl1OPBAPq+ZqCQcmuCb3lmteRfynfb
         qlPv4hy6HsKQl9afF/vxC9OCpdS7O4v0A6jBmoj8+1lAlGrqdSJOstAFfDwSxYfO0R
         8q+fGY9FUlSW57DLb6l8jilW9OlycFXOzLQ6iY7hZNKNPSGx/Uaq5cbxtWWlT1m8hB
         SEln1UJeZswkA==
Date:   Wed, 26 May 2021 12:48:08 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        Nehal-Bakulchandra.shah@amd.com, Sandeep.Singh@amd.com,
        shyam-sundar.s-k@amd.com
Subject: Re: [PATCH 0/2] General bug fixes to amd_sfh driver
In-Reply-To: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
Message-ID: <nycvar.YFH.7.76.2105261247560.28378@cbobk.fhfr.pm>
References: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 12 May 2021, Basavaraj Natikar wrote:

> The allocations which are required lifetime of amd_sfh driver is
> changed from kzalloc with devm_kzalloc. This cleans up an exit & error
> paths, since the objects does not need to be explicitly freed anymore.
> 
> amd_sfh driver with kernel memory detector config enabled. kmemleak
> (/sys/kernel/debug/kmemleak): suspected memory leaks in amd_sfh driver.
> So added a kfree which frees request_list entry once the processed entry
> is removed from the request_list.
> 
> Basavaraj Natikar (2):
>   amd_sfh: Use devm_kzalloc() instead of kzalloc()
>   amd_sfh: Fix memory leak in amd_sfh_work
> 
>  drivers/hid/amd-sfh-hid/amd_sfh_client.c | 19 ++++++++++---------
>  drivers/hid/amd-sfh-hid/amd_sfh_hid.c    |  3 ---
>  2 files changed, 10 insertions(+), 12 deletions(-)

Queued in for-5.13/upstream-fixes, thank you.

-- 
Jiri Kosina
SUSE Labs

