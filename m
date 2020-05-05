Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0141C4FB4
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 09:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgEEHzO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 03:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:45246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727784AbgEEHzN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 03:55:13 -0400
Received: from pobox.suse.cz (unknown [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D70020658;
        Tue,  5 May 2020 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588665313;
        bh=OVnqPr9Hz/mtf1W+Mr5D2dFdyZ5VzvR4fbxCM6Hkv2A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nARRCkEsGFQnWLfd5eQ4dkz44Emj7+6F3YX18sg/FrRXHBAj0RBR/TxI8Xwhf8eHz
         wiiZXHc9so9tIiH0TDyMHMMl/kyAkoSjWrZaxNKa/3jWszoNdM37V58H5+JQ1sstq6
         j0v8PWE6Vi8WovPVYxw3KLJ6wumFpq7IsriuZNpM=
Date:   Tue, 5 May 2020 09:55:01 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nick Crews <ncrews@chromium.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: intel-ish-hid: avoid bogus uninitialized-variable
 warning
In-Reply-To: <20200428215337.4094575-1-arnd@arndb.de>
Message-ID: <nycvar.YFH.7.76.2005050954530.25812@cbobk.fhfr.pm>
References: <20200428215337.4094575-1-arnd@arndb.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 28 Apr 2020, Arnd Bergmann wrote:

> Older compilers like gcc-4.8 don't see that the variable is
> initialized when it is used:
> 
> In file included from include/linux/compiler_types.h:68:0,
>                  from <command-line>:0:
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c: In function 'load_fw_from_host':
> include/linux/compiler-gcc.h:75:45: warning: 'fw_info.ldr_capability.max_dma_buf_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
>  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                              ^
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c:770:22: note: 'fw_info.ldr_capability.max_dma_buf_size' was declared here
>   struct shim_fw_info fw_info;
>                       ^
> 
> Make sure to initialize it before returning an error from ish_query_loader_prop().
> 
> Fixes: 91b228107da3 ("HID: intel-ish-hid: ISH firmware loader client driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

