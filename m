Return-Path: <linux-input+bounces-3517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CCB8BD6E3
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DE91F213D4
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADF615B974;
	Mon,  6 May 2024 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/yMHmv2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CDA15B96C;
	Mon,  6 May 2024 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715031035; cv=none; b=l0nZECmhiT4dH5y1Q/0KLlJAods6qYJ65SQ436JL/uCQ0CbAiDqJGs+Ja/sXPCo7kv/4SMQEcm3jBXx5EbOBzssiJz91XjovzybduScSJ2bj0T4ccuHPSiDHI/NJ8hlWv3W7jI9MhqBgEWXouRqcS9nLW+0mWmWDkyU0X1tQaUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715031035; c=relaxed/simple;
	bh=KjDM3t+mXPHZ1np8qdQus9+e0DhietiiqDnxUT3Z2PY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LQv9CKIhYxnAnF9YSmkktjLShL+KV5RJjalrnNnePwoLBKYo8+1PebWkJaNrtXR5WoDqZm82ib1CHAN+et/CqyId1JLj8hzFwn8xLRtKSMVTJLvM1umo/m3U2UjbgtXrdgD1VUOmk5o4H7HQQ5DLWGeVUUpVDHU0xmSjRu5YxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/yMHmv2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35708C116B1;
	Mon,  6 May 2024 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715031034;
	bh=KjDM3t+mXPHZ1np8qdQus9+e0DhietiiqDnxUT3Z2PY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h/yMHmv2v/ApNmXpzI4Y21meX5roolHvl3e3SCcjlRj9dWR5IsNMxkJN0NLOdUWk0
	 K4kZuz6MbEP+oplWCheFiFjfEHenHGDJsi4AhiNeQ+SxtoO6pFE4muCN9Ok5HYmy0s
	 RbQ/HN8wXtixiFbHDuJlYAqW/foGFdpBxqB9whNSAKJvigD446r8Fy9axobPPTTikh
	 EfciLZo6WVLsz5kZyGo8eTZm6SQnvOnTl0QYtW3CKwNEVbLR09xE+JwWGAe+bFhrod
	 psefR+GifNihINecQzegKglSAhVSZigw3g8F2ghJs2q+4F00naXwI/lfJSGDDHNSUy
	 aWGPXyAbJRaPg==
Date: Mon, 6 May 2024 23:30:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: David Yang <mmyangfl@gmail.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-kernel@vger.kernel.org, Milan Plzik <milan.plzik@gmail.com>
Subject: Re: [PATCH] HID: kye: Change Device Usage from Puck to Mouse
In-Reply-To: <20240502042335.15611-1-mmyangfl@gmail.com>
Message-ID: <nycvar.YFH.7.76.2405062329320.16865@cbobk.fhfr.pm>
References: <20240502042335.15611-1-mmyangfl@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 May 2024, David Yang wrote:

> Change device type because
> a. it is exactly a mouse, with left/right buttons and scroll wheel;
> b. it does not have visible marks or crosshairs, thus does not provide
> higher accuracy than stylus.

Let's CC Milan, who originally added all this in feb6faf1e5d46 ("HID: kye: 
Fix report descriptor for Genius PenSketch M912") ... Milan, any concerns 
about the below?

Thanks.

> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  drivers/hid/hid-kye.c | 75 +++++++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
> index eb9bf2829937..70ceb9437332 100644
> --- a/drivers/hid/hid-kye.c
> +++ b/drivers/hid/hid-kye.c
> @@ -209,7 +209,7 @@ static const __u8 pensketch_t609a_control_rdesc[] = {
>  	0xC0               /*  End Collection            */
>  };
>  
> -/* Fix indexes in kye_tablet_fixup if you change this */
> +/* Fix indexes in kye_tablet_fixup() if you change this */
>  static const __u8 kye_tablet_rdesc[] = {
>  	0x06, 0x00, 0xFF,             /*  Usage Page (FF00h),             */
>  	0x09, 0x01,                   /*  Usage (01h),                    */
> @@ -262,12 +262,16 @@ static const __u8 kye_tablet_rdesc[] = {
>  	0x27, 0xFF, 0x07, 0x00, 0x00, /*      Logical Maximum (2047),     */
>  	0x81, 0x02,                   /*      Input (Variable),           */
>  	0xC0,                         /*    End Collection,               */
> -	0xC0,                         /*  End Collection,                 */
> -	0x05, 0x0D,                   /*  Usage Page (Digitizer),         */
> -	0x09, 0x21,                   /*  Usage (Puck),                   */
> +	0xC0                          /*  End Collection,                 */
> +};
> +
> +/* Fix indexes in kye_tablet_fixup() if you change this */
> +static const __u8 kye_tablet_mouse_rdesc[] = {
> +	0x05, 0x01,                   /*  Usage Page (Desktop),           */
> +	0x09, 0x02,                   /*  Usage (Mouse),                  */
>  	0xA1, 0x01,                   /*  Collection (Application),       */
>  	0x85, 0x11,                   /*    Report ID (17),               */
> -	0x09, 0x21,                   /*    Usage (Puck),                 */
> +	0x09, 0x01,                   /*    Usage (Pointer),              */
>  	0xA0,                         /*    Collection (Physical),        */
>  	0x05, 0x09,                   /*      Usage Page (Button),        */
>  	0x19, 0x01,                   /*      Usage Minimum (01h),        */
> @@ -280,7 +284,7 @@ static const __u8 kye_tablet_rdesc[] = {
>  	0x95, 0x04,                   /*      Report Count (4),           */
>  	0x81, 0x01,                   /*      Input (Constant),           */
>  	0x05, 0x0D,                   /*      Usage Page (Digitizer),     */
> -	0x09, 0x32,                   /*      Usage (In Range),           */
> +	0x09, 0x37,                   /*      Usage (Data Valid),         */
>  	0x95, 0x01,                   /*      Report Count (1),           */
>  	0x81, 0x02,                   /*      Input (Variable),           */
>  	0x05, 0x01,                   /*      Usage Page (Desktop),       */
> @@ -317,7 +321,7 @@ static const struct kye_tablet_info {
>  	__s32 y_physical_maximum;
>  	__s8 unit_exponent;
>  	__s8 unit;
> -	bool has_punk;
> +	bool has_mouse;
>  	unsigned int control_rsize;
>  	const __u8 *control_rdesc;
>  } kye_tablets_info[] = {
> @@ -402,7 +406,7 @@ static __u8 *kye_consumer_control_fixup(struct hid_device *hdev, __u8 *rdesc,
>  static __u8 *kye_tablet_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int *rsize)
>  {
>  	const struct kye_tablet_info *info;
> -	unsigned int newsize;
> +	__u8 *newdesc = rdesc;
>  
>  	if (*rsize < sizeof(kye_tablet_rdesc)) {
>  		hid_warn(hdev,
> @@ -420,36 +424,45 @@ static __u8 *kye_tablet_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int
>  		return rdesc;
>  	}
>  
> -	newsize = info->has_punk ? sizeof(kye_tablet_rdesc) : 112;
> -	memcpy(rdesc, kye_tablet_rdesc, newsize);
> -
> -	put_unaligned_le32(info->x_logical_maximum, rdesc + 66);
> -	put_unaligned_le32(info->x_physical_maximum, rdesc + 72);
> -	rdesc[77] = info->unit;
> -	rdesc[79] = info->unit_exponent;
> -	put_unaligned_le32(info->y_logical_maximum, rdesc + 87);
> -	put_unaligned_le32(info->y_physical_maximum, rdesc + 92);
> -	put_unaligned_le32(info->pressure_logical_maximum, rdesc + 104);
> -
> -	if (info->has_punk) {
> -		put_unaligned_le32(info->x_logical_maximum, rdesc + 156);
> -		put_unaligned_le32(info->x_physical_maximum, rdesc + 162);
> -		rdesc[167] = info->unit;
> -		rdesc[169] = info->unit_exponent;
> -		put_unaligned_le32(info->y_logical_maximum, rdesc + 177);
> -		put_unaligned_le32(info->y_physical_maximum, rdesc + 182);
> +	memcpy(newdesc, kye_tablet_rdesc, sizeof(kye_tablet_rdesc));
> +
> +	put_unaligned_le32(info->x_logical_maximum, newdesc + 66);
> +	put_unaligned_le32(info->x_physical_maximum, newdesc + 72);
> +	newdesc[77] = info->unit;
> +	newdesc[79] = info->unit_exponent;
> +	put_unaligned_le32(info->y_logical_maximum, newdesc + 87);
> +	put_unaligned_le32(info->y_physical_maximum, newdesc + 92);
> +	put_unaligned_le32(info->pressure_logical_maximum, newdesc + 104);
> +
> +	newdesc += sizeof(kye_tablet_rdesc);
> +
> +	if (info->has_mouse) {
> +		if (newdesc + sizeof(kye_tablet_mouse_rdesc) > rdesc + *rsize)
> +			hid_err(hdev, "control desc unexpectedly large\n");
> +		else {
> +			memcpy(newdesc, kye_tablet_mouse_rdesc, sizeof(kye_tablet_mouse_rdesc));
> +
> +			put_unaligned_le32(info->x_logical_maximum, newdesc + 44);
> +			put_unaligned_le32(info->x_physical_maximum, newdesc + 50);
> +			newdesc[55] = info->unit;
> +			newdesc[57] = info->unit_exponent;
> +			put_unaligned_le32(info->y_logical_maximum, newdesc + 65);
> +			put_unaligned_le32(info->y_physical_maximum, newdesc + 70);
> +
> +			newdesc += sizeof(kye_tablet_mouse_rdesc);
> +		}
>  	}
>  
>  	if (info->control_rsize) {
> -		if (newsize + info->control_rsize > *rsize)
> -			hid_err(hdev, "control rdesc unexpectedly large");
> +		if (newdesc + info->control_rsize > rdesc + *rsize)
> +			hid_err(hdev, "control desc unexpectedly large\n");
>  		else {
> -			memcpy(rdesc + newsize, info->control_rdesc, info->control_rsize);
> -			newsize += info->control_rsize;
> +			memcpy(newdesc, info->control_rdesc, info->control_rsize);
> +			newdesc += info->control_rsize;
>  		}
>  	}
>  
> -	*rsize = newsize;
> +	*rsize = newdesc - rdesc;
>  	return rdesc;
>  }
>  
> -- 
> 2.43.0
> 

-- 
Jiri Kosina
SUSE Labs


