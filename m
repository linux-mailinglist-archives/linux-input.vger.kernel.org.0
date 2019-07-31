Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418617C057
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 13:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbfGaLqt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 07:46:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:56348 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727201AbfGaLqt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 07:46:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D00A3B08C;
        Wed, 31 Jul 2019 11:46:47 +0000 (UTC)
Date:   Wed, 31 Jul 2019 13:46:46 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     YueHaibing <yuehaibing@huawei.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: Fix check of
 logi_dj_recv_query_paired_devices()
Message-ID: <20190731114646.GB22537@dell5510>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20190725145719.8344-1-yuehaibing@huawei.com>
 <20190731105927.GA5092@dell5510>
 <20190731110629.GB5092@dell5510>
 <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

> Please test my patch titled: "HID: logitech-dj: Really fix return value of logi_dj_recv_query_hidpp_devices"
> which should fix this.
Indeed, patch [1] fixed that, thanks :)

> Regards,

> Hans

Kind regards,
Petr

[1] https://patchwork.kernel.org/patch/11064087/
