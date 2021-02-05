Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7783110DB
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 20:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbhBERbh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 12:31:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233407AbhBEP7d (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Feb 2021 10:59:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76C0A650E3;
        Fri,  5 Feb 2021 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612538090;
        bh=VnkfZtQdtRRpvr/tTC1Emt6Plz1aV6Qx7t6EYLttHJM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=boqwcn4YbKBRDVm30haM7y+kQu3DqPg25ebMxfVA7iIqZTOoHdeWgZgvAE0zB/VDl
         BXFSw5xZ7XsJ6pR2a5RXNN8bCniMFgpV2B4Vdr45m+yYMkrEstyuQKYtYx7u9uN/Em
         e3a0Gx6v2nIiHkDQE077zhP7RY+cqdX14jWxMYdqVXeo87ri7bXr4qZEU0geinPcxf
         3OAWXX8n2i3Lt26q820POEobJfcR7AgstSiYU84Kluyk0KWVkFCS5gha/1mYEBYPZf
         cvKYnUf9k9bZkSOJ/widagKABR+uHgm2Xe1UnFXVD5QMFKYqY9cDHi2boI6siykwTU
         btEsJjsasQvQA==
Date:   Fri, 5 Feb 2021 16:14:46 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>
Subject: Re: [PATCH 1/2] HID: logitech-dj: add support for the new lightspeed
 receiver iteration
In-Reply-To: <20210123180334.3062995-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2102051614020.28696@cbobk.fhfr.pm>
References: <20210123180334.3062995-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 23 Jan 2021, Filipe Laíns wrote:

> From: Filipe Laíns <lains@riseup.net>
> 
> Tested with the G Pro X Superlight. libratbag sees the device, as
> expected, and input events are passing trough.
> 
> https://github.com/libratbag/libratbag/pull/1122
> 
> The receiver has a quirk where the moused interface doesn't have a
> report ID, I am not sure why, perhaps they forgot. All other interfaces
> have report IDs so I am left scratching my head.
> Since this driver doesn't have a quirk system, I simply implemented it
> as a different receiver type, which is true, it just wouldn't be the
> prefered approach :P

Benjamin, do you have any other idea how to accomplish this without this 
kind of spaghetti-style conditions?
If not, I am tempted to apply the patch as is.

Thanks,

-- 
Jiri Kosina
SUSE Labs

