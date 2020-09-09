Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA60E26273B
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 08:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgIIGgl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 02:36:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:43476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIGgl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 02:36:41 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AF5920936;
        Wed,  9 Sep 2020 06:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599633400;
        bh=VgsQIPmxJcCBRNYZ/KLtO5FxuWooDVK8XXRd4BzTgSo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=O6X9azrKsQh7CZvLtQmNKE4l0AaeonbICqOvxHhnijMEQTR82p6hC4mLur7lmgmYD
         gCZJoOd8YGHjNqKr8wKwCJ374B8DQ/yG/lfUMcsLgmuiNUnynYYS7Z8GpNu4PbjfXz
         1D8zhHNq51tmXZTH3wX37GEQp0sznLiw0qI6a/Vg=
Date:   Wed, 9 Sep 2020 08:36:37 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sean O'Brien <seobrien@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Wei-Ning Huang <wnhuang@google.com>
Subject: Re: [PATCH v2] HID: google: add google vivaldi HID driver
In-Reply-To: <20200827015143.57364-1-seobrien@chromium.org>
Message-ID: <nycvar.YFH.7.76.2009090836130.4671@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2008261311550.27422@cbobk.fhfr.pm> <20200827015143.57364-1-seobrien@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 26 Aug 2020, Sean O'Brien wrote:

> > I actually believe we should follow the standard convention here, and have
> > just one hid-<vendor> driver for all google products. Currently we have
> > hid-google-hammer, and this would add hid-google-vivaldi. Would you (or
> > Wei-Ning, CCing here) object on merging these two together?
> 
> I'm a bit reluctant to merge them.  Partly because I'm not familiar with
> the hid-google-hammer driver, but mostly because this driver is intended
> to handle non-google products which will use a google-defined usage code.
> Perhaps I should drop "google" from the driver name?

If it's known that it will be handling non-google products, then I think 
that's indeed the best option. Thanks in advance for v3 with this change,

-- 
Jiri Kosina
SUSE Labs

