Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41CA239155D
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 12:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbhEZKwJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 06:52:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234210AbhEZKwI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 06:52:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1BE610A8;
        Wed, 26 May 2021 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622026237;
        bh=Gta0Rl3MUgOFAQG02l3z7tYKokSTxVhV+iruOAj3GuA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PXEtbVjP4sv3cIk7ILymuO8PkkxWDdjM0QaLstqwDsrweT2cQupUAh3J6re14CkFk
         6kjZ4SITilV8yZdV1g2VpW/GF16HQXNEH0Uw7IDF53Maf3BQqgyZdQlv0v9ELANpk/
         DBLJSE0sUJAtEO+vF9dWDaJm2r4elm6s9oMCVtwcPgvCmMgk5RCMOATdlRS+zF5Ksb
         fHt/JrfN1TZS1RxvNOJ1qAZTfUjJ59a9WRcOLz7w9ajKbWGm1+Ipkc2h4GwynlX0HH
         xhO1ix4LFuDUf3GEEwb2mwHSXyTGQGy4eSqwFiDGJrsyHd3EfQ5oS0VYcoTQ79yRaj
         ZzrmaovRCHsqA==
Date:   Wed, 26 May 2021 12:50:34 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Yiyuan GUO <yguoaz@gmail.com>
cc:     linux-input@vger.kernel.org, Yiyuan GUO <yguoaz@cse.ust.hk>,
        Jason Gerecke <Jason.Gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: check input_dev->absinfo in
 wacom_bpt3_touch_msg
In-Reply-To: <20210517093403.74276-1-yguoaz@cse.ust.hk>
Message-ID: <nycvar.YFH.7.76.2105261250060.28378@cbobk.fhfr.pm>
References: <20210517093403.74276-1-yguoaz@cse.ust.hk>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 17 May 2021, Yiyuan GUO wrote:

> The function wacom_bpt3_touch_msg calls input_abs_get_res(input,
> ABS_MT_POSITION_X) to obtain x_res, which may equal to 0 if
> input->absinfo is NULL. Since x_res is used as a divisor, this
> may lead to divide by zero problem.
> 
> Signed-off-by: Yiyuan GUO <yguoaz@cse.ust.hk>
> ---
>  drivers/hid/wacom_wac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 81d7d12bc..a5a6fb8bc 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -2892,7 +2892,7 @@ static void wacom_bpt3_touch_msg(struct wacom_wac *wacom, unsigned char *data)
>  	bool touch = data[1] & 0x80;
>  	int slot = input_mt_get_slot_by_key(input, data[0]);
>  
> -	if (slot < 0)
> +	if (slot < 0 || !input->absinfo)
>  		return;
>  
>  	touch = touch && report_touch_events(wacom);

CCing Wacom driver maintainers in order to get their ack.

-- 
Jiri Kosina
SUSE Labs

