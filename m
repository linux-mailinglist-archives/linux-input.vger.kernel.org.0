Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4112463C9
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 11:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgHQJws (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 05:52:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgHQJwq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 05:52:46 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BC79206C0;
        Mon, 17 Aug 2020 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597657966;
        bh=qLTRMIY8cVO92KvoaaKAi1t8PlSQ8ifbvEEXAie5+F0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=mQa7dGs8P1Q7SF9e9hg44t/y8o5DgLBL2Ge8akv+ciHQzzPIu4Pbm0RjZOhWHGZtD
         epc4Z6cfQXP3x+lmeWiOawgeiMoL5d1HVfdJklsdXzBvCFrhypjF0pdQUxJZzVGpp+
         n9UJ/qLEy2pZROVzKBpW1BQ+qZiJqJxEibJi9JfQ=
Date:   Mon, 17 Aug 2020 11:52:43 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmlambea@gmail.com,
        alexhenrie24@gmail.com
Subject: Re: [PATCH 0/2] HID: Constify static struct hid_device_id
In-Reply-To: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
Message-ID: <nycvar.YFH.7.76.2008171152360.27422@cbobk.fhfr.pm>
References: <20200727132200.32510-1-rikard.falkeborn@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 27 Jul 2020, Rikard Falkeborn wrote:

> Constify hid_device_id in two drivers (these were the only drivers that
> didn't already have it as const).
> 
> Rikard Falkeborn (2):
>   HID: cougar: Constify cougar_id_table
>   HID: macally: Constify macally_id_table
> 
>  drivers/hid/hid-cougar.c  | 2 +-
>  drivers/hid/hid-macally.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied both patches, thanks.

-- 
Jiri Kosina
SUSE Labs

