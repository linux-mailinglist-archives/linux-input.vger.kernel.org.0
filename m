Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436853CACDC
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244768AbhGOTqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:46:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:42240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344742AbhGOTog (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:44:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D92A61158;
        Thu, 15 Jul 2021 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626378101;
        bh=2XDbCR6daBrN+SGD5Ih2iWdiK69SR5WZGqHOdUgq408=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=A0vWcEUkCRWmUQ7vLAWDA0XFQAWxj2Rdd7867Ksr/4bSV+wGwgG/EasQJNlGflEPB
         LJY1boHjh+tHpodStYFNtKcbfm27P6Zivpkr4A3lyVwHZfc63Lcw2ZZtPaz2Y2RkTE
         Y2on4Y++CP9HvMEMl2ZtKo+bjOnT03gFGte8Jlnu+znqxovXTpOrCX0jDVYUgqU93Q
         T/lQQmODWHGHJrR1/xKfG4Pcod7LvlnFNfEl1Mz6JG/OlN/FsuelvNUTLy8bcn3O+A
         o1JimDVeisv0kD6XLHLMBuVZJpL0Kc6j76rHWyiBKsuPYJR/x0HGimVv27gTxcPdRc
         WI4tyZfPczQXg==
Date:   Thu, 15 Jul 2021 21:41:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Basavaraj Natikar <bnatikar@amd.com>
cc:     Dylan MacKenzie <ecstaticmorse@gmail.com>,
        Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        shyam-sundar.s-k@amd.com
Subject: Re: [PATCH] HID: amd_sfh: Use correct MMIO register for DMA
 address
In-Reply-To: <f430c14e-aa32-7b74-eba8-1b8e52a0a723@amd.com>
Message-ID: <nycvar.YFH.7.76.2107152141220.8253@cbobk.fhfr.pm>
References: <20210713041121.13418-1-ecstaticmorse@gmail.com> <20210713233106.9168-2-ecstaticmorse@gmail.com> <f430c14e-aa32-7b74-eba8-1b8e52a0a723@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 15 Jul 2021, Basavaraj Natikar wrote:

> > amd_stop_sensor_v2 accidentally used a different MMIO register than
> > amd_start_sensor_v2 for the DMA address.
> >
> > Signed-off-by: Dylan MacKenzie <ecstaticmorse@gmail.com>
> 
> Looks good to me. Can you please add a "Fixes:" tag too?
> With that addressed,
> 
> Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

I've added the proper Fixes: tag and applied, thanks.

-- 
Jiri Kosina
SUSE Labs

