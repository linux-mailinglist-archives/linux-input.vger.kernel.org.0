Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C7919D768
	for <lists+linux-input@lfdr.de>; Fri,  3 Apr 2020 15:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgDCNQN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Apr 2020 09:16:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728044AbgDCNQN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Apr 2020 09:16:13 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7052220721;
        Fri,  3 Apr 2020 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585919773;
        bh=mIsdgg3JiF/woY/GhsTRJfGm/CPDpcTOfpg0SNBr03Y=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=1FyFzNk9hAREIAl88kBTXNqKNLUqiiRVkLnBDf0ow2TNQVPX/OBJgxx20r9QjFDpl
         2MjDuZ9MGYAM7FHjvH/i9ttLGWk1UN23M7au5m5TzoK5BW+8tgkVDueQE7npHfpIj/
         qM9JR9VO+eoHYsts9X0bASt5QiPUCgopzrh4Lwl4=
Date:   Fri, 3 Apr 2020 15:16:09 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        carmueller@gmail.com
Subject: Re: [PATCH v11 00/11] HID: nintendo
In-Reply-To: <CAO-hwJJ1OEkgOBeKQh7XUsqm91ydZt+AjgyYU9XGL3cfom24KA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2004031515320.19713@cbobk.fhfr.pm>
References: <20200317032928.546172-1-djogorchock@gmail.com> <CAO-hwJJ1OEkgOBeKQh7XUsqm91ydZt+AjgyYU9XGL3cfom24KA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 1 Apr 2020, Benjamin Tissoires wrote:

> > I removed the IMU patch for now, since I have some more work on it to do
> > before it's ready. This version fixes a bug with joy-con S-trigger
> > configuration and switches the pro controller's Dpad input to a hat.
> 
> Thanks a lot for the continuous effort. I just had a quick look through 
> the series, and nothing came up problematic. I have requested a few 
> tests from people I know, and I'll be happy to merge this for v5.8. 
> Unless Jiri says that 5.7 is OK, but I doubt Linus will be happy getting 
> a new driver now that hasn't spent a little time in linux-next.

Yeah, let's queue this (once you have positive testing results from your 
testers) for 5.8.

Thanks,

-- 
Jiri Kosina
SUSE Labs

