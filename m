Return-Path: <linux-input+bounces-9867-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DFBA2E03C
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 20:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D519D3A5A55
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 19:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058CC1E0E14;
	Sun,  9 Feb 2025 19:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W8+vf2tB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A121DE895
	for <linux-input@vger.kernel.org>; Sun,  9 Feb 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739129890; cv=none; b=N6VPOOH4B8ZkG92j5bKuaM1FkpT1/bPK5LwXPgANSIwAc4rYinYNwJWUC/Jq96N8p8zmo/wVlyJz9x+don53+EbJdbu72cgf3FchFV+aKVAP2yClL3j8DThNbhzV+YKQkTBjW3h5DidxYRCmKp4rAx6CI38vGA/j6fhzRIP6Oao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739129890; c=relaxed/simple;
	bh=bakGvPthngL3gTQwUPSt/EUmVwDuJ8/w4DuyMlVWo/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvX3h/xTCjG10vk4up/VGSWSvRg2na8LNx+FD+V2pwNFzDtMssAB9cRINcz5XZDhmfFB/x5t5xy7Bgfqvu5yoBsGTgdJ6rEcF/j/wkfyEjfFGBIksZCitBcyjgdxPHiJGcVwm2w2n3y3YQuvDXSKqyRPXp/XZc1dMNzIT3mWwp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W8+vf2tB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de427a1d12so548076a12.1
        for <linux-input@vger.kernel.org>; Sun, 09 Feb 2025 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739129887; x=1739734687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l9Ero5vcDcOepXZ2yFnMrKTNvfLViDvWS1bPisX99zU=;
        b=W8+vf2tBlCSDaBnp12F8FyMij7XzS/h6ZRDfEEkRAHKIXIC9NnIACIVTW3RnKhkP6g
         u0JdU3IZ1QhLvFF2DVpz9moJS0LGFynUoYNjqyfYIltTU3r+7PQvO83segdIj0sbdj9j
         JyasB6v8zUGL14Yas1hp5ZzQRdhjJg4C/JwOO9eEYceCT9Kc4ix+gHs0kIr4a2/XpXnL
         a7BiZnoj8flHvN2S459RyMUTJJGuW0HlqZxBcg2Y83AM7yjB7kurKnHQkKREcXz15oSN
         NEA2MHN3ZhGniFCF6HwfipRkh9J7sLyjLHN/MZgbyclAQoXYbB4n5nO3+6TKh1cuGB3L
         qx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739129887; x=1739734687;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9Ero5vcDcOepXZ2yFnMrKTNvfLViDvWS1bPisX99zU=;
        b=amWcXuKQFUEnJ9pmZ1Pmnq1M7dmrqosTUQZoRw6pZ0O90XeLTO91c8VBv5rQnfSi+H
         QGCzFU2wRUUMKEqUOqUMkVMPPaAoZSbJs9PcK2srcx3HpYFNdKv0unZoe6EoWWupsYSW
         I+xnOS2CkfS9KHQAkJxt3yMwCVvXq9qo8A/vUAw+GD00MJZpTHul6RgSH0IHFHD5EcwU
         3YGU2MqJRHEfaI0pIjYJFsvJpgnMGqIbIb83hdzv0IIqgFYbd30d0Y80xPMSDD/8Oc6j
         3wLt6qerGqc9QTB367EBHn1evPq7YRYa2mLW+fgxIuAgPMJ4nUgWs198Doq9T6J6eWx+
         HFSg==
X-Forwarded-Encrypted: i=1; AJvYcCWm53wPRw+XnJPfw0dOzqW/hpVNcDw/bWUvnAZiAGSADxsyE1N0DckVU3dtLvGK8aVkV6UAWKeYQTmvGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0OH1ng+TygYPxWP+5/9BV6s54i32tzEfTbHWcDTehKIQuEauQ
	MS2Bw7dMHeyRDt/gQUwbipYv2PYSgQ0KMFfPCz1pvCsUuh7j5sfjL5mAS1ljIrI=
X-Gm-Gg: ASbGncvx/1A2OwmtG1nc6RxLt7KZlA+SG4S9n6IADIqMokR+0Fs4Bj8ow9TQSHMEN63
	1qVd3VzQm0qQgsRAivFwNtlLzb5t60mlurh4SfmLXfcHHgVPyjc2969QBgRBzqOAK4PPy1YcRnv
	zbMQ4YQacNXqUO+mOx1YhYvppv4A22QJuTE1MgmPT+YdY/ypB2x7xPn7apmWCKIVRREWUtouPL3
	WOOV7rUGEe+OIrfrFUYW0xNxXyVSOM1NINSEj8bHyBL+niUmm+53lh5svafz/Lqw1Ue1cuFG2x5
	Jxk8DLc75CTDtvPhUgNeUEBtHcLUYKRHtPU=
X-Google-Smtp-Source: AGHT+IEJL5E8qZHI2wQRhsWzOfx3kHSAmyv/sAKbVBbstYeeqOih+ViYs1THV7h2OAlqRYYee6hngQ==
X-Received: by 2002:a05:6402:5290:b0:5dc:7fbe:72f1 with SMTP id 4fb4d7f45d1cf-5de4503fea6mr4713950a12.2.1739129887485;
        Sun, 09 Feb 2025 11:38:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab784d4aadbsm617189566b.113.2025.02.09.11.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 11:38:06 -0800 (PST)
Message-ID: <e67c0375-1024-483b-aabf-6a11339ab9af@linaro.org>
Date: Sun, 9 Feb 2025 20:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchset status - 'Add support for Maxim Integrated MAX77705
 PMIC'
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org
References: <CABTCjFBx-QpCKFWs5MPCgLAjJWT6ygrvS_A0nJk2BBxmWAxF+Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABTCjFBx-QpCKFWs5MPCgLAjJWT6ygrvS_A0nJk2BBxmWAxF+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 15:13, Dzmitry Sankouski wrote:
> For the patchset I sent 2 weeks ago, [patchwork][1] shows status
> 'Handled Elsewhere, archived'. Is anything blocking it?
> 
> [1]: https://patchwork.kernel.org/project/linux-pm/list/?series=927848&archive=both&state=*

That's PM patchwork, not necessarily power supply. But anyway, what does
the cover letter say? Who do you expect to merge it? Above link does not
provide cover letter, unfortunately.

Best regards,
Krzysztof

