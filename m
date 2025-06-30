Return-Path: <linux-input+bounces-13233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8581AEE1C4
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 17:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BB87188D89C
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 14:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB9328C5C1;
	Mon, 30 Jun 2025 14:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie7WjTdn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3928C013;
	Mon, 30 Jun 2025 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295572; cv=none; b=QUHOmamk4ZTcoo5TcNgQLNOaoqRW7E59jw/8Rz4i0x7oCkHbxc+xj5jjLfxQuKIZE3E5sBWHC5LATwvpcFzaKNkY2YsR4QQ9IpFxPVaIjr0V+3pY3mJ0vMp+thL/yAucLDvbModkrMo+lpc4qeNLMZIDLH8AyX6vTNSraU2WCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295572; c=relaxed/simple;
	bh=kHZG/SAHtaCXvJPooJ1iE8nE6vSy8XcqduQc3aJRiIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lG7+pE0oFoZJi94qP92VwavgcVtyfsflDe4iIQg1piPt/eDr1RV9rh7LQK0Rr5SMlPZjDWjZzKw6txJO16lCxqOCrMSJpmxn/foxB4RYWvD43tWOrj3obPkh7of1OLSCR5MU7Pd4Yzvhmda1WSiIs9L4j3Pj/XpXWAtW6gC4C+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie7WjTdn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae3a604b43bso50780066b.0;
        Mon, 30 Jun 2025 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751295569; x=1751900369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZODcrcofm3wCiChuUI5ZxeqAT+1tWcc0clYojsHPHM=;
        b=Ie7WjTdnbCyqWZj0fK0KVTdopPmq/N5ZR+5sl4aLvtMENJDQlZIDW8aiqA8Bw9qv+7
         1CfbVvswh3rwGt4W3Cii3bARQ12vP4JUfG2fIqjrj9U4j1u/9u9sqAj3weuw1vl2fb2z
         keDMfk/ZiYw9UZlh8n5VNdaPyKOJ6spZmZXpzTOpc5GvvRyWkEQiGITerfxBgMljULCX
         B7bMYryJURDz9cqf2RqykkmnCQtbWN8q+uH6x8pa2U2V5Rjs1GHvc/k9iG4FJ6DrtGou
         EYjyo8+uUTbmGnoS0UESBrEdkP0odF77OxJybT/yxyQrBwn6CHWfUREt1FiHVAkGnTMo
         bRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295569; x=1751900369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZODcrcofm3wCiChuUI5ZxeqAT+1tWcc0clYojsHPHM=;
        b=s+i2rXwj4tqF20cZG54UNAeTtFEeDOpW7MydW/z1sH6mp61L5LW9wehIQc341iUjAx
         pgbOzqjFc8Uyd8gejq+fdN3vmHjNhFd8G5CG5+wH6zIiCt7z0G1rMot9SalfD5sXbjLG
         98W+rDGpNZNQhmxcOcGzcfS+w5fjyuIG90FgfzY7QZSF6PuL4Qum3iOrn/I1/ZYWVPs+
         WmmRUcsBw60Yo7ppBTI+YK1Cg7sfuhyBZOWNA4HgqsUxUlpW5yoOLH0a35MrLV+JIIk3
         BX9qg/D5tOp6IhLt2tRoQJ1Ov5SHLRLBuqAnEj+hoFznLYSZJHcKnHHnIBWlw6XKcFiN
         6log==
X-Forwarded-Encrypted: i=1; AJvYcCVagPEoq1oq34iRIpR89A2Xfkqmpuk+q19rbNNm8REsBIyIigL4vDzRCy0k7Zgrof5QySdNzrN8CFl9Gw==@vger.kernel.org, AJvYcCVowhKXzX+fJcIAW2qE7CxYWIoKGcNC5LnFEp9Jq3JZRd8pGZhOGpoujlEQB/7x+gEcCAoPBGyyZyMPHsCj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrt4drX9Pk/RMJSWhmGWR8m97UwVVh4R9iTgt5nndkCqPZJRC1
	76dWE5jXU7NMWXHScqhReoOQOA52a38WVQBSxPGDJbtyYczY161/gJ4PJOrKypNYvqQ=
X-Gm-Gg: ASbGncsFi51QaM/UUclzKPF2v8TaSYokCh5pZ3kGPDvaN9vbvQpsSPiglQVnaqHTRPa
	YIhS1sw91JF1sGxdjHTL2mfD72pESRSJH9UyBRgkPY06sgbTDS7ybzxyjzWb3e3QwW/jL+zzpeH
	0K0chcPonk0p3TxdV4AnGC4SyT1hWtIO6uIYnVNwQsiwJGkAGvur2MaCA33knAyX4764hkctTmV
	noUqmmj6ZmY1IUv0/QVHcQPQ3ZvhEoQjDRt3476syzlUPfk010VTDHxfUwQ+ZjQQ2VeVvjISCSt
	8JoZr8AsX3h7oO5y48ENY93/SEMfvc53toABf4NDrZrp8uMeV+t2Lst54zYC2vA02ljt6ZIhgAS
	Z9p4HN06yMeTmRkFzGnh7+g==
X-Google-Smtp-Source: AGHT+IHDFRjJ772iqS77I2LkwKiaoRWD8c/M97Vl3pT5NO8QRHrk7P9+uiILla9TUhzZkDy6xm8HbA==
X-Received: by 2002:a17:907:3e8b:b0:ae3:6eb9:60d0 with SMTP id a640c23a62f3a-ae36eb96270mr904600566b.42.1751295568458;
        Mon, 30 Jun 2025 07:59:28 -0700 (PDT)
Received: from [192.168.32.20] (public-gprs411093.centertel.pl. [37.47.237.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a00bsm674931066b.43.2025.06.30.07.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:59:28 -0700 (PDT)
Message-ID: <e33f4cec-dec5-41ae-a1dd-aa6953604526@gmail.com>
Date: Mon, 30 Jun 2025 16:59:26 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 kernel test robot <lkp@intel.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20250508214305.836406-1-titanv3585@gmail.com>
 <202505100535.vKH3zHW6-lkp@intel.com>
 <f5594328-11e4-4310-b961-41d8ca0c8116@gmail.com>
 <cce2d94e-8798-489f-8c9f-68f021bb21a7@cosmicgizmosystems.com>
Content-Language: en-US
From: Vadym Tytan <titanv3585@gmail.com>
In-Reply-To: <cce2d94e-8798-489f-8c9f-68f021bb21a7@cosmicgizmosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Should it be      .attr    = { .name = "dualshock4_bt_poll_interval", .mode = 0644 },  ?
> 
> Or did you not expand the macro fully on purpose?
> 
> Thanks,
> Terry

Here's my own quote

> P.S. Macro was expanded and variable name was changed from `dev_attr_bt_poll_interval` to `dev_attr_dualshock4_bt_poll_interval` because this attribute only applies to DualShock4
So, yes, i expanded it like that on purpose, as it applies only to DS4, 
and while being attribute, it applies only per device, so no collision 
is possible.

You're welcome
Vadym

