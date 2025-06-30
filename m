Return-Path: <linux-input+bounces-13177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05890AED300
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 05:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31A033A43E8
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 03:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9A186334;
	Mon, 30 Jun 2025 03:46:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988B823CE;
	Mon, 30 Jun 2025 03:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751255185; cv=none; b=H7KezdbLb9tsm1Pd54XHB3i1uQ+qLMywbOO4Su3t4EvV7HlS6cdes1FwcMylnDlbcdL/P0EMDMhhNyiINoGn4ahULrTLwOs7MRbtnjfBO1Hq6lcOblVK+g7i7TzY6PjdMWxKARN9Z899oVeK6e2/rmCBGK24Gj32NoSm1L5RwfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751255185; c=relaxed/simple;
	bh=vIbQ+oOCpoEJZX+mmjayNG5sy80Lm7EDqEBn3/cWReA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEXCZGviCANpIA4oPUZBQ3AFlcVqrS+x5I4Fdu56nxgQRPSmrTgxs8oErLN3g5jTYuOakyBlc8wW8s54LDEDJ5qlMTloSQP988/R1cp936qKrHvRmYaM1Y2e1Ti8gX31NDLzMYTOpmVGfDmHCs3axWCsCB/7Y2rNt/anZ3fgswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 6D3501CD5295;
	Sun, 29 Jun 2025 20:41:05 -0700 (PDT)
Message-ID: <cce2d94e-8798-489f-8c9f-68f021bb21a7@cosmicgizmosystems.com>
Date: Sun, 29 Jun 2025 20:41:04 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: Vadym Tytan <titanv3585@gmail.com>, kernel test robot <lkp@intel.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250508214305.836406-1-titanv3585@gmail.com>
 <202505100535.vKH3zHW6-lkp@intel.com>
 <f5594328-11e4-4310-b961-41d8ca0c8116@gmail.com>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <f5594328-11e4-4310-b961-41d8ca0c8116@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/13/25 1:44 AM, Vadym Tytan wrote:
>> kernel test robot noticed the following build warnings:
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/hid/hid-playstation.c:1773:25: sparse: sparse: symbol 'dev_attr_dualshock4_bt_poll_interval' was not declared. Should it be static?
>>
>> vim +/dev_attr_dualshock4_bt_poll_interval +1773 drivers/hid/hid-playstation.c
>>
>>    1772   
>>> 1773    struct device_attribute dev_attr_dualshock4_bt_poll_interval = {
>>    1774        .attr    = { .name = "bt_poll_interval", .mode = 0644 },

Should it be      .attr    = { .name = "dualshock4_bt_poll_interval", .mode = 0644 },  ?

Or did you not expand the macro fully on purpose?

Thanks,
Terry

>>    1775        .show    = dualshock4_show_poll_interval,
>>    1776        .store    = dualshock4_store_poll_interval,
>>    1777    };
>>    1778   
> 
> This piece of code is expanded `DEVICE_ATTR` macro with changed variable name.
> `DEVICE_ATTR` is defined as:
> ```c
> // Reference: https://github.com/intel-lab-lkp/linux/blob/Vadym-Tytan/HID-playstation-DS4-Add-BT-poll-interval-adjustment/20250509-054413/include/linux/device.h#L138-L158
> #define DEVICE_ATTR(_name, _mode, _show, _store) \
>     struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
> ```
> It doesn't use `static` so neither did I.
> 
> P.S. Macro was expanded and variable name was changed from `dev_attr_bt_poll_interval` to `dev_attr_dualshock4_bt_poll_interval` because this attribute only applies to DualShock4
> 
> 


