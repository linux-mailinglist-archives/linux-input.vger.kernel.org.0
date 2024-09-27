Return-Path: <linux-input+bounces-6819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB598889B
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 17:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D041C20A26
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 15:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470FF18C021;
	Fri, 27 Sep 2024 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riyQJO5r"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE4118B1A;
	Fri, 27 Sep 2024 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452585; cv=none; b=WBePpuxecTmz2Md6NMuDjJwpdIUBRhZcdKNBfYaYgiG8LlU9wl8utXCEO8V49/mAFse5P0k1BeUNdsvNs2653BU380K+VjM4hp6Njyv/5M2JndHFaZj4MinYbqyk0GKaYxsgMTefXHwDYqOeLat+ct2ySIXjX0ZQp5Qn4G2HdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452585; c=relaxed/simple;
	bh=LDGGmgVf9JJZZvlWGW82IbklqNVGYZgzG1K6LHijCQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3u5s0ysm9yPpzxTyZlWf/dJuz8jSByaq5ibJzWO26CwTGjQLlsiS0jCj7TE6o2mByxyo5GKK0lbt0FAViX/GAt/XQjBKZiOlOOa8m+Riu7MGxAQ0CK6myydeO45bNQrmQCcevegh/VtBuSrUIf36QOA56pSZqV3aFqS1CXS2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riyQJO5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E677EC4CEC4;
	Fri, 27 Sep 2024 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727452584;
	bh=LDGGmgVf9JJZZvlWGW82IbklqNVGYZgzG1K6LHijCQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riyQJO5rRdwj+aBpiHRdqdHYmGu738xPfJAF38WjjCIL2wNPMu6yTL1J2ZtishcXG
	 TWyjy9RNjzVFR5f32GFGduMzUYorFgRAguQwz6gaHHBvcXbgEGyowzZ/5Ncpr6dYfE
	 hA4qO2aKABag5k4bBq6SC2U0xOOL/+GcBrL4Vi29xOP93ZOWHzBSAew4Xi4/1R3CPq
	 7AK8SPC2jKUxkunxd8JJh0d5IeRtxz3POsUJQ8R+j0A0yDwbkLPJThfiSPSd9L/XNI
	 NgvM8wmUOXRHX4J39fvR2SnbUev4EO4KXOH3kCHIsOZ8ZHTqXPIigTyS01Qi5crY7t
	 +ZvQQ4lPKrQRA==
Date: Fri, 27 Sep 2024 17:56:19 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/10] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Message-ID: <xdkn2y6wpnqjrngem3xjxjn2a7cykhrb6dj56w6avz4noj7itu@xlknbwmp63h7>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <BD919A98-0D44-42F9-867F-B936BBB8267A@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD919A98-0D44-42F9-867F-B936BBB8267A@live.com>

On Aug 17 2024, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> This is needed to support Apple Touch Bars, where the contact ID is
> contained in fields with the HID_DG_TRANSDUCER_INDEX usage.
> 
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/hid-multitouch.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 56fc78841..3e92789ed 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -635,7 +635,9 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
>  
>  		if (field->logical == HID_DG_FINGER || td->hdev->group != HID_GROUP_MULTITOUCH_WIN_8) {
>  			for (n = 0; n < field->report_count; n++) {
> -				if (field->usage[n].hid == HID_DG_CONTACTID) {
> +				unsigned int hid = field->usage[n].hid;
> +
> +				if (hid == HID_DG_CONTACTID || hid == HID_DG_TRANSDUCER_INDEX) {

I'm not super happy about this. The HID spec specifically mentions
CONTACTID to be related to multitouch, when TRANSDUCER is not
specifically for multitouch. I would rather have this hidden behind a
quirk, because I don't think this is standard (the device comes from an
environment where both the hardware and the software stack is
controlled, which already gave some fun decisions from Apple).

Cheers,
Benjamin

>  					rdata->is_mt_collection = true;
>  					break;
>  				}
> @@ -814,6 +816,7 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  			MT_STORE_FIELD(tip_state);
>  			return 1;
>  		case HID_DG_CONTACTID:
> +		case HID_DG_TRANSDUCER_INDEX:
>  			MT_STORE_FIELD(contactid);
>  			app->touches_by_report++;
>  			return 1;
> -- 
> 2.43.0
> 

