Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 596FE81479
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 10:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfHEIvj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 04:51:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbfHEIvj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 04:51:39 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81C5E20880;
        Mon,  5 Aug 2019 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564995098;
        bh=YrDo9mF/VZxirGNdUKLXdwWYFB46jIYn5A2/ywodktA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=aTYYrjjOA86dK9a5t74lHfa0IjmVCMBd9ZdG+3/UhAxTJ9USRnP7rlaP26o5XzD4S
         MKI/gXHJ7+D9ukKu1G2tZXB/AGyhsh21RmsTOCOsKBfumwikhXzpGv1nanpofKDS76
         jnqKW5HtSscJFYwWfgnTXKjUqSisFdhqO9SKIfd0=
Date:   Mon, 5 Aug 2019 10:51:33 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Petr Vorel <pvorel@suse.cz>, YueHaibing <yuehaibing@huawei.com>,
        benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: Fix check of
 logi_dj_recv_query_paired_devices()
In-Reply-To: <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
Message-ID: <nycvar.YFH.7.76.1908051051080.5899@cbobk.fhfr.pm>
References: <20190725145719.8344-1-yuehaibing@huawei.com> <20190731105927.GA5092@dell5510> <20190731110629.GB5092@dell5510> <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 31 Jul 2019, Hans de Goede wrote:

> >>> In delayedwork_callback(), logi_dj_recv_query_paired_devices
> >>> may return positive value while success now, so check it
> >>> correctly.
> > 
> >>> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of
> >>> Fixes: logi_dj_recv_query_hidpp_devices")
> >>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > OK, not only it didn't fix problems with logitech mouse (see below),
> > but removing mouses USB dongle effectively crashes kernel, so this one
> > probably
> > shouldn't be applied :).
> > 
> > [  330.721629] logitech-djreceiver: probe of 0003:046D:C52F.0013 failed with
> > error 7
> > [  331.462335] hid 0003:046D:C52F.0013: delayedwork_callback:
> > logi_dj_recv_query_paired_devices error: 7
> 
> Please test my patch titled: "HID: logitech-dj: Really fix return value of
> logi_dj_recv_query_hidpp_devices"
> which should fix this.

Hans, have I been CCed on that patch? I don't seem to see it in in inbox.

Thanks,

-- 
Jiri Kosina
SUSE Labs

