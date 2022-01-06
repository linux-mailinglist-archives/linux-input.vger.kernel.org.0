Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80C548653D
	for <lists+linux-input@lfdr.de>; Thu,  6 Jan 2022 14:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239502AbiAFNXl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jan 2022 08:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239456AbiAFNXl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jan 2022 08:23:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5849AC061245
        for <linux-input@vger.kernel.org>; Thu,  6 Jan 2022 05:23:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA20D61BFA
        for <linux-input@vger.kernel.org>; Thu,  6 Jan 2022 13:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BC9C36AE3;
        Thu,  6 Jan 2022 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641475420;
        bh=itfYu+Jii1QJRfLnoTBnGRyhF+xv3GkEiHzgQ0ZUhsU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=GPJgDEfMhFTHKey77Phq0rUBQDmCZMboLXO+cIj+6p+Bq23avzGJYHggkwB9YvDON
         wSPktFFiX4YOjofdsgqZXTg3ie3PAzcIvwlM9jQp3CrodG6URjFrCWtbAULrP9xzab
         HcrqhuJ7AUtHBvcVKGBFx/m7G+IifipkDcXTZCMwT2fUsYeXc+4x/et2/AjwINIMXl
         dWrEmpdBMUxQIVvt50kGbAr0l0a/Jhp1Pn8m5PXwcpW3RrOUdw5CuOVIq+PAhrKv0P
         G1Hs3aPRyCGrCIeS519BZ2skFgSnQnn1mMSao+jNdzm/FWNy74jWKvlZ8OJ8849519
         3CvuixUKlyN+g==
Date:   Thu, 6 Jan 2022 14:23:37 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add new Letsketch tablet driver
In-Reply-To: <20211212212333.239644-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2201061423220.16505@cbobk.fhfr.pm>
References: <20211212212333.239644-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 12 Dec 2021, Hans de Goede wrote:

> Add a new driver for the LetSketch / VSON WP9620N drawing tablet. This
> drawing tablet is also sold under other brand names such as Case U,
> presumably this driver will work for all of them. But it has only been
> tested with a LetSketch WP9620N model.
> 
> These tablets also work without a special HID driver, but then only
> part of the active area works and both the pad and stylus buttons are
> hardwired to special key-combos. E.g. the 2 stylus buttons send right
> mouse clicks / resp. "e" key presses.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2005575
> BugLink: https://github.com/DIGImend/digimend-kernel-drivers/issues/528
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Queued in hid.git#for-5.17/letsketch.

Thanks,

-- 
Jiri Kosina
SUSE Labs

