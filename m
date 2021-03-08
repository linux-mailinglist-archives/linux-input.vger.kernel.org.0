Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AEB331331
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 17:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhCHQRL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 11:17:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:43854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231128AbhCHQQ6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 11:16:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 740E56521B;
        Mon,  8 Mar 2021 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615220218;
        bh=cW8t7xuDTgs4FwnpsppxTtiL2Zc2bKlDJBhJ+T5cif8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=idQje9Be807E9KD5TrZ2QN5fQpB4W8O/cC7UcgUJR+oTpdJs+kiouq8xbBRKB2eR1
         96m122FwGzxie4GwagllIPFZ4s8lFrSAmzyH2IT/IuIVRJbTnKt2/14I6gPXJ3DU1G
         rym3rO2vWV9ChrPX1UAG+2JOPFQz2VmVGEmoawgN1TANMHp2mXRliZaNx1L0Vywe4d
         Zf1fo3PMoZkmfRGJYn7xIGdGwCd0mrR0InvKgnOYf1CEcqssbiAl4BjE9R8aCDtiSL
         nCLHRNcJ/zX6BvmH9fQD2evdAtxuAQVmKogUw/RqB/IVcSZRp0n11r+HLvQXTkJuEI
         kVuGOXO2TlfcQ==
Date:   Mon, 8 Mar 2021 17:16:54 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc:     =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always
 false condition
In-Reply-To: <31028f589e27e246bb3b4b693caeb0b8eae3a285.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2103081716200.12405@cbobk.fhfr.pm>
References: <20210206151348.14530-1-uwe@kleine-koenig.org>  <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm> <31028f589e27e246bb3b4b693caeb0b8eae3a285.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 8 Mar 2021, Srinivas Pandruvada wrote:

> > > A remove callback is only ever called for a bound device. So there
> > > is no
> > > need to check for device or driver being NULL.
> > 
> > Srinivas, any objections to this patchset? The cleanups look good to
> > me. 
> Sorry, I missed this series.
> No objection for taking these patches.

Thanks. Applied with your Acked-by:
If you disagree with that interpretation of your statement above, please 
holler :)

Thanks,

-- 
Jiri Kosina
SUSE Labs

