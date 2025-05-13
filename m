Return-Path: <linux-input+bounces-12311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D1AB4E64
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 10:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C21A19E575E
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 08:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FBD20E336;
	Tue, 13 May 2025 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uv1+Srbz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284C1E9B0B;
	Tue, 13 May 2025 08:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125890; cv=none; b=LWFKHwPgSRTi8+euiO7zN6iUQx1SY5iiVlwvWWQJ3hqVUyczP10RJYvWFec9wX3Qpv+nBe4G75XkPdDjw0FCzDDvuX55O9NSrV+vy5fHWUuho+ht/JTvzRO5WJos9hmxPs+bJ0MfaAAAyFrh8XHVSZF3/BakyTd0AGxw5xaVS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125890; c=relaxed/simple;
	bh=rsaKQs4K1djvMy11y6HRb1i4tTMkgggzE5YFXchGPsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nykm+VBU6Qwkcy+pUuNOlB3GYvF5ZEPWZ89I+P3WqGo2uFbEpckUf3wI4vc9Mn7JuI8i9nWkO9MKUS3vUzGI3uklPrv5bdnZ8iJejs71TfB4m7n2DMFwq+Ioboo7UM41Ls+lBhogh9Strv/qNsPjC5IsssCrwShwEr+cP0w60Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uv1+Srbz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fcd7186dfso3582576e87.0;
        Tue, 13 May 2025 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747125886; x=1747730686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/mMlyrcrj1DZJWRA7Si4O9nxfUJRo0CA7NsYn1buv8=;
        b=Uv1+SrbzOmaXPyhzMrr9kUdn5wjsnCrkYrXPxY/5dVIuwx1Eln7cQYiKER8qXdKeU6
         DSbC0ySuCQYmnzgCMKbBeRHkdYPS/2XprET9okFeozRYNv8i1PkWCTh9+wf52PUMaE69
         dSJNGavXKK0NT2QMjK7feZPwryTOQ0KLzsMRO6WEBo0AQmjSdVnqw8bp4q+ytPBWJzNw
         FSak4mZwfO5Ls8zwtpgfoYpkpKwqLFAeMJXwTia1wXytpS8/QnRrT8aQ67NpzoK+Y8Ui
         Gpct4B8WEfip4sR0ONIAMCvFAc3ItJDOaaFQOzTKOYoxX8sGtxfvv1erBwzxmxojgZ0g
         XTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125886; x=1747730686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/mMlyrcrj1DZJWRA7Si4O9nxfUJRo0CA7NsYn1buv8=;
        b=mTd3Q7UVjsf/TnPKtjJztgXRnz5AucuAR4L7L+cMbEc0kkgZZgBHUFzmhrf7OsmrW2
         pWiK++lwMsUEwcQTb8Pu+YT56GqyNdUVDKQDZPm5+I8eGmvw+WBWIXpnw/DT7cfo2+WJ
         wBqILKeN6trwwv16jDBas4nxtA/Lnam2BlH63GCCEk72kSGViPDdUeRB/9omNK7iAYwj
         NxLPr9bsu/wAB3WsV69PNJ17ipvVyDSyIkPqATQ+dwG3NhY9ZPwy/JE0C2AJuoa6VbXT
         SzWu0iQiT+PmkkC25pqWIXBl/1bIkMU8v+LpPDGojTT3eyIgJovPZwQ6qb9ImmNVj3F4
         2+5A==
X-Forwarded-Encrypted: i=1; AJvYcCUWtOUydVFmHoVtcQ6LSh1Pt2cNyCavpxMA+ZQIl5YbkhVzcwiK7nx2b9WBjjZBMU9gH5xX1UkExzClCw==@vger.kernel.org, AJvYcCX3Y8IRd8h1azNgNKVYkKpjqGrgUKuTlXqc8Q/CRojx0xdpm50PQbVxQzX/CA/4SYbjKL5ZLh5f6ytKfasD@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXrXNdBICjYFdfYOruTUdkQLWyIxhVCECQNWoaF9bg50MISdv
	Qj2IwKPQOCRiW4g5T70OiZxJQ/VOm3SgpMuFy5lq8BqmUnv+iCfn8SsZfqKAiiM=
X-Gm-Gg: ASbGncvYRS4q8h2cJC4tZN8h2k8/P8E+l6nAE9IVgmSGwzDEZd2G7pIHSsv0pDnKHuI
	72liTz+9W9sc8XdKfJK8salCxYftH1EkcyJwWzlwGTY0YaaKcDhST0j3VasfRT+wQKRi93QADJF
	WFa0HcvgXzEVFvTIlLPPY/IsYn+TE+LB/74H/9t69bHFkG8UMoz23TzSKkjqWvjc8nzkU7w1u3w
	YyuAVKP7AgZku60eaRKCJ17wi7QK6fRg3nlngNvFV5NpUe+cWlEvMrarRrtQi5zNED9sDrwwpxm
	TxxZYr0R/znTY68BNtj3JB/ynkmY9Blx+8//q4It7OP1qxYtAn3NxJvB8DNZb7wR7O7mlUJM+xu
	PmgG/I875m68=
X-Google-Smtp-Source: AGHT+IE0INsiXd9JPWSY9AvmV431RVt59UdxkcetBzz2qpQTgfQ3fEnhDFP09c/AIuULnWGCV9BlUw==
X-Received: by 2002:a05:6512:4201:b0:54e:81ec:2c83 with SMTP id 2adb3069b0e04-54fc67c2180mr4957570e87.18.1747125886120;
        Tue, 13 May 2025 01:44:46 -0700 (PDT)
Received: from [192.168.32.20] (public-gprs411161.centertel.pl. [37.47.237.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cbb12sm1758394e87.213.2025.05.13.01.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:44:45 -0700 (PDT)
Message-ID: <f5594328-11e4-4310-b961-41d8ca0c8116@gmail.com>
Date: Tue, 13 May 2025 10:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: kernel test robot <lkp@intel.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250508214305.836406-1-titanv3585@gmail.com>
 <202505100535.vKH3zHW6-lkp@intel.com>
Content-Language: en-US
From: Vadym Tytan <titanv3585@gmail.com>
In-Reply-To: <202505100535.vKH3zHW6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> kernel test robot noticed the following build warnings:
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/hid/hid-playstation.c:1773:25: sparse: sparse: symbol 'dev_attr_dualshock4_bt_poll_interval' was not declared. Should it be static?
> 
> vim +/dev_attr_dualshock4_bt_poll_interval +1773 drivers/hid/hid-playstation.c
> 
>    1772	
>> 1773	struct device_attribute dev_attr_dualshock4_bt_poll_interval = {
>    1774		.attr	= { .name = "bt_poll_interval", .mode = 0644 },
>    1775		.show	= dualshock4_show_poll_interval,
>    1776		.store	= dualshock4_store_poll_interval,
>    1777	};
>    1778	

This piece of code is expanded `DEVICE_ATTR` macro with changed variable 
name.
`DEVICE_ATTR` is defined as:
```c
// Reference: 
https://github.com/intel-lab-lkp/linux/blob/Vadym-Tytan/HID-playstation-DS4-Add-BT-poll-interval-adjustment/20250509-054413/include/linux/device.h#L138-L158
#define DEVICE_ATTR(_name, _mode, _show, _store) \
	struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, 
_store)
```
It doesn't use `static` so neither did I.

P.S. Macro was expanded and variable name was changed from 
`dev_attr_bt_poll_interval` to `dev_attr_dualshock4_bt_poll_interval` 
because this attribute only applies to DualShock4


