Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAC87C050
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 13:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfGaLp1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 07:45:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:55988 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726232AbfGaLp1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 07:45:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 00A6DB031;
        Wed, 31 Jul 2019 11:45:25 +0000 (UTC)
Date:   Wed, 31 Jul 2019 13:45:24 +0200
From:   Petr Vorel <pvorel@suse.cz>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 5.3 regression fix] HID: logitech-dj: Really fix return
 value of logi_dj_recv_query_hidpp_devices
Message-ID: <20190731114524.GA18205@dell5510>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20190729155036.4094-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729155036.4094-1-hdegoede@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

> Commit dbcbabf7da92 ("HID: logitech-dj: fix return value of
> logi_dj_recv_query_hidpp_devices") made logi_dj_recv_query_hidpp_devices
> return the return value of hid_hw_raw_request instead of unconditionally
> returning 0.

> But hid_hw_raw_request returns the report-size on a successful request
> (and a negative error-code on failure) where as the callers of
> logi_dj_recv_query_hidpp_devices expect a 0 return on success.

> This commit fixes things so that either the negative error gets returned
> or 0 on success, fixing HID++ receivers such as the Logitech nano receivers
> no longer working.

> Cc: YueHaibing <yuehaibing@huawei.com>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
> Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Reported-by: Rafael J. Wysocki <rjw@rjwysocki.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Rafael J. Wysocki <rjw@rjwysocki.net>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
