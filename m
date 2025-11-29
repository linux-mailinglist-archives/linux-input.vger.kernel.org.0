Return-Path: <linux-input+bounces-16394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A8C934F2
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 01:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7ECF0348641
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 00:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CCE54654;
	Sat, 29 Nov 2025 00:16:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FF1A267;
	Sat, 29 Nov 2025 00:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764375379; cv=none; b=PWDQhW723RQ3bLTAnRKV28ZNY4DZDzrMZgcLLmEJCwETwnONuEh3bguibT/vY5IISBBaMFrdDTrr+hj8ozAqK2LQGHUUZSs4QZ8UvIIpM/XM6yYjzebI6gx+N2HLRZoSmCBVkIac57qpWsB+vEoYaqw8UeaGUC5c/3FHIFnLMH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764375379; c=relaxed/simple;
	bh=HUa1CdrxF8J/hkIcsG4AVqwJBZi5W5QlQHuM8rMTPZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAgOT5IKvIE36xJV0OPUfnMcqGYbNJ32Y6JAq4qNt6BL6YMIG8G7eIlDsWqZUeJvjRHavgrgzVJAPFJRybPKBcGiDjrpyE+v6zGMAz0Dhw/Km8OI9US+CYd5k1M7Ue+J0D/sb/xoYpN1lw9vyYKe+lNWOQIaPQ9UimunYKrTgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id DC82F1EA46A5;
	Fri, 28 Nov 2025 16:08:44 -0800 (PST)
Message-ID: <c462c4e7-ab34-4ca8-9d05-818017b7ea3f@cosmicgizmosystems.com>
Date: Fri, 28 Nov 2025 16:08:43 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30
 (2d99:a101)
To: =?UTF-8?Q?Rodrigo_Lugathe_da_Concei=C3=A7=C3=A3o_Alves?=
 <lugathe2@gmail.com>, bentiss@kernel.org, jikos@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 dmitry.torokhov@gmail.com, linuxsound@cosmicgizmosystems.com,
 michal.pecio@gmail.com
References: <20251127220357.1218420-1-lugathe2@gmail.com>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20251127220357.1218420-1-lugathe2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rodrigo,

Thanks for reporting, debugging, finding the solution, and submitting a patch!

Reviewed-by: Terry Junge <linuxhid@cosmicgizmosystems.com>

Original thread - https://lore.kernel.org/all/CALvgqEAq8ZWgG4Dyg_oL7_+nUDy+LUoTXi+-6aceO-AKtBS3Mg@mail.gmail.com/

Regards,
Terry

On 11/27/25 2:03 PM, Rodrigo Lugathe da Conceição Alves wrote:
> The USB speaker has a bug that causes it to reboot when changing the
> brightness using the physical knob.
> 
> Add a new vendor and product ID entry in hid-ids.h, and register
> the corresponding device in hid-quirks.c with the required quirk.
> 
> Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>

