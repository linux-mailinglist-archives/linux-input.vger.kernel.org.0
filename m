Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622582EF531
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 16:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbhAHPyG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 10:54:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:60778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbhAHPyF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 10:54:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A467E23884;
        Fri,  8 Jan 2021 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610121205;
        bh=4lEpFPdA9Ci7IUYse49SZ8sOMHRY4o5SMmuHdG9MHHA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=lcjl+zVcaKsuy1lnf6Y/BgigtqjH/GYM8flolL6BDSPfYaEAw25nw5G3J9CM4a4ZE
         wqhZtjvOfOI3qwUVubVhJLsRWMBRfXEcek0XA/jR07OQjf9MILj109mYqaQn0zV0kt
         dJhritmFo/aWRpHHxhUysqi90+fgTnhvMvzKBFO1AOxJ8TLu58v+cdrRIJXE9/AlS/
         1TilgcPvDl+LHr2FR6fjO+vXpXvbdX4CfYds+Y/rUPeFy8FMhoIcdGxvJUhNDchIgr
         Lq9dVy8Hz5+iAgGR32lDTqFpF5mZqbWmH+63DAo/rS6ZvKDJ0nUYyYOnX468UGS0in
         pLW4vswVNgZVA==
Date:   Fri, 8 Jan 2021 16:53:22 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Seth Miller <miller.seth@gmail.com>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on ASUS UX550
In-Reply-To: <be49cd57e53368062a5de07dcb7af2da0954771d.camel@gmail.com>
Message-ID: <nycvar.YFH.7.76.2101081652560.13752@cbobk.fhfr.pm>
References: <CAMh5ckdy=z8j7X5BXLtpnOz2-Ha7MZqN-DvJS0e1w4CdiLJ4EQ@mail.gmail.com>  <nycvar.YFH.7.76.2101081552560.13752@cbobk.fhfr.pm> <be49cd57e53368062a5de07dcb7af2da0954771d.camel@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 8 Jan 2021, Seth Miller wrote:

> Jiri,

> My apologies for the formatting issues. I wasn't aware Gmail's client 
> silently inserted line breaks in plain text emails. Hopefully Evolution 
> can do a bit better.
> 
> Signed-off-by: Seth Miller <miller.seth@gmail.com>

Thanks. This one didn't have proper changelog :) but I've combined the two 
and applied.

-- 
Jiri Kosina
SUSE Labs

