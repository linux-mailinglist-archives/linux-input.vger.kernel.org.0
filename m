Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CFD5359E1
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 09:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239854AbiE0HH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 03:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344829AbiE0HGq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 03:06:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74CBF6891
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 00:06:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A603B8232C
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 07:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD01C385A9;
        Fri, 27 May 2022 07:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653635202;
        bh=tQTL4BDTPrWkufrgcGaKlIcXsQazJabaPEGwFXwr1Mk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=K9tVt2mOvEojvWSGnX8sI678t/CC7s99Y1tDJzybZoLJHoQ6ao9GMnjjIvpIboDtd
         F+DnD6Otac0C2BTYHD5etAMmbBCJIAuVYlp355m76v/2g0M15TS0us5CaPCYgV3xRa
         IOBBsxAsc+eH2GibBUOXHJHod4xFgQQapptcEgrCcHSe5mxEjO2Ow+F2aMnTv4F2A9
         1AgdwZrK5U3+W+pJ0erQCBhE8biwjy9FDfof7xmKzaCNPQAAnws5klnlW1VksHgak5
         lOiPXe+qeuDoF/IVvbZvznZJDImAVYLmF0pYSMyAa2OL2L6k+BDEa0U7Mp61Sy1n8K
         RAeTipynoBaZw==
Date:   Fri, 27 May 2022 09:06:28 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, Aaron.Skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH 1/2] HID: wacom: Only report rotation for art pen
In-Reply-To: <20220513215156.14914-1-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.2205270906100.10851@cbobk.fhfr.pm>
References: <20220513215156.14914-1-ping.cheng@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 13 May 2022, Ping Cheng wrote:

> The generic routine, wacom_wac_pen_event, turns rotation value 90
> degree anti-clockwise before posting the events. This non-zero
> event trggers a non-zero ABS_Z event for non art pen tools. However,
> HID_DG_TWIST is only supported by art pen.
> 
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
> --
> Hi Jiri,
> 
> This is kind of a version 2 of the last one I posted two days ago.
> I updated the logic so it has less changed lines: 29 vs 158! Hopefully,
> the logic is easier to follow now. Please ignore the last one.
> 
> Thank you!
> ---
>  drivers/hid/wacom_wac.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index a7176fc0635d..3bee4f46003d 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -638,9 +638,26 @@ static int wacom_intuos_id_mangle(int tool_id)
>  	return (tool_id & ~0xFFF) << 4 | (tool_id & 0xFFF);
>  }
>  
> +static bool wacom_is_art_pen(int tool_id)
> +{
> +	bool is_art_pen = false;
> +
> +	switch (tool_id) {
> +	case 0x885:	/* Intuos3 Marker Pen */
> +	case 0x804:	/* Intuos4/5 13HD/24HD Marker Pen */
> +	case 0x10804:	/* Intuos4/5 13HD/24HD Art Pen */
> +		is_art_pen = true;
> +		break;
> +	}
> +	return is_art_pen;
> +}
> +
>  static int wacom_intuos_get_tool_type(int tool_id)
>  {
> -	int tool_type;
> +	int tool_type = BTN_TOOL_PEN;
> +
> +	if (wacom_is_art_pen(tool_id)

I've added the missing brace here and applied both patches. Thanks,

-- 
Jiri Kosina
SUSE Labs

