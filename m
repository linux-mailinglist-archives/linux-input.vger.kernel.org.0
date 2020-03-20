Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240B418DB7F
	for <lists+linux-input@lfdr.de>; Sat, 21 Mar 2020 00:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbgCTXII (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 19:08:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727550AbgCTXII (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 19:08:08 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 060122072C;
        Fri, 20 Mar 2020 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584745688;
        bh=U26CY0BQGcpUtPuH/7HtSD84yz0NB/7PRIZLpRdJOoA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mIY8xyMYxhFbdVAAr8V0NjP439UxHAwqqKMAk5ZJKQuUeAhobURyBW76+2wqPo2BU
         DLefhhg3oeoONuOTMS9gAp1Bfu27Lv5brDztYrzpSDGSzyaqa5CySnrMI5fBe3vWpA
         bU81cEDTcHC+7lMIfM0nlhMF49uOjyqD31VtU7I8=
Date:   Sat, 21 Mar 2020 00:08:05 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] intel-ish-hid: ishtp: ishtp-dev.h: Replace
 zero-length array with flexible-array member
In-Reply-To: <20200319213108.GA9320@embeddedor.com>
Message-ID: <nycvar.YFH.7.76.2003210007530.19500@cbobk.fhfr.pm>
References: <20200319213108.GA9320@embeddedor.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 19 Mar 2020, Gustavo A. R. Silva wrote:

> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

