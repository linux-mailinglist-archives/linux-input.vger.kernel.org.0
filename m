Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23F62CFAB9
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 10:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgLEJBT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 04:01:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgLEJAm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Dec 2020 04:00:42 -0500
Date:   Sat, 5 Dec 2020 09:59:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607158801;
        bh=z+uA0AM4EJ8toNr4PrCS1GY6pWLRjHrYKpwq5PMIhmI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=pFAKxdZzEe/210p8J4rMoHXiMsmdSgIXpKik/uDqvgUoXyP2lE03sEl6E5TYqFd6r
         TJnSoazBIQu393CpHELuNzitBv6y4w699JPDYQ4xlFEUnqb6ugLVTLBwW0j6zEO8GV
         hfZJl9/GequiOVYjybT8GZyCPKzK5vTPKDG5/9QQ=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will Coster <willcoster@google.com>
Subject: Re: [PATCH v1] HID: make arrays usage and value to be the same
Message-ID: <X8tMDQTls/RcTSAy@kroah.com>
References: <20201205004848.2541215-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205004848.2541215-1-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 05, 2020 at 12:48:48AM +0000, Will McVicker wrote:
> The HID subsystem allows an "HID report field" to have a different
> number of "values" and "usages" when it is allocated. When a field
> struct is created, the size of the usage array is guaranteed to be at
> least as large as the values array, but it may be larger. This leads to
> a potential out-of-bounds write in
> __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> hidinput_count_leds().
> 
> To fix this, let's make sure that both the usage and value arrays are
> the same size.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>

Any reason not to also add a cc: stable on this?

And, has this always been the case, or was this caused by some specific
commit in the past?  If so, a "Fixes:" tag is always nice to included.

And finally, as you have a fix for this already, no need to cc:
security@k.o as there's nothing the people there can do about it now :)

thanks,

greg k-h
