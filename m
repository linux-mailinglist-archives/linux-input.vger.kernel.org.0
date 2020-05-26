Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D422D1E1DBE
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 11:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731618AbgEZJAW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 05:00:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731428AbgEZJAV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 05:00:21 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A8FF205CB;
        Tue, 26 May 2020 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590483621;
        bh=STAm2RC3mfBdgq2YxbuI9GIS/umeg4tqG1qVVqpD+Qc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rFtS0fkfRy69LGOWRVQpHK8QF6CywMnRxb8BNmzOD7oO+D2sFnZx26Yv4LLE26WHg
         XH1oC2r08o8SNr4a6CP2Cu9VwBGjPb2A3/HVXr3dxXq1y6XLx4UQxS+zBVBNBkubum
         Gb2VT0WizmOl+rRE1I2herp8JjPa+t/n3TfmROfw=
Date:   Tue, 26 May 2020 11:00:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Scott Shumate <scott.shumate@gmail.com>
cc:     "Colenbrander, Roderick" <Roderick.Colenbrander@sony.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles
In-Reply-To: <e3496a04-3a96-f833-955f-69912a76bdac@gmail.com>
Message-ID: <nycvar.YFH.7.76.2005261059590.25812@cbobk.fhfr.pm>
References: <46c1ab66-62d7-5dae-2f4d-7e722f1aff3a@gmail.com> <BY5PR13MB38264B60014D43193C53B38798BF0@BY5PR13MB3826.namprd13.prod.outlook.com> <e3496a04-3a96-f833-955f-69912a76bdac@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 13 May 2020, Scott Shumate wrote:

> Hi Roderick,
> 
> The official DS3 has a Report Count(19) instead of Report Count(13) in the
> exact same offset.  I have no idea what the silicon vendor for these dongles
> was thinking but it's suspicious that the official count of 19 (0x13) turned
> into 13 (0xd) in the knock-off.  It makes you wonder if the engineers confused
> the decimal/hex numbers.
> 
> As buggy as all of these third-party devices are, I'm afraid relying on the
> HID parser to get it right is only going to worse over time.  I do like your
> idea of having each device register themselves.  It would be nice to have each
> device provide a callback to decode its own report rather than handle a bunch
> of special conditions and quirks in a unified report decoding function.  The
> drawback of course is that its going to be a little more effort to maintain.

I've added Cc: stable and Fixes: tag, and applied.

Thanks,

-- 
Jiri Kosina
SUSE Labs

