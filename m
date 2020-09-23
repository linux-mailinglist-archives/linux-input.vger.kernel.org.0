Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703AF2756E2
	for <lists+linux-input@lfdr.de>; Wed, 23 Sep 2020 13:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgIWLLe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Sep 2020 07:11:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:38794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbgIWLLe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Sep 2020 07:11:34 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 266DB20725;
        Wed, 23 Sep 2020 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600859493;
        bh=AV+Yf2q5dyoAG5bJrrOAANelhJ0YfF4MoDKAXbUfBxU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=J7lRRUEfNhB6i8sdTvarp874oGdC1dbNyGz4ATtzSXTCQkPv1Evo/ukVstjQa+CcU
         7OM61FiN+mLGsQU59XjfHmSJMBH8oeddUIjz+NPc+kDKLZ12lzddgtuFvXJIGFbPIc
         1sYsTolchvEFDaGuGugPR3lX3HuAq4E1/1mB5aVI=
Date:   Wed, 23 Sep 2020 13:11:30 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Xiaofei Tan <tanxiaofei@huawei.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hdegoede@redhat.com,
        kai.heng.feng@canonical.com, vicamo.yang@canonical.com,
        daniel.playfair.cal@gmail.com, admin@kryma.net, linuxarm@huawei.com
Subject: Re: [PATCH] HID: i2c-hid: fix some doc warnings in i2c-hid-core.c
In-Reply-To: <1600776484-31742-1-git-send-email-tanxiaofei@huawei.com>
Message-ID: <nycvar.YFH.7.76.2009231311250.3336@cbobk.fhfr.pm>
References: <1600776484-31742-1-git-send-email-tanxiaofei@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 22 Sep 2020, Xiaofei Tan wrote:

> Fix following warnings caused by mismatch bewteen function parameters
> and comments.
> drivers/hid/i2c-hid/i2c-hid-core.c:331: warning: Function parameter or member 'data_len' not described in 'i2c_hid_set_or_send_report'
> drivers/hid/i2c-hid/i2c-hid-core.c:331: warning: Excess function parameter 'len' description in 'i2c_hid_set_or_send_report'
> 
> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index dbd0449..01e9b36 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -323,7 +323,7 @@ static int i2c_hid_get_report(struct i2c_client *client, u8 reportType,
>   * @reportType: 0x03 for HID_FEATURE_REPORT ; 0x02 for HID_OUTPUT_REPORT
>   * @reportID: the report ID
>   * @buf: the actual data to transfer, without the report ID
> - * @len: size of buf
> + * @data_len: size of buf
>   * @use_data: true: use SET_REPORT HID command, false: send plain OUTPUT report

Applied.

-- 
Jiri Kosina
SUSE Labs

