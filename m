Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FE6273E2C
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 11:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIVJKs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 05:10:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgIVJKs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 05:10:48 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8017B20715;
        Tue, 22 Sep 2020 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600765847;
        bh=fiiD8EFNXKsf8j/pm1PJDSwv5nfPYK38p6p+JEsfZrc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LhiDpHZSRVSAAaUm09U+FbD6gA3C85KFnaIZ4GqkSGzGMWBiniKG1dCTQb+jMRKw6
         oR/dQvkSQXa4Ni4D7mb2O8q81bK69/x5YRnLq6Xv0OXwkMlOtiRf9rzEcXymLGkuXK
         SM7OvdqIIIvgmMlqcTDGjlzFUWC5HV+UPn+DtSGQ=
Date:   Tue, 22 Sep 2020 11:10:44 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] HID: intel-ish-hid: simplify the return expression
 of ishtp_bus_remove_device()
In-Reply-To: <ca452e8f61c2e828bc3ec2dc5993f87d251e5e38.camel@intel.com>
Message-ID: <nycvar.YFH.7.76.2009221110360.3336@cbobk.fhfr.pm>
References: <20200921131033.92017-1-miaoqinglang@huawei.com> <ca452e8f61c2e828bc3ec2dc5993f87d251e5e38.camel@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 21 Sep 2020, Pandruvada, Srinivas wrote:

> On Mon, 2020-09-21 at 21:10 +0800, Qinglang Miao wrote:
> > Simplify the return expression.
> > 
> > Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

