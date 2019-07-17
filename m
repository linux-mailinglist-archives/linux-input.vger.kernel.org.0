Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58FD66BB82
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 13:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfGQLeC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 07:34:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfGQLeC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 07:34:02 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9B0620880;
        Wed, 17 Jul 2019 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563363241;
        bh=FutKhaMtSB/Ueu9N8ldM8W+cjVEpaJsxGkNc405zMMA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XCIFfCa+3yARaoYc/Pv7dcOzwZfg8+o2aIaFNuGhOyHqszLs8OK/oRTPgKrnddNtm
         ho7Oz1xmZGcDvBg46KvYlbCFyFWPX/ywIkbzrcgAQJcdVx+bQOYDt5Yff+BfCmiWnm
         o+96aaTz51NL1cKsHw0LnQMyCQ62hCRp9wIwW+uo=
Date:   Wed, 17 Jul 2019 13:33:51 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Fabian Henneke <fabian.henneke@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] hidraw: Return EPOLLOUT from hidraw_poll
In-Reply-To: <3141770d-bb58-e0e9-35ac-84cc23719892@gmail.com>
Message-ID: <nycvar.YFH.7.76.1907171333160.5899@cbobk.fhfr.pm>
References: <3141770d-bb58-e0e9-35ac-84cc23719892@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 9 Jul 2019, Fabian Henneke wrote:

> Always return EPOLLOUT from hidraw_poll when a device is connected.
> This is safe since writes are always possible (but will always block).
> 
> hidraw does not support non-blocking writes and instead always calls
> blocking backend functions on write requests. Hence, so far, a call to
> poll never returned EPOLLOUT, which confuses tools like socat.
> 
> Signed-off-by: Fabian Henneke <fabian.henneke@gmail.com>
> In-reply-to: <CA+hv5qkyis03CgYTWeWX9cr0my-d2Oe+aZo+mjmWRXgjrGqyrw@mail.gmail.com>

Good catch. I believe we need the same for hiddev too, could you please 
look into that as well, given you're fixing things in this area already?

Thanks,

-- 
Jiri Kosina
SUSE Labs

