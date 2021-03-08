Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A80330AD7
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhCHKIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:08:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:59250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231610AbhCHKHs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:07:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D891A64DE5;
        Mon,  8 Mar 2021 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615198068;
        bh=1l+pOChyWmagC/15Du+ORFDSdCjmKOpaMI4gbleHh2U=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Sox73KmxMnQGtEbF7X4HAkaa1D1hRHQNyi+ueb30tu1WvXyRJw/J5xukZWaob4HPi
         VmeO+056cNvGnyqUnKM962UEipgfz3hD/n8MHb6CWtAs53e/7BDyzKEHLtDU+Liqb6
         KkWIGQnFzinet4zl3SsYSBNXPWLGH9is+ZKABTuURS592Vl042fVi4+55jOIWGIpoJ
         401zVr20PcNaRyC/beHLtZGVsOLq4zAlblLgu1meOQ6c+Vn3xolXcD8UEmgGPb/5HN
         M7AmVMgr0JOdfl08muLSLYWVPShMA6e6WdUA2U80daaROGPMZJ7k0hKzU4d7zh3AqZ
         M7Rp3MU94N/mg==
Date:   Mon, 8 Mar 2021 11:07:44 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always
 false condition
In-Reply-To: <20210206151348.14530-1-uwe@kleine-koenig.org>
Message-ID: <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm>
References: <20210206151348.14530-1-uwe@kleine-koenig.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 6 Feb 2021, Uwe Kleine-König wrote:

> A remove callback is only ever called for a bound device. So there is no
> need to check for device or driver being NULL.

Srinivas, any objections to this patchset? The cleanups look good to me. 
Thanks,

-- 
Jiri Kosina
SUSE Labs

