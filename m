Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DB730B3FF
	for <lists+linux-input@lfdr.de>; Tue,  2 Feb 2021 01:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhBBASQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Feb 2021 19:18:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:13482 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230122AbhBBASP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Feb 2021 19:18:15 -0500
IronPort-SDR: RW9GNazTa8+54nPm17mXaZlkz4OhCEC8Uw4KBCPuukER/t5sMqta9BiuXzZDeihGtoXAkkoPAI
 SvyqACrbX0sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="242290597"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="242290597"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 16:17:27 -0800
IronPort-SDR: smJdJiwMkzc9P/YXfcVcQpJa5/hZsncrUzC9L0s2AN13YyJCbQn+2oRBjeBlu8gorWgnxRVw7Z
 /Rk+43L3AWag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="356034831"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.26])
  by orsmga003.jf.intel.com with ESMTP; 01 Feb 2021 16:17:25 -0800
Date:   Tue, 2 Feb 2021 08:17:24 +0800 (CST)
From:   Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To:     "Michael S. Tsirkin" <mst@redhat.com>
cc:     Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>,
        rydberg@bitmath.org, mathias.crombez@faurecia.com,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND v3] virtio-input: add multi-touch support
In-Reply-To: <20210129102647-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.LNX.2.22.419.2102020815440.5024@coxu-arch-shz>
References: <20210115002623.8576-1-vasyl.vavrychuk@opensynergy.com> <20210129120654.16180-1-vasyl.vavrychuk@opensynergy.com> <20210129102647-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (LNX 419 2020-04-12)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


I second the support of MT with this one or other alternative.
This patch has been tested work in one of our POC project.
--
Best Regards,
Colin Xu

On Fri, 29 Jan 2021, Michael S. Tsirkin wrote:

> On Fri, Jan 29, 2021 at 02:06:54PM +0200, Vasyl Vavrychuk wrote:
>> Hi, All,
>>
>> There has been no reply to this patch.
>>
>> Is there anything I can do?
>>
>> Thanks,
>> Vasyl
>
> Gerd any input on this?
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
>
