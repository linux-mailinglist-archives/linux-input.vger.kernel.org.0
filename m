Return-Path: <linux-input+bounces-6902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3ED989D17
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 10:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BEAC1F24583
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 08:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D43F17BB34;
	Mon, 30 Sep 2024 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuxTrXEx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D392BD04;
	Mon, 30 Sep 2024 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685811; cv=none; b=m8Epyv1Z/7MoHUinV5m9DS86QC7yMPMbrHoEiPyj1BW1YC6N+UIdDfgE1Lbhwiwxpt5UwYI2fqwog8yAACvqUeFifgdQ65SOtEr4Qog0MzvryKpSKXX4c9RrN92JpznVPB6flceDeq6FwSWq/Hx3WWrdbpY7RmCjjoy9IGwpM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685811; c=relaxed/simple;
	bh=iLwqPzgkwOWw1bvUPIfGIK0TVggIPQMNfmYFeAobdMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jt3+QoJ0XSlHRIvRQnNBRNp6cS6CCRjKFjPQYxZ1+rbs7Chr6a0wyN41y408swNDlrOIREzblvdYf34gCMEn0XRoqiYacf0fp76sM6cY+XYpyRjjg46rODEX9ivDtrt5nmlBUG3MqoW3gRUCuk/e2aCA058Wwa/jKXdxRYC1560=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuxTrXEx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D676C4CECE;
	Mon, 30 Sep 2024 08:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727685810;
	bh=iLwqPzgkwOWw1bvUPIfGIK0TVggIPQMNfmYFeAobdMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuxTrXExJQseWBFsHlD0icv7MFDCf+e/tq1VjOXmCtSzDBdADsyyiZOgLIc21bEOF
	 X5xJfjglgfCsGroc5xYZL2CjqFVjGU1D2DgReBdeSn1AtmynIfQx05UH1Sx+bWk//y
	 /5ig02rYZ09qaA9vWmlDrLipYpAbHbxVVOpmJ5kGMu+ZcdaHIUnCHqmN77W9k8SrO1
	 9M3kjdfz4eyL1tJinJVKFtCSEaTqMq/Cgw/vw4+R9c9s2AUToA6QJlayj//05I3K2Y
	 J+icpWhv2leispDFlNKt/gJhdptz2Xpqk340SaQuqdq15yiQQvz09VdCNUB7kuukiK
	 T9cgJK42kqMiQ==
Date: Mon, 30 Sep 2024 10:43:26 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: jikos@kernel.org, guanwentao@uniontech.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, zhanjun@uniontech.com
Subject: Re: [PATCH] HID: multitouch: Add quirk for HONOR MagicBook Art 14
 touchpad
Message-ID: <bbzdnqs63yqmtk4zk7ffybs3xiyvdklbvsc7neonxhkmhrjadt@jmwfads7klso>
References: <293F58F16AA131CA+20240929051832.869861-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <293F58F16AA131CA+20240929051832.869861-1-wangyuli@uniontech.com>

Hi,

few formatting issues, but other than that patch looks good:

On Sep 29 2024, WangYuli wrote:
> [Problem]

Please drop that "[Problem]".

> It sometimes after reboot change output from Touchpad to Mouse,
> evtest show it output from "TOPS0102:00 35CC:0104 Touchpad"
> to "TOPS0102:00 35CC:0104 Mouse",and it works as A mouse.
> 
> [Solution]

Same, please drop that "[Solution]".

> Like GLO-GXXX,As a workaround, it is possible to call
> MT_QUIRK_FORCE_GET_FEATURE to force set feature in mt_set_input_mode
> for such special touchpad device.
> 
> Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1040
> Link: https://gitlab.freedesktop.org/guanwentao/libinput/-/commit/8624bc6d7539ba01e996fefb58ce393e6f129db8

Not sure this Link adds anything: it's a personal fork of libinput, so
we don't really care.
I think with the libinput issue from above we have enough information to
relate to the MR linked to this commit, so please just drop the second
link

> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Anyway, please submit a v2 with the required changes and:

Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

> ---
>  drivers/hid/hid-multitouch.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 99812c0f830b..a1e0c3db3d4c 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -2082,6 +2082,11 @@ static const struct hid_device_id mt_devices[] = {
>  		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>  			0x347d, 0x7853) },
>  
> +	/* HONOR MagicBook Art 14 touchpad */
> +	{ .driver_data = MT_CLS_VTL,
> +		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +			0x35cc, 0x0104) },
> +
>  	/* Ilitek dual touch panel */
>  	{  .driver_data = MT_CLS_NSMU,
>  		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
> -- 
> 2.45.2
> 

