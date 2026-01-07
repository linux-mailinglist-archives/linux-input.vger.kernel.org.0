Return-Path: <linux-input+bounces-16830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2FCFEE94
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 17:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 192BA320E10B
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 16:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5360329390;
	Wed,  7 Jan 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huKqPEEy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5032694A;
	Wed,  7 Jan 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798756; cv=none; b=ginhK8Ok3/5M7gKnVAuSH1mZrf7zcGAISfzNkz9lM30BTnkb1gpebJycH8QDtNd5V0xIQEssDaF27A2Ij81MTR+gXpt++ddDVZT+/GRaAW0eoc3H9uiPnNZo6D5sL6SPh6eigRT0SePXzgWmqoC6a03eEQGaFn520J2EsGOzWnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798756; c=relaxed/simple;
	bh=z8MVGlvtUqFfiZcxqM9AuJLjQl9HGc61kYJyDK0+Zrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cZayCONc7MsAhhmerJ3uqXg/ntbLz+Ot4Mw2psoZK+HRYwYjRmHANXJ08X+DWW69o6SW2bsPu9nSnSsiwd/PmtpiqMWphS1dMimE5Jz4uAzux8vAt3Dhc6EdR+/YhEdLhunoqs40ed7rRNMNlVONH5XiuNX4Aa1ANBxBc4CD0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huKqPEEy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B21C4CEF1;
	Wed,  7 Jan 2026 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767798756;
	bh=z8MVGlvtUqFfiZcxqM9AuJLjQl9HGc61kYJyDK0+Zrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=huKqPEEytosL9qJmAjcAxiD91GZ2ZqUpaDNa6hF1Uawf/LPrg5Bk5F0wPmZeV8sCU
	 aPlYdfZs8SmSh2dkgqMClMUmiDkIV05ZcdpuslDHSu8/u5E+ngQ12EeBzJJkBAN0d3
	 qiUK+gxNH9UpuHWo/qv43YiuSXBIyXnFTqwNmIWmQo1wv690lGskF7KIFqEw/oOv4Z
	 ZTOS+nHiP078SKRP/qdCJ1O6hSbnjUed6xGisIzqtOTxJ5HA+EqiuPlwWEJcbOLjbW
	 KiryJrfQqyBGweOhTn5DVco6EASzlQZdTBQayoQy/BBAhl8G6Ug8Ub45zOxC+/vb8B
	 EEusbvLh0Y+jg==
Message-ID: <4707b78c-4782-48d1-8771-2015e9d296d5@kernel.org>
Date: Wed, 7 Jan 2026 09:12:34 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] HID: asus: Filter spurious HID vendor codes on ROG
 laptops
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: benato.denis96@gmail.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-6-sunlightlinux@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260107111945.48018-6-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 5:19 AM, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
> 
> On Asus ROG G14 and G15 laptops, several HID vendor usage codes (0xea,
> 0xec, 0x02, 0x8a, 0x9e) are sent during normal operation without a clear
> purpose, generating unwanted "Unmapped Asus vendor usagepage code"
> warnings in dmesg.
> 
> Add definitions for these codes and filter them out in asus_raw_event()
> to prevent kernel log spam.
> 
> Tested on Asus ROG G14/G15 series laptops.
> 
> Change-Id: I3f3b3a1e1698c8689e4c57582635435bfeda5990

Please strip Change-Id when sending patches to LKML.

> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>

Otherwise LGTM, feel free to add to next version.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/hid/hid-asus.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index eb14b9d13823b..06cd3d3b74af7 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -57,6 +57,13 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>   #define ROG_ALLY_X_MIN_MCU 313
>   #define ROG_ALLY_MIN_MCU 319
>   
> +/* Spurious HID codes sent by QUIRK_ROG_NKEY_KEYBOARD devices */
> +#define ASUS_SPURIOUS_CODE_0XEA 0xea
> +#define ASUS_SPURIOUS_CODE_0XEC 0xec
> +#define ASUS_SPURIOUS_CODE_0X02 0x02
> +#define ASUS_SPURIOUS_CODE_0X8A 0x8a
> +#define ASUS_SPURIOUS_CODE_0X9E 0x9e
> +
>   #define SUPPORT_KBD_BACKLIGHT BIT(0)
>   
>   #define MAX_TOUCH_MAJOR 8
> @@ -348,6 +355,21 @@ static int asus_raw_event(struct hid_device *hdev,
>   	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
>   		return -1;
>   	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +		/*
> +		 * G14 and G15 send these codes on some keypresses with no
> +		 * discernable reason for doing so. Filter them out to avoid
> +		 * unmapped warning messages.
> +		 */
> +		if (report->id == FEATURE_KBD_REPORT_ID) {
> +			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0X8A ||
> +			    data[1] == ASUS_SPURIOUS_CODE_0X9E) {
> +				return -1;
> +			}
> +		}
> +
>   		/*
>   		 * G713 and G733 send these codes on some keypresses, depending on
>   		 * the key pressed it can trigger a shutdown event if not caught.


