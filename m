Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8726FF912B
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 14:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfKLN5o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 08:57:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:59212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfKLN5n (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 08:57:43 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9747421783;
        Tue, 12 Nov 2019 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573567063;
        bh=KMJbDvepupG/xIJlqiZD93/orZFvY10LZmHdVx8YcKo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=f1D0Iy0QdPys41FNRwPMmuXPlsFR2vyb+9egievNnvuDvWCkLjzD1hKYSjrkypW19
         KkV33sUYUZoVIKIKP0BZ9zbHge0T4CeE4C6DwmHD4aORGuxi5e47C3kglpdHI5OhIK
         4U7OPwNe0g5NuvE8ZqiaXTsacLVcOTcr0myPyikQ=
Date:   Tue, 12 Nov 2019 14:57:39 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Candle Sun <candlesea@gmail.com>
cc:     benjamin.tissoires@redhat.com, nsaenzjulienne@suse.de,
        orson.zhai@unisoc.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Subject: Re: [PATCH v4] HID: core: check whether Usage Page item is after
 Usage ID items
In-Reply-To: <20191022142139.16789-1-candlesea@gmail.com>
Message-ID: <nycvar.YFH.7.76.1911121457050.1799@cbobk.fhfr.pm>
References: <20191022142139.16789-1-candlesea@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 22 Oct 2019, Candle Sun wrote:

> From: Candle Sun <candle.sun@unisoc.com>
> 
> Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> to Main item") adds support for Usage Page item after Usage ID items
> (such as keyboards manufactured by Primax).
[ ... snip ... ]

Benjamin,

are you planning to run this through your testsuite against regressions?

I believe that's the last missing step, otherwise I'd be fine merging 
this.

Thanks,

-- 
Jiri Kosina
SUSE Labs

