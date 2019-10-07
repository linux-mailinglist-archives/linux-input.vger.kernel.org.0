Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 405ECCE707
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 17:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728793AbfJGPOg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 11:14:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:37610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728245AbfJGPOg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Oct 2019 11:14:36 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43BC42070B;
        Mon,  7 Oct 2019 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570461275;
        bh=k3D98VHMtG3lSG7huiH414Zod30a9xupZ17zEa32hoo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SqD7vE993/622/eUv7tFetKrrdr8w9wP6I5bx9U73ScUQ02h7FnRITKJn7dtsk9KR
         Pk8U1JXb6r6OCMgnYX/Gvr3LafD2oyU+1MN5RtNDoen9PxMteZArOD4UAiDJcBbbba
         ZCMa7a1V+TMoJyhhYbeWPKO0AeNQmvb9wt/84yLw=
Date:   Mon, 7 Oct 2019 17:14:03 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com
Subject: Re: [PATCH v6 1/6] HID: joycon: add nintendo switch controller
 driver
In-Reply-To: <20190915233140.244347-2-djogorchock@gmail.com>
Message-ID: <nycvar.YFH.7.76.1910071711440.13160@cbobk.fhfr.pm>
References: <20190915233140.244347-1-djogorchock@gmail.com> <20190915233140.244347-2-djogorchock@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 15 Sep 2019, Daniel J. Ogorchock wrote:

> The joycon driver supports the Nintendo Switch Pro Controllers and the
> Joy-Cons. The Pro Controllers can be used over USB or Bluetooth.
> 
> The Joy-Cons each create their own, independent input devices, so it is
> up to userspace to combine them if desired.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  MAINTAINERS              |   6 +
>  drivers/hid/Kconfig      |  11 +
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-ids.h    |   3 +
>  drivers/hid/hid-joycon.c | 820 +++++++++++++++++++++++++++++++++++++++

Hi Daniel,

I've finally (sorry for the delay) through reviewing these patches. All 
looks good and ready to be merged, the only last request I'd have -- could 
we please have this called hid-nintendo instead? We've been going on with 
the per-vendor driver naming for quite some time already.

If you agree with that, let's get this queued for 5.5.

Thanks,

-- 
Jiri Kosina
SUSE Labs

