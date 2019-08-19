Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF1B92326
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2019 14:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfHSML1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 08:11:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:48270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfHSML1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 08:11:27 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5D9C20851;
        Mon, 19 Aug 2019 12:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566216686;
        bh=JsoB9+veoYIM2/Rf/UX0MXvF1Fpr9caSYoOnVONJjCU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=W83cuadqeNO6S1sxdbnYOnabx4EuPBnq6LWVmAVxcIdWMX6LWh065iSHOC0mpAX5g
         cZXdzQkQncsVB+te7RppWO/ttCIowCe3KKFrRCn4P7mP+wZnTC3Prki3I7vHu6R8gl
         559unPdyM3aUovvOfo5Dil1G5xGGEUSdGViowvlQ=
Date:   Mon, 19 Aug 2019 14:11:17 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Even Xu <even.xu@intel.com>
cc:     linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH] hid: intel-ish-hid: ipc: add EHL device id
In-Reply-To: <20190809131829.6126-1-even.xu@intel.com>
Message-ID: <nycvar.YFH.7.76.1908191411060.27147@cbobk.fhfr.pm>
References: <20190809131829.6126-1-even.xu@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 9 Aug 2019, Even Xu wrote:

> EHL is a new platform using ishtp solution, add its device id
> to support list.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied to for-5.3/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

