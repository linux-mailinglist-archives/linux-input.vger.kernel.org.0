Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02CBE7BEC0
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 12:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGaK7b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 06:59:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:40780 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725921AbfGaK7a (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 06:59:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BA844ACC4;
        Wed, 31 Jul 2019 10:59:29 +0000 (UTC)
Date:   Wed, 31 Jul 2019 12:59:27 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: Fix check of
 logi_dj_recv_query_paired_devices()
Message-ID: <20190731105927.GA5092@dell5510>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20190725145719.8344-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725145719.8344-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

> In delayedwork_callback(), logi_dj_recv_query_paired_devices
> may return positive value while success now, so check it
> correctly.

> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
